using PortalDeFluxos.Core.BLL.Modelo;
using PortalDeFluxos.Core.BLL.Negocio;
using PortalDeFluxos.Core.BLL.Utilitario;
using PortalDeFluxos.Core.SP.Core.BaseControls;
using PortalDeFluxos.Core.Wrapper;
using PortalDeFluxos.NOTIF.BLL.Modelo;
using PortalDeFluxos.NOTIF.BLL.Utilitario;
using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Iteris;
using System.Linq;
using PortalDeFluxos.NOTIF.BLL.Negocio;

namespace PortalDeFluxos.NOTIF.SP.ControlTemplates.PortalDeFluxos.NOTIF.SP
{
    public partial class ucNOTIF : CustomForm, ICustomForm
    {

        #region [propriedades]

        private ListaSP_NOTIF _propostaListaSP_NOTIF;
        private Control controleIbm;
        private Control controleEstruturaGt;
        private Control controleEstruturaGr;
        private Control controleEstruturaDiretor;
        private Control controleEstruturaCdr;
        private Control controleEstruturaGdr;

        private ListaNOTIF _propostaListaNOTIF;
		private List<ListaNOTIFNotificacoes> _listaListaNOTIFNotificacoes;

		private String DadosComercialAtual
		{
			get { return ViewState["_DadosComercialAtual"] as String; }
			set { ViewState["_DadosComercialAtual"] = value; }
		}

		#region [ViewState]

		private List<DadosNotificacaoAcao> _lstNotificacao
		{
			get { return ViewState["_lstNotificacao"] as List<DadosNotificacaoAcao>; }
			set { ViewState["_lstNotificacao"] = value; }
		}

		#endregion

		#endregion

		#region [Evento]

		protected void Page_Load(object sender, EventArgs e)
        {
            LoadMenu();
        }

        protected override void CreateChildControls()
        {
            base.CreateChildControls();
            EventoTratado(LoadControls, false);
        }

        #region [Click]

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            //Não modificar o evento
            //Qualquer tratativa deve ser realizada dentro do método SalvarFormulario
            Salvar(false);
        }

        protected void btnSalvarIniciar_Click(object sender, EventArgs e)
        {
            //Não modificar o evento
            //Qualquer tratativa deve ser realizada dentro do método SalvarFormulario
            Salvar(true);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Cancelar();
        }

        protected void btnAnexoPorEmail_Click(object sender, EventArgs e)
        {
            EnviarEmailAnexo();
        }

        protected void btnReiniciarFluxo_Click(object sender, EventArgs e)
        {
            ReiniciarFluxoForm();
        }

		protected void btnIncluirNoficacao_Click(object sender, EventArgs e)
		{
			EventoTratado(IncluirItemGridNoficacao, false);
		}

        protected void btnFinalizarAcompanhamento_Click(object sender, EventArgs e)
        {
			EventoTratado(FinalizarAcompanhamento);
        }

        #endregion

		#region [GridView]

		protected void grvNotificacoes_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			switch (e.CommandName)
			{
				case "Editar":
					EventoTratado(GridCommandEditar, false, e);
					break;
				case "Cancelar":
					EventoTratado(GridCommandCancelar, false, e);
					break;
				case "Salvar":
					EventoTratado(GridCommandSalvar, false, e);
					break;
				case "CancelarEdicao":
					EventoTratado(GridCommandCancelarEdicao, false, e);
					break;
			}
		}

		protected void grvNotificacoes_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			EventoTratado(GridNotificacao_RowDataBound, false, e);
		}

		protected void grvEmissoes_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			EventoTratado(GridEmissoes_RowDataBound, false, e);
		}

		#endregion

		#region [Change]

		protected void bd_Mercado_SelectedIndexChanged(object sender, EventArgs e)
		{
			EventoTratado(Mercado_SelectedIndexChanged, false);
		}

		#endregion

        #endregion

        #region [Métodos - Eventos Tratados]

        protected void LoadMenu()
        {
            List<KeyValuePair<String, String>> listaMenus = new List<KeyValuePair<String, String>>();
            listaMenus.Add(new KeyValuePair<String, String>("menuProposta", "Informações da Notificação"));
            listaMenus.Add(new KeyValuePair<String, String>("menuNotificacoes", "Gestão das Notificações"));
            listaMenus.Add(new KeyValuePair<String, String>("menuEmissoes", "Informações Emissão"));
            listaMenus.Add(new KeyValuePair<String, String>("menuJuridico", "Jurídico"));
            listaMenus.Add(new KeyValuePair<String, String>("menuRelacoesSetoriais", "Relações Setoriais"));
            listaMenus.Add(new KeyValuePair<String, String>("menuObservacoes", "Observações"));
            listaMenus.Add(new KeyValuePair<String, String>("menuAnexo", "Anexo"));
            CarregarFormulario(listaMenus, "menuProposta", " Notificação ", LoadForm, LoadPermissao, SalvarFormulario);
        }

        public KeyValuePair<Boolean, String> LoadControls()
        {
            KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);

            //os usercontrols do Core devem carregados neste método.
            CarregarUcAnexos(phUcAnexos);
            LoadEstruturaComercialControls();

            if (!this.IsPostBack)
            {
                LoadFormEstruturaComercialControls();
            }

            return retorno;
        }

        public KeyValuePair<Boolean, String> SalvarFormulario(Boolean reiniciarFluxo)
        {
            KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);

			//if (reiniciarFluxo && new ControleAnexo(controlAnexo).ObterQuaNOTIFdadeAnexos() <= 0)//Não precisa dessa validação
			//	return new KeyValuePair<Boolean, String>(false, "Fluxo não pode ser iniciado se não tiver anexos.");

            LoadListaSP_NOTIF(true);
            LoadListaSP_NOTIFFromForm();
            SalvarListaSP_NOTIF(true);

            LoadListaNOTIF(true);
            LoadListaNOTIFFromForm();
            SalvarListaNOTIF();
			LoadListaNOTIFNotificacoes(true);
			retorno = LoadListaNOTIFNotificacoesFromForm(reiniciarFluxo);
			SalvarListaNOTIFNotificacoes();

			if (retorno.Key)
				SalvarListaNOTIF();

			SalvarListaSP_NOTIF();
			if (reiniciarFluxo && retorno.Key)
				AcaoFluxo(_propostaListaSP_NOTIF, reiniciarFluxo);
			else if (reiniciarFluxo)
				return retorno;

            return new KeyValuePair<Boolean, String>(true, "Dados gravados com sucesso."); 
        }

		public KeyValuePair<Boolean, String> FinalizarAcompanhamento()
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);

            NegocioNOTIF.FinalizarAcompanhamento(CodigoItem, CodigoLista, true);
            LoadPermissao();
            return new KeyValuePair<bool, string>(true, "Finalizado o acompanhamento da notificação.");
		}

		public KeyValuePair<Boolean, String> Mercado_SelectedIndexChanged()
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);

			Boolean desabilitar = LoadComportamentoMercado();
			CarregarEstruturaComercial(desabilitarControle: desabilitar);

			return retorno;
		}

		#region [GridNotificacao & Emissões]

		public KeyValuePair<Boolean, String> IncluirItemGridNoficacao()
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);

			List<DadosNotificacaoAcao> lstNotificacao = _lstNotificacao == null ? new List<DadosNotificacaoAcao>() : _lstNotificacao;

			TipoNotificacao tipoNotificacao = ObterTipoProposta();
			
			Int32 quantidadeNotificacoes = 1;
			if (tipoNotificacao == TipoNotificacao.NTI || tipoNotificacao == TipoNotificacao.FeeDobrado)
				quantidadeNotificacoes = lstNotificacao.Count > 0 ? 1 : 3;

			DateTime dataInicioContrato = (DateTime)FormHelper.GetDateValue(bd_DataInicioContrato);
			DateTime dataFimContrato = (DateTime)FormHelper.GetDateValue(bd_DataFimContrato);
			DateTime dataNotificacao = (DateTime)FormHelper.GetDateValue(bd_DataNotificacao);
			

			for (int i = 0; i < quantidadeNotificacoes; i++)
			{
				DadosNotificacaoAcao notificacao = new DadosNotificacaoAcao();

				notificacao.IdStatus = (Int32)StatusNotificacao.Aberta;
				notificacao.DataInicioContrato = dataInicioContrato;				
				
				notificacao.DataFimContrato = dataFimContrato;
				notificacao.DataNotificacao = quantidadeNotificacoes == 1 ? dataNotificacao :
					dataInicioContrato.AddMonths((i + 2) * 6);

				notificacao.Observacao = bd_Observacao.Text;
				notificacao.NotifAtiva = false;

				notificacao.NumeroNotificacao = lstNotificacao.Count + 1;
				lstNotificacao.Add(notificacao);
			}

			BindGridNotificacoes(lstNotificacao);
			BindGridEmissoes(lstNotificacao,true);
			LimparCamposNotificacao();
			DesabiltarCamposNotificacao(true);

			return retorno;
		}

		public KeyValuePair<Boolean, String> GridNotificacao_RowDataBound(object evento)
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);
			if (!(evento is GridViewRowEventArgs))
				return new KeyValuePair<Boolean, String>(false, "Método configurado incorretamente.");
			
			GridViewRowEventArgs e = (GridViewRowEventArgs)evento;

			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				if (e.Row.RowIndex == grvNotificacoes.EditIndex)
				{
					#region [Notificação Ativa]

					RadioButton notificacaoAtiva = ((RadioButton)e.Row.FindControl("grid_bd_NotifAtiva"));
					notificacaoAtiva.Checked = ((DadosNotificacaoAcao)(e.Row.DataItem)).NotifAtiva;
					
					#endregion
					
				}
				else
				{
					if (((DadosNotificacaoAcao)(e.Row.DataItem)).IdStatus != (Int32)StatusNotificacao.Aberta )
					{
						((ImageButton)e.Row.FindControl("grvEditarItem")).Visible = false;
						((ImageButton)e.Row.FindControl("grvCancelarItem")).Visible = false;
					}
					else
					{
						((ImageButton)e.Row.FindControl("grvEditarItem")).Visible = BtnVisible;
						((ImageButton)e.Row.FindControl("grvCancelarItem")).Visible = BtnVisible;
					}

					//Change Row Color
					GridHelper.ChangeRowColor(e, GridHelper.ColorRollover, GridHelper.Color, GridHelper.ColorAlternate);
				}
			}

			return retorno;
		}

		public KeyValuePair<Boolean, String> GridCommandCancelarEdicao(object e)
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);
			if (!(e is GridViewCommandEventArgs))
				return new KeyValuePair<Boolean, String>(false, "Método configurado incorretamente.");

			List<DadosNotificacaoAcao> lstNotificacao = _lstNotificacao;
			grvNotificacoes.EditIndex = -1;
			BindGridNotificacoes(lstNotificacao);

			return retorno;
		}

		public KeyValuePair<Boolean, String> GridCommandSalvar(object e)
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);
			if (!(e is GridViewCommandEventArgs))
				return new KeyValuePair<Boolean, String>(false, "Método configurado incorretamente.");

			int numeroNotificacao = Convert.ToInt32(((GridViewCommandEventArgs)e).CommandArgument);
			List<DadosNotificacaoAcao> lstNotificacao = _lstNotificacao;
			DadosNotificacaoAcao notificacaoAtual = lstNotificacao.Find(enL => enL.NumeroNotificacao == numeroNotificacao);
			int index = lstNotificacao.IndexOf(lstNotificacao.Find(enL => enL.NumeroNotificacao == numeroNotificacao));

			retorno = AtualizarNotificacao(notificacaoAtual, grvNotificacoes.Rows[grvNotificacoes.EditIndex]);

			if (retorno.Key)
			{
				lstNotificacao.RemoveAll(enL => enL.NumeroNotificacao == numeroNotificacao);
				if (notificacaoAtual.NotifAtiva)
					lstNotificacao.ForEach(_ => _.NotifAtiva = false);
				lstNotificacao.Insert(index, notificacaoAtual);
				grvNotificacoes.EditIndex = -1;
				BindGridNotificacoes(lstNotificacao);
				BindGridEmissoes(lstNotificacao,true);
			}

			return retorno;
		}

		public KeyValuePair<Boolean, String> GridCommandCancelar(object e)
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);
			if (!(e is GridViewCommandEventArgs))
				return new KeyValuePair<Boolean, String>(false, "Método configurado incorretamente.");

			List<DadosNotificacaoAcao> lstNotificacao = _lstNotificacao;
			lstNotificacao.Where(enL => enL.NumeroNotificacao == Convert.ToInt32(((GridViewCommandEventArgs)e).CommandArgument)).ToList().ForEach(
				_ =>
				{
					_.IdStatus = (Int32)StatusNotificacao.Cancelada;
					_.NotifAtiva = false;
				});
			BindGridNotificacoes(lstNotificacao);
			BindGridEmissoes(lstNotificacao,true);

			return retorno;
		}

		public KeyValuePair<Boolean, String> GridCommandEditar(object e)
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);
			if (!(e is GridViewCommandEventArgs))
				return new KeyValuePair<Boolean, String>(false, "Método configurado incorretamente.");

			List<DadosNotificacaoAcao> lstNotificacao = _lstNotificacao;
			DadosNotificacaoAcao comprador = lstNotificacao.Find(enL => enL.NumeroNotificacao == Convert.ToInt32(((GridViewCommandEventArgs)e).CommandArgument));

			int index = lstNotificacao.IndexOf(comprador);
			grvNotificacoes.EditIndex = index;
			BindGridNotificacoes(lstNotificacao);
			
			return retorno;
		}

		public KeyValuePair<Boolean, String> GridEmissoes_RowDataBound(object evento)
		{
			KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);
			if (!(evento is GridViewRowEventArgs))
				return new KeyValuePair<Boolean, String>(false, "Método configurado incorretamente.");

			GridViewRowEventArgs e = (GridViewRowEventArgs)evento;

			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				DadosNotificacaoAcao dadosNotificacaoAcao = (DadosNotificacaoAcao)(e.Row.DataItem);

				#region [Agrupador]

				Panel agrupador = ((Panel)e.Row.FindControl("grv_Panel"));

				StatusNotificacao tipoNotificacao = dadosNotificacaoAcao.IdStatus != -1 ?
					(StatusNotificacao)Enum.Parse(typeof(StatusNotificacao), dadosNotificacaoAcao.IdStatus.ToString()) : StatusNotificacao.Aberta;

				String mensagemNotificacao = String.Format(" - {0} {1}", tipoNotificacao.GetTitle()
					, dadosNotificacaoAcao.NotifAtiva ? "<span style='color:#008000'>Ativo</span>" : String.Empty);

				String styleAgrupador = dadosNotificacaoAcao.NotifAtiva ? "border-width:2px;border-style:Solid;margin-bottom: 15px;margin-left:5px;margin-right:5px;border-color:#008000" :
					"border-width:1px;border-style:Solid;margin-bottom: 15px;margin-left:5px;margin-right:5px;";
				agrupador.GroupingText = String.Format(" {0}ª Notificação {1}", dadosNotificacaoAcao.NumeroNotificacao, mensagemNotificacao);
				agrupador.Attributes["style"] = styleAgrupador;
				agrupador.Enabled = BtnVisible ? dadosNotificacaoAcao.IdStatus == (Int32)StatusNotificacao.Aberta : false;

				#endregion

				#region [Aprovação GR/DV]

				CheckBox grv_bd_AprovacaoGRDV = ((CheckBox)e.Row.FindControl("grv_bd_AprovacaoGRDV"));
				grv_bd_AprovacaoGRDV.Checked = ((DadosNotificacaoAcao)(e.Row.DataItem)).AprovacaoGRDV == null ? true : (bool)((DadosNotificacaoAcao)(e.Row.DataItem)).AprovacaoGRDV;
				grv_bd_AprovacaoGRDV.Enabled = agrupador.Enabled;
				#endregion

				#region [Notificação Padrão]

				CheckBox grv_bd_NotificacaoPadrao = ((CheckBox)e.Row.FindControl("grv_bd_NotificacaoPadrao"));
				grv_bd_NotificacaoPadrao.Checked = ((DadosNotificacaoAcao)(e.Row.DataItem)).NotificacaoPadrao == null ? false : (bool)((DadosNotificacaoAcao)(e.Row.DataItem)).NotificacaoPadrao;
				grv_bd_NotificacaoPadrao.Enabled = false;
				
				#endregion

				#region [Grau de Noticação]

				DropDownList grv_bd_GrauNotificacao = ((DropDownList)e.Row.FindControl("grv_bd_GrauNotificacao"));
				FormHelper.LoadDataSource(grv_bd_GrauNotificacao, NegocioComum.GetDictionaryFromEnum<GrauNotificacao>(true),false);
				FormHelper.SetSelectedValues(grv_bd_GrauNotificacao, new[] { ((DadosNotificacaoAcao)(e.Row.DataItem)).GrauNotificacao.ToString() });

				#endregion

				#region [Envolvimento Planejamento]

				CheckBox grv_bd_EnvolvimentoPlanejamento = ((CheckBox)e.Row.FindControl("grv_bd_EnvolvimentoPlanejamento"));
				grv_bd_EnvolvimentoPlanejamento.Checked = ((DadosNotificacaoAcao)(e.Row.DataItem)).EnvolvimentoPlanejamento == null ? false : (bool)((DadosNotificacaoAcao)(e.Row.DataItem)).EnvolvimentoPlanejamento;
				grv_bd_EnvolvimentoPlanejamento.Enabled = agrupador.Enabled;
				#endregion
				
			}

			return retorno;
		}

		#endregion
		
        #endregion

        #region [Métodos - Load]

        #region [Load Controles]

        protected void LoadFormControls()
        {
            FormHelper.LoadDataSource(bd_Mercado, NegocioComum.GetDictionaryFromEnum<Mercado>(true));
            FormHelper.LoadDataSource(bd_TipoNotificacao, NegocioComum.GetDictionaryFromEnum<TipoNotificacao>(true),false);

            FormHelper.LoadDataSource(bd_Juridico_FasesJudicializacao, NegocioComum.GetDictionaryFromEnum<FasesJudicializacao>(true), false);
            FormHelper.LoadDataSource(bd_Juridico_TipoAcaoJudicial, NegocioComum.GetDictionaryFromEnum<AcaoJudicial>(true), false);
        }

        #region [Estrutura Comercial]

        protected void LoadEstruturaComercialControls()
        {
            #region [Proposta]

            controleIbm = CarregarUcBuscarEstruturaComercial(divBuscarEstruturaComercial_IBM);
            controleEstruturaGt = CarregarUcEstruturaIndividual(plhEstruturaGt);
            controleEstruturaGr = CarregarUcEstruturaIndividual(plhEstruturaGr);
            controleEstruturaDiretor = CarregarUcEstruturaIndividual(plhEstruturaDiretor);
            controleEstruturaCdr = CarregarUcEstruturaIndividual(plhEstruturaCdr);
            controleEstruturaGdr = CarregarUcEstruturaIndividual(plhEstruturaGdr);

            #endregion
        }

        protected void LoadFormEstruturaComercialControls()
        {
            if (_propostaListaSP_NOTIF != null)
            {
                CarregarDadosUcBuscarEstruturaComercial(controleIbm, _propostaListaSP_NOTIF.Ibm, true, !BtnVisible, String.Empty);

                DadosComercialSalesForce dadosSales = new DadosComercialSalesForce();
				dadosSales.RazaoSocial = _propostaListaSP_NOTIF.RazaoSocial;

				if(_propostaListaNOTIF != null)
				{
					dadosSales.CNPJ = _propostaListaNOTIF.CNPJ;
					dadosSales.Endereco = _propostaListaNOTIF.Endereco;
					dadosSales.CEP = _propostaListaNOTIF.Cep;
					dadosSales.Bairro = _propostaListaNOTIF.Bairro;
					dadosSales.Estado = _propostaListaNOTIF.UF;
					dadosSales.Cidade = _propostaListaNOTIF.Cidade;
				}

                dadosSales.GerenteTerritorio = FormHelper.GetLogin(_propostaListaSP_NOTIF.GerenteTerritorio);
                dadosSales.GerenteRegiao = FormHelper.GetLogin(_propostaListaSP_NOTIF.GerenteRegiao);
                dadosSales.DiretorVendas = FormHelper.GetLogin(_propostaListaSP_NOTIF.DiretorVendas);
                dadosSales.Cdr = FormHelper.GetLogin(_propostaListaSP_NOTIF.Gdr);
                dadosSales.Gdr = FormHelper.GetLogin(_propostaListaSP_NOTIF.Cdr);
				CarregarEstruturaComercial(dadosSales, desabilitarControle: LoadComportamentoMercado());
            }
            else
                CarregarEstruturaComercial(desabilitarControle: LoadComportamentoMercado());
        }

		protected void CarregarEstruturaComercial(DadosComercialSalesForce dados = null, Boolean desabilitarControle = false)
        {
			if (dados != null)
				DadosComercialAtual = Serializacao.SerializeToJson(dados);
			else if (dados == null && !String.IsNullOrEmpty(DadosComercialAtual))
				dados = Serializacao.DeserializeFromJson<DadosComercialSalesForce>(DadosComercialAtual);

			bd_Cnpj.Text = dados != null ? dados.CNPJ : String.Empty;
			sp_RazaoSocial.Text = dados != null ? dados.RazaoSocial : String.Empty;
			bd_Cep.Text = dados != null ? dados.CEP : String.Empty;
			bd_Endereco.Text = dados != null ? dados.Endereco : String.Empty;
			bd_Bairro.Text = dados != null ? dados.Bairro : String.Empty;
			bd_UF.Text = dados != null ? dados.Estado : String.Empty;
			bd_Cidade.Text = dados != null ? dados.Cidade : String.Empty;

			CarregarDadosUcEstruturaindividual(controleEstruturaGt, "GT"
				, dados != null && dados.GerenteTerritorio != null ? dados.GerenteTerritorio : string.Empty
				, BtnVisible
				, rezoneamentoVisivel: !desabilitarControle
				, rezoneamentoPadrao: _propostaListaSP_NOTIF == null || desabilitarControle ? desabilitarControle ? false : true : _propostaListaSP_NOTIF.UtilizaZoneamentoGT);
			CarregarDadosUcEstruturaindividual(controleEstruturaGr, "GR"
				, dados != null && dados.GerenteRegiao != null ? dados.GerenteRegiao : string.Empty
				, desabilitarControle ? true : false
				, rezoneamentoVisivel: !desabilitarControle
				, rezoneamentoPadrao: _propostaListaSP_NOTIF == null || desabilitarControle ? desabilitarControle ? false : true : _propostaListaSP_NOTIF.UtilizaZoneamentoGR);
            CarregarDadosUcEstruturaindividual(controleEstruturaDiretor, "Diretor"
				, dados != null && dados.DiretorVendas != null ? dados.DiretorVendas : string.Empty
				, desabilitarControle ? true : false
				, rezoneamentoVisivel: !desabilitarControle
				, rezoneamentoPadrao: _propostaListaSP_NOTIF == null || desabilitarControle ? desabilitarControle ? false : true : _propostaListaSP_NOTIF.UtilizaZoneamentoDiretor);
            CarregarDadosUcEstruturaindividual(controleEstruturaCdr, "CDR"
				, dados != null && dados.Cdr != null ? dados.Cdr : string.Empty
				, BtnVisible
				, rezoneamentoVisivel: !desabilitarControle
				, rezoneamentoPadrao: _propostaListaSP_NOTIF == null || desabilitarControle ? desabilitarControle ? false : true : _propostaListaSP_NOTIF.UtilizaZoneamentoGdr);
			CarregarDadosUcEstruturaindividual(controleEstruturaGdr, "GDR"
				, dados != null && dados.Gdr != null ? dados.Gdr : string.Empty
				, BtnVisible
				, rezoneamentoVisivel: !desabilitarControle
				, rezoneamentoPadrao: _propostaListaSP_NOTIF == null || desabilitarControle ? desabilitarControle ? false : true : _propostaListaSP_NOTIF.UtilizaZoneamentoCdr);

            uppmenuProposta.Update();
        }

        #endregion

        #endregion

        #region [Load Form]

        public void LoadPermissao()
        {
            Boolean fluxoAtivo = this.FluxoAtivo;
            Boolean permissaoEditar = this.PermissaoEditar;
            Boolean fluxoFinalizado = this.FluxoFinalizado;
            Boolean propostaEmAprovacao = this.PropostaEmAprovacao;

            BtnVisible = !fluxoFinalizado && (!propostaEmAprovacao && permissaoEditar);

            btnIniciar.Visible = BtnVisible;
            btnSalvar.Visible = BtnVisible;
            btnReiniciarFluxo.Visible = !btnIniciar.Visible && !fluxoFinalizado && permissaoEditar && !fluxoAtivo;
            btnAnexoPorEmail.Visible = this.CodigoItem > 0;
			btnIncluirNoficacao.Visible = BtnVisible;
			btnFinalizarAcompanhamento.Visible = !fluxoFinalizado && permissaoEditar;

            if (!this.IsPostBack)
				SetReadOnlyOnAllControls(this, !BtnVisible);

			LoadPermissaoEspecifica(fluxoFinalizado);			
        }

		public void LoadPermissaoEspecifica(Boolean fluxoFinalizado)
		{
			if (PermissaoIncluirComentario && !fluxoFinalizado)
			{
				btnSalvar.Visible = true;
				bd_Observacoes_Comentarios.ReadOnly = false;
			}
			else
				bd_Observacoes_Comentarios.ReadOnly = true;
		}

        public void LoadForm()
        {
            LoadFormControls();

            LoadListaSP_NOTIF();
            LoadFormFromListaSP_NOTIF();

            LoadListaNOTIF();
            LoadFormFromListaNOTIF();
			LoadListaNOTIFNotificacoes();
			LoadFormFromListaNOTIFNotificacoes();
			
			LoadAlerta();

        }

        private void LoadAlerta()
        {
            if (_propostaListaNOTIF == null)
                return;

			Farol farolConsumo = NegocioNOTIF.ObterFarolConsumo(_propostaListaNOTIF);

			if (farolConsumo == Farol.Vermelho)
                bd_Consumo.Attributes.Add("style", "color:#FF0000 !important;text-align:center;font-weight:bold;font-size:14px !important;");
			else if (farolConsumo == Farol.Verde)
                bd_Consumo.Attributes.Add("style", "color:#00CD00 !important;text-align:center;font-weight:bold;font-size:14px !important;");

			Farol farolStatusLoja = NegocioNOTIF.ObterFarolStatusLoja(_propostaListaNOTIF);

			if (farolStatusLoja == Farol.Vermelho)
                bd_StatusLoja.Attributes.Add("style", "color:#FF0000 !important;text-align:center;font-weight:bold;text-transform:uppercase;font-size:14px !important;");
			else if (farolStatusLoja == Farol.Verde)
                bd_StatusLoja.Attributes.Add("style", "color:#00CD00 !important;text-align:center;font-weight:bold;text-transform:uppercase;font-size:14px !important;");
        }

		#region [ListaSP_NOTIF]
		
		protected void LoadListaSP_NOTIF(Boolean defaultObject = false)
		{
			_propostaListaSP_NOTIF = _propostaListaSP_NOTIF == null && CodigoItem > 0 ? new ListaSP_NOTIF().Obter(CodigoItem) : _propostaListaSP_NOTIF;

			if (_propostaListaSP_NOTIF == null && defaultObject)
				_propostaListaSP_NOTIF = new ListaSP_NOTIF();
		}

		protected void LoadFormFromListaSP_NOTIF()
		{
			if (_propostaListaSP_NOTIF == null)
				return;
			
			#region [TexBox]

			_propostaListaSP_NOTIF.SetControl(sp_RazaoSocial, _ => _.RazaoSocial);

			#endregion

		}

		protected void LoadListaSP_NOTIFFromForm()
		{
			#region [DropDownList & RadioButtonList]

			_propostaListaSP_NOTIF.TipoNotificacao = FormHelper.GetDictionaryValue(
												  NegocioComum.GetDictionaryFromEnum<Mercado>(false)
												, bd_Mercado.SelectedValue);

			#endregion

			#region [TexBox]

			_propostaListaSP_NOTIF.LoadProperty(sp_RazaoSocial, _ => _.RazaoSocial);
			_propostaListaSP_NOTIF.StatusLoja = String.IsNullOrEmpty(bd_StatusLoja.Text) ? "N/A" : bd_StatusLoja.Text;
			_propostaListaSP_NOTIF.Consumo = String.IsNullOrEmpty(bd_Consumo.Text) ? "N/A" : String.Format("{0} m³", bd_Consumo.Text);

			#endregion

			#region [DadosControle]

			ControleBuscarDadosComercial wControleBuscarDadosComercial = new ControleBuscarDadosComercial(controleIbm);
			ControleEstruturaIndividual wControleEstruturaGt = new ControleEstruturaIndividual(controleEstruturaGt);
			ControleEstruturaIndividual wControleEstruturaGr = new ControleEstruturaIndividual(controleEstruturaGr);
			ControleEstruturaIndividual wControleEstruturaDiretor = new ControleEstruturaIndividual(controleEstruturaDiretor);
			ControleEstruturaIndividual wControleEstruturaCdr = new ControleEstruturaIndividual(controleEstruturaCdr);
			ControleEstruturaIndividual wControleEstruturaGdr = new ControleEstruturaIndividual(controleEstruturaGdr);

			_propostaListaSP_NOTIF.GerenteTerritorio = (Usuario)FormHelper.GetPeoplePickerValue(wControleEstruturaGt.ObterResponsavelNivel());
			_propostaListaSP_NOTIF.GerenteRegiao = (Usuario)FormHelper.GetPeoplePickerValue(wControleEstruturaGr.ObterResponsavelNivel());
			_propostaListaSP_NOTIF.DiretorVendas = (Usuario)FormHelper.GetPeoplePickerValue(wControleEstruturaDiretor.ObterResponsavelNivel());
			_propostaListaSP_NOTIF.Cdr = (Usuario)FormHelper.GetPeoplePickerValue(wControleEstruturaCdr.ObterResponsavelNivel());
			_propostaListaSP_NOTIF.Gdr = (Usuario)FormHelper.GetPeoplePickerValue(wControleEstruturaGdr.ObterResponsavelNivel());

			_propostaListaSP_NOTIF.UtilizaZoneamentoGT = wControleEstruturaGt.UtilizaRezoneamento();
			_propostaListaSP_NOTIF.UtilizaZoneamentoGR = wControleEstruturaGr.UtilizaRezoneamento();
			_propostaListaSP_NOTIF.UtilizaZoneamentoDiretor = wControleEstruturaDiretor.UtilizaRezoneamento();
			_propostaListaSP_NOTIF.UtilizaZoneamentoCdr = wControleEstruturaCdr.UtilizaRezoneamento();
			_propostaListaSP_NOTIF.UtilizaZoneamentoGdr = wControleEstruturaGdr.UtilizaRezoneamento();
			_propostaListaSP_NOTIF.UtilizaZoneamentoPadrao = _propostaListaSP_NOTIF.UtilizaZoneamentoGT && _propostaListaSP_NOTIF.UtilizaZoneamentoGR && _propostaListaSP_NOTIF.UtilizaZoneamentoDiretor
				&& _propostaListaSP_NOTIF.UtilizaZoneamentoCdr && _propostaListaSP_NOTIF.UtilizaZoneamentoGdr;


			_propostaListaSP_NOTIF.Ibm = FormHelper.GetIntValue(wControleBuscarDadosComercial.ObterIbm());


			#endregion

		} 
		
		#endregion

		#region [ListaNOTIF]
		
		protected void LoadListaNOTIF(Boolean defaultObject = false)
		{
			//throw new NotImplementedException("Verificar o método e depois apagar o NotImplementedException");
			//Mudar o código abaixo com a busca correta - o nome da propriedade id pode variar

			_propostaListaNOTIF = _propostaListaNOTIF == null && CodigoItem > 0 ? new ListaNOTIF().Obter(CodigoItem) : _propostaListaNOTIF;
			if (_propostaListaNOTIF == null && defaultObject)
				_propostaListaNOTIF = new ListaNOTIF();
		}

		protected void LoadFormFromListaNOTIF()
		{
			if (_propostaListaNOTIF == null)
				return;

			TituloFormulario = _propostaListaSP_NOTIF != null ? String.Format("{0} {1}", NegocioNOTIF.ObterImagemFarol(_propostaListaNOTIF), _propostaListaSP_NOTIF.Titulo) : TituloFormulario;

			#region [DropDownList]

			_propostaListaNOTIF.SetControl(bd_TipoNotificacao, _ => _.TipoNotificacao);
			_propostaListaNOTIF.SetControl(bd_Mercado, _ => _.Mercado);

			_propostaListaNOTIF.SetControl(bd_Juridico_FasesJudicializacao, _ => _.Juridico_FasesJudicializacao);
			_propostaListaNOTIF.SetControl(bd_Juridico_TipoAcaoJudicial, _ => _.Juridico_TipoAcaoJudicial);

			#endregion

			#region [TexBox]

			_propostaListaNOTIF.SetControl(bd_StatusLoja, _ => _.StatusLoja);
			_propostaListaNOTIF.SetControl(bd_Consumo, _ => _.Consumo);
			_propostaListaNOTIF.SetControl(bd_Observacoes_Comentarios, _ => _.Comentario);

			_propostaListaNOTIF.SetControl(bd_Cnpj, _ => _.CNPJ);
			_propostaListaNOTIF.SetControl(bd_Cep, _ => _.Cep);
			_propostaListaNOTIF.SetControl(sp_RazaoSocial, _ => _.DescricaoRazaoSocial);
			_propostaListaNOTIF.SetControl(bd_Endereco, _ => _.Endereco);
			_propostaListaNOTIF.SetControl(bd_Bairro, _ => _.Bairro);
			_propostaListaNOTIF.SetControl(bd_Cidade, _ => _.Cidade);
			_propostaListaNOTIF.SetControl(bd_UF, _ => _.UF);

			_propostaListaNOTIF.SetControl(bd_OutroTipoNotificacao, _ => _.OutroTipoNotificacao);
			_propostaListaNOTIF.SetControl(bd_NomeContrato, _ => _.NomeContrato);
			_propostaListaNOTIF.SetControl(bd_NumeroContrato, _ => _.NumeroContrato);

			_propostaListaNOTIF.SetControl(bd_Juridico_Observacao, _ => _.Juridico_Observacao);
			_propostaListaNOTIF.SetControl(bd_Juridico_DataAcao, _ => _.Juridico_DataAcao);

			_propostaListaNOTIF.SetControl(bd_RelacoesSetoriais_FaseDenuncia, _ => _.RelacoesSetoriais_FaseDenuncia);
			_propostaListaNOTIF.SetControl(bd_RelacoesSetoriais_OrgaoDenuncia, _ => _.RelacoesSetoriais_OrgaoDenuncia);
			_propostaListaNOTIF.SetControl(bd_RelacoesSetoriais_Observacao, _ => _.RelacoesSetoriais_Observacao);
			_propostaListaNOTIF.SetControl(bd_RelacoesSetoriais_Data, _ => _.RelacoesSetoriais_Data);
			#endregion

		}

		protected void LoadListaNOTIFFromForm()
		{
			if (_propostaListaNOTIF == null)
				return;

			_propostaListaNOTIF.CodigoLista = CodigoLista;

			#region [DropDownList & RadioButtonList]

			_propostaListaNOTIF.LoadProperty(bd_TipoNotificacao, _ => _.TipoNotificacao);
			_propostaListaNOTIF.LoadProperty(bd_Mercado, _ => _.Mercado);

			_propostaListaNOTIF.LoadProperty(bd_Juridico_FasesJudicializacao, _ => _.Juridico_FasesJudicializacao);
			_propostaListaNOTIF.LoadProperty(bd_Juridico_TipoAcaoJudicial, _ => _.Juridico_TipoAcaoJudicial);

			#endregion

			#region [TexBox]

			_propostaListaNOTIF.NumeroIBM = _propostaListaSP_NOTIF.Ibm;
			_propostaListaNOTIF.LoadProperty(bd_StatusLoja, _ => _.StatusLoja);
			_propostaListaNOTIF.LoadProperty(bd_Consumo, _ => _.Consumo);
			_propostaListaNOTIF.LoadProperty(bd_Observacoes_Comentarios, _ => _.Comentario);

			_propostaListaNOTIF.LoadProperty(bd_Cnpj, _ => _.CNPJ);
			_propostaListaNOTIF.LoadProperty(bd_Cep, _ => _.Cep);
			_propostaListaNOTIF.LoadProperty(sp_RazaoSocial, _ => _.DescricaoRazaoSocial);
			_propostaListaNOTIF.LoadProperty(bd_Endereco, _ => _.Endereco);
			_propostaListaNOTIF.LoadProperty(bd_Bairro, _ => _.Bairro);
			_propostaListaNOTIF.LoadProperty(bd_Cidade, _ => _.Cidade);
			_propostaListaNOTIF.LoadProperty(bd_UF, _ => _.UF);

			_propostaListaNOTIF.LoadProperty(bd_OutroTipoNotificacao, _ => _.OutroTipoNotificacao);
			_propostaListaNOTIF.LoadProperty(bd_NomeContrato, _ => _.NomeContrato);
			_propostaListaNOTIF.LoadProperty(bd_NumeroContrato, _ => _.NumeroContrato);
			_propostaListaNOTIF.LoadProperty(bd_Mercado, _ => _.Mercado);

			_propostaListaNOTIF.LoadProperty(bd_Juridico_Observacao, _ => _.Juridico_Observacao);
			_propostaListaNOTIF.LoadProperty(bd_Juridico_DataAcao, _ => _.Juridico_DataAcao);

			_propostaListaNOTIF.LoadProperty(bd_RelacoesSetoriais_FaseDenuncia, _ => _.RelacoesSetoriais_FaseDenuncia);
			_propostaListaNOTIF.LoadProperty(bd_RelacoesSetoriais_OrgaoDenuncia, _ => _.RelacoesSetoriais_OrgaoDenuncia);
			_propostaListaNOTIF.LoadProperty(bd_RelacoesSetoriais_Observacao, _ => _.RelacoesSetoriais_Observacao);
			_propostaListaNOTIF.LoadProperty(bd_RelacoesSetoriais_Data, _ => _.RelacoesSetoriais_Data);
			#endregion

		} 
		
		#endregion

		#region [ListaNOTIFNotificacoes]
		
		protected void LoadListaNOTIFNotificacoes(Boolean defaultObject = false)
		{
			_listaListaNOTIFNotificacoes = _listaListaNOTIFNotificacoes == null && CodigoItem > 0 ?
				new ListaNOTIFNotificacoes().Consultar(_ => _.CodigoItem == CodigoItem) : _listaListaNOTIFNotificacoes;

			if (_listaListaNOTIFNotificacoes == null && defaultObject)
				_listaListaNOTIFNotificacoes = new List<ListaNOTIFNotificacoes>();
		}

		protected void LoadFormFromListaNOTIFNotificacoes()
		{
			_lstNotificacao = _lstNotificacao == null ?
				new DadosNotificacaoAcao().ObterListNotificacao(_listaListaNOTIFNotificacoes) : _lstNotificacao;

			BindGridNotificacoes(_lstNotificacao);
			BindGridEmissoes(_lstNotificacao);
		}

		protected KeyValuePair<Boolean, String> LoadListaNOTIFNotificacoesFromForm(Boolean iniciarFluxo = false)
		{
			if (_listaListaNOTIFNotificacoes == null || _lstNotificacao == null)
				return new KeyValuePair<bool, string>(true, "");

			Boolean salvarSP = false;
			#region [Notificação]
			foreach (var notif in _lstNotificacao)
				if (_listaListaNOTIFNotificacoes.Any(_ => _.NumeroNotificacao == notif.NumeroNotificacao))
				{
					ListaNOTIFNotificacoes listaNOTIFNotificacoes = _listaListaNOTIFNotificacoes.Where(_ => _.NumeroNotificacao == notif.NumeroNotificacao).FirstOrDefault();
					listaNOTIFNotificacoes.DataInicioContrato = notif.DataInicioContrato;
					listaNOTIFNotificacoes.DataFimContrato = notif.DataFimContrato;
					listaNOTIFNotificacoes.DataNotificacao = notif.DataNotificacao;
					listaNOTIFNotificacoes.Status = notif.IdStatus;
					salvarSP = salvarSP == false ? listaNOTIFNotificacoes.NotifAtiva != notif.NotifAtiva : salvarSP;
					listaNOTIFNotificacoes.NotifAtiva = notif.NotifAtiva;
					listaNOTIFNotificacoes.GrauNotificacao = notif.GrauNotificacao;
					listaNOTIFNotificacoes.Observacao = notif.Observacao;
					listaNOTIFNotificacoes.FormaEnvio = notif.FormaEnvio;
				}
				else
				{
					salvarSP = salvarSP == false ? notif.NotifAtiva : salvarSP;
					_listaListaNOTIFNotificacoes.Add(new ListaNOTIFNotificacoes()
					{
						DataInicioContrato = notif.DataInicioContrato,
						DataFimContrato = notif.DataFimContrato,
						DataNotificacao = notif.DataNotificacao,
						CodigoItem = CodigoItem,
						Status = notif.IdStatus,
						NumeroNotificacao = notif.NumeroNotificacao,
						NotifAtiva = notif.NotifAtiva,
						GrauNotificacao = notif.GrauNotificacao,
						Observacao = notif.Observacao,
						FormaEnvio = notif.FormaEnvio
					});
				}

			#endregion

			#region [Emissões]

			AtualizarEmissao();

			#endregion

			if (iniciarFluxo || salvarSP)
			{
				if (_listaListaNOTIFNotificacoes != null && _listaListaNOTIFNotificacoes.Any(_ => _.NotifAtiva == true
					&& _.Status == (Int32)StatusNotificacao.Aberta))
				{
					ListaNOTIFNotificacoes notificacaoAtiva = _listaListaNOTIFNotificacoes.FirstOrDefault(_ => _.NotifAtiva == true
					&& _.Status == (Int32)StatusNotificacao.Aberta);
					if (iniciarFluxo)
						notificacaoAtiva.Status = (Int32)StatusNotificacao.EmAprovacao;

                    #region ListaSP_NOTIF

                    _propostaListaSP_NOTIF.EnvolvimentoPlanejamento = notificacaoAtiva.EnvolvimentoPlanejamento;
                    _propostaListaSP_NOTIF.AprovacaoGRDV = notificacaoAtiva.AprovacaoGRDV;
					_propostaListaSP_NOTIF.DataDaNotificacao = notificacaoAtiva.DataNotificacao;

                    #endregion

                    #region ListaNOTIF

                    _propostaListaNOTIF.EnvolvimentoPlanejamento = notificacaoAtiva.EnvolvimentoPlanejamento;
                    _propostaListaNOTIF.AprovacaoGRDV = notificacaoAtiva.AprovacaoGRDV;
					_propostaListaNOTIF.DataNotificacao = notificacaoAtiva.DataNotificacao;
                    #endregion                    

                }
				else if (iniciarFluxo)
					return new KeyValuePair<bool, string>(false, "Nenhuma notificação ativa!");
			}

			return new KeyValuePair<bool, string>(iniciarFluxo || salvarSP, "");
		} 
		
		#endregion

		#endregion

		#endregion

        #region [Métodos - Salvar]

		protected void SalvarListaSP_NOTIF(bool somenteNovoItem = false)
        {
			if (CodigoItem > 0 && !somenteNovoItem)
                _propostaListaSP_NOTIF.Atualizar();
			else if (CodigoItem <= 0)
            {
                _propostaListaSP_NOTIF.Inserir();
                CodigoItem = _propostaListaSP_NOTIF.ID;                 
            }

            String uf = bd_UF.Text;
			String tipoPropostaReduzido = ObterTipoPropostaReduzido();
			String nomeSolicitacao = String.Format("[NOTIF - {4}] – {0} – {1} - {2} – {3}", uf, _propostaListaSP_NOTIF.RazaoSocial, _propostaListaSP_NOTIF.Ibm.ToString(), _propostaListaSP_NOTIF.ID, tipoPropostaReduzido);
			nomeSolicitacao = nomeSolicitacao.Length <= 255 ? nomeSolicitacao :
				String.Format("[NOTIF - {4}] – {0} – {1} - {2} – {3}", uf, _propostaListaSP_NOTIF.RazaoSocial.Substring(0, _propostaListaSP_NOTIF.RazaoSocial.Length > nomeSolicitacao.Length - 255 ? nomeSolicitacao.Length - 255 : nomeSolicitacao.Length), _propostaListaSP_NOTIF.Ibm.ToString(), _propostaListaSP_NOTIF.ID, tipoPropostaReduzido);

			if (_propostaListaSP_NOTIF.Titulo != nomeSolicitacao && !somenteNovoItem)
            {
                _propostaListaSP_NOTIF.Titulo = nomeSolicitacao;
                _propostaListaSP_NOTIF.Atualizar();
            }	
        }

        protected void SalvarListaNOTIF()
        {
			if (_propostaListaNOTIF == null)
				return;

			if (_propostaListaNOTIF.CodigoItem > 0)
				_propostaListaNOTIF.Atualizar();
            else
            {
                _propostaListaNOTIF.CodigoItem = CodigoItem;
                _propostaListaNOTIF.Inserir();
            }
		}

		protected void SalvarListaNOTIFNotificacoes()
		{
			if (_propostaListaNOTIF.CodigoItem <= 0)
				return;

			if (_listaListaNOTIFNotificacoes == null || _listaListaNOTIFNotificacoes.Count == 0)
				return;

			if (_listaListaNOTIFNotificacoes.Any(_ => _.IdNotificacao <= 0))
				_listaListaNOTIFNotificacoes.Where(_ => _.IdNotificacao <= 0).ToList().Inserir();
			_listaListaNOTIFNotificacoes.Atualizar();

        }

        #endregion

        #region [Métodos - Auxiliares]

		protected String ObterTipoPropostaReduzido()
		{
			return ObterTipoProposta().GetInfoExtra();
		}

		protected TipoNotificacao ObterTipoProposta()
		{
			TipoNotificacao tipoNotificacao = bd_TipoNotificacao.SelectedValue != "-1" ?
				(TipoNotificacao)Enum.Parse(typeof(TipoNotificacao), bd_TipoNotificacao.SelectedValue) : TipoNotificacao.Outros;

			return tipoNotificacao;
		}

		protected Boolean LoadComportamentoMercado()
		{
			return bd_Mercado.SelectedValue.TryParseToInt32(-1) != (Int32)Mercado.Varejo;
		}

		#region [Grid Notificação & Ação]

		private void BindGridNotificacoes(List<DadosNotificacaoAcao> lstNotificacao)
		{
			_lstNotificacao = lstNotificacao.ToList();
			grvNotificacoes.DataSource = _lstNotificacao;
			grvNotificacoes.DataBind();
		}

		private void LimparCamposNotificacao()
		{
            bd_DataInicioContrato.Text = String.Empty;
			bd_DataFimContrato.Text = String.Empty;
			bd_DataNotificacao.Text = String.Empty;
			bd_Observacao.Text = String.Empty;
		}

		private void DesabiltarCamposNotificacao(bool habilitar)
		{
			btnIncluirNoficacao.Visible = habilitar;
            bd_DataInicioContrato.Enabled = habilitar;
			bd_DataFimContrato.Enabled = habilitar;
			bd_DataNotificacao.Enabled = habilitar;
			bd_Observacao.Enabled = habilitar;
		}

		private KeyValuePair<Boolean, String> AtualizarNotificacao(DadosNotificacaoAcao notificacao, GridViewRow gridViewRow)
		{
			bool validate = true;
			string[] validateFields = new string[8];
			string script = String.Empty;

			Boolean ativarNotificacao = ((RadioButton)gridViewRow.FindControl("grid_bd_NotifAtiva")).Checked;
            DateTime? dataInicioContrato = FormHelper.GetDateValue((TextBox)gridViewRow.FindControl("grid_bd_DataInicioContrato"));
			DateTime? dataFimContrato = FormHelper.GetDateValue((TextBox)gridViewRow.FindControl("grid_bd_DataFimContrato"));
			DateTime? dataNotificacao = FormHelper.GetDateValue((TextBox)gridViewRow.FindControl("grid_bd_DataNotificacao"));
			String observacao = ((TextBox)gridViewRow.FindControl("grid_bd_Observacao")).Text;
			
            if (dataInicioContrato == null)
            {
                validate = false;
                validateFields[0] = "Data Início Contrato";
            }

			if (dataNotificacao == null)
			{
				validate = false;
				validateFields[1] = "Data da Notificação";
			}

			if (dataFimContrato == null)
			{
				validate = false;
				validateFields[2] = "Data Fim Contrato";
			}

			if (validate)
			{
                notificacao.DataInicioContrato = (DateTime)dataInicioContrato;
				notificacao.DataFimContrato = (DateTime)dataFimContrato;
				notificacao.DataNotificacao = (DateTime)dataNotificacao;
				notificacao.NotifAtiva = ativarNotificacao;
				notificacao.Observacao = observacao;
			}
			else
			{
				string requiredFields = string.Empty;
				foreach (var item in validateFields)
				{
					if (!string.IsNullOrEmpty(item) && requiredFields == String.Empty)
						requiredFields = item;
					else if (!string.IsNullOrEmpty(item))
						requiredFields += string.Format(", {0}", item);
				}

				script = string.Format("Os seguintes campos são obrigatórios: {0}", requiredFields);
			}

			return new KeyValuePair<bool, string>(validate, script);
			}

		private void AtualizarEmissao()
		{
			foreach (GridViewRow row in grvEmissoes.Rows)
				if (row.RowType == DataControlRowType.DataRow)
				{
					HiddenField grv_NumeroNotificacao = (HiddenField)row.FindControl("grv_NumeroNotificacao");
					CheckBox grv_bd_AprovacaoGRDV = (CheckBox)row.FindControl("grv_bd_AprovacaoGRDV");
					CheckBox grv_bd_NotificacaoPadrao = (CheckBox)row.FindControl("grv_bd_NotificacaoPadrao");
					DropDownList grv_bd_GrauNotificacao = (DropDownList)row.FindControl("grv_bd_GrauNotificacao");
					CheckBox grv_bd_EnvolvimentoPlanejamento = (CheckBox)row.FindControl("grv_bd_EnvolvimentoPlanejamento");
					TextBox grv_bd_FormaEnvio = (TextBox)row.FindControl("grv_bd_FormaEnvio");

					if (_listaListaNOTIFNotificacoes != null && _lstNotificacao != null &&
						_lstNotificacao.Any(_ => _.NumeroNotificacao == Convert.ToInt32(grv_NumeroNotificacao.Value)))
					{
						ListaNOTIFNotificacoes listaNOTIFNotificacoes = _listaListaNOTIFNotificacoes.Where(_ =>
							_.NumeroNotificacao == Convert.ToInt32(grv_NumeroNotificacao.Value)).FirstOrDefault();
						listaNOTIFNotificacoes.AprovacaoGRDV = grv_bd_AprovacaoGRDV.Checked;
						listaNOTIFNotificacoes.NotificacaoPadrao = grv_bd_NotificacaoPadrao.Checked;
						listaNOTIFNotificacoes.EnvolvimentoPlanejamento = grv_bd_EnvolvimentoPlanejamento.Checked;
						listaNOTIFNotificacoes.FormaEnvio = grv_bd_FormaEnvio.Text;
						listaNOTIFNotificacoes.GrauNotificacao = FormHelper.GetSelectedValue(grv_bd_GrauNotificacao).ToInt32();
					}else if (_lstNotificacao != null &&
						_lstNotificacao.Any(_ => _.NumeroNotificacao == Convert.ToInt32(grv_NumeroNotificacao.Value)))
					{
						DadosNotificacaoAcao dadosNotificacao = _lstNotificacao.Where(_ =>
							_.NumeroNotificacao == Convert.ToInt32(grv_NumeroNotificacao.Value)).FirstOrDefault();
						dadosNotificacao.AprovacaoGRDV = grv_bd_AprovacaoGRDV.Checked;
						dadosNotificacao.NotificacaoPadrao = grv_bd_NotificacaoPadrao.Checked;
						dadosNotificacao.EnvolvimentoPlanejamento = grv_bd_EnvolvimentoPlanejamento.Checked;
						dadosNotificacao.FormaEnvio = grv_bd_FormaEnvio.Text;
						dadosNotificacao.GrauNotificacao = FormHelper.GetSelectedValue(grv_bd_GrauNotificacao).ToInt32();
					}
				}
		}

		private void BindGridEmissoes(List<DadosNotificacaoAcao> lstNotificacao, Boolean reloadInfoEmissao = false)
		{
			if (reloadInfoEmissao)
				AtualizarEmissao();
			_lstNotificacao = lstNotificacao.ToList();
			grvEmissoes.DataSource = _lstNotificacao;
			grvEmissoes.DataBind();
			uppmenuEmissoes.Update();
		}

		#endregion

        #endregion

        #region [Controles - Core]

        #region [User Control Estrutura Comercial - Interface]

        //Método chamado pelos controles - Core
        public void CarregarDadosComercial(Control control, String dadosComercial)
        {
            EventoTratado(CarregarDadosComercialLocal, false, control, dadosComercial);
        }

        //Método chamado pelos controles - Core
        public void MudarZoneamentoPadrao(Control control, Boolean habilitado)
        {
            ControleBuscarDadosComercial wControleBuscarEstruturaComercial = new ControleBuscarDadosComercial(controleIbm);
            wControleBuscarEstruturaComercial.ChamadaWebServiceHabilitada(true);//Recarrega sempre.
            if (habilitado)
                wControleBuscarEstruturaComercial.RecarregarEstruturaComercial();

            if (control == controleEstruturaGt)
                new ControleEstruturaIndividual(controleEstruturaGt).ControlesHabilitados(habilitado);
            else if (control == controleEstruturaGr)
                new ControleEstruturaIndividual(controleEstruturaGr).ControlesHabilitados(habilitado);
            else if (control == controleEstruturaCdr)
                new ControleEstruturaIndividual(controleEstruturaCdr).ControlesHabilitados(habilitado);
            else if (control == controleEstruturaDiretor)
                new ControleEstruturaIndividual(controleEstruturaDiretor).ControlesHabilitados(habilitado);
            else if (control == controleEstruturaGdr)
                new ControleEstruturaIndividual(controleEstruturaGdr).ControlesHabilitados(habilitado);
        }

        protected KeyValuePair<Boolean, String> CarregarDadosComercialLocal(object _control, object _dadosComercial)
        {
            KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);
            Control control = (Control)_control;
            String dadosComercial = (String)_dadosComercial;

            CarregarEstruturaComercial();
            DadosComercialSalesForce dados = Serializacao.DeserializeFromJson<DadosComercialSalesForce>(dadosComercial);

            if (dados == null || dados.Ibm == null || dados.SiteCode == null)
                retorno = new KeyValuePair<bool, string>(false, "Número do IBM ou Site Code não encontrado");

            if (retorno.Key)
				CarregarEstruturaComercial(dados, desabilitarControle: LoadComportamentoMercado());

            return retorno;
        }

        #endregion

        #region [User Control Menu- Interface]

        public List<KeyValuePair<String, String>> ObterConfiguracaoMenu()
        {
            return _listaConfiguracaoMenu;
        }

        public String ObterMenuAtivo()
        {
            return _idMenuAtivo;
        }

        public Boolean ExibirMenuTarefa()
        {
            return _exibirMenuTarefa;
        }

        public String ObterTituloFormulario()
        {
            return TituloFormulario;
        }

        #endregion
		

        #endregion

    }
}