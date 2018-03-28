USE [FluxosRaizen]

GO
IF NOT EXISTS(select 1 from sys.columns t0 inner join sys.objects t1 on t0.object_id = t1.object_id
				where t0.name = 'NotificacaoPadrao' and t1.name = 'ListaNOTIFNotificacoes')
BEGIN
	ALTER TABLE ListaNOTIFNotificacoes ADD [NotificacaoPadrao] [bit] NULL;
END


INSERT [dbo].[RelatorioOperacionalTarefa] ([Fluxo], [Tabela], [CodigoLista], [IdTipoProposta], [IdProposta], [TituloProposta], [Combo], [RazaoSocial], [IBM], [SiteCode], [GT], [GR], [Diretor], [CDR], [GDR])
VALUES (N'NOTIF', N'ListaNOTIF', N'CodigoLista', NULL, N'CodigoItem', N'TituloProposta', NULL, N'DescricaoRazaoSocial', N'NumeroIBM', null, N'LoginGerenteTerritorio', N'LoginGerenteRegiao', N'LoginDiretorVendas', N'LoginCDR', N'LoginGDR')
GO
