<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StronaPostu.aspx.cs" Inherits="Forum.Web_pages.StronaPostu" Title="Post" %>

<%@ Register  TagPrefix="post" TagName="Answer" Src="~/Controls/AnswerControl.ascx"%>


<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <asp:Literal ID="pageTitle" Text="" runat="server"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        .post-container{
            margin: 20px;
            background-color: blanchedalmond;
        }
        .info-container{
            font-size: 1.6vh;
        }
        .contents-container{
            padding: 10px 0 0 0;
            font-size:2vh;
        }
        .asp-button{
            margin:0;
            padding:0;
        }
        .date{
            text-align: right;
        }
        .btnAuthor{
            font-family:Verdana;
            border-style:none;
            background-color:transparent;
        }
        .addAnswer-container{
            margin: 20px 0 20px 0;
        }
        textarea{
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
        <div class="col-2"></div>
        <div class="col-8">
            <div class="container post-container" style="padding:30px;">
                <div class="row info-container">
                    <div class="col-6">
                        <asp:Button ID="btnAuthor" class="asp-button btn-author" runat="server" Text="Button" BackColor="Transparent" BorderStyle="None" OnClick="btnAuthor_Click" />
                    </div>
                    <div class="col-6 date">
                        <asp:Label ID="txtDate" runat="server" Text="Data"></asp:Label>
                    </div>
                </div>
                <div class="row align-items-center">
                    <div class="col-12">
                        <h2 id="txtTitle" runat="server">
                            To jest temat tego postu
                        </h2>
                    </div>
                </div>
                <div class="row contents-container">
                    <div class="col-12" id="txtContents" runat="server">
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
                    </div>
                </div>
            </div>
            
            <div class="container">
                <div class="row">
                    <div class="col">
                        <asp:Label ID="lblAnswers" runat="server" Text="Odpowiedzi:"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="container addAnswer-container">
                <div class="row">
                    <div class="col">
                        <asp:TextBox ID="txtAnswerContents" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <asp:Button ID="btnAddAnswer" runat="server" Text="Dodaj komentarz" OnClick="btnAddAnswer_Click" />
                    </div>
                </div>
            </div>

            <div class="container">
<%--                <post:Answer runat="server" id="Answer" />--%>
                <asp:PlaceHolder ID="AnswersPlaceholder" runat="server" />
            </div>
        </div>
        <div class="col-2"></div>
    </div>
    
    
<%--    
    <div class="form-group">
        <asp:Button ID="btnTestNHibernate" runat="server" Text="Test NHibernate" OnClick="btnTestNHibernate_Click" />
    </div>
--%>
</asp:Content>