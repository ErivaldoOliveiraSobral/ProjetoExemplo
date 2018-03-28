USE [FluxosRaizen]
GO
/****** Object:  Table [dbo].[ListaNOTIFNotificacoes]    Script Date: 22/06/2016 13:26:35 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ListaNOTIFNotificacoes]') AND type in (N'U'))
DROP TABLE [dbo].[ListaNOTIFNotificacoes]
GO


/****** Object:  Table [dbo].[ListaNOTIFNotificacoes]    Script Date: 12/28/2016 20:26:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[ListaNOTIFNotificacoes](
	[IdNotificacao] [int] IDEntity(1,1) NOT NULL,
	[CodigoItem] [int] NOT NULL,	
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,

	[NotifAtiva] [bit] NOT NULL,	
	[NumeroNotificacao] [int] NOT NULL,
	[Status] [int] NULL,	
	[Observacao] [varchar](5000) NULL,
	
	[DataInicioContrato] [datetime] NULL,
	[DataFimContrato] [datetime] NULL,
	[DataNotificacao] [datetime] NULL,
	
	[AprovacaoGRDV] [bit] NULL,	
	[EnvolvimentoPlanejamento] [bit] NULL,	
	[GrauNotificacao] [int] NULL,
	[FormaEnvio] [varchar](255) NULL,
	[NotificacaoPadrao] [bit] NULL,

 CONSTRAINT [PK_ListaNOTIFNotificacoes] PRIMARY KEY CLUSTERED 
(
	[IdNotificacao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[ListaNOTIFNotificacoes]  WITH CHECK ADD  CONSTRAINT [FK_NOTIFICACOES_LISTANOTIF] FOREIGN KEY([CodigoItem])
REFERENCES [dbo].[ListaNOTIF] ([CodigoItem])
GO

ALTER TABLE [dbo].[ListaNOTIFNotificacoes] CHECK CONSTRAINT [FK_NOTIFICACOES_LISTANOTIF]
GO

SET ANSI_PADDING OFF
GO


