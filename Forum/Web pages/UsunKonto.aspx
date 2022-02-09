<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UsunKonto.aspx.cs" Inherits="Forum.Web_pages.UsunKonto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <div class="col">
                <label id="txtResult" runat="server"></label>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-6">Podaj hasło:</label>
                <div class="col">
                    <asp:TextBox ID="txtPassword" class="form-control" runat="server"></asp:TextBox>
                    <asp:CustomValidator ID="tfvPassword" ControlToValidate="txtPassword" runat="server" OnServerValidate="tfvPassword_ServerValidate" ErrorMessage=""></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="tfvPasswordReq" ControlToValidate="txtPassword" runat="server" ErrorMessage="Pole wymagane!"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col">
                <asp:Button ID="btnDelete" class="btn-primary" runat="server" Text="Usuń konto" OnClick="btnDelete_Click"/>
                <asp:Button ID="btnCancel" class="btn-primary" runat="server" Text="Anuluj" OnClick="btnCancel_Click" CausesValidation="false"/>
            </div>
        </div>
        <div class="col-4"></div>
    </div>
    
    
<%--    
    <div class="form-group">
        <asp:Button ID="btnTestNHibernate" runat="server" Text="Test NHibernate" OnClick="btnTestNHibernate_Click" />
    </div>
--%>
</asp:Content>