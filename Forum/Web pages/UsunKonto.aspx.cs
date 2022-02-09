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
    public partial class UsunKonto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("StronaGlowna.aspx");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                if (Session["currentUser"] != null)
                {
                    var api = new ForumApi();
                    ServiceResponse response = api.DeleteUserAccount((User)Session["currentUser"]);
                    if (response.Succes)
                    {
                        Session["currentUser"] = null;
                        Response.Redirect("StronaGlowna.aspx");
                    }
                    else
                    {
                        txtResult.InnerText = response.Message;
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ZarzadzajKontem.aspx");
        }

        protected void tfvPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var api = new ForumApi();
            User currentUser = (User)Session["currentUser"];
            args.IsValid = api.LoginUser(currentUser.Username, args.Value);
            if (!args.IsValid) tfvPassword.ErrorMessage = "Hasło nieprawidłowe!";
        }
    }
}