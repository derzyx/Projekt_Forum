using Forum.BusinesLogic.Api;
using Forum.BusinesLogic.Communication;
using Forum.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Web_pages
{
    public partial class ZarzadzajKontem : System.Web.UI.Page
    {
        public bool isEmailValid;
        public bool isPasswordVaild;
        public bool isUsernameValid;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("StronaGlowna.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                var api = new ForumApi();
                User userToUpdate = (User)Session["currentUser"];

                userToUpdate.Username = ctrlUserManageAccount.usernameField;
                userToUpdate.Email = ctrlUserManageAccount.emailField;
                userToUpdate.AccountDescription = ctrlUserManageAccount.accountDescField;

                userToUpdate.Password = (ctrlUserManageAccount.newPassword1Field != "") ? ctrlUserManageAccount.newPassword1Field : userToUpdate.Password;

                ServiceResponse response = api.UpdateUserData(userToUpdate);
                if (response.Succes) Session["currentUser"] = userToUpdate;
                txtResult.InnerText = response.Message;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("UsunKonto.aspx");
        }
    }
}