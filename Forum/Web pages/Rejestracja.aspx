<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Rejestracja.aspx.cs" Inherits="Forum.Web_pages.Rejestracja" %>
<%@ Register TagPrefix="userAccount" TagName="RegisterUserControl" Src="~/Controls/RegisterUserControl.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <userAccount:RegisterUserControl ID="ctrlRegisterUser" runat="server" />
            <div class="col">
                <asp:Button ID="btnRegister" class="btn-primary" runat="server" Text="Zapisz" OnClick="btnRegister_Click"/>
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