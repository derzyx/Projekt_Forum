<%@ Page Language="C#" MasterPageFile="~/Layout.Master"  AutoEventWireup="true" CodeBehind="StronaUzytkownika.aspx.cs" Inherits="Forum.Web_pages.StronaUzytkownika" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .desc-container{
            margin: 20px 0 20px 0;
            padding: 20px;
            background-color:lightblue;
        }
        .username-container{
            padding: 20px;
            background-color:lightblue;
        }
        #txtDescription{
            font-weight:bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <div id="usernameContainer" class="username-container">
                <asp:Label ID="lblUsername" runat="server" Text="Użytwkownik:"></asp:Label>
                <h2 id="txtUsername" runat="server">

                </h2>
            </div>

            <div id="descriptionContainer" class="desc-container">
                <asp:Label ID="lblDesc" runat="server" Text="Opis:"></asp:Label>
                <div id="txtDescription" runat="server">

                </div>
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</asp:Content>