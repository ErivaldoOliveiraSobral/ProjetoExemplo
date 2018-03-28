using Iteris.SharePoint;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PortalDeFluxos.Core.BLL;
using PortalDeFluxos.Core.BLL.Modelo;
using PortalDeFluxos.Core.BLL.Negocio;
using PortalDeFluxos.Core.BLL.Utilitario;
using System;
using System.Collections.Generic;
using Iteris;
using System.Xml;
using System.Text;
using System.IO;
using System.Xml.Serialization;
using PortalDeFluxos.NOTIF.BLL.Modelo;
using System.Linq;
using PortalDeFluxos.NOTIF.BLL.Utilitario;
using PortalDeFluxos.NOTIF.BLL.Dados;
using PortalDeFluxos.NOTIF.BLL.Core.Modelo.Salesforce;
using PortalDeFluxos.NOTIF.BLL.Negocio;

namespace PortalDeFluxos.Core.Test
{
    [TestClass]
    public class TesteentidadeDBTeste
    {

        [TestMethod]
        public void TesteConsultaIBMs()
        {
            using (PortalWeb pweb = new PortalWeb("http://pi"))
            {
                List<int?> lista = new ListaNOTIF().Consultar(x => x.Ativo == true, x => x.NumeroIBM);
                lista.RemoveAll(item => item == null);
            }

        }

        [TestMethod]
        public void TesteAtualizaStatusLojaEConsumoPorIBM()
        {
            using (PortalWeb pWeb = new PortalWeb("http://pi"))
            {
				//List<InstanciaFluxo> inst = new InstanciaFluxo().Consultar();

				//List<int?> listaIBMs = new ListaNOTIF().Consultar(x => x.Ativo == true, x => x.NumeroIBM);
				//listaIBMs.RemoveAll(item => item == null);


				List<int> listaIBMs = new ListaNOTIF().Consultar(x => x.Ativo == true
					&& x.NumeroIBM != null && (x.TipoNotificacao == (Int32)TipoNotificacao.NTI
						|| x.TipoNotificacao == (Int32)TipoNotificacao.CompraZero
						|| x.TipoNotificacao == (Int32)TipoNotificacao.FeeDobrado), x => (Int32)x.NumeroIBM);


				List<InformacoesIBMSalesForce> listaRetorno = new List<InformacoesIBMSalesForce>();
				listaRetorno.Add(new InformacoesIBMSalesForce
                    {
                        DataInicio = DateTime.Now.AddDays(-30),
                        DataFim = DateTime.Now,
                        TipoRegistro = "D",
                        IBM = 1012779,
                        StatusLoja = "Aberta",
                        TipoProduto = "D1A",
                        VolumeTotal = 25
                    }
                );
				listaRetorno.Add(new InformacoesIBMSalesForce
                {
                    DataInicio = DateTime.Now.AddDays(-30),
                    DataFim = DateTime.Now,
                    TipoRegistro = "D",
                    IBM = 1012779,
                    StatusLoja = "Aberta",
                    TipoProduto = "D1B",
                    VolumeTotal = 23
                }
                );
				listaRetorno.Add(new InformacoesIBMSalesForce
                {
                    DataInicio = DateTime.Now.AddDays(-30),
                    DataFim = DateTime.Now,
                    TipoRegistro = "D",
                    IBM = 1012779,
                    StatusLoja = "Aberta",
                    TipoProduto = "D1C",
                    VolumeTotal = 25
                }
                );
				listaRetorno.Add(new InformacoesIBMSalesForce
				{
					DataInicio = DateTime.Now.AddDays(-30),
					DataFim = DateTime.Now,
					TipoRegistro = "D",
					IBM = 1012778,
					StatusLoja = "Aberta",
					TipoProduto = "D1C",
					VolumeTotal = 25
				}
			   );
				
				List<ListaNOTIF> propostas = DadosNOTIF.ObterListaNOTIFPorIbms(listaRetorno);
				
				
				List<ListaSP_NOTIF> propostasSP = new ListaSP_NOTIF().Consultar(_ => propostas.Any(p => p.CodigoItem == _.ID));


            }
        }

		[TestMethod]
		public void TesteServico()
		{
			new NegocioServicoNOTIF().Executar("http://pi");
		}

		private List<InformacoesIBMSalesForce> ConsumoMedioPorIbm(List<int> ibms, List<InformacoesIBMSalesForce> retornoSalesForce)
		{
			List<InformacoesIBMSalesForce> retorno = new List<InformacoesIBMSalesForce>();

			foreach (var item in ibms)
			{
				if (retornoSalesForce.Any(_ => _.IBM == item))
				{
					Decimal valorMedio = retornoSalesForce.Where(_ => _.IBM == item).Average(_ => _.VolumeTotal);
					String status = retornoSalesForce.FirstOrDefault(_ => _.IBM == item).StatusLoja;
					int ibm = retornoSalesForce.FirstOrDefault(_ => _.IBM == item).IBM;
					retorno.Add(new InformacoesIBMSalesForce(ibm, status, valorMedio));
				}
			}

			return retorno;
		}

		private void AtualizarStatusLojaEConsumoPorIBM(List<InformacoesIBMSalesForce> listaIBMs)
		{
			List<ListaNOTIF> propostas = new ListaNOTIF().Consultar(_ => listaIBMs.Any(ibm => ibm.IBM == _.NumeroIBM));
			List<ListaSP_NOTIF> propostasSP = new ListaSP_NOTIF().Consultar(_ => propostas.Any(p => p.CodigoItem == _.ID));

			foreach (var ibm in listaIBMs)
			{
				propostas.Where(_ => _.NumeroIBM == ibm.IBM &&
					(_.TipoNotificacao == (Int32)TipoNotificacao.NTI
					|| _.TipoNotificacao == (Int32)TipoNotificacao.CompraZero)).ToList().ForEach(_ =>
					{
						_.StatusLoja = String.Empty;
						_.Consumo = ibm.VolumeTotal;
						_.Farol = NegocioNOTIF.ObterFarolConsumo(_).GetTitle();
						ListaSP_NOTIF itemAtual = propostasSP.FirstOrDefault(item => item.ID == _.CodigoItem);
						itemAtual.StatusLoja = _.StatusLoja;
						itemAtual.Consumo = _.Consumo.ToString();
						itemAtual.Farol = _.Farol;

					});
				propostas.Where(_ => _.NumeroIBM == ibm.IBM &&
					_.TipoNotificacao == (Int32)TipoNotificacao.FeeDobrado).ToList().ForEach(_ =>
					{
						_.StatusLoja = ibm.StatusLoja;
						_.Consumo = null;
						_.Farol = NegocioNOTIF.ObterFarolStatusLoja(_).GetTitle();
						ListaSP_NOTIF itemAtual = propostasSP.FirstOrDefault(item => item.ID == _.CodigoItem);
						itemAtual.StatusLoja = _.StatusLoja;
						itemAtual.Consumo = String.Empty;
						itemAtual.Farol = _.Farol;
					});
			}

			propostas.Atualizar();
		}
    }
}
