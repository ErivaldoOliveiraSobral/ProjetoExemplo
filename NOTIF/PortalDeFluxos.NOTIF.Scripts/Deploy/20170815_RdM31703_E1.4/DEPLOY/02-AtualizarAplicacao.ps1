if ( (Get-PSSnapin -Name "Microsoft.SharePoint.Powershell" -ErrorAction Silentlycontinue) -eq $null ) {
    Add-PsSnapin "Microsoft.SharePoint.Powershell"
}
cls;

$nomeLista = "NOTIF"
$nomeColuna = "NOTIF"
$wspRaizenName = "PortalDeFluxos.NOTIF.SP.wsp"
$featureEventReceiver = "PortalDeFluxos.NOTIF.SP_EventReceiver"
$featureFluxo = "PortalDeFluxos.NOTIF.SP_Fluxo"
$caminhoControle = "/_CONTROLTEMPLATES/15/PortalDeFluxos.NOTIF.SP/ucNOTIF.ascx"
$caminhoControleTarefa = "/_CONTROLTEMPLATES/15/PortalDeFluxos.NOTIF.SP/ucAprovacaoDelegacaoTarefa.ascx"

#################### Ambiente #########################
$url = "http://labdev/sites/raizen";

if($env:computername -eq "PI")
{
    $url = "http://pi"
}

if($env:computername -eq "RZAPPRNP01VD")
{
    $url = "http://fluxos-dev.raizen.com"
}

if($env:computername -eq "RZAPPRNP01VQ" -or $env:computername -eq "RZAPPRNP02VQ")
{
    $url = "http://fluxos-qas.raizen.com"
}

if($env:computername -eq "RZAPPRNP01V" -or $env:computername -eq "RZAPPRNP02V")
{
    $url = "http://fluxos.raizen.com"
}

Write-Host -ForegroundColor Green "Ambiente:" $url;
#################### Ambiente #########################

$scriptPath = (Resolve-Path .\).Path
$wspFilesPath = $scriptPath + '\WSP'

$wspRaizenPath = "{0}\{1}" -f $wspFilesPath, $wspRaizenName
$sites = Get-SPSite $url;
$web   = Get-SPWeb  $url;
$listaPaginas = $web.Lists.TryGetList("Páginas do Site");

### Apga as páginas do sistema
function ApagarPagina($nomePagina){
    $pagina = $listaPaginas.Items | Where { $_.Name -eq $nomePagina}
    if ($pagina -ne $null) {
        $pagina.Delete();
    }
}

### Método para reativar features
function AtivarFeature($nome, $scopo, $somenteDesativa){
    $feature = Get-SPFeature | Where {$_.Displayname -eq $nome}
    If($feature)
    {
        Write-Host ""
        $ativado = $scopo.Features | Where {$_.DefinitionId -eq $feature.Id}
        If($ativado -eq $null)
        {
			if ($somenteDesativa -eq 0) {
				Write-Host -ForegroundColor Green "Ativando a feature $($nome)"
				Enable-SPFeature -IdEntity $nome -Url $url 
				Write-Host -ForegroundColor Green "Feature ativada!"
			}
        }else
        {
    	    Write-Host -ForegroundColor Green "Desativando a feature $($nome)"
            Disable-SPFeature -IdEntity $nome -Url $url -Confirm:$false
            if ($somenteDesativa -eq 0) {
	    	    Write-Host "Ativando a feature $($nome)"
	    	    Enable-SPFeature -IdEntity $nome -Url $url
                Write-Host -ForegroundColor Green "Feature ativada!"
	        }
        }
    }
}

#Efetua o deploy da solution
$solution = Get-SPSolution -IdEntity $wspRaizenName -ErrorAction Silentlycontinue
if ($solution -eq $null -or $solution.Deployed -eq $false) {
    Add-SPSolution -LiteralPath $wspRaizenPath
	Install-SPSolution  -IdEntity $wspRaizenName -GACDeployment -Force
} else {
    Write-Host "Iniciando atualização"
    Update-SPSolution -GACDeployment -IdEntity $wspRaizenName -LiteralPath $wspRaizenPath -Force -Confirm:$false
    
    ## Espera a conclusão do deploy
    $Solution = Get-SPSolution -idEntity $wspRaizenName
    $lastStatus = ""
    ## Verifica se já foi feito o Deploy
    write-host "" 
    while ($Solution.JobExists -eq $True) 
    { 
        $currentStatus = $Solution.JobStatus 
        if ($currentStatus -ne $lastStatus) 
        { 
	        Write-Host ""
            Write-Host "$currentStatus…" -foreground Green -nonewline
            $lastStatus = $currentStatus 
        }
    
        write-host "." -nonewline -foreground Green
        sleep 1
    } 


    ## Deploy Realizado 
    Write-Host "" 
    Write-Host "     " $Solution.LastOperationDetails -foreground green

    #Reinicia os serviços
    Write-Host "Reiniciando os serviços do Sharepoint" 
    IISRESET
    NET STOP SPTIMERV4
    NET START SPTIMERV4
}

## Espera a conclusão do deploy
$Solution = Get-SPSolution -idEntity $wspRaizenName
$lastStatus = ""
## Verifica se já foi feito o Deploy
write-host "" 
while ($Solution.JobExists -eq $True) 
{ 
    $currentStatus = $Solution.JobStatus 
    if ($currentStatus -ne $lastStatus) 
    { 
	Write-Host ""
        Write-Host "$currentStatus…" -foreground Green -nonewline
        $lastStatus = $currentStatus 
    }
    
    write-host "." -nonewline -foreground Green
    sleep 1
} 

Write-Host ""
Write-Host -ForegroundColor Green $wspRaizenName " Adicionado."


if ($sites -ne $null) {
    $sites.dispose();
}
if ($web -ne $null) {
    $web.dispose();
}
$sites = Get-SPSite $url;
$web   = Get-SPWeb  $url;


##Adiciona Colunas Status Fluxos quando necessário
$list = $web.Lists[$nomeLista] ;
$column = $list.Fields[$nomeColuna] ;


if ($column -eq $null)
{
    $spFieldType = [Microsoft.SharePoint.SPFieldType]::URL
    $list.Fields.Add($nomeColuna,$spFieldType,$false)
    $list.Update()
}


##reativa as features
AtivarFeature $featureEventReceiver $web 0        #Reativa feature de WebParts
AtivarFeature $featureFluxo $web 0                #Reativa feature de Fluxo

##Atualizando tabela Lista

$list = $sites.RootWeb.Lists.TryGetList($nomeLista)
$DescricaoUrlItem = "{0}{1}{2}" -f $migrateTo, ($list.DefaultDisplayFormUrl -replace $list.ParentWeb.Url,""), "?ID="
$urlTarefa2013 = "{0}{1}{2}" -f $migrateTo, ($list.DefaultDisplayFormUrl -replace $list.ParentWeb.Url,""), "?IdTarefa="

$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString  = $sites.RootWeb.AllProperties["PortalDeFluxos.Core.ConnectionString"]
$conn.open()

$cmd = New-Object System.Data.SqlClient.SqlCommand
$cmd.connection = $conn
$cmd.commandtext = "IF(NOT EXISTS(SELECT 1 FROM Lista WHERE CodigoLista = '{0}')) BEGIN INSERT INTO Lista (CodigoLista,Nome,DescricaoUrlLista,DescricaoUrlItem,DescricaoUrlTarefa,Ambiente2007) VALUES('{0}','{1}','{2}','{3}','{4}','{5}') END;" -f $list.ID,$nomeLista,$nomeLista,$DescricaoUrlItem,$DescricaoUrlItem,0
$cmd.executenonquery()

$cmd.connection = $conn
$cmd.commandtext = "UPDATE Lista SET DescricaoUrlTarefa='{0}' Where Nome='{1}';" -f $urlTarefa2013,$nomeLista
$cmd.executenonquery()

$conn.close()
##Atualizando tabela Lista


##configura userControlEspecifico

$listConfigUserControl = $sites.RootWeb.Lists.TryGetList("Raizen UserControl")
$userControlAtualizado = $false
foreach($item in $listConfigUserControl.Items){
    if($item["Title"] -eq $nomeLista -and $item["TipoUserControl"] -eq "Proposta"){        
        $item["urlUserControl"] = $caminhoControle
        $item.Update();
        $userControlAtualizado = $True
    }    
}

if($userControlAtualizado -eq $false)
{
    $newItem = $listConfigUserControl.items.add()
    $newItem["Title"] = $nomeLista
    $newItem["TipoUserControl"] = "Proposta"
    $newItem["urlUserControl"] = $caminhoControle
    $newItem.update()
}

$userControlAtualizado = $false
foreach($item in $listConfigUserControl.Items){
    if($item["Title"] -eq $nomeLista -and $item["TipoUserControl"] -eq "Formulário de Aprovação"){        
        $item["urlUserControl"] = $caminhoControleTarefa
        $item.Update();
        $userControlAtualizado = $True
    }    
}

if($userControlAtualizado -eq $false -and $caminhoControleTarefa -ne "")
{
    $newItem = $listConfigUserControl.items.add()
    $newItem["Title"] = $nomeLista
    $newItem["TipoUserControl"] = "Formulário de Aprovação"
    $newItem["urlUserControl"] = $caminhoControleTarefa
    $newItem.update()
}

if ($sites -ne $null) {
    $sites.dispose();
}

if ($web -ne $null) {
    $web.dispose();
}

IISRESET
NET STOP SPTIMERV4
NET START SPTIMERV4


Write-Host "" 
Write-Host -ForegroundColor Green "Atualização Concluída!"
