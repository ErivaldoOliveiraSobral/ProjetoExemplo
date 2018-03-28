using PortalDeFluxos.Core.BLL;
using PortalDeFluxos.Core.BLL.Modelo.Base;
using PortalDeFluxos.NOTIF.BLL.Modelo;
using PortalDeFluxos.Core.BLL.Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PortalDeFluxos.NOTIF.BLL.Utilitario;
using PortalDeFluxos.NOTIF.BLL.Core.Modelo.Salesforce;
using Iteris;
using PortalDeFluxos.NOTIF.BLL.Dados;

namespace PortalDeFluxos.NOTIF.BLL.Negocio
{
    public class NegocioServicoNOTIF : IPortalServico
    {

        public void Executar(String urlContexto)
        {
            using (PortalWeb pWeb = new PortalWeb(urlContexto))
            {
                if (pWeb == null)
                    throw new ArgumentNullException("pWeb", "pWeb não pode ser nulo");

                List<int> listaIBMs = new ListaNOTIF().Consultar(x => x.Ativo == true
					&& x.NumeroIBM != null && (x.TipoNotificacao == (Int32)TipoNotificacao.NTI
						|| x.TipoNotificacao == (Int32)TipoNotificacao.CompraZero
						|| x.TipoNotificacao == (Int32)TipoNotificacao.FeeDobrado), x => (Int32)x.NumeroIBM);

				if (listaIBMs.Count >= 1)
                {

					var retornoSalesForce = NegocioServicos.ListarVolumePorIBM(listaIBMs, DateTime.Now.AddDays(-30), DateTime.Now, 'D');

					List<InformacoesIBMSalesForce> valoresTratados = ConsumoMedioPorIbm(listaIBMs, retornoSalesForce);                    
                    AtualizarStatusLojaEConsumoPorIBM(valoresTratados);

                }                                   
            }
        }

        private List<InformacoesIBMSalesForce> ConsumoMedioPorIbm(List<int> ibms, List<InformacoesIBMSalesForce> retornoSalesForce)
        {
            List<InformacoesIBMSalesForce> retorno = new List<InformacoesIBMSalesForce>();
			if (ibms != null)
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
			List<ListaNOTIF> propostas = DadosNOTIF.ObterListaNOTIFPorIbms(listaIBMs);
			List<Int32> propostasAlteradas = new List<int>();

			#region [Alteração Entidades BD]
			foreach (var ibm in listaIBMs)
			{
				propostas.Where(_ => _.NumeroIBM == ibm.IBM &&
					(_.TipoNotificacao == (Int32)TipoNotificacao.NTI
					|| _.TipoNotificacao == (Int32)TipoNotificacao.CompraZero)).ToList().ForEach(_ =>
									{
										Boolean valueChanged = false;

										if (_.StatusLoja != String.Empty)
											valueChanged = true;
										if (_.Consumo != ibm.VolumeTotal)
											valueChanged = true;

										_.StatusLoja = String.Empty;
										_.Consumo = ibm.VolumeTotal;
										_.Farol = NegocioNOTIF.ObterFarolConsumo(_).GetTitle();

										if (valueChanged)
											propostasAlteradas.Add(_.CodigoItem);
									});
				propostas.Where(_ => _.NumeroIBM == ibm.IBM &&
					_.TipoNotificacao == (Int32)TipoNotificacao.FeeDobrado).ToList().ForEach(_ =>
					{
						Boolean valueChanged = false;

						if (_.StatusLoja != ibm.StatusLoja)
							valueChanged = true;
						if (_.Consumo != null)
							valueChanged = true;

						_.StatusLoja = ibm.StatusLoja;
						_.Consumo = null;
						_.Farol = NegocioNOTIF.ObterFarolStatusLoja(_).GetTitle();

						if (valueChanged)
							propostasAlteradas.Add(_.CodigoItem);
					});
			}
			propostas.Atualizar(); 
			#endregion

			#region [Alteração Itens SP]
			foreach (var codigoItem in propostasAlteradas)
			{
				ListaNOTIF notifBD = propostas.FirstOrDefault(_ => _.CodigoItem == codigoItem);
				ListaSP_NOTIF notifSP = new ListaSP_NOTIF().Obter(codigoItem);
				if (notifSP != null)
				{
					notifSP.StatusLoja = notifBD.StatusLoja;
					notifSP.Consumo = notifBD.Consumo == null ? String.Empty : notifBD.ToNumberMask(3);
					notifSP.Farol = notifBD.Farol;
					notifSP.Atualizar();
				}
			} 
			#endregion
        }
    }
}
