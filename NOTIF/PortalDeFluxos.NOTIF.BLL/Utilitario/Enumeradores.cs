using Iteris;
using System.ComponentModel;

namespace PortalDeFluxos.NOTIF.BLL.Utilitario
{
    public enum TipoNotificacao
    {
		[Title("NTI")]
		[InfoExtraAttribute("NTI")]
		NTI = 0,
		
		[Title("Compra Zero")]
		[InfoExtraAttribute("COMZ")]
		CompraZero = 1,
		
		[Title("Fee Dobrado")]
		[InfoExtraAttribute("FEED")]
		FeeDobrado = 2,
		
		[Title("Baixo Consumo")]
		[InfoExtraAttribute("OUTROS")]
		BaixoCusto = 3,
		
		[Title("Baixa de Hipoteca")]
		[InfoExtraAttribute("OUTROS")]
		BaixaHipoteca = 4,
		
		[Title("Cessão de Locação")]
		[InfoExtraAttribute("OUTROS")]
		CessaLocacao = 5,
		
		[Title("Dano ao Imóvel")]
		[InfoExtraAttribute("OUTROS")]
		DanoImovel = 6,
		
		[Title("Débitos com a Raízen")]
		[InfoExtraAttribute("OUTROS")]
		DebitosRaizen = 7,
		
		[Title("Débitos Tributos")]
		[InfoExtraAttribute("OUTROS")]
		DebitosTributos = 8,
		
		[Title("Desocupação Imóvel")]
		[InfoExtraAttribute("OUTROS")]
		DesocupacaoImovel = 9,
		
		[Title("Devolução Equipamentos")]
		[InfoExtraAttribute("OUTROS")]
		DevolucaoEquipamentos = 10,
		
		[Title("DNA não conformidade")]
		[InfoExtraAttribute("OUTROS")]
		DNANaoConformidade = 11,
		
		[Title("Documentos Ambientais")]
		[InfoExtraAttribute("OUTROS")]
		DocumentosAmbientais = 12,
		
		[Title("Entrega de Produtos")]
		[InfoExtraAttribute("OUTROS")]
		EntregaProdutos = 13,
		
		[Title("Falta Envio Relatório Gerencial")]
		[InfoExtraAttribute("OUTROS")]
		FaltaEnvioRelatorioGerencial = 14,

		[Title("Fee de Loja")]
		[InfoExtraAttribute("OUTROS")]
		FeeLoja = 15,

		[Title("Instalação Programa Gerenciamento")]
		[InfoExtraAttribute("OUTROS")]
		InstalacaoProgGerenciamento = 16,
		
		[Title("Isenção Cobranças")]
		[InfoExtraAttribute("OUTROS")]
		IsencaoCobrancas = 17,
		
		[Title("Licenças(Ambiental,Operação,ETC)")]
		[InfoExtraAttribute("OUTROS")]
		LicencasAmbOpEtc = 18,
		
		[Title("Manifestação Visual Loja")]
		[InfoExtraAttribute("OUTROS")]
		ManifestacaoVisualLoja = 19,
		
		[Title("Manifestação Visual Posto")]
		[InfoExtraAttribute("OUTROS")]
		ManifestacaoVisualPosto = 20,
		
		[Title("Manutenção Equipamentos")]
		[InfoExtraAttribute("OUTROS")]
		ManutencaoEquipamentos = 21,
		
		[Title("Outorga de Escritura")]
		[InfoExtraAttribute("OUTROS")]
		OutorgaEscritura = 22,
		
		[Title("Preços")]
		[InfoExtraAttribute("OUTROS")]
		Precos = 23,
		
		[Title("Remediação Ambiental")]
		[InfoExtraAttribute("OUTROS")]
		RemediacaoAmbiental = 24,
		
		[Title("Rescisão Contratual")]
		[InfoExtraAttribute("OUTROS")]
		RescisaoContratual = 25,
		
		[Title("Troca Societária")]
		[InfoExtraAttribute("OUTROS")]
		TrocaSocietaria = 26,
		
		[Title("Outros")]
		[InfoExtraAttribute("OUTROS")]
		Outros = 99
    }

	public enum GrauNotificacao
	{
		[Title("Leve")]
		Leve =0,
		[Title("Leve com Loja")]
		LeveLoja =1,
		[Title("Pesada")]
		Pesada =2,
		[Title("Pesada com Loja")]
		PesadaLoja =3,
		[Title("Outros")]
		Outros = 4,
	}

	public enum StatusNotificacao
	{
		[Title("Aberta")]
		Aberta = 0,
		[Title("Em aprovação")]
		EmAprovacao = 1,
		[Title("Cancelada")]
		Cancelada = 2,
		[Title("Emitida")]
		Emitida = 3,
		[Title("Enviada")]
		Enviada = 4,
		[Title("Recebida")]
		Recebida =5,
		[Title("Extraviada")]
		Extraviada = 6,
		[Title("Recusado/Negativado")]
		RecusadoNegativado = 7,
		[Title("Mudou-se")]
		MudouSe = 8,
		[Title("Não Localizado")]
		NaoLocalizado = 9,
		[Title("Reprovada")]
		Reprovada = 10
	}

	public enum StatusNotificacaoTarefa
	{
		[Title("Recebida")]
		Recebida = 5,
		[Title("Extraviada")]
		Extraviada = 6,
		[Title("Recusado/Negativado")]
		RecusadoNegativado = 7,
		[Title("Mudou-se")]
		MudouSe = 8,
		[Title("Não Localizado")]
		NaoLocalizado = 9,
	}

    public enum Tarefas
    {
        [Title("Emissão Contratos - Emissão de Notificação")]
        EmitirNotificacao,
        [Title("Contratos - Envio da Notificação")]
        EnvioNotificacao,
        [Title("Contratos - Confirmação Recebimento")]
        ConfirmacaoRecebimento,
        [Title("Contratos - Gestão Notificações")]
        GestaoNotificacao,
		[Title("GR/Diretor de Vendas")]
		GRDiretorVendas
    }

    public enum Mercado
    {
        [Title("Varejo")]
        Varejo = 0,
        [Title("B2B")]
        B2B = 1,
        [Title("Aviação")]
        Avaiacao = 2
    }

    public enum FasesJudicializacao
    {
        [Title("Encaminhado ao Jurídico")]
        EncaminhadoJuridico = 0,
        [Title("Em fase de judicialização")]
        EmFaseJudicializacao = 1,
        [Title("Ação Ajuizada")]
        AcaoAjuizada = 2,
        [Title("Liminar Concedida")]
        LiminarConcedida = 3,
        [Title("Liminar Revertida")]
        LiminarRevertida = 4,
        [Title("Liminar Cumprida")]
        LiminarCumprida = 5,
        [Title("Liminar Suspensa")]
        LiminarSuspensa = 6,
        [Title("Citação")]
        Citacao = 7,
        [Title("Fase de provas")]
        FaseProvas = 8,
        [Title("Sentença")]
        Sentenca = 9,
        [Title("Recurso")]
        Recurso = 10
 
    }

    public enum AcaoJudicial
    {
        [Title("Obrigação de Fazer")]
        ObrigacaoFazer = 0,
        [Title("Rescisão Contratual")]
        RescisaoContratual = 1,
        [Title("Retirada de Marca (Posto sem contrato)")]
        RetiradaMarca = 2,
        [Title("Rescisão Passiva")]
        RescisaoPassiva = 3,
        [Title("Execução de Dívida")]
        ExecucaoDivida = 4,
        [Title("Renovatória")]
        Renovatoria = 5,
        [Title("Despejo Operador")]
        DespejoOperador = 6
    }

	public enum Farol
	{
		[Title("")]
		Branco = 0,
		[Title("Vermelho")]
		Vermelho = 1,
		[Title("Verde")]
		Verde = 2,
		[Title("Amarelo")]
		Amarelo = 3		
	}
}
