USE [FluxosRaizen]
GO

IF EXISTS (SELECT * FROM [dbo].[Parametro] WHERE IdParametro =40)
BEGIN
	DELETE [dbo].[Parametro] WHERE IdParametro=40;
END
GO

SET IDEntity_INSERT [dbo].[Parametro] ON 
GO

DECLARE	@Ambiente					nvarchar(10),
		@UrlAmbiente				nvarchar(200)

SELECT @UrlAmbiente	= Valor FROM Parametro WHERE IdParametro = 1;

IF(@UrlAmbiente = 'http://gestaodefluxos-sc.cosan.com.br/')
	SELECT @Ambiente = 'prd';
ELSE IF(@UrlAmbiente = 'http://gestaodefluxos-sc-qas.cosan.com.br/')
	SELECT @Ambiente = 'qas';
ELSE IF(@UrlAmbiente = 'http://rzappwfe01vd/')
	SELECT @Ambiente = 'dev';
ELSE
	SELECT @Ambiente = 'vm';

SELECT @Ambiente AS Ambiente;

IF(@Ambiente = 'prd') 
	BEGIN
		INSERT [dbo].[Parametro] ([IdParametro], [Descricao], [Valor]) VALUES (40, N'Configurações E-mail Attachment', N'[
			{  
				"NomeLista":"Aditivos Gerais",
				"SiteAnexo":"http://fluxos.raizen.com",
				"TipoAnexo":"1",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Item":"AditivosGerais"
				}
			},
			{  
				"NomeLista":"Comodato",
				"SiteAnexo":"http://fluxos.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"RNIPs",
				"SiteAnexo":"http://fluxos.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"B2BIP",
				"SiteAnexo":"http://fluxos.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"NOTIF",
				"SiteAnexo":"http://fluxos.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			}
		]');
		
	
	END
ELSE IF(@Ambiente = 'qas') 
	BEGIN
		INSERT [dbo].[Parametro] ([IdParametro], [Descricao], [Valor]) VALUES (40, N'Configurações E-mail Attachment', N'[
		  {  
				"NomeLista":"Aditivos Gerais",
				"SiteAnexo":"http://fluxos-qas.raizen.com",
				"TipoAnexo":"1",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Item":"AditivosGerais"
				}
			},
			{  
				"NomeLista":"Comodato",
				"SiteAnexo":"http://fluxos-qas.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"RNIPs",
				"SiteAnexo":"http://fluxos-qas.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"B2BIP",
				"SiteAnexo":"http://fluxos-qas.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"NOTIF",
				"SiteAnexo":"http://fluxos-qas.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			}
		]');		
	END
ELSE IF(@Ambiente = 'dev') 
	BEGIN
		INSERT [dbo].[Parametro] ([IdParametro], [Descricao], [Valor]) VALUES (40, N'Configurações E-mail Attachment', N'[
		  {  
				"NomeLista":"Aditivos Gerais",
				"SiteAnexo":"http://fluxos-dev.raizen.com",
				"TipoAnexo":"1",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Item":"AditivosGerais"
				}
			},
			{  
				"NomeLista":"Comodato",
				"SiteAnexo":"http://fluxos-dev.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"RNIPs",
				"SiteAnexo":"http://fluxos-dev.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"B2BIP",
				"SiteAnexo":"http://fluxos-dev.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"NOTIF",
				"SiteAnexo":"http://fluxos-dev.raizen.com",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			}  
		]');	
	END
ELSE
	BEGIN
		INSERT [dbo].[Parametro] ([IdParametro], [Descricao], [Valor]) VALUES (40, N'Configurações E-mail Attachment', N'[
		  {  
				"NomeLista":"Aditivos Gerais",
				"SiteAnexo":"http://pi",
				"TipoAnexo":"1",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Item":"AditivosGerais"
				}
			},
			{  
				"NomeLista":"Comodato",
				"SiteAnexo":"http://pi",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"RNIPs",
				"SiteAnexo":"http://pi",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"B2BIP",
				"SiteAnexo":"http://pi",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			},
			{  
				"NomeLista":"NOTIF",
				"SiteAnexo":"http://pi",
				"TipoAnexo":"2",
				"TamanhoLimite":"30",
				"Mapeamento":{  
					"Usuario":"Author"
				}
			}  
		]');		
	END

GO
SET IDEntity_INSERT [dbo].[Parametro] OFF
GO

SELECT Valor FROM Parametro WHERE IdParametro = 40;
