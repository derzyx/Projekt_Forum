using Forum.BusinesLogic.Api;
using Forum.BusinesLogic.Communication;
using Forum.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Controls
{
    public partial class UserManageAccountControl : System.Web.UI.UserControl
    {

        public string usernameField => txtUsername.Text;
        public string emailField => txtEmail.Text;
        public string accountDescField => txtAccountDesc.Text;
        public string oldPasswordField => txtOldPassword.Text;
        public string newPassword1Field => txtNewPassword1.Text;
        public string newPassword2Field => txtNewPassword2.Text;


        public CustomValidator tfvUsernameField => tfvUsername;
        public CustomValidator tfvEmailField => tfvEmail;
        public CustomValidator tfvOldPassField => tfvOldPass;


        public bool isEmailValid;
        public bool isPasswordVaild;
        public bool isUsernameValid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var api = new ForumApi();
                User currentUser = (User)Session["currentUser"];
                txtUsername.Text = currentUser.Username;
                txtEmail.Text = currentUser.Email;
                txtAccountDesc.Text = currentUser.AccountDescription;
            }
        }

        protected void tfvUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var api = new ForumApi();
            User currentUser = (User)Session["currentUser"];

            if (args.Value == currentUser.Username)
            {
                isUsernameValid = true;
                args.IsValid = isUsernameValid;
            }
            else
            {
                ServiceResponse response = api.ValidateUsername(args.Value);
                isUsernameValid = response.Succes;
                args.IsValid = isUsernameValid;
                tfvUsername.ErrorMessage = response.Message;
            }
        }

        protected void tfvEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var api = new ForumApi();
            User currentUser = (User)Session["currentUser"];

            if (args.Value == currentUser.Email)
            {
                isEmailValid = true;
                args.IsValid = isEmailValid;
            }
            else
            {
                ServiceResponse response = api.Validate_Email(args.Value);
                isEmailValid = response.Succes;
                args.IsValid = isEmailValid;
                tfvEmail.ErrorMessage = response.Message;
            }
        }

        protected void tfvOldPass_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var api = new ForumApi();
            User currentUser = (User)Session["currentUser"];
            ServiceResponse response = api.Validate_ChangePassword(currentUser.Username, oldPasswordField, newPassword1Field, newPassword2Field);

            isPasswordVaild = response.Succes;
            args.IsValid = isPasswordVaild;
            tfvOldPass.ErrorMessage = response.Message;
        }
    }
}