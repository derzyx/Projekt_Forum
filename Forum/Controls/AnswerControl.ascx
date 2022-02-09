<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AnswerControl.ascx.cs" Inherits="Forum.Controls.AnswerControl" %>

<style>
    .answer-block{
        margin: 20px 0 20px 0;
        padding: 30px;
        background-color:lightgray;
    }
</style>

<div class="container answer-block">
    <div class="row info-container" >
        <div class="col-6">
            <asp:Button ID="btnAuthor" CssClass="btnAuthor asp-button" runat="server" Text="Author" OnClick="btnAuthor_Click"/>
        </div>
        <div class="col-6 date">
            <asp:Label ID="lblDate" runat="server" Text="2022-02-01 14:02:54"></asp:Label>
        </div>
    </div>

    <div class="row">
        <div class="col">
            <div id="txtAnswer" class="contents-container" runat="server">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
            </div>
        </div>
    </div>
</div>

