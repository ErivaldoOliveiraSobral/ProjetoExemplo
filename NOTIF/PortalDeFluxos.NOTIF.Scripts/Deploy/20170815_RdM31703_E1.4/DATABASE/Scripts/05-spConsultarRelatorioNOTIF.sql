USE [FluxosRaizen]
GO
/****** Object:  StoredProcedure [dbo].[spConsultarLog]    Script Date: 07/03/2017 16:32:47 ******/


IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND NAME = 'spConsultarRelatorioNOTIF' AND type_desc = 'SQL_STORED_PROCEDURE')
BEGIN
    DROP PROCEDURE [dbo].[spConsultarRelatorioNOTIF] 
END

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultarRelatorioNOTIF]
 
	@status INT = NULL,
	@dataInicio DateTime = NULL,
	@dataFim DateTime = NULL
AS
BEGIN
	
SET NOCOUNT ON;

SELECT  
		NOTIF.[CodigoItem]					AS 'Código do item'
	,	NOTIF.[TituloProposta]				AS 'Proposta'
	,	CASE 
			WHEN [Mercado] IS NULL OR [Mercado] = -1
				THEN '-' 
			WHEN [Mercado] = 0
				THEN 'Varejo'
			WHEN [Mercado] = 1
				THEN 'B2B'
			ELSE
				'Aviação'
		END									AS 'Mercado'
	,	[DescricaoRazaoSocial]				AS 'Razão Social'
	,	[NumeroIBM]							AS 'IBM'
	,	CASE 
			WHEN [LoginGerenteTerritorio] IS NULL OR [LoginGerenteTerritorio] = '' 
				THEN ''
			ELSE
				ISNULL(SUBSTRING([LoginGerenteTerritorio], CHARINDEX('#', [LoginGerenteTerritorio])+1, 1000),'')
		END									AS 'GT'
	,	CASE 
			WHEN [LoginGerenteRegiao] IS NULL OR [LoginGerenteRegiao] = '' 
				THEN ''
			ELSE
				ISNULL(SUBSTRING([LoginGerenteRegiao], CHARINDEX('#', [LoginGerenteRegiao])+1, 1000),'')
		END									AS 'GR'
	,	CASE 
			WHEN [LoginDiretorVendas] IS NULL OR [LoginDiretorVendas] = '' 
				THEN ''
			ELSE
				ISNULL(SUBSTRING([LoginDiretorVendas], CHARINDEX('#', [LoginDiretorVendas])+1, 1000),'')
		END									AS 'Diretor'
	,	CASE 
			WHEN [LoginCDR] IS NULL OR [LoginCDR] = '' 
				THEN ''
			ELSE
				ISNULL(SUBSTRING([LoginCDR], CHARINDEX('#', [LoginCDR])+1, 1000),'')
		END									AS 'CDR'
	,	CASE 
			WHEN [LoginGDR] IS NULL OR [LoginGDR] = '' 
				THEN ''
			ELSE
				ISNULL(SUBSTRING([LoginGDR], CHARINDEX('#', [LoginGDR])+1, 1000),'')
		END									AS 'GDR'
	,	CASE 
			WHEN [UtilizaZoneamentoGT] IS NULL OR [UtilizaZoneamentoGT] = '' OR [UtilizaZoneamentoGT] = 0 
				THEN 'Não' 
			ELSE 
				'Sim'
		END									AS 'Rezoneamento GT'
	,	CASE 
			WHEN [UtilizaZoneamentoCdr] IS NULL OR [UtilizaZoneamentoCdr] = '' OR [UtilizaZoneamentoCdr] = 0 
				THEN 'Não' 
			ELSE 
				'Sim'
		END									AS 'Rezoneamento CDR'
	,	CASE 
			WHEN [UtilizaZoneamentoGdr] IS NULL OR [UtilizaZoneamentoGdr] = '' OR [UtilizaZoneamentoGdr] = 0 
				THEN 'Não' 
			ELSE 
				'Sim'
		END									AS 'Rezoneamento GDR'
	,	[Endereco]							AS 'Endereço'
	,	[Bairro]							AS 'Bairro'
	,	[Cep]								AS 'Cep'
	,	[UF]								AS 'UF'
	,	[Cidade]							AS 'Cidade'
	,	[NomeContrato]						AS 'Nome do Contrato'
	,	[NumeroContrato]					AS 'Número do Contrato'
	,	CASE 
			WHEN [TipoNotificacao] = 0
				THEN 	'NTI'
			WHEN [TipoNotificacao] = 1
				THEN 	'Compra Zero'			
			WHEN [TipoNotificacao] = 2
				THEN	'Fee Dobrado'
			WHEN [TipoNotificacao] = 3
				THEN	'Baixo Consumo'
			WHEN [TipoNotificacao] = 4
				THEN	'Baixa de Hipoteca'
			WHEN [TipoNotificacao] = 5
				THEN	'Cessão de Locação'
			WHEN  [TipoNotificacao] = 6
				THEN	'Dano ao Imóvel'
			WHEN  [TipoNotificacao] = 7
				THEN	'Débitos com a Raízen'
			WHEN [TipoNotificacao] = 8
				THEN	'Débitos Tributos'
			WHEN  [TipoNotificacao] = 9
				THEN	'Desocupação Imóvel'
			WHEN  [TipoNotificacao] = 10
				THEN	'Devolução Equipamentos'
			WHEN  [TipoNotificacao] = 11
				THEN	'DNA não conformidade'
			WHEN  [TipoNotificacao] = 12
				THEN	'Documentos Ambientais'
			WHEN  [TipoNotificacao] = 13
				THEN	'Entrega de Produtos'
			WHEN  [TipoNotificacao] = 14
				THEN	'Falta Envio Relatório Gerencial'
			WHEN [TipoNotificacao] = 15
				THEN	'Fee de Loja'
			WHEN  [TipoNotificacao] = 16
				THEN	'Instalação Programa Gerenciamento'
			WHEN  [TipoNotificacao] = 17
				THEN	'Isenção Cobranças'
			WHEN  [TipoNotificacao] = 18
				THEN	'Licenças(Ambiental,Operação,ETC'
			WHEN  [TipoNotificacao] = 19
				THEN	'Manifestação Visual Loja'
			WHEN  [TipoNotificacao] = 20
				THEN	'Manifestação Visual Posto'
			WHEN  [TipoNotificacao] = 21
				THEN	'Manutenção Equipamentos'
			WHEN  [TipoNotificacao] = 22
				THEN	'Outorga de Escritura'
			WHEN  [TipoNotificacao] = 23
				THEN	'Preços'
			WHEN  [TipoNotificacao] = 24
				THEN	'Remediação Ambiental'
			WHEN  [TipoNotificacao] = 25
				THEN	'Rescisão Contratual'
			WHEN [TipoNotificacao] = 26
				THEN	'Troca Societária'
			ELSE
				'Outros'
		END										AS 'Tipo de Notificação'
	,	[OutroTipoNotificacao]					AS 'Tipo de Notificação - Outro'
	,	[StatusLoja]							AS 'Status da Loja'
	,	[Consumo]								AS 'Consumo (m³/mês)'
	,	[Comentario]							AS 'Comentário'
	,	CASE
			WHEN	[Juridico_FasesJudicializacao] = 0
				THEN 'Encaminhado ao Jurídico'
			WHEN	[Juridico_FasesJudicializacao] = 1
				THEN 'Em fase de judicialização'
			WHEN	[Juridico_FasesJudicializacao] = 2
				THEN 'Ação Ajuizada'
			WHEN	[Juridico_FasesJudicializacao] = 3
				THEN 'Liminar Concedida'
			WHEN	[Juridico_FasesJudicializacao] = 4
				THEN 'Liminar Revertida'
			WHEN	[Juridico_FasesJudicializacao] = 5
				THEN 'Liminar Cumprida'
			WHEN	[Juridico_FasesJudicializacao] = 6
				THEN 'Liminar Suspensa'
			WHEN	[Juridico_FasesJudicializacao] = 7
				THEN 'Citação'
			WHEN	[Juridico_FasesJudicializacao] = 8
				THEN 'Fase de provas'
			WHEN	[Juridico_FasesJudicializacao] = 9
				THEN 'Sentença'
			ELSE	
					 'Recurso'
		END										AS 'Jurídico - Fases Judicialização'
	,	CASE
			WHEN	[Juridico_TipoAcaoJudicial] = 0
				THEN 'Obrigação de Fazer'
			WHEN	[Juridico_TipoAcaoJudicial] = 1
				THEN 'Rescisão Contratual'
			WHEN	[Juridico_TipoAcaoJudicial] = 2
				THEN 'Retirada de Marca (Posto sem contrato'
			WHEN	[Juridico_TipoAcaoJudicial] = 3
				THEN 'Rescisão Passiva'
			WHEN	[Juridico_TipoAcaoJudicial] = 4
				THEN 'Execução de Dívida'
			WHEN	[Juridico_TipoAcaoJudicial] = 5
				THEN 'Renovatória'
			ELSE
					'Despejo Operador'
		END										AS 'Jurídico - Tipo de Ação Judicial'
	,	[Juridico_DataAcao]						AS 'Jurídico - Data da Ação'
	,	[Juridico_Observacao]					AS 'Jurídico - Observação'
	,	[RelacoesSetoriais_FaseDenuncia]		AS 'Relações Setoriais - Fase Denúncia'
	,	[RelacoesSetoriais_OrgaoDenuncia]		AS 'Relações Setoriais - Orgão Denúncia'
	,	[RelacoesSetoriais_Data]				AS 'Relações Setoriais - Data'
	,	[RelacoesSetoriais_Observacao]			AS 'Relações Setoriais - Observação'
	,	[Comentario]							AS 'Comentários'
	,	CASE 
			WHEN notf.[NotifAtiva] IS NULL OR notf.[NotifAtiva] = '' OR notf.[NotifAtiva] = 0 
				THEN 'Não' 
			ELSE 
				'Sim'
		END										AS 'Notificação Ativa'
	,	notf.[NumeroNotificacao]				AS 'Número da Notificação'
	,	CASE
			WHEN notf.[Status] = 0
				THEN	'Aberta'
			WHEN notf.[Status] = 1
				THEN	'Em aprovação'
			WHEN notf.[Status] = 2
				THEN	'Cancelada'
			WHEN notf.[Status] = 3
				THEN	'Emitida'
			WHEN notf.[Status] = 4
				THEN	'Enviada'
			WHEN notf.[Status] = 5
				THEN	'Recebida'
			WHEN notf.[Status] = 6
				THEN	'Extraviada'
			WHEN notf.[Status] = 7
				THEN	'Recusado/Negativado'
			WHEN notf.[Status] = 8
				THEN	'Mudou-se'
			WHEN notf.[Status] = 9
				THEN	'Não Localizado'
			ELSE
						'Reprovada'
		END									AS 'Status'
	,	CASE 
			WHEN notf.[DataInicioContrato] IS NULL
				THEN '-' 
			ELSE
				FORMAT(notf.[DataInicioContrato],'dd/MM/yyyy')
		END									AS 'Data Início Contrato'
	,	CASE 
			WHEN notf.[DataFimContrato] IS NULL
				THEN '-' 
			ELSE
				FORMAT(notf.[DataFimContrato],'dd/MM/yyyy')
		END									AS 'Data Fim Contrato'
	,	CASE 
			WHEN notf.[DataNotificacao] IS NULL
				THEN '-' 
			ELSE
				FORMAT(notf.[DataNotificacao],'dd/MM/yyyy')
		END									AS 'Data da Notificação'
	,	notf.[Observacao]					AS 'Observação'
	,	CASE 
			WHEN notf.[AprovacaoGRDV] IS NULL OR notf.[AprovacaoGRDV] = '' OR notf.[AprovacaoGRDV] = 0 
				THEN 'Não' 
			ELSE 
				'Sim'
		END									AS 'Aprovação GR/DV'
	,	CASE 
			WHEN notf.[EnvolvimentoPlanejamento] IS NULL OR notf.[EnvolvimentoPlanejamento] = '' OR notf.[EnvolvimentoPlanejamento] = 0 
				THEN 'Não' 
			ELSE 
				'Sim'
		END									AS 'Envolvimento Planejamento'
	,	CASE 
			WHEN notf.[NotificacaoPadrao] IS NULL OR notf.[NotificacaoPadrao] = '' OR notf.[NotificacaoPadrao] = 0 
				THEN 'Não' 
			ELSE 
				'Sim'
		END									AS 'Notificação Padrão'
	,	CASE
			WHEN notf.[GrauNotificacao] = 0
				THEN 'Leve'
			WHEN notf.[GrauNotificacao] = 1
				THEN 'Leve com Loja'
			WHEN notf.[GrauNotificacao] = 2
				THEN 'Pesada'
			WHEN notf.[GrauNotificacao] = 3
				THEN 'Pesada com Loja'
			ELSE
				'Outros'
		END									AS 'Grau de Notificação'
	,	notf.[FormaEnvio]					AS 'Forma de Envio'
FROM 
	[FluxosRaizen].[dbo].[ListaNOTIF] NOTIF
LEFT JOIN
	[FluxosRaizen].[dbo].[ListaNOTIFNotificacoes] notf
ON	
		NOTIF.CodigoItem = notf.CodigoItem
WHERE
		(@status IS NULL OR notf.[Status] = @status)
	AND	(@dataInicio IS NULL OR notf.[DataNotificacao] >= @dataInicio)
	AND (@dataFim IS NULL OR notf.[DataNotificacao] <= @dataFim);

END