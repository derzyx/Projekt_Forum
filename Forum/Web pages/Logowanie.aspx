<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="Logowanie.aspx.cs" Inherits="Forum.Web_pages.Logowanie" %>

<%@ Register Src="~/Controls/UserLoginControl.ascx" TagPrefix="userAccount" TagName="LoginUserControl" %>



<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">
            <userAccount:LoginUserControl runat="server" ID="ctrlLoginUser" />
            <asp:Label ID="txtWarning" runat="server" Text=""></asp:Label>
            <div class="col">
                <asp:Button ID="btnLogin" class="btn-primary" runat="server" Text="Zaloguj" OnClick="btnLogin_Click"/>
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