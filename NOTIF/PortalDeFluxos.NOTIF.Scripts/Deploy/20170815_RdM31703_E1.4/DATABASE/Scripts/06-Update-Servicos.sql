USE [FluxosRaizen]

GO

IF EXISTS (SELECT 1 FROM [dbo].[ServicoAgendado] WHERE [NomeAssemblyType] = 'PortalDeFluxos.NOTIF.BLL.Negocio.NegocioServicoNOTIF')
	UPDATE [dbo].[ServicoAgendado]
	   SET [DataProximaExecucao] = getdate(),[DescricaoAgenda]='daily between 03:00:00 and 04:00:00',[Ativo]=1
	 WHERE [NomeAssemblyType] = 'PortalDeFluxos.NOTIF.BLL.Negocio.NegocioServicoNOTIF'
ELSE 
    INSERT INTO [dbo].[ServicoAgendado]
               ([NomeAssemblyFullName]
               ,[NomeAssemblyType]
               ,[DescricaoAgenda]
               ,[DataUltimaExecucao]
               ,[DataProximaExecucao]
               ,[LoginInclusao]
               ,[DataInclusao]
               ,[LoginAlteracao]
               ,[DataAlteracao]
               ,[Ativo])
         VALUES
               ('PortalDeFluxos.NOTIF.BLL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=ea01b2f5f70f54e6'
               ,'PortalDeFluxos.NOTIF.BLL.Negocio.NegocioServicoNOTIF'
               ,'daily between 03:00:00 and 04:00:00'
               ,getdate()
               ,getdate()
               ,''
               ,getdate()
               ,''
               ,getdate()
               ,1)

