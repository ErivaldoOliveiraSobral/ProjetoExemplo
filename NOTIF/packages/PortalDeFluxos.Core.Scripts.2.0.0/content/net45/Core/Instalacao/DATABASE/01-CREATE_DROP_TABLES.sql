USE [PortalDeFluxo]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TarefaHist', @level2type=N'COLUMN',@level2name=N'TipoTarefaHist'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'AprovadoPorEmail'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoHumanWorkflowID'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoListaTarefa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoTarefaSP'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'Ativo'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataAlteracao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataInclusao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginAlteracao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginInclusao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataAtribuido'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataFinalizado'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginCompletadoPor'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeCompletadoPor'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'TarefaEscalonada'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'TarefaCompleta'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'EmailEnviado'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CopiarSuperior'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoMensagemEmailEscalonamento'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAssuntoEmailEscalonamento'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoMensagemEmail'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAssuntoEmail'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAcao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAcaoEfetuada'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'ComentarioAprovacao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataEscalonamento'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataSLA'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'SLA'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeSuperior'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginSuperior'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'EmailSuperior'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeResponsavel'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginResponsavel'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'EmailResponsavel'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAreaResponsavel'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'TipoTarefa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeEtapa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeTarefa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'AprovacaoPor'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoConfiguracao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoTarefa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'IdInstanciaFluxo'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'IdTarefa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'TempoExecucao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'QuantidadeDelegacao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'QuantidadeTarefa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'QuantidadeInstancia'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'QuantidadeLista'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaHist', @level2type=N'COLUMN',@level2name=N'CodigoItem'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaHist', @level2type=N'COLUMN',@level2name=N'CodigoLista'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaAditivosGerais', @level2type=N'COLUMN',@level2name=N'CodigoLista'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaAditivosGerais', @level2type=N'COLUMN',@level2name=N'CodigoItem'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lista', @level2type=N'COLUMN',@level2name=N'DescricaoUrlTarefa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lista', @level2type=N'COLUMN',@level2name=N'CodigoLista'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'DescricaoMensagem'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'DescricaoAssunto'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'EmailEnviado'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'CopiarSuperior'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'DataEnvio'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'NomePara'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'EmailPara'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'IdTarefa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'DataAlteracao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NumeroTentativaInicio'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoWorkflowProgressID'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoInstanceID'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'DataInicio'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'LoginSolicitante'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NomeSolicitante'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NomeSolicitacao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NomeEtapa'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NomeFluxo'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'StatusFluxo'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoItem'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoLista'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoFluxo'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoInstanciaFluxo'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'Ativo'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'DataAlteracao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'DataInclusao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'LoginAlteracao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'LoginInclusao'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'EmailUsuario'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'DescricaoMensagemEmail'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'DescricaoAssuntoEmail'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'Ambiente2013'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'IdItem'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'CodigoLista'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'Processado'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'TipoEmail'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'IdEmailAttachment'

GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Delegacao', @level2type=N'COLUMN',@level2name=N'Status'

GO
ALTER TABLE [dbo].[TipoPropostaDocumento] DROP CONSTRAINT [FK_TipoPropostaDocumento_TipoProposta]
GO
ALTER TABLE [dbo].[TipoPropostaDocumento] DROP CONSTRAINT [FK_TipoPropostaDocumento_Documento]
GO
ALTER TABLE [dbo].[TarefaHist] DROP CONSTRAINT [FK_TarefaHist_Tarefa]
GO
ALTER TABLE [dbo].[Tarefa] DROP CONSTRAINT [FK_Tarefa_InstanciaFluxo]
GO
ALTER TABLE [dbo].[Tarefa] DROP CONSTRAINT [FK_Tarefa_Discussao]
GO
ALTER TABLE [dbo].[PropostaDocumento] DROP CONSTRAINT [FK_PropostasDocumento_Documento]
GO
ALTER TABLE [dbo].[PropostaDocumento] DROP CONSTRAINT [FK_PropostaDocumento_TipoProposta]
GO
ALTER TABLE [dbo].[ListaHist] DROP CONSTRAINT [FK_ListaHist_Lista]
GO
ALTER TABLE [dbo].[Lembrete] DROP CONSTRAINT [FK_Lembrete_Tarefa]
GO
ALTER TABLE [dbo].[InstanciaFluxo] DROP CONSTRAINT [FK_InstanciaFluxo_Lista]
GO
ALTER TABLE [dbo].[Comprador] DROP CONSTRAINT [FK_Comprador_ListaRNIP]
GO
ALTER TABLE [dbo].[Cidade] DROP CONSTRAINT [FK_Cidade_Estado]
GO
ALTER TABLE [dbo].[AnoContratual] DROP CONSTRAINT [FK_AnoContratual_TipoProposta]
GO
ALTER TABLE [dbo].[WFGestaoFluxo_Tarefa] DROP CONSTRAINT [DF_TB_TAREFAS_NR_EMAIL_RESPONSAVEL]
GO
ALTER TABLE [dbo].[WFGestaoFluxo_Tarefa] DROP CONSTRAINT [DF_TB_TAREFAS_NR_EMAIL_SUPERVISOR]
GO
ALTER TABLE [dbo].[WFGestaoFluxo_Tarefa] DROP CONSTRAINT [DF_TB_TAREFAS_SN_FLUXOATUAL]
GO
ALTER TABLE [dbo].[Comprador] DROP CONSTRAINT [DF_Comprador_IsentoIE]
GO
/****** Object:  Table [dbo].[WFGestaoFluxo_Tarefa]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[WFGestaoFluxo_Tarefa]
GO
/****** Object:  Table [dbo].[WFGestaoFluxo_Fluxo]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[WFGestaoFluxo_Fluxo]
GO
/****** Object:  Table [dbo].[TipoPropostaDocumento]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[TipoPropostaDocumento]
GO
/****** Object:  Table [dbo].[TipoProposta]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[TipoProposta]
GO
/****** Object:  Table [dbo].[TarefaHist]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[TarefaHist]
GO
/****** Object:  Table [dbo].[Tarefa]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Tarefa]
GO
/****** Object:  Table [dbo].[TabelaExemplo]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[TabelaExemplo]
GO
/****** Object:  Table [dbo].[ServicoAgendado]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[ServicoAgendado]
GO
/****** Object:  Table [dbo].[PropostaDocumento]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[PropostaDocumento]
GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Parametro]
GO
/****** Object:  Table [dbo].[LogIntegracao]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[LogIntegracao]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Log]
GO
/****** Object:  Table [dbo].[ListaHist]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[ListaHist]
GO
/****** Object:  Table [dbo].[ListaAditivosGerais]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[ListaAditivosGerais]
GO
/****** Object:  Table [dbo].[Lista]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Lista]
GO
/****** Object:  Table [dbo].[Lembrete]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Lembrete]
GO
/****** Object:  Table [dbo].[InstanciaFluxo]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[InstanciaFluxo]
GO
/****** Object:  Table [dbo].[HorarioVerao]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[HorarioVerao]
GO
/****** Object:  Table [dbo].[EstruturaComercial_Salesforce]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[EstruturaComercial_Salesforce]
GO
/****** Object:  Table [dbo].[EstruturaComercial_Modificada]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[EstruturaComercial_Modificada]
GO
/****** Object:  Table [dbo].[EstruturaComercial]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[EstruturaComercial]
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Estado]
GO
/****** Object:  Table [dbo].[EmailAttachment]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[EmailAttachment]
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Documento]
GO
/****** Object:  Table [dbo].[Delegacao]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Delegacao]
GO
/****** Object:  Table [dbo].[Comprador]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Comprador]
GO
/****** Object:  Table [dbo].[Cidade]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[Cidade]
GO
/****** Object:  Table [dbo].[AnoContratual]    Script Date: 17/11/2016 17:55:03 ******/
DROP TABLE [dbo].[AnoContratual]
GO
/****** Object:  Table [dbo].[AnoContratual]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnoContratual](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IdProposta] [int] NOT NULL,
	[IdTipoProposta] [int] NOT NULL,
	[CasoBase] [bit] NULL,
	[Ativo] [bit] NOT NULL,
	[Ano] [int] NOT NULL,
	[Bonificacao] [decimal](18, 5) NULL,
	[BonificacaoPorAno] [decimal](18, 5) NULL,
	[CurvaMaturacaoVolumePadrao] [decimal](18, 5) NULL,
	[CurvaMaturacaoVolumeExcecao] [decimal](18, 5) NULL,
	[OutrasReceitas] [decimal](18, 5) NULL,
	[OutrasDespesas] [decimal](18, 5) NULL,
	[CurvaMaturacaoVolumes] [decimal](18, 5) NULL,
	[OutrosFluxosPositivos] [decimal](18, 5) NULL,
	[OutrosFluxosNegativos] [decimal](18, 5) NULL,
	[Diesel] [decimal](18, 5) NULL,
	[Otto] [decimal](18, 5) NULL,
	[OleoCombustivel] [decimal](18, 5) NULL,
	[Arla] [decimal](18, 5) NULL,
	[CurvaMaturacaoFuels] [decimal](18, 5) NULL,
	[AluguelPago] [decimal](18, 5) NULL,
	[AluguelRecebido] [decimal](18, 5) NULL,
	[Manutencao] [decimal](18, 5) NULL,
	[MeioAmbiente] [decimal](18, 5) NULL,
	[Terrenos] [decimal](18, 5) NULL,
	[EdificacoesPista] [decimal](18, 5) NULL,
	[EdificacoesLoja] [decimal](18, 5) NULL,
	[Bombas] [decimal](18, 5) NULL,
	[Tanques] [decimal](18, 5) NULL,
	[ImagemRVI] [decimal](18, 5) NULL,
	[EquipamentosLoja] [decimal](18, 5) NULL,
	[CurvaMaturacaoLoja] [decimal](18, 5) NULL,
	[Gasolina] [decimal](18, 5) NULL,
	[Etanol] [decimal](18, 5) NULL,
 CONSTRAINT [PK_AnoContratual] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cidade]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cidade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdEstado] [int] NOT NULL,
	[Nome] [nvarchar](255) NOT NULL,
	[SiglaEstado] [nvarchar](2) NULL,
	[SiglaPais] [nvarchar](2) NULL,
	[CodigoSistemaRBC] [int] NULL,
 CONSTRAINT [PK_Cidade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comprador]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comprador](
	[IdComnprador] [int] IDENTITY(1,1) NOT NULL,
	[IdListaRNIP] [int] NOT NULL,
	[IBM] [int] NULL,
	[Pessoa] [nchar](10) NULL,
	[RazaoSocialNome] [varchar](255) NULL,
	[CNPJCPF] [char](14) NULL,
	[IE] [varchar](255) NULL,
	[Endereco] [varchar](255) NULL,
	[Bairro] [varchar](255) NULL,
	[CEP] [char](8) NULL,
	[Cidade] [varchar](255) NULL,
	[UF] [varchar](255) NULL,
	[TipoNegociacao] [varchar](255) NULL,
	[IsentoIE] [bit] NOT NULL,
	[Ativo] [bit] NOT NULL,
	[FkCidade] [int] NULL,
 CONSTRAINT [PK_Comprador] PRIMARY KEY CLUSTERED 
(
	[IdComnprador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Delegacao]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Delegacao](
	[IdDelegacao] [int] IDENTITY(1,1) NOT NULL,
	[LoginDe] [varchar](255) NOT NULL,
	[NomeDe] [varchar](255) NULL,
	[EmailDe] [varchar](200) NULL,
	[LoginPara] [varchar](255) NOT NULL,
	[NomePara] [varchar](255) NULL,
	[EmailPara] [varchar](200) NULL,
	[DataInicio] [datetime] NOT NULL,
	[DataFim] [datetime] NOT NULL,
	[Status] [int] NOT NULL CONSTRAINT [DF_Delegacao_TarefaCompleta]  DEFAULT ((1)),
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
	[CodigoDelegacao2007] [int] NULL,
 CONSTRAINT [PK_Delegacao] PRIMARY KEY CLUSTERED 
(
	[IdDelegacao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Documento]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Documento](
	[IdDocumento] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Agrupador] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED 
(
	[IdDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmailAttachment]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmailAttachment](
	[IdEmailAttachment] [int] IDENTITY(1,1) NOT NULL,
	[TipoEmail] [tinyint] NOT NULL CONSTRAINT [DF_EmailAttachment_TipoEmail]  DEFAULT ((1)),
	[Processado] [bit] NOT NULL CONSTRAINT [DF_EmailAttachment_Processado]  DEFAULT ((0)),
	[CodigoLista] [uniqueidentifier] NOT NULL,
	[IdItem] [int] NOT NULL,
	[NomeProposta] [varchar](200) NULL,
	[Ibm] [varchar](200) NULL,
	[RazaoSocial] [varchar](200) NULL,
	[GerenteTerritorio] [varchar](200) NULL,
	[GerenteRegiao] [varchar](200) NULL,
	[DiretorVendas] [varchar](200) NULL,
	[Cdr] [varchar](200) NULL,
	[Gdr] [varchar](200) NULL,
	[Ambiente2013] [bit] NOT NULL,
	[DescricaoAssuntoEmail] [varchar](500) NULL,
	[DescricaoMensagemEmail] [varchar](max) NULL,
	[EmailUsuario] [varchar](200) NOT NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataInclusao] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_EmailAttachment] PRIMARY KEY CLUSTERED 
(
	[IdEmailAttachment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[UF] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_Estado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstruturaComercial]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstruturaComercial](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IBM] [char](10) NULL,
	[SiteCode] [char](10) NULL,
	[GT] [varchar](100) NULL,
	[GR] [varchar](100) NULL,
	[DV] [varchar](100) NULL,
	[CDR] [varchar](100) NULL,
	[GDR] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstruturaComercial_Modificada]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstruturaComercial_Modificada](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IBM] [char](10) NULL,
	[SiteCode] [char](10) NULL,
	[GT] [varchar](100) NULL,
	[GR] [varchar](100) NULL,
	[DV] [varchar](100) NULL,
	[CDR] [varchar](100) NULL,
	[GDR] [varchar](100) NULL,
	[Processado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EstruturaComercial_Salesforce]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EstruturaComercial_Salesforce](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IBM] [char](10) NULL,
	[SiteCode] [char](10) NULL,
	[GT] [varchar](100) NULL,
	[GR] [varchar](100) NULL,
	[DV] [varchar](100) NULL,
	[CDR] [varchar](100) NULL,
	[GDR] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HorarioVerao]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HorarioVerao](
	[IdHorarioVerao] [int] IDENTITY(1,1) NOT NULL,
	[DataInicio] [datetime] NOT NULL,
	[DataFim] [datetime] NOT NULL,
	[Ano] [int] NOT NULL,
 CONSTRAINT [PK_HorarioVerao] PRIMARY KEY CLUSTERED 
(
	[IdHorarioVerao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InstanciaFluxo]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InstanciaFluxo](
	[IdInstanciaFluxo] [int] IDENTITY(1,1) NOT NULL,
	[CodigoInstanciaFluxo] [uniqueidentifier] NULL,
	[CodigoFluxo] [uniqueidentifier] NULL,
	[CodigoLista] [uniqueidentifier] NOT NULL,
	[CodigoItem] [int] NOT NULL,
	[StatusFluxo] [int] NULL,
	[NomeFluxo] [varchar](200) NOT NULL,
	[NomeEtapa] [varchar](200) NULL,
	[NomeSolicitacao] [varchar](200) NOT NULL,
	[NomeSolicitante] [varchar](100) NOT NULL,
	[LoginSolicitante] [varchar](100) NOT NULL,
	[DataInicio] [datetime] NOT NULL,
	[DataFinalizado] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
	[CodigoInstanceID] [int] NULL,
	[CodigoWorkflowProgressID] [int] NULL,
	[NumeroTentativaInicio] [int] NULL CONSTRAINT [DF_InstanciaFluxo_NumeroTentativaInicio]  DEFAULT ((0)),
	[DataAlteracao] [datetime] NULL,
	[ErroCancelado] [bit] NULL,
	[FluxoReprovado] [bit] NULL,
	[EtapaParalela] [bit] NULL,
	[LoginGerenteTerritorio] [varchar](255) NULL,
	[NomeGerenteTerritorio] [varchar](255) NULL,
	[LoginDiretorVendas] [varchar](255) NULL,
	[NomeDiretorVendas] [varchar](255) NULL,
	[LoginGdr] [varchar](255) NULL,
	[NomeGdr] [varchar](255) NULL,
	[LoginGerenteRegiao] [varchar](255) NULL,
	[NomeGerenteRegiao] [varchar](255) NULL,
	[LoginCdr] [varchar](255) NULL,
	[NomeCdr] [varchar](255) NULL,
	[EmailGerenteTerritorio] [varchar](255) NULL,
	[EmailDiretorVendas] [varchar](255) NULL,
	[EmailGdr] [varchar](255) NULL,
	[EmailGerenteRegiao] [varchar](255) NULL,
	[EmailCdr] [varchar](255) NULL,
 CONSTRAINT [PK_InstanciaFluxo] PRIMARY KEY CLUSTERED 
(
	[IdInstanciaFluxo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lembrete]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Lembrete](
	[IdLembrete] [int] IDENTITY(1,1) NOT NULL,
	[IdTarefa] [int] NOT NULL,
	[EmailPara] [varchar](200) NULL,
	[LoginPara] [varchar](150) NOT NULL,
	[NomePara] [varchar](500) NOT NULL,
	[DataEnvio] [datetime] NOT NULL,
	[CopiarSuperior] [bit] NOT NULL,
	[EmailEnviado] [bit] NOT NULL CONSTRAINT [DF_Lembrete_EmailEnviado]  DEFAULT ((0)),
	[DescricaoAssunto] [varchar](500) NOT NULL,
	[DescricaoMensagem] [varchar](max) NOT NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_Lembrete] PRIMARY KEY CLUSTERED 
(
	[IdLembrete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Lista]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lista](
	[CodigoLista] [uniqueidentifier] NOT NULL,
	[Nome] [varchar](200) NOT NULL,
	[DescricaoUrlLista] [varchar](500) NULL,
	[DescricaoUrlItem] [varchar](500) NULL,
	[DescricaoUrlTarefa] [varchar](500) NULL,
	[Ambiente2007] [bit] NOT NULL CONSTRAINT [DF_Lista_Ambiente2007]  DEFAULT ((1)),
 CONSTRAINT [PK_Lista] PRIMARY KEY CLUSTERED 
(
	[CodigoLista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaAditivosGerais]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListaAditivosGerais](
	[CodigoItem] [int] NOT NULL,
	[CodigoLista] [uniqueidentifier] NOT NULL,
	[CodigoSolicitacao] [varchar](255) NULL,
	[NomeGerente] [varchar](255) NULL,
	[NomeRazaoSocial] [varchar](255) NULL,
	[DescricaoIBM] [varchar](255) NULL,
	[DescricaoRemuneracaoMensal] [varchar](255) NULL,
	[DescricaoTaxaAdesao] [varchar](255) NULL,
	[DescricaoTaxaFranquia] [varchar](255) NULL,
	[DescricaoRoyalty] [varchar](255) NULL,
	[DescricaoGerencia] [varchar](255) NULL,
	[DescricaoResultadoSolicitacao] [varchar](255) NULL,
	[DescricaoTarefaConcluida] [varchar](255) NULL,
	[DescricaoDiscussao] [varchar](255) NULL,
	[DescricaoAssinaturaSocios] [varchar](max) NULL,
	[DescricaoAssinaturaFiador] [varchar](max) NULL,
	[DescricaoUltimoComentario] [varchar](max) NULL,
	[Observacao] [varchar](max) NULL,
	[ContratoPadrao] [bit] NULL,
	[Licenciamento] [bit] NULL,
	[BuscaDeDocumento] [bit] NULL,
	[Franquia] [bit] NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataAlteracao] [datetime] NULL,
	[LoginInclusaoSP] [varchar](255) NULL,
	[DataInclusaoSP] [datetime] NULL,
	[LoginAlteracaoSP] [varchar](255) NULL,
	[DataAlteracaoSP] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_ListaAditivosGerais_1] PRIMARY KEY CLUSTERED 
(
	[CodigoItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ListaHist]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ListaHist](
	[IdListaHist] [int] IDENTITY(1,1) NOT NULL,
	[CodigoLista] [uniqueidentifier] NOT NULL,
	[CodigoItem] [int] NOT NULL,
	[XmlAlteracao] [xml] NOT NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
 CONSTRAINT [PK_ListaHist] PRIMARY KEY CLUSTERED 
(
	[IdListaHist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Log]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Log](
	[IdLog] [bigint] IDENTITY(1,1) NOT NULL,
	[NomeProcesso] [varchar](200) NULL,
	[DescricaoOrigem] [varchar](200) NULL,
	[DescricaoMensagem] [varchar](4000) NOT NULL,
	[DescricaoDetalhe] [varchar](max) NULL,
	[Erro] [bit] NOT NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
 CONSTRAINT [PK_Log] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LogIntegracao]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogIntegracao](
	[IdLogIntegracao] [bigint] IDENTITY(1,1) NOT NULL,
	[DataExecucao] [datetime] NOT NULL,
	[WorkflowProgressID] [int] NOT NULL,
	[QuantidadeLista] [int] NOT NULL CONSTRAINT [DF_LogIntegracao_QuantidadeLista]  DEFAULT ((0)),
	[QuantidadeInstancia] [int] NOT NULL CONSTRAINT [DF_LogIntegracao_QuantidadeInstancia]  DEFAULT ((0)),
	[QuantidadeTarefa] [int] NOT NULL CONSTRAINT [DF_LogIntegracao_QuantidadeTarefa]  DEFAULT ((0)),
	[QuantidadeDelegacao] [int] NOT NULL CONSTRAINT [DF_LogIntegracao_QuantidadeDelegacao]  DEFAULT ((0)),
	[TempoExecucao] [int] NOT NULL CONSTRAINT [DF_LogIntegracao_TempoExecucao]  DEFAULT ((0)),
	[ExecucaoCompleta] [bit] NULL DEFAULT ((0)),
	[ExecucaoGestaoFluxo] [bit] NULL DEFAULT ((0)),
	[QuantidadeGestaoFluxoFluxo] [int] NULL,
	[QuantidadeGestaoFluxoTarefa] [int] NULL,
	[QuantidadeGestaoFluxoTarefaStatus] [int] NULL,
 CONSTRAINT [PK_LogIntegracao] PRIMARY KEY CLUSTERED 
(
	[IdLogIntegracao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parametro]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parametro](
	[IdParametro] [int] IDENTITY(1,1) NOT NULL,
	[Descricao] [varchar](100) NOT NULL,
	[Valor] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Parametro] PRIMARY KEY CLUSTERED 
(
	[IdParametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropostaDocumento]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropostaDocumento](
	[IdPropostaDocumento] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoProposta] [int] NOT NULL,
	[IdDocumento] [int] NOT NULL,
 CONSTRAINT [PK_PropostasDocumento] PRIMARY KEY CLUSTERED 
(
	[IdPropostaDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServicoAgendado]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[ServicoAgendado](
	[IdServicoAgendado] [int] IDENTITY(1,1) NOT NULL,
	[NomeAssemblyFullName] [varchar](500) NOT NULL,
	[NomeAssemblyType] [varchar](255) NOT NULL,
	[DescricaoAgenda] [varchar](500) NULL,
	[DataUltimaExecucao] [datetime] NULL,
	[DataProximaExecucao] [datetime] NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
	[Logar] [bit] NULL,
 CONSTRAINT [PK_ServicoAgendado] PRIMARY KEY CLUSTERED 
(
	[IdServicoAgendado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TabelaExemplo]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TabelaExemplo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Valor] [varchar](500) NOT NULL,
 CONSTRAINT [PK__Table__3214EC07A0603698] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarefa]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarefa](
	[IdTarefa] [int] IDENTITY(1,1) NOT NULL,
	[IdInstanciaFluxo] [int] NOT NULL,
	[CodigoTarefa] [uniqueidentifier] NULL,
	[CodigoConfiguracao] [int] NULL,
	[AprovacaoPor] [int] NULL,
	[NomeTarefa] [varchar](200) NOT NULL,
	[NomeEtapa] [varchar](200) NOT NULL,
	[TipoTarefa] [tinyint] NULL CONSTRAINT [DF_Tarefa_TipoTarefa]  DEFAULT ((1)),
	[DescricaoAreaResponsavel] [varchar](200) NULL,
	[EmailResponsavel] [varchar](max) NOT NULL,
	[LoginResponsavel] [varchar](250) NOT NULL,
	[NomeResponsavel] [varchar](500) NOT NULL,
	[EmailSuperior] [varchar](200) NULL,
	[LoginSuperior] [varchar](250) NULL,
	[NomeSuperior] [varchar](500) NULL,
	[SLA] [int] NULL,
	[DataSLA] [datetime] NULL,
	[DataEscalonamento] [datetime] NULL,
	[ComentarioAprovacao] [varchar](max) NULL,
	[DescricaoAcaoEfetuada] [varchar](100) NULL,
	[DescricaoAcao] [varchar](500) NULL,
	[DescricaoAssuntoEmail] [varchar](500) NULL,
	[DescricaoMensagemEmail] [varchar](max) NULL,
	[DescricaoAssuntoEmailEscalonamento] [varchar](500) NULL,
	[DescricaoMensagemEmailEscalonamento] [varchar](max) NULL,
	[CopiarSuperior] [bit] NOT NULL,
	[EmailEnviado] [bit] NOT NULL CONSTRAINT [DF_Tarefa_EmailEnviado]  DEFAULT ((0)),
	[TarefaCompleta] [bit] NOT NULL CONSTRAINT [DF_Tarefa_TarefaCompleta]  DEFAULT ((0)),
	[TarefaEscalonada] [bit] NOT NULL CONSTRAINT [DF_Tarefa_TarefaEscalonada]  DEFAULT ((0)),
	[NomeCompletadoPor] [varchar](100) NULL,
	[LoginCompletadoPor] [varchar](100) NULL,
	[DataFinalizado] [datetime] NULL,
	[DataAtribuido] [datetime] NOT NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataInclusao] [datetime] NOT NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL,
	[CodigoTarefaSP] [int] NULL,
	[CodigoListaTarefa] [uniqueidentifier] NULL,
	[CodigoHumanWorkflowID] [int] NULL,
	[DescricaoAcaoFinalizarEtapa] [varchar](500) NULL,
	[AprovadoPorEmail] [bit] NULL CONSTRAINT [DF_Tarefa_AprovadoPorEmail]  DEFAULT ((0)),
	[IndexAprovacao] [int] NULL,
	[AprovacoesAtuais] [bit] NULL,
	[IdTarefaPai] [int] NULL,
	[EnviarPdf] [bit] NULL,
	[IndexHeadLineFinal] [int] NULL,
	[ParametrosUrl] [varchar](500) NULL,
 CONSTRAINT [PK_Tarefa] PRIMARY KEY CLUSTERED 
(
	[IdTarefa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TarefaHist]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[TarefaHist](
	[IdTarefaHist] [int] IDENTITY(1,1) NOT NULL,
	[IdTarefa] [int] NOT NULL,
	[TipoTarefaHist] [tinyint] NOT NULL,
	[LoginDe] [varchar](255) NOT NULL,
	[LoginPara] [varchar](255) NOT NULL,
	[LoginInclusao] [varchar](255) NOT NULL,
	[DataInclusao] [datetime] NOT NULL,
	[LoginAlteracao] [varchar](255) NULL,
	[DataAlteracao] [datetime] NULL,
	[Ativo] [bit] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[TarefaHist] ADD [ComentarioDelegacao] [varchar](max) NULL
 CONSTRAINT [PK_DelegacaoHist] PRIMARY KEY CLUSTERED 
(
	[IdTarefaHist] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoProposta]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoProposta](
	[IdTipoProposta] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoPropostaPai] [int] NULL,
	[Proposta] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Propostas] PRIMARY KEY CLUSTERED 
(
	[IdTipoProposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TipoPropostaDocumento]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoPropostaDocumento](
	[IdTipoPropostaDocumento] [int] IDENTITY(1,1) NOT NULL,
	[IdItem] [int] NOT NULL,
	[IdTipoProposta] [int] NULL,
	[IdDocumento] [int] NULL,
	[Tem] [bit] NULL CONSTRAINT [DF_ListaDocumento_Tem]  DEFAULT ((0)),
	[Atende] [bit] NULL CONSTRAINT [DF_ListaDocumento_Atende]  DEFAULT ((0)),
	[Excecao] [bit] NULL CONSTRAINT [DF_ListaDocumento_Excecao]  DEFAULT ((0)),
	[Dispensado] [bit] NULL CONSTRAINT [DF_ListaDocumento_Dispensado]  DEFAULT ((0)),
 CONSTRAINT [PK_ListaDocumento_1] PRIMARY KEY CLUSTERED 
(
	[IdTipoPropostaDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WFGestaoFluxo_Fluxo]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WFGestaoFluxo_Fluxo](
	[CD_SEQ_FLUXO] [int] NOT NULL,
	[CD_ITEM] [int] NOT NULL,
	[CD_LISTA] [uniqueidentifier] NOT NULL,
	[NM_LISTA] [varchar](255) NULL,
	[NM_SOLICITACAO] [varchar](255) NULL,
	[NM_IBM] [varchar](20) NULL,
	[NM_RAZAO_SOCIAL] [varchar](255) NULL,
	[NM_SOLICITANTE] [varchar](255) NULL,
	[NM_STATUS] [varchar](255) NULL,
	[NM_ATIVO] [varchar](50) NULL,
	[NM_GA] [varchar](255) NULL,
	[NM_GT] [varchar](255) NULL,
	[DT_ENTRADA] [datetime] NULL,
	[DT_SAIDA] [datetime] NULL,
	[DT_CRIACAO] [datetime] NULL,
	[DT_MODIFICACAO] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CD_SEQ_FLUXO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WFGestaoFluxo_Tarefa]    Script Date: 17/11/2016 17:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[WFGestaoFluxo_Tarefa](
	[CD_TAREFA] [int] NOT NULL,
	[CD_FLUXO] [int] NOT NULL,
	[CD_WORKFLOW_ID] [uniqueidentifier] NOT NULL,
	[CD_LISTA_TAREFA] [uniqueidentifier] NOT NULL,
	[NR_ESTADO_ID] [int] NOT NULL,
	[NR_ACAO_ID] [int] NOT NULL,
	[NR_ESTADO_ACAO_ID] [int] NOT NULL,
	[SN_FLUXO_ATUAL] [bit] NOT NULL,
	[NM_TAREFA] [varchar](255) NULL,
	[NM_PAPEL] [varchar](255) NULL,
	[NM_RESPONSAVEL] [varchar](255) NULL,
	[NM_RESPONSAVEL_ORIGINAL] [varchar](255) NULL,
	[NM_RESPONSAVEL_LOGIN] [varchar](255) NULL,
	[NM_RESPONSAVEL_LOGIN_ORIGINAL] [varchar](255) NULL,
	[NM_SUPERVISORES] [varchar](1000) NULL,
	[NM_SUPERVISORES_LOGIN] [varchar](1000) NULL,
	[NM_STATUS] [varchar](255) NULL,
	[NM_COMENTARIOS] [varchar](4000) NULL,
	[SN_DELEGADO_SUPERVISOR] [bit] NULL,
	[NR_EMAIL_SUPERVISOR] [int] NULL,
	[NR_EMAIL_RESPONSAVEL] [int] NULL,
	[NR_SLA_ESPERADO] [int] NULL,
	[NR_SLA_REAL] [int] NULL,
	[DT_SLA] [datetime] NULL,
	[DT_SAIDA] [datetime] NULL,
	[DT_CRIACAO] [datetime] NULL,
	[DT_MODIFICACAO] [datetime] NULL,
	[DT_DELEGACAO_PROGRAMADA] [datetime] NULL,
	[CD_ITEM_TAREFA] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CD_TAREFA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Comprador] ADD  CONSTRAINT [DF_Comprador_IsentoIE]  DEFAULT ((0)) FOR [IsentoIE]
GO
ALTER TABLE [dbo].[WFGestaoFluxo_Tarefa] ADD  CONSTRAINT [DF_TB_TAREFAS_SN_FLUXOATUAL]  DEFAULT ((1)) FOR [SN_FLUXO_ATUAL]
GO
ALTER TABLE [dbo].[WFGestaoFluxo_Tarefa] ADD  CONSTRAINT [DF_TB_TAREFAS_NR_EMAIL_SUPERVISOR]  DEFAULT ((0)) FOR [NR_EMAIL_SUPERVISOR]
GO
ALTER TABLE [dbo].[WFGestaoFluxo_Tarefa] ADD  CONSTRAINT [DF_TB_TAREFAS_NR_EMAIL_RESPONSAVEL]  DEFAULT ((0)) FOR [NR_EMAIL_RESPONSAVEL]
GO
ALTER TABLE [dbo].[AnoContratual]  WITH CHECK ADD  CONSTRAINT [FK_AnoContratual_TipoProposta] FOREIGN KEY([IdTipoProposta])
REFERENCES [dbo].[TipoProposta] ([IdTipoProposta])
GO
ALTER TABLE [dbo].[AnoContratual] CHECK CONSTRAINT [FK_AnoContratual_TipoProposta]
GO
ALTER TABLE [dbo].[Cidade]  WITH CHECK ADD  CONSTRAINT [FK_Cidade_Estado] FOREIGN KEY([IdEstado])
REFERENCES [dbo].[Estado] ([Id])
GO
ALTER TABLE [dbo].[Cidade] CHECK CONSTRAINT [FK_Cidade_Estado]
GO
ALTER TABLE [dbo].[Comprador]  WITH CHECK ADD  CONSTRAINT [FK_Comprador_ListaRNIP] FOREIGN KEY([IdListaRNIP])
REFERENCES [dbo].[ListaRNIP] ([IdListaRNIP])
GO
ALTER TABLE [dbo].[Comprador] CHECK CONSTRAINT [FK_Comprador_ListaRNIP]
GO
ALTER TABLE [dbo].[InstanciaFluxo]  WITH CHECK ADD  CONSTRAINT [FK_InstanciaFluxo_Lista] FOREIGN KEY([CodigoLista])
REFERENCES [dbo].[Lista] ([CodigoLista])
GO
ALTER TABLE [dbo].[InstanciaFluxo] CHECK CONSTRAINT [FK_InstanciaFluxo_Lista]
GO
ALTER TABLE [dbo].[Lembrete]  WITH CHECK ADD  CONSTRAINT [FK_Lembrete_Tarefa] FOREIGN KEY([IdTarefa])
REFERENCES [dbo].[Tarefa] ([IdTarefa])
GO
ALTER TABLE [dbo].[Lembrete] CHECK CONSTRAINT [FK_Lembrete_Tarefa]
GO
ALTER TABLE [dbo].[ListaHist]  WITH CHECK ADD  CONSTRAINT [FK_ListaHist_Lista] FOREIGN KEY([CodigoLista])
REFERENCES [dbo].[Lista] ([CodigoLista])
GO
ALTER TABLE [dbo].[ListaHist] CHECK CONSTRAINT [FK_ListaHist_Lista]
GO
ALTER TABLE [dbo].[PropostaDocumento]  WITH CHECK ADD  CONSTRAINT [FK_PropostaDocumento_TipoProposta] FOREIGN KEY([IdTipoProposta])
REFERENCES [dbo].[TipoProposta] ([IdTipoProposta])
GO
ALTER TABLE [dbo].[PropostaDocumento] CHECK CONSTRAINT [FK_PropostaDocumento_TipoProposta]
GO
ALTER TABLE [dbo].[PropostaDocumento]  WITH CHECK ADD  CONSTRAINT [FK_PropostasDocumento_Documento] FOREIGN KEY([IdDocumento])
REFERENCES [dbo].[Documento] ([IdDocumento])
GO
ALTER TABLE [dbo].[PropostaDocumento] CHECK CONSTRAINT [FK_PropostasDocumento_Documento]
GO
ALTER TABLE [dbo].[Tarefa]  WITH CHECK ADD  CONSTRAINT [FK_Tarefa_Discussao] FOREIGN KEY([IdTarefaPai])
REFERENCES [dbo].[Tarefa] ([IdTarefa])
GO
ALTER TABLE [dbo].[Tarefa] CHECK CONSTRAINT [FK_Tarefa_Discussao]
GO
ALTER TABLE [dbo].[Tarefa]  WITH CHECK ADD  CONSTRAINT [FK_Tarefa_InstanciaFluxo] FOREIGN KEY([IdInstanciaFluxo])
REFERENCES [dbo].[InstanciaFluxo] ([IdInstanciaFluxo])
GO
ALTER TABLE [dbo].[Tarefa] CHECK CONSTRAINT [FK_Tarefa_InstanciaFluxo]
GO
ALTER TABLE [dbo].[TarefaHist]  WITH CHECK ADD  CONSTRAINT [FK_TarefaHist_Tarefa] FOREIGN KEY([IdTarefa])
REFERENCES [dbo].[Tarefa] ([IdTarefa])
GO
ALTER TABLE [dbo].[TarefaHist] CHECK CONSTRAINT [FK_TarefaHist_Tarefa]
GO
ALTER TABLE [dbo].[TipoPropostaDocumento]  WITH CHECK ADD  CONSTRAINT [FK_TipoPropostaDocumento_Documento] FOREIGN KEY([IdDocumento])
REFERENCES [dbo].[Documento] ([IdDocumento])
GO
ALTER TABLE [dbo].[TipoPropostaDocumento] CHECK CONSTRAINT [FK_TipoPropostaDocumento_Documento]
GO
ALTER TABLE [dbo].[TipoPropostaDocumento]  WITH CHECK ADD  CONSTRAINT [FK_TipoPropostaDocumento_TipoProposta] FOREIGN KEY([IdTipoProposta])
REFERENCES [dbo].[TipoProposta] ([IdTipoProposta])
GO
ALTER TABLE [dbo].[TipoPropostaDocumento] CHECK CONSTRAINT [FK_TipoPropostaDocumento_TipoProposta]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Status que a delegação se encontra (1 - Pendente / 2 - Iniciada / 3 - Concluída)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Delegacao', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador do Email ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'IdEmailAttachment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de Email (1 - Enviado, 2 - Recebido)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'TipoEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se o e-mail foi processado com sucesso. (1- Processado 2-Erro/Não processado)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'Processado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guid da lista de proposta - Sharepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'CodigoLista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id da proposta - Sharepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'IdItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se a proposta está no ambiente 2007 ou 2013' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'Ambiente2013'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assunto do e-mail.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'DescricaoAssuntoEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Corpo do e-mail.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'DescricaoMensagemEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E-mail do Usuário que reberá ou enviou o e-mail.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'EmailUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do usuário que criou a EmailAttachment.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'LoginInclusao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do usuário que alterou a EmailAttachment.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'LoginAlteracao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de criação da EmailAttachment.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'DataInclusao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data da alteração da EmailAttachment.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'DataAlteracao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se a EmailAttachment foi excluída do sistema.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EmailAttachment', @level2type=N'COLUMN',@level2name=N'Ativo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da Instância do fluxo no Sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoInstanciaFluxo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Armazena WorkflowSubscriptionID do fluxo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoFluxo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id da lista Sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoLista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id do Item Sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado do fluxo Sharepoint (1- Em andamento, 2- Erro, 3- Cancelado, 4- Finalizado)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'StatusFluxo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do fluxo no Sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NomeFluxo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Armazena o UserStatus do workflow. Estado do item.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NomeEtapa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome da solicitação. Geralmente é o mesmo valor do Title do item sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NomeSolicitacao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do usuário que realizou a solicitação. Geralmente é o autor do item sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NomeSolicitante'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do usuário que realizou a solicitação. Geralmente é o autor do item sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'LoginSolicitante'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data do início do fluxo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'DataInicio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Instance ID do Nintex. Utilizado apenas no controle dos dados migrados 2007.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoInstanceID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Progress ID do Nintex. Utilizado apenas no controle dos dados migrados 2007.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'CodigoWorkflowProgressID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número de tentativas de início do fluxo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'NumeroTentativaInicio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data que o item foi alterado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'InstanciaFluxo', @level2type=N'COLUMN',@level2name=N'DataAlteracao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código da tarefa ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'IdTarefa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Destinatário do lembrete.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'EmailPara'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do destinatário do lembrete.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'NomePara'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data programada para envio do lembrete.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'DataEnvio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se o superior deve estar copiado no e-mail enviado.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'CopiarSuperior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se o e-mail já foi enviado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'EmailEnviado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assunto do lembrete.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'DescricaoAssunto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Corpo do e-mail do lembrete.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lembrete', @level2type=N'COLUMN',@level2name=N'DescricaoMensagem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chave da lista no Sharepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lista', @level2type=N'COLUMN',@level2name=N'CodigoLista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Url para tela de aprovacao.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lista', @level2type=N'COLUMN',@level2name=N'DescricaoUrlTarefa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID do item no Sharepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaAditivosGerais', @level2type=N'COLUMN',@level2name=N'CodigoItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID da lista no Shaepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaAditivosGerais', @level2type=N'COLUMN',@level2name=N'CodigoLista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID da lista no Shaepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaHist', @level2type=N'COLUMN',@level2name=N'CodigoLista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID do item no Sharepoint' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ListaHist', @level2type=N'COLUMN',@level2name=N'CodigoItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade de listas sincronizadas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'QuantidadeLista'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade de instâncias sincronizadas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'QuantidadeInstancia'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade de tarefas sincronizadas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'QuantidadeTarefa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Quantidade de delegação sincronizadas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'QuantidadeDelegacao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tempo de execução em segundos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogIntegracao', @level2type=N'COLUMN',@level2name=N'TempoExecucao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador da tarefa ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'IdTarefa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador do fluxo.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'IdInstanciaFluxo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Utilizado para dar andamento na custom action. Todas as tarefas criadas pela mesma action deve ter o mesmo código.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoTarefa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID do item de configuração no Sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoConfiguracao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Como o aprovador é definido (1 - Item, 2 - Papel, 3 - Alçada)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'AprovacaoPor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome da tarefa. Definido na lista de configuração no Sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeTarefa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome da etapa que a tarefa pertence. Definido na lista de configuração no Sharepoint. Utilizado no painel.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeEtapa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de aprovação criada (1 - primeiro, 2 - Todos,3 - votação)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'TipoTarefa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome da etapa que a tarefa pertence. Definido na lista de configuração no Sharepoint. Utilizado no painel.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAreaResponsavel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do responsável pela tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'EmailResponsavel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do responsável pela tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginResponsavel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E-mail do responsável pela tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeResponsavel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do superior responsável pela tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'EmailSuperior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do superior responsável pela tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginSuperior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'E-mail do superior responsável pela tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeSuperior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID do item de configuração no Sharepoint.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'SLA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SLA em dias.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataSLA'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data do escalonamento automático da tarefa. Caso a data estiver nula a tarefa não é escalonada.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataEscalonamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Comentário da tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'ComentarioAprovacao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ação efetuada.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAcaoEfetuada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ações disponíveis para o usuário/sistema na tarefa' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAcao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assunto do e-mail da tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAssuntoEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Corpo do e-mail da tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoMensagemEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Assunto do e-mail da escalonamento.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoAssuntoEmailEscalonamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Corpo do e-mail do escalonamento.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DescricaoMensagemEmailEscalonamento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se o superior deve estar copiado no e-mail enviado para o responsável.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CopiarSuperior'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se o e-mail já foi enviado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'EmailEnviado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se a tarefa já foi completada via Usuário/Sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'TarefaCompleta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se a tarefa foi escalonada.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'TarefaEscalonada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nome do usuário que aprovou a tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'NomeCompletadoPor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do usuário que aprovou a tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginCompletadoPor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data em que a tarefa foi finalizada.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataFinalizado'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data que a tarefa foi atribuído para o responsável. A data muda em caso de delegação.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataAtribuido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do usuário que criou a tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginInclusao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Login do usuário que alterou a tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'LoginAlteracao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data de criação da tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataInclusao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Data da alteração da tarefa.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'DataAlteracao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se a tarefa foi excluída do sistema.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'Ativo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id da tarefa Sharepoint. Utilizado apenas no controle dos dados migrados 2007.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoTarefaSP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id da lista de tarefas Sharepoint. Utilizado apenas no controle dos dados migrados 2007.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoListaTarefa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Agrupador de tarefas. Utilizado apenas no controle dos dados migrados 2007.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'CodigoHumanWorkflowID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Se a aprovação foi realizada por e-mail' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Tarefa', @level2type=N'COLUMN',@level2name=N'AprovadoPorEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de Historico (1 - Delegação Individual, 2 - Delegação Automática, 3 - Escalonamento)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TarefaHist', @level2type=N'COLUMN',@level2name=N'TipoTarefaHist'
GO
