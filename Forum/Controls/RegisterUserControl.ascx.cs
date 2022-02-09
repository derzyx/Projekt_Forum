using Forum.BusinesLogic.Api;
using Forum.BusinesLogic.Communication;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Controls
{
    public partial class RegisterUserControl : System.Web.UI.UserControl
    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        #region Properties

        public string Username => txtUsername.Text;
        public string Password => txtPassword.Text;
        public string Email => txtEmail.Text;
        public string AccountDesc => txtAccountDesc.Text;


        public bool isEmailValid;
        public bool isPasswordVaild;
        public bool isUsernameValid;

        #endregion


        protected void tfvEmail_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var api = new ForumApi();
            ServiceResponse response = api.Validate_Email(args.Value);

            if (response.Succes)
            {
                isEmailValid = true;
                args.IsValid = isEmailValid;
            }
            else
            {
                isEmailValid = false;
                args.IsValid = isEmailValid;
                tfvEmail.ErrorMessage = response.Message;
            }
        }

        protected void tfvPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var api = new ForumApi();
            ServiceResponse response = api.Validate_Password(args.Value);

            if(response.Succes)
            {
                isPasswordVaild = true;
                args.IsValid = isPasswordVaild;
            }
            else
            {
                isPasswordVaild = false;
                args.IsValid = isPasswordVaild;
                tfvPassword.ErrorMessage = response.Message;
            }
            
        }

        protected void tfvUsername_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var api = new ForumApi();
            ServiceResponse response = api.ValidateUsername(args.Value);
            if (response.Succes)
            {
                isUsernameValid = true;
                args.IsValid = isUsernameValid;  
            }
            else
            {
                isUsernameValid = false;
                args.IsValid = isUsernameValid;
                tfvUsername.ErrorMessage = response.Message;
            }
        }
    }
}