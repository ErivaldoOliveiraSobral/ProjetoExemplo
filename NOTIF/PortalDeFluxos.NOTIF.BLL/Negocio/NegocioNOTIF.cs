using Microsoft.SharePoint.Client.WorkflowServices;
using PortalDeFluxos.Core.BLL;
using PortalDeFluxos.Core.BLL.Modelo;
using PortalDeFluxos.Core.BLL.Negocio;
using PortalDeFluxos.Core.BLL.Utilitario;
using PortalDeFluxos.NOTIF.BLL.Modelo;
using PortalDeFluxos.NOTIF.BLL.Utilitario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Iteris;

namespace PortalDeFluxos.NOTIF.BLL.Negocio
{
    public class NegocioNOTIF
    {
        public static void FinalizarAcompanhamento(int codigoItem, Guid codigoLista, bool finalizarFluxo = false
			, String estadoEtapa = "-",Int32 statusFluxo = -1)
        {
            if (finalizarFluxo)
                NegocioInstanciaFluxo.CancelarFluxo(codigoLista, codigoItem);
            else
            {
                InstanciaFluxo instanciFluxo = new InstanciaFluxo().Obter(_ => _.CodigoItem == codigoItem && _.CodigoLista == codigoLista);
				instanciFluxo.StatusFluxo = statusFluxo == -1 ? (Int32)StatusFluxo.Finalizado : statusFluxo;
				instanciFluxo.DataFinalizado = DateTime.Now;
                instanciFluxo.Atualizar();
            }

            ListaSP_NOTIF propostaSP = new ListaSP_NOTIF().Obter(codigoItem);
			propostaSP.EstadoAtualFluxo = estadoEtapa == "-" ? StatusProposta.Finalizada.GetTitle() : estadoEtapa;
			propostaSP.Etapa = estadoEtapa == "-" ? StatusProposta.Finalizada.GetTitle() : estadoEtapa;
            propostaSP.Atualizar();
        }

        public static Farol ObterFarolConsumo(ListaNOTIF entidade)
        {
            Farol farol = Farol.Branco;
            if (entidade.TipoNotificacao == (int)TipoNotificacao.NTI || entidade.TipoNotificacao == (int)TipoNotificacao.CompraZero)
            {
                farol = Farol.Verde;
                if (entidade.Consumo < 15 && entidade.TipoNotificacao == (int)TipoNotificacao.NTI)
                    farol = Farol.Vermelho;
                else if (entidade.Consumo == 0 && entidade.TipoNotificacao == (int)TipoNotificacao.CompraZero)
                    farol = Farol.Vermelho;
				else if (entidade.Consumo == null)
					farol = Farol.Branco;
            }

            return farol;
        }

		public static Farol ObterFarolStatusLoja(ListaNOTIF entidade)
		{
			Farol farol = Farol.Branco;

			if (entidade.TipoNotificacao == (int)TipoNotificacao.FeeDobrado && !String.IsNullOrEmpty(entidade.StatusLoja))
			{
				if (!entidade.StatusLoja.ToLower().Contains("abert"))
					farol = Farol.Vermelho;
				else
					farol = Farol.Verde;
			}

			return farol;
		}

		public static String ObterImagemFarol(ListaNOTIF entidade)
		{
			Farol farol = ObterFarolConsumo(entidade);
			farol = farol == Farol.Branco ? ObterFarolStatusLoja(entidade) : farol;
			String imagemFarol = String.Empty;
			switch (farol)
			{
				case Farol.Branco:
					imagemFarol = String.Empty;
					break;
				case Farol.Vermelho:
					imagemFarol = "<img src='/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/FarolVermelho.png'/>";
					break;
				case Farol.Verde:
					imagemFarol = "<img src='/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/FarolVerde.png'/>";
					break;
				case Farol.Amarelo:
					imagemFarol = "<img src='/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/FarolAmarelo.png'/>";
					break;
				default:
					break;
			}
			return imagemFarol;
		}        
    }
}
