using PortalDeFluxos.Core.BLL.Negocio;
using PortalDeFluxos.NOTIF.BLL.Negocio;
using PortalDeFluxos.Core.BLL.Utilitario;
using PortalDeFluxos.Core.SP.Core.BaseControls;
using PortalDeFluxos.NOTIF.BLL.Utilitario;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using PortalDeFluxos.Core.BLL.Core.Modelo;

namespace PortalDeFluxos.NOTIF.SP.ControlTemplates.PortalDeFluxos.NOTIF.SP
{
	public partial class ucRelatorio : CustomForm
	{

		#region [Eventos]

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!this.IsPostBack)
				EventoTratado(LoadFormControls, false);

			ScriptManager scriptMan = ScriptManager.GetCurrent(this.Page);
			btnExtrairRelatorio.OnClientClick = "raizen.waitDownload(); window.setTimeout(function() { _spFormOnSubmitCalled = false; }, 10);";
			scriptMan.RegisterPostBackControl(btnExtrairRelatorio);
		}

		protected void btnExtrairRelatorio_Click(Object sender, EventArgs e)
		{
			EventoTratado(ExportarDados, false);

		}

		#endregion [Fim - Eventos]

		#region [EventoTratado]

		public KeyValuePair<Boolean, String> LoadFormControls()
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);

			FormHelper.LoadDataSource(ddlStatus, NegocioComum.GetDictionaryFromEnum<StatusNotificacao>(true));
			
			return retorno;
		}

		public KeyValuePair<Boolean, String> ExportarDados()
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);

			DateTime? dateInicio = FormHelper.GetDateValue(txtInicio);
			DateTime? dateFim = FormHelper.GetDateValue(txtFim);
			Int32 idStatus = -1;
			Int32.TryParse(ddlStatus.SelectedValue, out idStatus);

			List<ExcelSheet> abas= NegocioRelatorioNOTIF.ObterRelatorio(dateInicio, dateFim, idStatus != -1 ? idStatus : (Int32?)null);
			FormHelper.Download(String.Format("NOTIF_{0}.xls", DateTime.Now.ToString().Replace(" ", "_").Replace("/", "").Replace(":", "")), abas);

			return retorno;
		}

		#endregion
				
	}
}
