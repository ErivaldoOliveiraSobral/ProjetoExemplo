<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="CustomControls" Namespace="PortalDeFluxos.Core.SP.Core.BaseControls" Assembly="PortalDeFluxos.NOTIF.SP, Version=1.0.0.0, Culture=neutral, PublicKeyToken=9bc490e05e1d16a6" %>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucRelatorio.ascx.cs" Inherits="PortalDeFluxos.NOTIF.SP.ControlTemplates.PortalDeFluxos.NOTIF.SP.ucRelatorio" %>



<div class="col-md-offset-1 col-sm-10 col-md-10" style="height: 200px">
	<div class="form-group-core">
		<asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
			<ContentTemplate>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12" style="height: 30px; border-bottom-color: rgb(204, 204, 204); border-bottom-width: 1px; border-bottom-style: solid;">
						<strong>Relatório de Notificações</strong>
					</div>
				</div>
				<div class="row col-md-12">
					<div class="col-xs-12 col-sm-1 col-md-1">
						Início
					</div>
					<div class="col-xs-12 col-sm-2 col-md-2">
						<div id="dtp_txtInicio" class="input-group date">
							<asp:TextBox ID="txtInicio" runat="server" Class="form-control datepicker"></asp:TextBox>
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
					</div>
					<div class="col-xs-12 col-sm-1 col-md-1">
						Fim:
					</div>
					<div class="col-xs-12 col-sm-2 col-md-2">
						<div id="dtp_txtFim" class="input-group date">
							<asp:TextBox ID="txtFim" runat="server" Class="form-control datepicker"></asp:TextBox>
							<span class="input-group-addon">
								<i class="glyphicon glyphicon-calendar"></i>
							</span>
						</div>
					</div>
					<div class="col-xs-12 col-sm-1 col-md-1">
						Status
					</div>
					<div class="col-xs-12 col-sm-3 col-md-3">
						<asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control"></asp:DropDownList>
					</div>
					<div class="col-xs-12 col-sm-2 col-md-2">
						<asp:Button runat="server" ID="btnExtrairRelatorio" OnClick="btnExtrairRelatorio_Click" Text="Extrair Relatório" CssClass="btn btn-primary .btn-md" formnovalidate="formnovalidate" />
					</div>
				</div>
				<div class="row col-md-12">
				</div>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</div>
