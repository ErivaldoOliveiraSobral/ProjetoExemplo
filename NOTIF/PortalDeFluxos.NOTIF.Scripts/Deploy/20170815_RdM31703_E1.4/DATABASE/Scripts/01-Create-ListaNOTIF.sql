USE [FluxosRaizen]
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListaNOTIF]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ListaNOTIF](
	
	[CodigoItem] [int] NOT NULL,
	[CodigoLista] [uniqueidentifier] NOT NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
	[TituloProposta] [varchar](255) NULL,
	[DescricaoRazaoSocial] [varchar](255) NULL,
	[NumeroIBM] [int] NULL,
	[NumeroSiteCode] [int] NULL,
	[DescricaoEstadoAtualFluxo] [varchar](255) NULL,
	[BuscaDocumentos] [bit] NULL,
	[ContratoPadrao] [bit] NULL,
	[DescricaoEtapa] [varchar](255) NULL,

	[LoginGerenteTerritorio] [varchar](255) NULL,
	[LoginGerenteRegiao] [varchar](255) NULL,
	[LoginDiretorVendas] [varchar](255) NULL,
	[LoginCDR] [varchar](255) NULL,
	[LoginGDR] [varchar](255) NULL,
	
	[UtilizaZoneamentoPadrao] [bit] NULL,
	[UtilizaZoneamentoCdr] [bit] NULL,
	[UtilizaZoneamentoDiretor] [bit] NULL,
	[UtilizaZoneamentoGdr] [bit] NULL,
	[UtilizaZoneamentoGR] [bit] NULL,
	[UtilizaZoneamentoGT] [bit] NULL,
	
	[EnvolvimentoPlanejamento] [bit] NULL,
	[AprovacaoGRDV] [bit] NULL,
	[NotificacaoPadrao] [bit] NULL,
	[DataNotificacao] [datetime] NULL,
	[Farol] [varchar](50) NULL,

	[Mercado] [int] NULL,
	[CNPJ] CHAR(18) NULL,
	[Endereco] [varchar](255) NULL,
	[Bairro] [varchar](255) NULL,
	[Cep] [varchar](9) NULL,
	[UF] [varchar](255) NULL,
	[Cidade] [varchar](255) NULL,

	[NomeContrato] [varchar](255) NULL,
	[NumeroContrato] [varchar](255) NULL,
	[TipoNotificacao] [int] NULL,
	[OutroTipoNotificacao] [varchar](255) NULL,
	[StatusLoja] [varchar](255) NULL,
	[Consumo] [decimal] (15,3) NULL,
	
	[Comentario] [varchar](5000) NULL,

	[Juridico_FasesJudicializacao] [int] NULL,
	[Juridico_TipoAcaoJudicial] [int] NULL,
	[Juridico_Observacao] [varchar](5000) NULL,
	[Juridico_DataAcao] [datetime] NULL,

	[RelacoesSetoriais_FasesJudicializacao] [varchar](255) NULL,
	[RelacoesSetoriais_TipoAcaoJudicial] [varchar](255) NULL,
	[RelacoesSetoriais_Observacao] [varchar](5000) NULL,
	[RelacoesSetoriais_DataAcao] [datetime] NULL,

CONSTRAINT [PK_ListaNOTIF] PRIMARY KEY CLUSTERED 
(
	[CodigoItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_PADDING OFF
GO

IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ListaNOTIF', N'COLUMN',N'CodigoItem'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID do item no Sharepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaNOTIF', @level2type=N'COLUMN',@level2name=N'CodigoItem'
GO

IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ListaNOTIF', N'COLUMN',N'CodigoLista'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID da lista no Shaepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaNOTIF', @level2type=N'COLUMN',@level2name=N'CodigoLista'
GO



IF EXISTS(select 1 from sys.columns t0 inner join sys.objects t1 on t0.object_id = t1.object_id
				where t0.name = 'RelacoesSetoriais_FasesJudicializacao' and t1.name = 'ListaNOTIF')
BEGIN
	EXEC sp_rename 'ListaNOTIF.RelacoesSetoriais_FasesJudicializacao', 'RelacoesSetoriais_FaseDenuncia', 'COLUMN'
END

IF EXISTS(select 1 from sys.columns t0 inner join sys.objects t1 on t0.object_id = t1.object_id
				where t0.name = 'RelacoesSetoriais_TipoAcaoJudicial' and t1.name = 'ListaNOTIF')
BEGIN
	EXEC sp_rename 'ListaNOTIF.RelacoesSetoriais_TipoAcaoJudicial', 'RelacoesSetoriais_OrgaoDenuncia', 'COLUMN'
END

IF EXISTS(select 1 from sys.columns t0 inner join sys.objects t1 on t0.object_id = t1.object_id
				where t0.name = 'RelacoesSetoriais_DataAcao' and t1.name = 'ListaNOTIF')
BEGIN
	EXEC sp_rename 'ListaNOTIF.RelacoesSetoriais_DataAcao', 'RelacoesSetoriais_Data', 'COLUMN'
END


