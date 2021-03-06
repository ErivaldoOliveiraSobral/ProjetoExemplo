USE [PortalDeFluxo]
GO
/****** Object:  Table [dbo].[FormularioTesteTipoProposta]    Script Date: 15/02/2017 13:19:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENOTIFFIER ON
GO
CREATE TABLE [dbo].[FormularioTesteTipoProposta](
	[IdFormularioTesteTipoProposta] [int] NOT NULL,
	[Descricao] [nchar](500) NULL,
 CONSTRAINT [PK_FormularioTesteTipoProposta] PRIMARY KEY CLUSTERED 
(
	[IdFormularioTesteTipoProposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[FormularioTesteTipoProposta] ([IdFormularioTesteTipoProposta], [Descricao]) VALUES (1, N'Tipo 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ')
INSERT [dbo].[FormularioTesteTipoProposta] ([IdFormularioTesteTipoProposta], [Descricao]) VALUES (2, N'Tipo 2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ')
INSERT [dbo].[FormularioTesteTipoProposta] ([IdFormularioTesteTipoProposta], [Descricao]) VALUES (3, N'Tipo 3                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ')
INSERT [dbo].[FormularioTesteTipoProposta] ([IdFormularioTesteTipoProposta], [Descricao]) VALUES (4, N'Tipo 4                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              ')
