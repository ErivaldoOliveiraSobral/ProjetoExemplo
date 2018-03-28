using PortalDeFluxos.Core.BLL.Core.Modelo;
using PortalDeFluxos.Core.BLL.Modelo;
using PortalDeFluxos.Core.BLL.Negocio;
using PortalDeFluxos.NOTIF.BLL.Dados;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortalDeFluxos.NOTIF.BLL.Negocio
{
	public class NegocioRelatorioNOTIF
	{
		private static string[] tabelas = new string[] { "Propostas" }; //new string[] { "Propostas", "Notificações" };

		public static DataSet ObterRelatorioDataSet(DateTime? dataInicio, DateTime? dataFim, Int32? status)
		{
			return DadosNOTIF.ObterRelatorioDataSet(dataInicio, dataFim, status, tabelas);
		}

		public static List<ExcelSheet> ObterRelatorio(DateTime? dataInicio, DateTime? dataFim, Int32? status)
		{
			List<ExcelSheet> abas = new List<ExcelSheet>();

			DataSet dsRelatorio = DadosNOTIF.ObterRelatorioDataSet(dataInicio, dataFim, status, tabelas);
			for (int i = 0; i < dsRelatorio.Tables.Count; i++)
				abas.Add(new ExcelSheet(dsRelatorio.Tables[i].TableName, dsRelatorio.Tables[i]));
			return abas;
		}

	}
}
