<%@ Page Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DodajPost.aspx.cs" Inherits="Forum.Web_pages.DodajPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="contentBody" runat="server">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4">

            <div class="form-group">
                <label class="control-label col">Tytuł posta:</label>
                <div class="col">
                    <asp:TextBox ID="txtTitle" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTitle" ControlToValidate="txtTitle" runat="server" ErrorMessage="Pole wymagane!" />
                </div>
            </div>

            <div class="form-group">
                <label class="control-label col">Treść:</label>
                <div class="col">
                    <asp:TextBox ID="txtContents" TextMode="MultiLine" Rows="6" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvContents" ControlToValidate="txtContents" runat="server" ErrorMessage="Pole wymagane!" />
                </div>
            </div>

            <div class="col">
                <asp:Button ID="btnPrześlij" class="btn-primary" runat="server" Text="Opublikuj" OnClick="btnPrześlij_Click"/>
            </div>

            <asp:Label ID="testLabel" runat="server"></asp:Label>

        </div>
        <div class="col-4"></div>
    </div>
</asp:Content>