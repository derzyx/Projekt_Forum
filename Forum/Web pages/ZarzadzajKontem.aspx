<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ZarzadzajKontem.aspx.cs" Inherits="Forum.Web_pages.ZarzadzajKontem" %>
<%@ Register Src="~/Controls/UserManageAccountControl.ascx" TagPrefix="userAccount" TagName="UserManageAccountControl"  %>


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
            <userAccount:UserManageAccountControl runat="server" ID="ctrlUserManageAccount" />
            

            <div class="col">
                <asp:Button ID="btnSave" class="btn-primary" runat="server" Text="Zapisz" OnClick="btnSave_Click" />
            </div>

            <div class="col">
                <asp:Button ID="btnDelete" class="btn-primary" runat="server" Text="Usuń konto" OnClick="btnDelete_Click" />
            </div>
            
        </div>
        <div class="col-4"></div>
    </div>
    
</asp:Content>