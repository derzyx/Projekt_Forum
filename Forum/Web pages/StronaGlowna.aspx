<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StronaGlowna.aspx.cs" Inherits="Forum.Web_pages.StronaGlowna1" %>
<%@ Register  TagPrefix="post" TagName="PostPreview" Src="~/Controls/PostPreview.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        #linkPostName{
            color: black;
        }
        #linkPostName:hover{
            color: gray;
            text-decoration: none;
        }
        .description{
            padding:0 30px;
            background-color:lightblue;
            font-weight: bold;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <div class="row align-items-center description">
                <div class="col-8">Temat</div>
                <div class="col-2" style="text-align:center;">Liczba odpowiedzi</div>
                <div class="col-2">Autor i Data</div>
            </div>
            <asp:PlaceHolder ID="ControlPlaceholder" runat="server" />
               
            <div class="row justify-content-center">
                <asp:PlaceHolder ID="ButtonsPlaceholder" runat="server" />
            </div>
        </div>
        <div class="col-2"></div>
    </div>
</asp:Content>