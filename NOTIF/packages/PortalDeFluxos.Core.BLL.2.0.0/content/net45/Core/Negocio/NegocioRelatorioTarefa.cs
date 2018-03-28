using PortalDeFluxos.Core.BLL.Dados;
using PortalDeFluxos.Core.BLL.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortalDeFluxos.Core.BLL.Negocio
{
    public class NegocioRelatorioTarefa
    {
        public static DataSet ObterRelatorioTarefas(String periodoInicio, String periodoFim, Boolean consultaPorTarefa, string[] fluxos)
        {
            return DadosRelatorioTarefa.ObterRelatorioTarefas(periodoInicio, periodoFim,consultaPorTarefa, fluxos);
        }

    }
}
