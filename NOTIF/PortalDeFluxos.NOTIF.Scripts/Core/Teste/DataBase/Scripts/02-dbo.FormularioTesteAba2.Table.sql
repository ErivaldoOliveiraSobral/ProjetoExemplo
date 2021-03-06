USE [PortalDeFluxo]
GO
/****** Object:  Table [dbo].[FormularioTesteAba2]    Script Date: 15/02/2017 13:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENOTIFFIER ON
GO
CREATE TABLE [dbo].[FormularioTesteAba2](
	[IdFormularioTesteAba2] [int] IDEntity(1,1) NOT NULL,
	[IdFormularioTeste] [int] NOT NULL,
	[CasoBase] [bit] NOT NULL,
	[Valor1] [decimal](12, 5) NOT NULL,
	[Valor2] [decimal](12, 3) NOT NULL,
	[Valor3] [decimal](12, 1) NOT NULL,
	[Valor4] [int] NOT NULL,
	[Comentario] [nvarchar](4000) NOT NULL,
	[HoraInicial] [datetime] NOT NULL,
	[HoraFinal] [datetime] NOT NULL,
	[DataInicial] [date] NOT NULL,
	[Datafinal] [date] NOT NULL,
 CONSTRAINT [PK_FormularioTesteAba2] PRIMARY KEY CLUSTERED 
(
	[IdFormularioTesteAba2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[FormularioTesteAba2]  WITH CHECK ADD  CONSTRAINT [FK_FormularioTesteAba2_ListaFormularioTeste] FOREIGN KEY([IdFormularioTeste])
REFERENCES [dbo].[ListaFormularioTeste] ([CodigoItem])
GO
ALTER TABLE [dbo].[FormularioTesteAba2] CHECK CONSTRAINT [FK_FormularioTesteAba2_ListaFormularioTeste]
GO
