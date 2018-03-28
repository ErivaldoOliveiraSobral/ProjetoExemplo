﻿<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAprovacaoDelegacaoTarefa.ascx.cs" Inherits="PortalDeFluxos.NOTIF.SP.ControlTemplates.PortalDeFluxos.NOTIF.SP.ucAprovacaoDelegacaoTarefa" %>

<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppFormularioAprovacao">
    <ContentTemplate>
        <asp:HiddenField runat="server" ID="hdnIdTarefa" Value="" />
        <asp:HiddenField runat="server" ID="hdnTarefaGrupo" Value="" />
        <div class="col-sm-offset-1 col-md-offset-1 col-xs-12 col-sm-10 col-md-10 modal fade" id="divTarefaModal" role="dialog">
            <div class="vertical-alignment-helper">
                <div class="vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" id="lblAprovacaoTarefaModal" runat="server"></h4>
                            <asp:Label runat="server" ID="lblMensagem" Visible="true" CssClass="error"></asp:Label>
                        </div>
                        <div class="modal-body">
                            <asp:Panel runat="server" ID="pnlInfoTarefa">
                                <div class="row form-group ms-formbody" runat="server" id="divTarefa">
                                    <div class="col-xs-12 col-sm-6 col-md-6 ms-formlabel">
                                        <h4 class="ms-standardheader" style="font-weight: bold">Status</h4>
                                        <h4 style="font-size: small">Selecione uma opção para dar continuidade ao fluxo.</h4>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <asp:RadioButtonList runat="server" ID="rblOutcomes" RepeatDirection="Vertical" RepeatLayout="Flow" CssClass="radio radiobuttonlist" ClientIDMode="Static">
                                        </asp:RadioButtonList>
                                        <label class='error' id='OutComeObrigatorio' style='display: none'>Por favor, selecione uma opção para continuar.</label>
                                        <br/>
                                        <asp:Label ID="lblMsgDiscutir" runat="server" Font-Size="Small">Ou você pode <a id="discutirTarefa" style="cursor: pointer;" onclick="aprovacaoDelegacaoTarefa.events.carregarDiscussao();" title="Clique aqui para discutir esta tarefa.">discutir</a> esta tarefa com outra pessoa.</asp:Label>
                                        <asp:Label ID="lblMsgDelegar" runat="server" Font-Size="Small">Ou você pode <a id="delegarTarefa" style="cursor: pointer;" onclick="aprovacaoDelegacaoTarefa.events.carregarDelegacao();" title="Clique aqui para delegar esta tarefa.">delegar</a> esta tarefa para outra pessoa.</asp:Label>                                        
                                    </div>
                                </div>
                                <div class="row form-group ms-formbody" runat="server" id="divDiscussao">
                                    <div class="col-xs-12 col-sm-6 col-md-6 ms-formlabel">
                                        <h4 class="ms-standardheader" style="font-weight: bold">Discussão:</h4>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <asp:TextBox runat="server" ID="txtPerguntaDiscussao" TextMode="MultiLine" Rows="5" 
                                            CssClass="form-control" ClientIDMode="Static" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row form-group ms-formbody">
                                    <div class="col-xs-12 col-sm-6 col-md-6 ms-formlabel">
                                        <h4 class="ms-standardheader" style="font-weight: bold">Comentários</h4>
                                        <h4 style="font-size: small">Utilize este campo para colocar quaisquer comentários sobre o item.</h4>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                        <asp:TextBox runat="server" ID="txtComentarios" TextMode="MultiLine" Rows="5" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                        <br/>
						                <label class='error' id='ComentarioObrigatorio' style='display: none'>Você não pode deixar em branco.</label>
                                    </div>
                                </div>

                                <div class="row form-group ms-formbody" runat="server" id="divNotificacaoPadrao">
                                    <div class="col-xs-12 col-sm-6 col-md-6 ms-formlabel">
                                        <h4 class="ms-standardheader" style="font-weight: bold">Notificação Padrão?</h4>
                                        <%--<h4 style="font-size: small">Utilize este campo para colocar quaisquer comentários sobre o item.</h4>--%>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <asp:DropDownList runat="server" ID="ddlNotificacaoPadrao" CssClass="form-control" type="DropDownList"></asp:DropDownList>
                                        <br/>
						                <label class='error' id='NotificacaoPadraoObrigatoria' style='display: none'>Você não pode deixar em branco.</label>
                                    </div>
                                </div>

                                <div class="row form-group ms-formbody" runat="server" id="divConfirmacaoRecebimento">
                                    <div class="col-xs-12 col-sm-6 col-md-6 ms-formlabel">
                                        <h4 class="ms-standardheader" style="font-weight: bold">Status Notificação:</h4>
                                        <%--<h4 style="font-size: small">Utilize este campo para colocar quaisquer comentários sobre o item.</h4>--%>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <asp:DropDownList runat="server" ID="ddlConfirmacaoRecebimento" CssClass="form-control" type="DropDownList"></asp:DropDownList>
                                        <br/>
						                <label class='error' id='ConfirmacaoRecebimentoObrigatoria' style='display: none'>Você não pode deixar em branco.</label>
                                    </div>
                                </div>

                                <div class="row form-group ms-formbody" runat="server" id="divGestaoNotificacoes">
                                    <div class="col-xs-12 col-sm-6 col-md-6 ms-formlabel">
                                        <h4 class="ms-standardheader" style="font-weight: bold">Finalizar Acompanhamento:</h4>
                                        <%--<h4 style="font-size: small">Utilize este campo para colocar quaisquer comentários sobre o item.</h4>--%>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4">
                                        <asp:DropDownList runat="server" ID="ddlFinalizarAcompanhamento" CssClass="form-control" type="DropDownList"></asp:DropDownList>
                                        <br/>
						                <label class='error' id='FinalizarAcompanhamentosObrigatoria' style='display: none'>Você não pode deixar em branco.</label>
                                    </div>
                                    <div class="col-xs-12 col-sm-6 col-md-6 ms-formlabel gestao-notificacao">
                                        <h4 class="ms-standardheader" style="font-weight: bold">Selecionar nova notificação:</h4>
                                        <%--<h4 style="font-size: small">Utilize este campo para colocar quaisquer comentários sobre o item.</h4>--%>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 gestao-notificacao">
                                        <asp:DropDownList runat="server" ID="ddlNotificacoes" CssClass="form-control" type="DropDownList"></asp:DropDownList>
                                        <br/>
						                <label class='error' id='SelecionarNotificacaoObrigatoria' style='display: none'>Você não pode deixar em branco.</label>
                                    </div>
                                </div>

                            </asp:Panel>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnOk" Text="Ok" OnClientClick="return aprovacaoDelegacaoTarefaNOTIF.validation.validarFormularioAprovacao();" OnClick="btnOk_OnClick" CssClass="btn btn-primary .btn-md" formnovalidate="formnovalidate" />
                            <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="btn btn-danger .btn-md" data-dismiss="modal" formnovalidate="formnovalidate" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnCarregarFormulario" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
<asp:UpdatePanel ID="uppRecarregarAprovacao" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Button runat="server" ID="btnCarregarFormulario" OnClick="btnCarregarFormulario_Click" Text="Carregar" Style="display: none" formnovalidate="formnovalidate" />
    </ContentTemplate>
</asp:UpdatePanel>


<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppFormularioDelegacao">
    <ContentTemplate>
        <div class="col-sm-offset-2 col-md-offset-2 col-xs-12 col-sm-8 col-md-8 modal fade" id="divDelegacaoModal" role="dialog">
            <div class="vertical-alignment-helper">
                <div class="vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" id="lblDelegacaoTarefaModal" runat="server"></h4>
                            <asp:Label runat="server" ID="lblErroDelegacao" Visible="true" CssClass="error"></asp:Label>
                        </div>
                        <div class="modal-body">
                            <div class="row form-group ms-formbody">
                                <div class="col-xs-12 col-sm-4 col-md-4 ms-formlabel">
                                    <h4 class="ms-standardheader" style="font-weight: bold">Delegar esta tarefa para:</h4>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6" 
                                    style="left: -15px !important; width: 455px !important; padding-right: 0px !important; padding-left: 0px !important;">
                                    <SharePoint:ClientPeoplePicker ID="peDelegarUsuario" runat="server"
                                        ValidationEnabled="true" AutoFillEnabled="True" VisibleSuggestions="3"
                                        Rows="1" AllowMultipleEntities="false" />
                                    <br/>
                                </div>
                            </div>
                            <div class="row form-group ms-formbody">
                                <div class="col-xs-12 col-sm-4 col-md-4 ms-formlabel">
                                    <h4 class="ms-standardheader" style="font-weight: bold">Comentário:</h4>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <asp:TextBox runat="server" ID="txtComentarioDelegacao" TextMode="MultiLine" Rows="5" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    <br/>
						    <label class='error' id='ComentarioDelegacaoObrigatorio' style='display: none'>Você não pode deixar em branco.</label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnConfirmarDelegacao" Text="Confirmar" OnClientClick="return aprovacaoDelegacaoTarefa.validation.validarFormularioDelegacao();" OnClick="btnConfirmarDelegacao_Click" CssClass="btn btn-primary .btn-md" formnovalidate="formnovalidate" />
                            <asp:Button runat="server" ID="btnCancelarDelegacao" Text="Cancelar" CssClass="btn btn-danger .btn-md" data-dismiss="modal" formnovalidate="formnovalidate" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnCarregarFormularioDelegacao" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
<asp:UpdatePanel ID="uppRecarregarDelegacao" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Button runat="server" ID="btnCarregarFormularioDelegacao" OnClick="btnCarregarFormularioDelegacao_Click" Text="Carregar" Style="display: none" formnovalidate="formnovalidate" />
    </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppFormularioDiscussao">
    <ContentTemplate>
        <div class="col-sm-offset-2 col-md-offset-2 col-xs-12 col-sm-8 col-md-8 modal fade" id="divDiscussaoModal" role="dialog">
            <div class="vertical-alignment-helper">
                <div class="vertical-align-center">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" id="lblDiscussaoTarefaModal" runat="server"></h4>
                            <asp:Label runat="server" ID="lblErroDiscussao" Visible="true" CssClass="error"></asp:Label>
                        </div>
                        <div class="modal-body">
                            <div class="row form-group ms-formbody">
                                <div class="col-xs-12 col-sm-4 col-md-4 ms-formlabel">
                                    <h4 class="ms-standardheader" style="font-weight: bold">Discutir esta tarefa com:</h4>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6" 
                                    style="left: -15px !important; width: 455px !important; padding-right: 0px !important; padding-left: 0px !important;">
                                    <SharePoint:ClientPeoplePicker ID="peDiscussaoUsuario" runat="server"
                                        ValidationEnabled="true" AutoFillEnabled="True" VisibleSuggestions="3"
                                        Rows="1" AllowMultipleEntities="false" />
                                    <br/>
                                </div>
                            </div>
                            <div class="row form-group ms-formbody">
                                <div class="col-xs-12 col-sm-4 col-md-4 ms-formlabel">
                                    <h4 class="ms-standardheader" style="font-weight: bold">Comentário:</h4>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <asp:TextBox runat="server" ID="txtComentarioDiscussao" TextMode="MultiLine" Rows="5" CssClass="form-control" ClientIDMode="Static"></asp:TextBox>
                                    <br/>
						    <label class='error' id='ComentarioDiscussaoObrigatorio' style='display: none'>Você não pode deixar em branco.</label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button runat="server" ID="btnConfirmarDiscussao" Text="Confirmar" OnClientClick="return aprovacaoDelegacaoTarefa.validation.validarFormularioDiscussao();" OnClick="btnConfirmarDiscussao_Click" CssClass="btn btn-primary .btn-md" formnovalidate="formnovalidate" />
                            <asp:Button runat="server" ID="btnCancelarDiscussao"  Text="Cancelar" CssClass="btn btn-danger .btn-md" data-dismiss="modal" formnovalidate="formnovalidate" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnCarregarFormularioDiscussao" EventName="Click" />
    </Triggers>
</asp:UpdatePanel>
<asp:UpdatePanel ID="uppRecarregarDiscussao" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
    <ContentTemplate>
        <asp:Button runat="server" ID="btnCarregarFormularioDiscussao" OnClick="btnCarregarFormularioDiscussao_Click" Text="Carregar" Style="display: none" formnovalidate="formnovalidate" />
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript" src="/_layouts/15/PortalDeFluxos.NOTIF.SP/AprovacaoDelegacaoTarefa/JS/AprovacaoDelegacaoTarefaNOTIF.js?v=1.1"> </script>