using PortalDeFluxos.Core.BLL;
using PortalDeFluxos.Core.BLL.Dados;
using PortalDeFluxos.NOTIF.BLL.Core.Modelo.Salesforce;
using PortalDeFluxos.NOTIF.BLL.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PortalDeFluxos.Core.BLL.Core.Modelo;

namespace PortalDeFluxos.NOTIF.BLL.Dados
{
    public class DadosNOTIF : BaseDB
    {

		public static DataSet ObterRelatorioDataSet(DateTime? dataInicio, DateTime? dataFim, Int32? status,String[] tabelas)
        {
            #region [Parâmetros]
            List<DbParameter> parametros = new List<DbParameter>()
            {
                    new SqlParameter()
                    {
                        DbType = System.Data.DbType.DateTime,
                        Direction = System.Data.ParameterDirection.Input,
                        ParameterName = "@dataInicio",
                        Value = dataInicio
                    }
                    ,new SqlParameter()
                    {
                        DbType = System.Data.DbType.DateTime,
                        Direction = System.Data.ParameterDirection.Input,
                        ParameterName = "@dataFim",
                        Value = dataFim
                    }
					,new SqlParameter()
                    {
                        DbType = System.Data.DbType.Int32,
                        Direction = System.Data.ParameterDirection.Input,
                        ParameterName = "@status",
                        Value = status
                    }    
            };
            #endregion

			return ExecutarProcedureDataSet(PortalWeb.ContextoWebAtual, "spConsultarRelatorioNOTIF", parametros, tabelas);

        }

		public static List<ListaNOTIF> ObterListaNOTIFPorIbms(List<InformacoesIBMSalesForce> ibms)
		{
			List<ListaNOTIF> _propostas = new List<ListaNOTIF>();
			List<Int32> numerosIbm = ibms.Select(_ => _.IBM).ToList();
			using (ContextoBanco db = RetornarContextoDB(PortalWeb.ContextoWebAtual))
			{
				_propostas =  (from notif in db.ListaNOTIF
							   where notif.NumeroIBM != null &&
									numerosIbm.Contains((Int32)notif.NumeroIBM)
							   select notif).ToList();
			}
			return _propostas;
		}

    }
}
