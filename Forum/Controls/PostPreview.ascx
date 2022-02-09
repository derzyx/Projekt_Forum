<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostPreview.ascx.cs" Inherits="Forum.Controls.PostPreview"%>

<div class="row align-items-center post-preview">
    <div class="col-8">
        <h2>
            <asp:Button type="none" ID="btnPostTitle" runat="server" Text="Button"  BorderStyle="None" BackColor="Transparent" />
        </h2>

    </div>
    <div class="col-2" style="text-align:center;">
        <b id="txtAnswersCount" runat="server">
            
        </b>
    </div>
    <div class="col-2">
        <b id="txtAuthor" runat="server">
            
        </b>
        <div id="txtDate" runat="server">

        </div>
    </div>
</div>
