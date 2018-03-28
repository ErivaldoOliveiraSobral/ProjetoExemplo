USE [FluxosRaizen]
GO

IF EXISTS (SELECT * FROM [dbo].[Parametro] WHERE IdParametro =22)
BEGIN
	DELETE [dbo].[Parametro] WHERE IdParametro=22;
END
GO

SET IDEntity_INSERT [dbo].[Parametro] ON 
GO

INSERT [dbo].[Parametro] ([IdParametro], [Descricao], [Valor]) VALUES (22, N'Listas sincronizadas no banco', N'[{
		"NomeTabela": "ListaAditivosGerais",
		"NomeLista": "Aditivos Gerais",
		"Mapeamento": {
			"Title": "CodigoSolicitacao",
			"gerente": "NomeGerente",
			"RazaoSocial": "NomeRazaoSocial",
			"IBM": "DescricaoIBM",
			"RemuneracaoMensal": "DescricaoRemuneracaoMensal",

			"TaxaAdesao": "DescricaoTaxaAdesao",
			"TaxaFranquia": "DescricaoTaxaFranquia",
			"Royalty": "DescricaoRoyalty",
			"Gerencia": "DescricaoGerencia",
			"Discussao": "DescricaoDiscussao",
			"ResultadoSolicitacao": "DescricaoResultadoSolicitacao",
			"FlagUltimasTarefasConcluidas": "DescricaoTarefaConcluida",
			"SociosQueAssinamContrato": "DescricaoAssinaturaSocios",
			"FiadoresQueAssinaraoContrato": "DescricaoAssinaturaFiador",
			"UltimoComentario": "DescricaoUltimoComentario",
			"Observacoes": "Observacao",
			"ContratoPadrao": "ContratoPadrao",
			"Licenciamento": "Licenciamento",
			"BuscaDocumentos": "BuscaDeDocumento",
			"Franquia": "Franquia",
			"Created": "DataInclusaoSP",
			"Author": "LoginInclusaoSP",
			"Modified": "DataAlteracaoSP",
			"Editor": "LoginAlteracaoSP"
		}
	}, {
		"NomeTabela": "ListaComodato",
		"NomeLista": "Comodato",
		"Mapeamento": {
			"IbmDestino": "NumeroIbmDestino",
			"RazaoSocialDestino": "NomeRazaoSocialDestino",
			"Engenheiro": "DescricaoEngenheiro",
			"TipoMovimentacao": "DescricaoTipoMovimentacao",
			"TipoAcao": "DescricaoTipoAcao",
			"GrupoEconomico": "DescricaoGrupoEconomico",
			"EmitirContratoComodato": "EmitirContratoComodato",
			"EmitirAditamentoContratual": "EmitirAditamentoContratual",
			"EmitirNfsVenda": "EmitirNfsVenda",
			"ManutencaoRaizen": "ManutencaoRaizen",
			"BaixaVendaAtivos": "BaixaVendaAtivos",
			"ValorAtivosResidual": "ValorAtivosResidual",
			"ValorAtivosVenda": "ValorAtivosVenda",
			"ValorAtivosBaixa": "ValorAtivosBaixa",
			"ValorAtivosMantem": "ValorAtivosMantem",
			"ClausulasAlteradas": "DescricaoClausulasAlteradas",
			"ComentariosMovimentacao": "DescricaoComentariosMovimentacao",
			"PrazoVigenciaMeses": "PrazoVigenciaMeses",
			"Title": "CodigoSolicitacao",
			"RazaoSocial": "NomeRazaoSocial",
			"IBM": "NumeroIBM",
			"SiteCode": "NumeroSiteCode",
			"EtapaReprovada": "EtapaReprovada",
			"TarefasConcluidas": "TarefasConcluidas",
			"EstadoAtualFluxo": "EstadoAtualFluxo",
			"BuscaDocumentos": "BuscaDocumentos",
			"ContratoPadrao": "ContratoPadrao",
			"UtilizaZoneamentoPadrao": "UtilizaZoneamentoPadrao",
			"GerenteTerritorio": "LoginGerenteTerritorio",
			"GerenteRegiao": "LoginGerenteRegiao",
			"DiretorVendas": "LoginDiretorVendas",
			"CDR": "LoginCDR",
			"GDR": "LoginGDR",
			"Created": "DataInclusaoSP",
			"Author": "LoginInclusaoSP",
			"Modified": "DataAlteracaoSP",
			"Editor": "LoginAlteracaoSP"
		}
	}, {
		"NomeTabela": "ListaRNIP",
		"NomeLista": "RNIPs",
		"Mapeamento": {
			"GerenteTerritorio": "LoginGerenteTerritorio",
			"GerenteRegiao": "LoginGerenteRegiao",
			"DiretorVendas": "LoginDiretorVendas",
			"CDR": "LoginCdr",
			"GDR": "LoginGdr",
			"Modified": "DataAlteracaoSP"
		}
	}, {
		"NomeTabela": "ListaB2B",
		"NomeLista": "B2BIP",
		"Mapeamento": {
			"GerenteTerritorio": "LoginGerenteTerritorio",
			"GerenteRegiao": "LoginGerenteRegiao",
			"DiretorVendas": "LoginDiretorVendas",
			"CDR": "LoginCdr",
			"GDR": "LoginGdr"
		}
	}, {
		"NomeTabela": "ListaNOTIF",
		"NomeLista": "NOTIF",
		"Mapeamento": {
			"GerenteTerritorio": "LoginGerenteTerritorio",
			"GerenteRegiao": "LoginGerenteRegiao",
			"DiretorVendas": "LoginDiretorVendas",
			"CDR": "LoginCDR",
			"GDR": "LoginGDR",
			"UtilizaZoneamentoCdr": "UtilizaZoneamentoCdr",
			"UtilizaZoneamentoDiretor": "UtilizaZoneamentoDiretor",
			"UtilizaZoneamentoGdr": "UtilizaZoneamentoGdr",
			"UtilizaZoneamentoGR": "UtilizaZoneamentoGR",
			"UtilizaZoneamentoGT": "UtilizaZoneamentoGT",
			"EstadoAtualFluxo": "DescricaoEstadoAtualFluxo",
			"Etapa": "DescricaoEtapa",
			"Title": "TituloProposta"
		}
	}

]
')
GO
SET IDEntity_INSERT [dbo].[Parametro] OFF
GO

SELECT Valor FROM Parametro WHERE IdParametro = 22;
