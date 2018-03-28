<%@ Assembly Name="PortalDeFluxos.NOTIF.SP, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9bc490e05e1d16a6" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucNOTIF.ascx.cs" Inherits="PortalDeFluxos.NOTIF.SP.ControlTemplates.PortalDeFluxos.NOTIF.SP.ucNOTIF" %>

<%--<link rel="Stylesheet" href="/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Style/NOTIF.main.css" type="text/css" />--%>

<div id="menuProposta" class="tab-pane fade in active">
	<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppmenuProposta">
		<ContentTemplate>
			<div class="row form-group-core">
				<div class="col-xs-12 col-sm-7 col-md-7">

					<div class="container-fluid">
						<div class="col-xs-12 col-sm-3 col-md-3">
							Mercado
						</div>
						<div class="col-xs-12 col-sm-3 col-md-3">
							<asp:DropDownList runat="server" ID="bd_Mercado" CssClass="form-control" type="DropDownList" required="" formnovalidate="formnovalidate" OnSelectedIndexChanged="bd_Mercado_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
						</div>
						<div class="col-xs-12 col-sm-2 col-md-2">
							IBM
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<div runat="server" class="col-xs-12 col-sm-9 col-md-9" id="divBuscarEstruturaComercial_IBM"></div>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12 col-sm-3 col-md-3">
							CNPJ
						</div>
						<div class="col-xs-12 col-sm-8 col-md-8">
							<asp:TextBox runat="server" ID="bd_Cnpj" CssClass="form-control" MaxLength="250" type="cnpj" required="" Enabled="false"></asp:TextBox>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-3 col-md-3">
							Razão Social
						</div>
						<div class="col-xs-12 col-sm-8 col-md-8">
							<asp:TextBox runat="server" ID="sp_RazaoSocial" CssClass="form-control" MaxLength="255" required="" Enabled="false"></asp:TextBox>
						</div>
					</div>
					<div class="row camposEspVarejo">
						<div class="col-xs-12 col-sm-3 col-md-3">
							Endereço
						</div>
						<div class="col-xs-12 col-sm-8 col-md-8">
							<asp:TextBox runat="server" ID="bd_Endereco" CssClass="form-control" MaxLength="255" required="" Enabled="false"></asp:TextBox>
						</div>
					</div>
					<div class="row camposEspVarejo">
						<div class="col-xs-12 col-sm-3 col-md-3">
							CEP
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<asp:TextBox runat="server" ID="bd_Cep" CssClass="form-control" MaxLength="255" required="" Enabled="false" type='Cep'></asp:TextBox>
						</div>
					</div>
					<div class="row camposEspVarejo">
						<div class="col-xs-12 col-sm-3 col-md-3">
							Bairro
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<asp:TextBox runat="server" ID="bd_Bairro" CssClass="form-control" MaxLength="255" required="" Enabled="false"></asp:TextBox>
						</div>
					</div>
					<div class="row camposEspVarejo">
						<div class="col-xs-12 col-sm-3 col-md-3">
							UF
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<asp:TextBox runat="server" ID="bd_UF" Enabled="false" CssClass="form-control" required="" MaxLength="250"></asp:TextBox>
						</div>
					</div>
					<div class="row camposEspVarejo">
						<div class="col-xs-12 col-sm-3 col-md-3">
							Cidade
						</div>
						<div class="col-xs-12 col-sm-4 col-md-4">
							<asp:TextBox runat="server" ID="bd_Cidade" Enabled="false" CssClass="form-control" required="" MaxLength="250"></asp:TextBox>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-5 col-md-5">

					<%--User control Estrutura Comercial--%>

					<div class="row">
						<asp:PlaceHolder runat="server" ID="plhEstruturaGt"></asp:PlaceHolder>
					</div>
					<div class="row">
						<asp:PlaceHolder runat="server" ID="plhEstruturaGr"></asp:PlaceHolder>
					</div>
					<div class="row">
						<asp:PlaceHolder runat="server" ID="plhEstruturaDiretor"></asp:PlaceHolder>
					</div>
					<div class="row">
						<asp:PlaceHolder runat="server" ID="plhEstruturaCdr"></asp:PlaceHolder>
					</div>
					<div class="row">
						<asp:PlaceHolder runat="server" ID="plhEstruturaGdr"></asp:PlaceHolder>
					</div>

					<%--User control Estrutura Comercial--%>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>

<div id="menuNotificacoes" class="tab-pane fade ">
	<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppmenuNotificacoes">
		<ContentTemplate>

			<div class="row form-group-core">

				<div class="col-xs-12 col-sm-4 col-md-4">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4">
							Nome do Contrato
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<asp:TextBox runat="server" ID="bd_NomeContrato" CssClass="form-control" MaxLength="255" required=""></asp:TextBox>
						</div>
					</div>

					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4">
							Número do Contrato
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<asp:TextBox runat="server" ID="bd_NumeroContrato" CssClass="form-control" MaxLength="255" required=""></asp:TextBox>
						</div>
					</div>

				</div>

				<div class="col-xs-12 col-sm-4 col-md-4">

					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 ">
							Tipo de Notificação
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<asp:DropDownList ID="bd_TipoNotificacao" CssClass="form-control" runat="server" type="DropDownList" required="" formnovalidate="formnovalidate"></asp:DropDownList>
						</div>
					</div>

					<div class="row campoTipoNotificacaoOutro">
						<div class="col-xs-12 col-sm-4 col-md-4 ">
							Outro
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<asp:TextBox runat="server" ID="bd_OutroTipoNotificacao" CssClass="form-control" MaxLength="255" required=""></asp:TextBox>
						</div>
					</div>
				</div>


				<div class="col-xs-12 col-sm-4 col-md-4">

					<div class="row" id="divStatusLoja" runat="server">
						<div class="col-xs-12 col-sm-4 col-md-4">
							Status da Loja
						</div>
						<div class="col-xs-12 col-sm-5 col-md-5">
							<asp:TextBox runat="server" ID="bd_StatusLoja" Enabled="false" CssClass="form-control" MaxLength="250"></asp:TextBox>
						</div>
					</div>

					<div class="row" id="divConsumo" runat="server">
						<div class="col-xs-12 col-sm-4 col-md-4">
							Consumo (m³/mês)
						</div>
						<div class="col-xs-12 col-sm-5 col-md-5">
							<asp:TextBox runat="server" ID="bd_Consumo" Enabled="false" CssClass="form-control numero decimal3" MaxLength="250"></asp:TextBox>
						</div>
					</div>

				</div>

			</div>

			<div class="row">
				<br>
				<div style="border-bottom-width: 1px; border-bottom-color: #ccc; border-bottom-style: solid; width: 95%; margin: 0 auto;">
					<strong>Nova Notificação</strong>
				</div>
				<br>
			</div>

			<div class="row form-group-core">

				<div class="col-xs-12 col-sm-10 col-md-10">
					<div class="row">
						<div class="col-xs-12 col-sm-2 col-md-2">
							Data Início Contrato
						</div>
						<div class="col-xs-12 col-sm-2 col-md-2">
							<div id="dtp_DataInicioContrato" class="input-group date">
								<asp:TextBox runat="server" ID="bd_DataInicioContrato" CssClass="form-control datepicker"></asp:TextBox>
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>
						</div>
						<div class="col-xs-12 col-sm-2 col-md-2">
							Data Fim Contrato
						</div>
						<div class="col-xs-12 col-sm-2 col-md-2">
							<div id="dtp_DataFimContrato" class="input-group date">
								<asp:TextBox runat="server" ID="bd_DataFimContrato" CssClass="form-control datepicker"></asp:TextBox>
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>
						</div>
						<div class="col-xs-12 col-sm-2 col-md-2">
							Data da Notificação
						</div>
						<div class="col-xs-12 col-sm-2 col-md-2">
							<div id="dtp_DataNotificacao" class="input-group date">
								<asp:TextBox runat="server" ID="bd_DataNotificacao" CssClass="form-control datepicker"></asp:TextBox>
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>		
				<div class="row" style="margin-left: 0px; margin-right: 0px;">
					<div class="col-xs-12 col-sm-12 col-md-12">
						Observação					
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<asp:TextBox runat="server" ID="bd_Observacao" CssClass="form-control" Rows="5" TextMode="MultiLine"></asp:TextBox>
					</div>
				</div>
				<div class="col-xs-12 col-md-offset-10 col-sm-offset-10 col-sm-2 col-md-2" style="margin-top: 5px;">
					<div class="col-xs-12 col-sm-4 col-md-4">
						<asp:Button runat="server" ID="btnIncluirNoficacao" OnClientClick="return notif.dadosNotificacao.isValid();" OnClick="btnIncluirNoficacao_Click" Text="Incluir Notificação" CssClass="btn btn-primary .btn-md" />
					</div>
				</div>
			</div>

			<div class="row form-group-core">
				<div class="col-xs-12- col-sm-12 col-md-12" style="margin-top: 30px;">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12" style="height: 30px; border-bottom-color: rgb(204, 204, 204); border-bottom-width: 1px; border-bottom-style: solid;">
							<strong>Gerenciar Notificações</strong>
						</div>
					</div>
				</div>
				<div class="col-xs-12- col-sm-12 col-md-12" style="margin-top: 3px;">
					<asp:GridView ID="grvNotificacoes" runat="server" AutoGenerateColumns="false" Width="100%"
						CellPadding="4" CellSpacing="1" Font-Size="13px" ForeColor="#333333" GridLines="None" OnRowCommand="grvNotificacoes_RowCommand"
						OnRowDataBound="grvNotificacoes_RowDataBound" ShowFooter="true" CssClass="gridview-core"
						EmptyDataText="Não há notificações cadastradas.">
						<Columns>
							<asp:TemplateField HeaderText="#" ItemStyle-CssClass="gridview-column-row" HeaderStyle-CssClass="gridview-column-header gridview-column-header-border-left" ItemStyle-Width="1%" HeaderStyle-Width="1%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<%# Eval("NumeroNotificacao")%>
								</ItemTemplate>
								<EditItemTemplate>
									<%# Eval("NumeroNotificacao")%>
								</EditItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Data início Contrato" ItemStyle-CssClass="gridview-column-row" HeaderStyle-CssClass="gridview-column-header" ItemStyle-Width="10%" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<%# Eval("DataInicioContrato", "{0:dd/MM/yyyy}")%>
								</ItemTemplate>
								<EditItemTemplate>
									<div id="grid_dtp_DataInicioContrato" class="input-group date">
										<asp:TextBox runat="server" ID="grid_bd_DataInicioContrato" Enabled="true" CssClass="form-control datepicker" Text='<%# Eval("DataInicioContrato")%>'></asp:TextBox>
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-calendar"></i>
										</span>
									</div>
								</EditItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Data Fim Contrato" ItemStyle-CssClass="gridview-column-row" HeaderStyle-CssClass="gridview-column-header" ItemStyle-Width="10%" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<%# Eval("DataFimContrato", "{0:dd/MM/yyyy}")%>
								</ItemTemplate>
								<EditItemTemplate>
									<div id="grid_dtp_DataFimContrato" class="input-group date">
										<asp:TextBox runat="server" ID="grid_bd_DataFimContrato" Enabled="true" CssClass="form-control datepicker" Text='<%# Eval("DataFimContrato")%>'></asp:TextBox>
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-calendar"></i>
										</span>
									</div>
								</EditItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Data da Notificação" ItemStyle-CssClass="gridview-column-row" HeaderStyle-CssClass="gridview-column-header" ItemStyle-Width="10%" HeaderStyle-Width="10%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<%# Eval("DataNotificacao", "{0:dd/MM/yyyy}")%>
								</ItemTemplate>
								<EditItemTemplate>
									<div id="grid_dtp_DataNotificacao" class="input-group date">
										<asp:TextBox runat="server" ID="grid_bd_DataNotificacao" Enabled="true" CssClass="form-control datepicker" Text='<%# Eval("DataNotificacao")%>'>></asp:TextBox>
										<span class="input-group-addon">
											<i class="glyphicon glyphicon-calendar"></i>
										</span>
									</div>
								</EditItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Observação" ItemStyle-CssClass="gridview-column-row" HeaderStyle-CssClass="gridview-column-header" ItemStyle-Width="40%" HeaderStyle-Width="25%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<div style="white-space: pre"><%# Eval("Observacao")%></div>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:TextBox ID="grid_bd_Observacao" runat="server" CssClass="form-control" Rows="3" TextMode="MultiLine" Text='<%# Eval("Observacao")%>'></asp:TextBox>
								</EditItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Status" ItemStyle-CssClass="gridview-column-row" HeaderStyle-CssClass="gridview-column-header" ItemStyle-Width="9%" HeaderStyle-Width="9%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<%# Eval("Status")%>
								</ItemTemplate>
								<EditItemTemplate>
									<%# Eval("Status")%>
								</EditItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField HeaderText="Ativa" ItemStyle-CssClass="gridview-column-row" HeaderStyle-CssClass="gridview-column-header" ItemStyle-Width="3%" HeaderStyle-Width="3%" HeaderStyle-HorizontalAlign="Left" HeaderStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<asp:RadioButton ID="grid_bd_NotifAtiva" runat="server" Checked='<%#(Eval("NotifAtiva") == null ? false : Eval("NotifAtiva"))%>' Enabled="false"></asp:RadioButton>
								</ItemTemplate>
								<EditItemTemplate>
									<asp:RadioButton ID="grid_bd_NotifAtiva" runat="server"></asp:RadioButton>
								</EditItemTemplate>
							</asp:TemplateField>
							<asp:TemplateField ItemStyle-Width="5%" HeaderStyle-Width="5%" HeaderStyle-CssClass="gridview-column-header-border-right" FooterStyle-Width="5%" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
								<ItemTemplate>
									<asp:ImageButton ID="grvEditarItem" runat="server" CommandName="Editar" ToolTip="Editar Notificação" CommandArgument='<%# Eval("NumeroNotificacao")%>' ImageUrl="/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/edit.png" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="grvCancelarItem" runat="server" CommandName="Cancelar" ToolTip="Cancelar Notificação" CommandArgument='<%# Eval("NumeroNotificacao")%>' ImageUrl="/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/remove.gif" />
								</ItemTemplate>
								<EditItemTemplate>
									<asp:ImageButton ID="grvSalvarItem" runat="server" CommandName="Salvar" ToolTip="Salvar Edição" CommandArgument='<%# Eval("NumeroNotificacao")%>' ImageUrl="/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/save.png" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:ImageButton ID="grvCancelarEdicao" runat="server" CommandName="CancelarEdicao" ToolTip="Cancelar Edição" CommandArgument='<%# Eval("NumeroNotificacao")%>' ImageUrl="/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/Img/cancel.png" />
								</EditItemTemplate>
							</asp:TemplateField>
						</Columns>
						<RowStyle BackColor="#F1F1F1" ForeColor="Black" Font-Size="12px" />
						<EditRowStyle BackColor="#cccccc" />
						<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
						<PagerStyle BackColor="#FFFFFF" ForeColor="Black" HorizontalAlign="Center" Font-Size="12px" />
						<HeaderStyle BackColor="#337ab7" ForeColor="White" Font-Size="12px" />
						<AlternatingRowStyle BackColor="White" ForeColor="Black" />
						<FooterStyle BackColor="#337AB7" Font-Bold="false" Height="3px" Font-Size="3px" ForeColor="White" CssClass="gridview-column-footer" />
					</asp:GridView>
				</div>

			</div>

		</ContentTemplate>
	</asp:UpdatePanel>
</div>

<div id="menuEmissoes" class="tab-pane fade ">
	<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppmenuEmissoes">
		<ContentTemplate>
			<div class="row form-group-core">
				<div class="col-xs-12- col-sm-12 col-md-12">
					<asp:GridView ID="grvEmissoes" runat="server" AutoGenerateColumns="false" Width="100%"
						CellPadding="4" CellSpacing="1" Font-Size="13px" ForeColor="#333333" GridLines="None"
						OnRowDataBound="grvEmissoes_RowDataBound" CssClass="gridview-core" ShowHeader="false"
						EmptyDataText="Não há Notificações cadastradas.">
						<Columns>
							<asp:TemplateField HeaderText="" ShowHeader="false" ItemStyle-Width="100%">
								<ItemTemplate>
									<asp:Panel ID="grv_Panel" runat="server">
										<div class="row">
											<div class="col-xs-12 col-sm-2 col-md-2">
												Aprovação GR/DV?
											</div>
											<div class="col-xs-12- col-sm-2 col-md-2">
												<asp:CheckBox runat="server" ID="grv_bd_AprovacaoGRDV" Checked='<%#(Eval("AprovacaoGRDV") == null ? true : Eval("AprovacaoGRDV"))%>' />
											</div>
											<div class="col-xs-12 col-sm-2 col-md-2">
											</div>
											<div class="col-xs-12 col-sm-2 col-md-2">
												Grau de Notificação
											</div>
											<div class="col-xs-12- col-sm-2 col-md-2">
												<asp:DropDownList runat="server" ID="grv_bd_GrauNotificacao" CssClass="form-control"></asp:DropDownList>
											</div>
										</div>
										<div class="row" style="padding-bottom: 10px !important">
											<div class="col-xs-12 col-sm-2 col-md-2">
												Envolvimento Planejamento?
											</div>
											<div class="col-xs-12- col-sm-2 col-md-2">
												<asp:CheckBox runat="server" ID="grv_bd_EnvolvimentoPlanejamento" Enabled="false" Checked='<%#(Eval("EnvolvimentoPlanejamento") == null ? false : Eval("EnvolvimentoPlanejamento"))%>' />
											</div>
											<div class="col-xs-12 col-sm-2 col-md-2">
											</div>
											<div class="col-xs-12 col-sm-2 col-md-2">
												Forma de Envio
											</div>
											<div class="col-xs-12- col-sm-2 col-md-2">
												<asp:TextBox runat="server" ID="grv_bd_FormaEnvio" CssClass="form-control" MaxLength="255" Text='<%# Eval("FormaEnvio")%>'></asp:TextBox>
											</div>
										</div>
										<div class="row" style="padding-bottom: 10px !important">
											<div class="col-xs-12 col-sm-2 col-md-2">
												Notificação Padrão?
											</div>
											<div class="col-xs-12- col-sm-2 col-md-2">
												<asp:CheckBox runat="server" ID="grv_bd_NotificacaoPadrao" Enabled="false" Checked='<%#(Eval("NotificacaoPadrao") == null ? false : Eval("EnvolvimentoPlanejamento"))%>' />
											</div>
										</div>
										<asp:HiddenField runat="server" ID="grv_NumeroNotificacao" Value='<%# Eval("NumeroNotificacao")%>' />
									</asp:Panel>
								</ItemTemplate>
							</asp:TemplateField>
						</Columns>
					</asp:GridView>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>

<div id="menuJuridico" class="tab-pane fade">
	<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppmenuJuridico">
		<ContentTemplate>
			<div class="row form-group-core">

				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 ">
							Fases Judicialização
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<asp:DropDownList ID="bd_Juridico_FasesJudicializacao" CssClass="form-control" runat="server" type="DropDownList"></asp:DropDownList>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 ">
							Tipo de Ação Judicial
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<asp:DropDownList ID="bd_Juridico_TipoAcaoJudicial" CssClass="form-control" runat="server" type="DropDownList"></asp:DropDownList>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 ">
							Data da Ação
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div id="dtp_Juridico_DataAcao" class="input-group date">
								<asp:TextBox runat="server" ID="bd_Juridico_DataAcao" CssClass="form-control datepicker"></asp:TextBox>
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>

				<div class="row" style="margin-left: 0px; margin-right: 0px;">
					<div class="col-xs-12 col-sm-12 col-md-12">
						Observação					
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<asp:TextBox runat="server" ID="bd_Juridico_Observacao" CssClass="form-control" Rows="5" TextMode="MultiLine"></asp:TextBox>
					</div>
				</div>

			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>

<div id="menuRelacoesSetoriais" class="tab-pane fade">
	<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppmenuRelacoesSetoriais">
		<ContentTemplate>
			<div class="row form-group-core">

				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 ">
							Fase Denúncia
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<asp:TextBox runat="server" ID="bd_RelacoesSetoriais_FaseDenuncia" CssClass="form-control" MaxLength="255"></asp:TextBox>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 ">
							Orgão Denúncia
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<asp:TextBox runat="server" ID="bd_RelacoesSetoriais_OrgaoDenuncia" CssClass="form-control" MaxLength="255"></asp:TextBox>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 ">
							Data
						</div>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<div id="dtp_RelacoesSetoriais_DataAcao" class="input-group date">
								<asp:TextBox runat="server" ID="bd_RelacoesSetoriais_Data" CssClass="form-control datepicker"></asp:TextBox>
								<span class="input-group-addon">
									<i class="glyphicon glyphicon-calendar"></i>
								</span>
							</div>
						</div>
					</div>
				</div>

				<div class="row" style="margin-left: 0px; margin-right: 0px;">
					<div class="col-xs-12 col-sm-12 col-md-12">
						Observação					
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12">
						<asp:TextBox runat="server" ID="bd_RelacoesSetoriais_Observacao" CssClass="form-control" Rows="5" TextMode="MultiLine"></asp:TextBox>
					</div>
				</div>

			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>

<div id="menuObservacoes" class="tab-pane fade ">
	<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" ID="uppmenuObservacoes">
		<ContentTemplate>
			<div class="row form-group-core">
				<div class="col-xs-12 col-sm-6 col-md-6" style="width: 100%">

					<div class="row">
						<div class="col-sm-2 col-md-2">
							<span>Comentários</span>
						</div>
					</div>

					<div class="row">
						<div class="col-sm-12 col-md-12">
							<asp:TextBox runat="server" ID="bd_Observacoes_Comentarios" CssClass="form-control" MaxLength="5000" Rows="4" TextMode="MultiLine"></asp:TextBox>
						</div>
					</div>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>

<div id="menuAnexo" class="tab-pane fade">
	<div class="form-group">
		<asp:PlaceHolder runat="server" ID="phUcAnexos"></asp:PlaceHolder>
	</div>
</div>

<div class="row form-group form-group-button">
	<asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="uppFormularioBtn">
		<ContentTemplate>
			<div class="col-xs-6 col-sm-offset-0 col-md-offset-0">
				<asp:Button runat="server" ID="btnAnexoPorEmail" OnClick="btnAnexoPorEmail_Click" Text="Anexo por E-mail" CssClass="btn btn-warning .btn-md" formnovalidate="formnovalidate" />
			</div>
			<div class="col-xs-6" style="text-align: right;">
				<asp:Button runat="server" ID="btnReiniciarFluxo" OnClick="btnReiniciarFluxo_Click" Text="Reiniciar o fluxo" CssClass="btn btn-primary .btn-md" Title="Só pode ser usado em casos de aprovação parada por erro." />
				<asp:Button runat="server" ID="btnFinalizarAcompanhamento" OnClick="btnFinalizarAcompanhamento_Click" Text="Finalizar Acompanhamento" CssClass="btn btn-primary .btn-md" Title="Finalizará o fluxo em andamento e " />
				<asp:Button runat="server" ID="btnIniciar" OnClick="btnSalvarIniciar_Click" OnClientClick="return raizenForm.events.submitForm();" Text="Enviar para aprovação" CssClass="btn btn-primary .btn-md btnIniciarFluxo" />
				<asp:Button runat="server" ID="btnSalvar" OnClick="btnSalvar_Click" Text="Salvar" CssClass="btn btn-primary .btn-md" formnovalidate="formnovalidate" />
				<asp:Button runat="server" ID="btnCancelar" OnClick="btnCancelar_Click" Text="Sair" CssClass="btn btn-danger .btn-md" formnovalidate="formnovalidate" />
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</div>

<script type="text/javascript" src="/_layouts/15/PortalDeFluxos.NOTIF.SP/NOTIF/JS/notif.main.js?v=1.2"></script>
