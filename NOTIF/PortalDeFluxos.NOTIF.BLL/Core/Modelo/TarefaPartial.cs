using PortalDeFluxos.Core.BLL.Negocio;

namespace PortalDeFluxos.Core.BLL.Modelo
{
    public partial class Tarefa 
    {
        private ListaSP_RaizenConfiguracoesDeFluxo _configuracao = null;
        /// <summary>Carrega a configuração da tarefa</summary>
        public ListaSP_RaizenConfiguracoesDeFluxo Configuracao
        { 
            get
            {
                if (_configuracao == null && this.CodigoConfiguracao > 0 && this.CodigoConfiguracao != null)
                    _configuracao = new ListaSP_RaizenConfiguracoesDeFluxo().Obter((int)this.CodigoConfiguracao);
                return _configuracao;
            }
        }
    }
}
