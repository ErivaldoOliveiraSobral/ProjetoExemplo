using Microsoft.SharePoint;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;

namespace PortalDeFluxos.Core.Wrapper
{
    public class ControleAnexo : ControleBase
    {
        public ControleAnexo(Control control)
        {
            _controle = control;
        }

        public void SalvarAnexos(String url)
        {
            _controle.GetType().GetMethod("SalvarAnexos").Invoke(_controle, new object[] { url });
        }

        public Int32 ObterQuaNOTIFdadeAnexos()
        {
            object quaNOTIFdade = _controle.GetType().GetMethod("ObterQuaNOTIFdadeAnexos").Invoke(_controle, null);
            return quaNOTIFdade is int ? (int)quaNOTIFdade : 0;
        }
    }
}
