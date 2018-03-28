using PortalDeFluxos.Core.BLL.Negocio;
using PortalDeFluxos.NOTIF.BLL.Utilitario;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PortalDeFluxos.NOTIF.BLL.Modelo
{
	[Serializable]
	public class DadosNotificacaoAcao
	{
		public int IdNotificacao { get; set; }
		public int CodigoItem { get; set; }

		public int NumeroNotificacao { get; set; }

		public DateTime DataInicioContrato { get; set; }

		public DateTime DataFimContrato { get; set; }

        public DateTime DataNotificacao { get; set; }

		public bool NotifAtiva { get; set; }

		public bool? AprovacaoGRDV { get; set; }

		public bool? EnvolvimentoPlanejamento { get; set; }

		public bool? NotificacaoPadrao { get; set; }

		public string Status { get { return NegocioComum.GetTitleFromEnum<StatusNotificacao>(this.IdStatus); } }

		public Int32 IdStatus { get; set; }

		public int? GrauNotificacao { get; set; }

		public String Observacao { get; set; }

        public String FormaEnvio { get; set; }

		public DadosNotificacaoAcao()
		{
			this.GrauNotificacao = -1;
		}

		public DadosNotificacaoAcao(ListaNOTIFNotificacoes notificacao)
		{
			this.IdNotificacao = notificacao.IdNotificacao;
			this.IdStatus = notificacao.Status == null ? (Int32)StatusNotificacao.Aberta : (Int32)notificacao.Status;
			this.NotifAtiva = notificacao.NotifAtiva;
			this.NumeroNotificacao = notificacao.NumeroNotificacao;
            this.DataInicioContrato = notificacao.DataInicioContrato == null ? DateTime.Now : (DateTime)notificacao.DataInicioContrato;
			this.DataFimContrato = notificacao.DataFimContrato == null ? DateTime.Now : (DateTime)notificacao.DataFimContrato;
            this.DataNotificacao = notificacao.DataNotificacao == null ? DateTime.Now : (DateTime)notificacao.DataNotificacao;
			this.CodigoItem = notificacao.CodigoItem;
			this.GrauNotificacao = notificacao.GrauNotificacao == null ? -1 : (Int32)notificacao.GrauNotificacao;
			this.Observacao = notificacao.Observacao;
            this.FormaEnvio = notificacao.FormaEnvio;
			this.AprovacaoGRDV = notificacao.AprovacaoGRDV;
			this.EnvolvimentoPlanejamento = notificacao.EnvolvimentoPlanejamento;
			this.NotificacaoPadrao = notificacao.NotificacaoPadrao;
		}

		public List<DadosNotificacaoAcao> ObterListNotificacao(List<ListaNOTIFNotificacoes> notificacoes)
		{
			List<DadosNotificacaoAcao> listNotificacoes = new List<DadosNotificacaoAcao>();

			if (notificacoes == null || notificacoes.Count == 0)
				return listNotificacoes;

			foreach (var notif in notificacoes)
				listNotificacoes.Add(new DadosNotificacaoAcao(notif));

			return listNotificacoes;
		}
	}
}
