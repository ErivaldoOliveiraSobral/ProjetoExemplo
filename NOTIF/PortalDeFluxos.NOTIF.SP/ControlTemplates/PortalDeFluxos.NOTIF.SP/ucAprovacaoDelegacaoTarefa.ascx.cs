using PortalDeFluxos.Core.BLL.Modelo;
using PortalDeFluxos.Core.BLL.Utilitario;
using PortalDeFluxos.Core.SP.Core.BaseControls;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using PortalDeFluxos.Core.BLL.Negocio;
using Iteris;
using System.Collections.Generic;
using PortalDeFluxos.NOTIF.BLL.Utilitario;
using PortalDeFluxos.NOTIF.BLL.Modelo;
using System.Linq;
using PortalDeFluxos.NOTIF.BLL.Negocio;

namespace PortalDeFluxos.NOTIF.SP.ControlTemplates.PortalDeFluxos.NOTIF.SP
{
    public partial class ucAprovacaoDelegacaoTarefa : CustomApproveForm
    {
        #region [Eventos]

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            CarregarFormulario(ucAprovacaoTarefa_IniciandoFormulario
                    , ucAprovacaoTarefa_IniciandoPermissao
                    , ucAprovacaoTarefa_SalvandoDados
                    , ucDelegacaoTarefa_IniciandoFormulario
                    , ucDelegacaoTarefa_SalvandoDados
                    , ucDiscussao_IniciandoFormulario
                    , ucDiscussao_SalvandoDados);
        }

        #region [Aprovacao]
        protected void btnOk_OnClick(object sender, EventArgs e)
        {
            Salvar(hdnIdTarefa);
        }

        protected void btnCarregarFormulario_Click(object sender, EventArgs e)
        {
            CarregarTarefa(hdnIdTarefa, uppFormularioAprovacao);
        }
        #endregion

        #region [Delegacao]
        protected void btnConfirmarDelegacao_Click(object sender, EventArgs e)
        {
            Delegar(hdnIdTarefa);
        }

        protected void btnCarregarFormularioDelegacao_Click(object sender, EventArgs e)
        {
            CarregarDelegacao(hdnIdTarefa, uppFormularioDelegacao);
        }

        #endregion

        #region [Discussão]
        protected void btnConfirmarDiscussao_Click(object sender, EventArgs e)
        {
            Discutir(hdnIdTarefa);
        }

        protected void btnCarregarFormularioDiscussao_Click(object sender, EventArgs e)
        {
            CarregarDiscussao(hdnIdTarefa, uppFormularioDiscussao);
        }

        #endregion

        #endregion [Fim - Eventos]

        #region [Comum]

        #region [Aprovacao]
        public void ucAprovacaoTarefa_SalvandoDados()
        {
			SalvarAprovacaoSP(); 
            SalvarAprovacaoBD();
        }

        public void ucAprovacaoTarefa_IniciandoPermissao()
        {
            if (_tarefa != null)
            {

                pnlInfoTarefa.Visible = PermissaoVisualizar;

                lblMsgDelegar.Visible = !_tarefa.TarefaCompleta && (PermissaoAprovador || this.PermissaoDelegarTarefa);
                btnOk.Enabled = !_tarefa.TarefaCompleta && PermissaoAprovador;
                rblOutcomes.Enabled = btnOk.Enabled;
                txtComentarios.ReadOnly = !btnOk.Enabled;

                if (_tarefa.AprovacaoPor == (Int32)TipoAprovacao.Discussao)
                {
                    divDiscussao.Visible = true;
                    divTarefa.Visible = false;
                    Tarefa _discussaoPergunta = new Tarefa().Obter((Int32)_tarefa.IdTarefaPai);
                    txtPerguntaDiscussao.Text = _discussaoPergunta.ComentarioAprovacao;
                }
                else
                {
                    divDiscussao.Visible = false;
                    divTarefa.Visible = true;
                }

                lblMensagem.Text = !this.PermissaoVisualizar ? "Você não tem permissão para ver esta tarefa." :
                    _tarefa.TarefaCompleta ? "Esta tarefa já foi respondida." :
                    !PermissaoAprovador ? "Esta tarefa está atribuída a outro usuário." : String.Empty;

                hdnTarefaGrupo.Value = TarefaGrupo.ToString().ToLower();
            }
            else
                DesabilitarTela();
        }

        public void ucAprovacaoTarefa_IniciandoFormulario()
        {
            //CarregarAprovacaoControlesSP();
            CarregarAprovacaoControlesBD();
            //CarregarAprovacaoDadosSP();
            CarregarAprovacaoDadosBD();
            CarregarCamposEspecificos();
        }

        private KeyValuePair<Boolean, String> CarregarCamposEspecificos()
        {
            KeyValuePair<Boolean, String> retorno = new KeyValuePair<Boolean, String>(true, String.Empty);

            if (_tarefa == null)
                return retorno;

            divNotificacaoPadrao.Visible = false;
            divConfirmacaoRecebimento.Visible = false;
            divGestaoNotificacoes.Visible = false;

            ListaNOTIF proposta = new ListaNOTIF().Obter(i => i.CodigoItem == CodigoItem);
            ListaSP_NOTIF spListaB2B = new ListaSP_NOTIF().Obter(CodigoItem);

            if (_tarefa.NomeTarefa == Tarefas.EmitirNotificacao.GetTitle())
                divNotificacaoPadrao.Visible = true;
            else if (_tarefa.NomeTarefa == Tarefas.ConfirmacaoRecebimento.GetTitle())
                divConfirmacaoRecebimento.Visible = true;
            else if (_tarefa.NomeTarefa == Tarefas.GestaoNotificacao.GetTitle())
                divGestaoNotificacoes.Visible = true;

            return retorno;
        }

        #endregion

        #region [Delegacao]
        public void ucDelegacaoTarefa_IniciandoFormulario()
        {
            CarregarDelegacaoControlesBD();
        }

        public void ucDelegacaoTarefa_SalvandoDados()
        {
            SalvarDelegacaoBD();
        }

        #endregion

        #region [Discussao]
        public void ucDiscussao_IniciandoFormulario()
        {
            CarregarDiscussaoControlesBD();
        }

        public void ucDiscussao_SalvandoDados()
        {
            SalvarDiscussaoBD();
        }

        #endregion

        #endregion

        #region [Métodos]
        protected void DesabilitarTela()
        {
            lblMsgDelegar.Visible = false;
            txtComentarios.ReadOnly = true;
            btnCancelar.Enabled = false;
            btnOk.Enabled = false;
            lblMensagem.Text = _tarefa == null ? "Tarefa não foi encontrada!" : lblMensagem.Text;
        }

        #region [Item - SP]

        //protected void CarregarAprovacaoControlesSP()
        //{
        //    //Caso precise implementar Load de controles que o dado é proveniente do SP
        //}

        //protected void CarregarAprovacaoDadosSP()
        //{
        //    //Caso precise implementar Load de controles que o dado é proveniente do SP
        //}

        protected void SalvarAprovacaoSP()
        {
            if (!_tarefa.TarefaCompleta)
            {

                if (divNotificacaoPadrao.Visible == true)
                {
                    ListaSP_NOTIF proposta = new ListaSP_NOTIF().Obter(CodigoItem);
                    proposta.NotificacaoPadrao = FormHelper.GetBooleanValue(ddlNotificacaoPadrao);
                    proposta.Atualizar();
                } else if (divGestaoNotificacoes.Visible == true){

                    if (FormHelper.GetBooleanValue(ddlFinalizarAcompanhamento))
                        NegocioNOTIF.FinalizarAcompanhamento(CodigoItem,CodigoLista);
                    else
						NegocioNOTIF.FinalizarAcompanhamento(CodigoItem,CodigoLista,estadoEtapa:"",statusFluxo:(Int32)StatusFluxo.Default);
                }
            }
            else
                lblMensagem.Text = "Esta tarefa já foi respondida.";
        }

        #endregion

        #region [BD]

        #region [Aprovacao]
        protected void CarregarAprovacaoControlesBD()
        {
            if (_tarefa != null)
            {
                FormHelper.LoadDataSource(rblOutcomes, _tarefa.ObterDataSourceString(t => t.DescricaoAcao));
                FormHelper.LoadDataSource(ddlNotificacaoPadrao, FormHelper.GetBooleanDictionary(true));
                FormHelper.LoadDataSource(ddlConfirmacaoRecebimento, NegocioComum.GetDictionaryFromEnum<StatusNotificacaoTarefa>(true), false);
                FormHelper.LoadDataSource(ddlFinalizarAcompanhamento, FormHelper.GetBooleanDictionary(true));

                FormHelper.LoadDataSource(ddlNotificacoes, new ListaNOTIFNotificacoes().Consultar(_ => _.Status == (int)StatusNotificacao.Aberta
                    && _.NotifAtiva == false && _.CodigoItem == CodigoItem).ObterDataSource(_ => _.IdNotificacao, _ => _.NumeroNotificacao.ToString(), true));
                
            }            
        }

        protected void CarregarAprovacaoDadosBD()
        {
            if (_tarefa != null)
            {
                if (_tarefa.TarefaCompleta)
                    FormHelper.SetSelectedValues(rblOutcomes, new String[] { _tarefa.DescricaoAcaoEfetuada });
                txtComentarios.Text = _tarefa.ComentarioAprovacao;
                lblAprovacaoTarefaModal.InnerText = _tarefa.NomeTarefa;
            }
        }

        protected void SalvarAprovacaoBD()
        {
            if (!_tarefa.TarefaCompleta)
            {
                _tarefa.TarefaCompleta = true;
                _tarefa.NomeCompletadoPor = _tarefa.Contexto.UsuarioAtual.Nome;
                _tarefa.LoginCompletadoPor = _tarefa.Contexto.UsuarioAtual.Login;
                _tarefa.DataFinalizado = DateTime.Now;
                _tarefa.ComentarioAprovacao = txtComentarios.Text;

                if (_tarefa.AprovacaoPor == (Int32)TipoAprovacao.Discussao)
                {
                    _tarefa.DescricaoAcaoEfetuada = TipoAprovacao.Discussao.GetTitle();
                    NegocioTarefaCustom.FormatarRespostaDiscussao(_tarefa);
                    NegocioEmail.EnviarEmailRespostaDiscussao(_tarefa);
                }
                else
                {
                    _tarefa.DescricaoAcaoEfetuada = rblOutcomes.SelectedValue;
                    _tarefa.Configuracao.CarregarDados();

                    if (divNotificacaoPadrao.Visible == true)
                        AtualizarPropostaNotificacaoBD((int)StatusNotificacao.Emitida, FormHelper.GetBooleanValue(ddlNotificacaoPadrao));
					else if (_tarefa.NomeTarefa == Tarefas.EnvioNotificacao.GetTitle() && _tarefa.DescricaoAcaoEfetuada == "Aprovar")
                        AtualizarPropostaNotificacaoBD((int)StatusNotificacao.Enviada);
					else if (divConfirmacaoRecebimento.Visible == true && _tarefa.DescricaoAcaoEfetuada == "Aprovar")
                        AtualizarPropostaNotificacaoBD(FormHelper.GetSelectedValue(ddlConfirmacaoRecebimento).ToInt32());
					else if (_tarefa.NomeTarefa == Tarefas.GRDiretorVendas.GetTitle() && _tarefa.DescricaoAcaoEfetuada == "Reprovar")
						AtualizarPropostaNotificacaoBD((int)StatusNotificacao.Reprovada);
                    else if (divGestaoNotificacoes.Visible == true)
                    {
                        if (!FormHelper.GetBooleanValue(ddlFinalizarAcompanhamento))
                        { 
                            List<ListaNOTIFNotificacoes> listaNotificacoes = new ListaNOTIFNotificacoes().Consultar(_ => _.CodigoItem == CodigoItem && _.Ativo == true);

                            ListaNOTIFNotificacoes notificacaoAtivaAtual = listaNotificacoes.FirstOrDefault(_ => _.NotifAtiva == true);
                            notificacaoAtivaAtual.NotifAtiva = false;

                            ListaNOTIFNotificacoes novaNotificacaoAtiva = listaNotificacoes.FirstOrDefault(_ => _.IdNotificacao == FormHelper.GetSelectedValue(ddlNotificacoes).ToInt32());
                            novaNotificacaoAtiva.NotifAtiva = true;

                            listaNotificacoes.Atualizar();
                        }
                    }

                    NegocioTarefaCustom.AtualizarDiscussoesPendentes(_tarefa);
                }

                _tarefa.Atualizar();
            }
            else
                lblMensagem.Text = "Esta tarefa já foi respondida.";
        }

        protected void AtualizarPropostaNotificacaoBD(int? statusNotificacao, Boolean? notificacaoPadrao = null)
        {
            ListaNOTIFNotificacoes notificacao = new ListaNOTIFNotificacoes().Obter(i => i.CodigoItem == CodigoItem && i.NotifAtiva == true);
            notificacao.Status = statusNotificacao;
			
			if (notificacaoPadrao != null)
			{
				ListaNOTIF proposta = new ListaNOTIF().Obter(i => i.CodigoItem == CodigoItem && i.Ativo == true);
				proposta.NotificacaoPadrao = notificacaoPadrao;
				proposta.Atualizar();
				notificacao.NotificacaoPadrao = notificacaoPadrao;
			}

            notificacao.Atualizar();

        }
        #endregion

        #region [Delegacao]
        protected void CarregarDelegacaoControlesBD()
        {
            peDelegarUsuario.AllEntities.Clear();
            peDelegarUsuario.ResolvedEntities.Clear();
            txtComentarioDelegacao.Text = String.Empty;
            lblDelegacaoTarefaModal.InnerText = String.Format("{0} - {1}", "Delegação", _tarefa.NomeTarefa);
        }

        protected void SalvarDelegacaoBD()
        {
            if (!_tarefa.TarefaCompleta)
            {
                // Recuperar o usuário selecionado
                UsuarioGrupoBase usuarioGrupo = FormHelper.GetPeoplePickerValue(peDelegarUsuario);

                Usuario usuarioSelecionado = null;
                if (usuarioGrupo is Usuario)
                    usuarioSelecionado = (Usuario)usuarioGrupo;

                // Incluir item na tarefa hist
                _tarefaHist = new TarefaHist();
                _tarefaHist.Ativo = true;
                _tarefaHist.IdTarefa = _tarefa.IdTarefa;
                _tarefaHist.TipoTarefaHist = (Byte)TipoTarefaHist.DelegacaoIndividual;
                _tarefaHist.LoginDe = _tarefa.Contexto.UsuarioAtual.Login;
                _tarefaHist.LoginPara = usuarioSelecionado.Login;
                _tarefaHist.ComentarioDelegacao = txtComentarioDelegacao.Text;
                _tarefaHist.Inserir();

                // Atualizar a tarefa atual
                _tarefa.LoginResponsavel = usuarioSelecionado.Login;
                _tarefa.NomeResponsavel = usuarioSelecionado.Nome;
                _tarefa.EmailResponsavel = usuarioSelecionado.Email;
                _tarefa.DescricaoMensagemEmail += NegocioTarefaCustom.ObterTextoDelegacao(_tarefaHist);
                _tarefa.EmailEnviado = false;//Programa o envio do e-mail.
                _tarefa.Atualizar();

                List<Lembrete> lembretes = new Lembrete().Consultar(l => l.IdTarefa == _tarefa.IdTarefa);
                lembretes.ForEach(l =>
                {
                    l.LoginPara = usuarioSelecionado.Login;
                    l.NomePara = usuarioSelecionado.Nome;
                    l.EmailPara = usuarioSelecionado.Email;
                }
                );
                lembretes.Atualizar();

            }
            else
                lblMensagem.Text = "Esta tarefa já foi respondida.";
        }

        #endregion

        #region [Discussao]

        protected void CarregarDiscussaoControlesBD()
        {
            peDiscussaoUsuario.AllEntities.Clear();
            peDiscussaoUsuario.ResolvedEntities.Clear();
            txtComentarioDiscussao.Text = String.Empty;
            lblDiscussaoTarefaModal.InnerText = String.Format("{0} - {1}", "Discussão", _tarefa.NomeTarefa);
        }

        protected void SalvarDiscussaoBD()
        {
            if (!_tarefa.TarefaCompleta)
            {
                // Recuperar o usuário selecionado
                UsuarioGrupoBase usuarioGrupo = FormHelper.GetPeoplePickerValue(peDiscussaoUsuario);
                Usuario usuarioSelecionado = null;
                if (usuarioGrupo is Usuario)
                    usuarioSelecionado = (Usuario)usuarioGrupo;

                #region [Discussão Pergunta]

                Tarefa _tarefaDiscussaoPergunta = new Tarefa();

                _tarefaDiscussaoPergunta.LoginResponsavel = _tarefa.Contexto.UsuarioAtual.Login;
                _tarefaDiscussaoPergunta.NomeResponsavel = _tarefa.Contexto.UsuarioAtual.Nome;
                _tarefaDiscussaoPergunta.EmailResponsavel = _tarefa.Contexto.UsuarioAtual.Email;
                _tarefaDiscussaoPergunta.LoginCompletadoPor = _tarefa.Contexto.UsuarioAtual.Login;
                _tarefaDiscussaoPergunta.NomeCompletadoPor = _tarefa.Contexto.UsuarioAtual.Nome;
                _tarefaDiscussaoPergunta.LoginInclusao = _tarefa.Contexto.UsuarioAtual.Login;

                _tarefaDiscussaoPergunta.DataInclusao = DateTime.Now;
                _tarefaDiscussaoPergunta.DataFinalizado = DateTime.Now;
                _tarefaDiscussaoPergunta.DataAtribuido = DateTime.Now;

                _tarefaDiscussaoPergunta.NomeEtapa = _tarefa.NomeEtapa;
                _tarefaDiscussaoPergunta.NomeTarefa = String.Format("{0} - {1}", _tarefa.NomeTarefa, TipoAprovacao.Discussao.GetTitle());
                _tarefaDiscussaoPergunta.IdInstanciaFluxo = _tarefa.IdInstanciaFluxo;

                _tarefaDiscussaoPergunta.DescricaoAcaoEfetuada = TipoAprovacao.Discussao.GetTitle();
                _tarefaDiscussaoPergunta.DescricaoAcao = TipoAprovacao.Discussao.GetTitle();
                _tarefaDiscussaoPergunta.ComentarioAprovacao = txtComentarioDiscussao.Text;
                _tarefaDiscussaoPergunta.EmailEnviado = true;
                _tarefaDiscussaoPergunta.TarefaCompleta = true;
                _tarefaDiscussaoPergunta.TarefaEscalonada = false;
                _tarefaDiscussaoPergunta.CopiarSuperior = false;
                _tarefaDiscussaoPergunta.TipoTarefa = (byte)TipoTarefa.Primeiro;
                _tarefaDiscussaoPergunta.CodigoConfiguracao = _tarefa.CodigoConfiguracao;
                _tarefaDiscussaoPergunta.AprovacaoPor = (Int32)TipoAprovacao.Discussao;
                _tarefaDiscussaoPergunta.IdTarefaPai = _tarefa.IdTarefa;

                _tarefaDiscussaoPergunta.Inserir();

                #endregion

                #region [Discussão Resposta]

                Tarefa _tarefaDiscussaoResposta = new Tarefa();

                _tarefaDiscussaoResposta.LoginResponsavel = usuarioSelecionado.Login;
                _tarefaDiscussaoResposta.NomeResponsavel = usuarioSelecionado.Nome;
                _tarefaDiscussaoResposta.EmailResponsavel = usuarioSelecionado.Email;
                _tarefaDiscussaoResposta.LoginInclusao = _tarefa.Contexto.UsuarioAtual.Login;

                _tarefaDiscussaoResposta.DataInclusao = DateTime.Now;
                _tarefaDiscussaoResposta.DataAtribuido = DateTime.Now;

                _tarefaDiscussaoResposta.NomeEtapa = _tarefa.NomeEtapa;
                _tarefaDiscussaoResposta.NomeTarefa = String.Format("{0} - {1}", _tarefa.NomeTarefa, TipoAprovacao.Discussao.GetTitle());
                _tarefaDiscussaoResposta.IdInstanciaFluxo = _tarefa.IdInstanciaFluxo;

                _tarefaDiscussaoResposta.DescricaoAcaoEfetuada = TipoAprovacao.Discussao.GetTitle();
                _tarefaDiscussaoResposta.DescricaoAcao = TipoAprovacao.Discussao.GetTitle();
                _tarefaDiscussaoResposta.EmailEnviado = false;
                _tarefaDiscussaoResposta.TarefaCompleta = false;
                _tarefaDiscussaoResposta.TarefaEscalonada = false;
                _tarefaDiscussaoResposta.CopiarSuperior = false;
                _tarefaDiscussaoResposta.TipoTarefa = (byte)TipoTarefa.Primeiro;
                _tarefaDiscussaoResposta.CodigoConfiguracao = _tarefa.CodigoConfiguracao;
                _tarefaDiscussaoResposta.AprovacaoPor = (Int32)TipoAprovacao.Discussao;
                _tarefaDiscussaoResposta.IdTarefaPai = _tarefaDiscussaoPergunta.IdTarefa;

                _tarefaDiscussaoResposta.Inserir();

                NegocioTarefaCustom.PopularEmailDiscussaoPergunta(_tarefaDiscussaoResposta, _tarefaDiscussaoPergunta);
                _tarefaDiscussaoResposta.Atualizar();

                #endregion
            }
            else
                lblMensagem.Text = "Esta tarefa já foi respondida.";
        }

        #endregion

        #endregion

        #endregion [Fim - Métodos]

    }

}
