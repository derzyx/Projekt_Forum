<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserLoginControl.ascx.cs" Inherits="Forum.Controls.UserLoginControl" %>

<div class="form-group">
    <label class="control-label col-sm-2">Username:</label>
    <div class="col">
        <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvUsername" ControlToValidate="txtUsername" ErrorMessage="Pole wymagane" runat="server"></asp:RequiredFieldValidator>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2">Password:</label>
    <div class="col">
        <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" ErrorMessage="Pole wymagane" runat="server"></asp:RequiredFieldValidator>
    </div>
</div>