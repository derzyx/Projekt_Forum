<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserManageAccountControl.ascx.cs" Inherits="Forum.Controls.UserManageAccountControl" %>

<label class="control-label col-sm-6"><b>Dane o koncie</b></label>
<br />

<div class="form-group">
    <label class="control-label col-sm-6">Nazwa użytkownika:</label>
    <div class="col">
        <asp:TextBox ID="txtUsername" class="form-control" runat="server"></asp:TextBox>
        <asp:CustomValidator ID="tfvUsername" ControlToValidate="txtUsername" OnServerValidate="tfvUsername_ServerValidate" runat="server" ErrorMessage="" />
        <asp:RequiredFieldValidator ID="tfvUsernameReq" ControlToValidate="txtUsername" runat="server" ErrorMessage="Pole wymagane!" />
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-6">Email:</label>
    <div class="col">
        <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
        <asp:CustomValidator ID="tfvEmail" ControlToValidate="txtEmail" OnServerValidate="tfvEmail_ServerValidate" runat="server" ErrorMessage="" />
        <asp:RequiredFieldValidator ID="tfvEmailReq" ControlToValidate="txtEmail" runat="server" ErrorMessage="Pole wymagane!" />
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-6">Opis:</label>
    <div class="col">
        <asp:TextBox ID="txtAccountDesc" TextMode="MultiLine" Rows="6" class="form-control" runat="server"></asp:TextBox>
    </div>
</div>

<label class="control-label col-sm-6"><b>Zmień hasło</b></label>
<label class="control-label col-sm-6">Aby zmienić hasło wypełnij wszystkie pola poniżej:</label>
<br />

<div class="form-group">

    <label class="control-label col-sm-6">Stare hasło:</label>
    <div class="col">
        <asp:TextBox ID="txtOldPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
        <asp:CustomValidator ID="tfvOldPass" ControlToValidate="txtOldPassword" OnServerValidate="tfvOldPass_ServerValidate" runat="server" ErrorMessage="" />
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-6">Nowe hasło:</label>
    <div class="col">
        <asp:TextBox ID="txtNewPassword1" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
        
    </div>
</div>

<div class="form-group">
    <label class="control-label col-sm-6">Powtórz hasło:</label>
    <div class="col">
        <asp:TextBox ID="txtNewPassword2" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
        
    </div>
</div>

