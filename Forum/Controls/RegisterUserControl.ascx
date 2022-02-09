<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegisterUserControl.ascx.cs" Inherits="Forum.Controls.RegisterUserControl" %>

<div class="form-group">
    <label class="control-label col-sm-2">Username:</label>
    <div class="col">
        <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
        <asp:CustomValidator ID="tfvUsername" ControlToValidate="txtUsername" OnServerValidate="tfvUsername_ServerValidate" runat="server" ErrorMessage="Pole wymagane!" />
        <asp:RequiredFieldValidator ID="rfvUsername" ControlToValidate="txtUsername" ErrorMessage="Pole wymagane" runat="server"/>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2">Password:</label>
    <div class="col">
        <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CustomValidator ID="tfvPassword" ControlToValidate="txtPassword" OnServerValidate="tfvPassword_ServerValidate" runat="server" ErrorMessage="" />
        <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" ErrorMessage="Pole wymagane" runat="server"/>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2">Email:</label>
    <div class="col">
        <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
        <asp:CustomValidator ID="tfvEmail" ControlToValidate="txtEmail" OnServerValidate="tfvEmail_ServerValidate" runat="server" ErrorMessage="Nieprawidłowy adres email!" />
        <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail" ErrorMessage="Pole wymagane" runat="server"/>
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-2">AccountDescription:</label>
    <div class="col">
        <asp:TextBox ID="txtAccountDesc" TextMode="MultiLine" Rows="6" class="form-control" runat="server"></asp:TextBox>
    </div>
</div>

