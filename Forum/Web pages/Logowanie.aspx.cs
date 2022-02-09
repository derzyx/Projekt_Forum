using Forum.BusinesLogic.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Web_pages
{
    public partial class Logowanie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var api = new ForumApi();
            if(api.LoginUser(ctrlLoginUser.username, ctrlLoginUser.password))
            {
                var currentUser = api.GetUser(ctrlLoginUser.username);
                Session["currentUser"] = currentUser;
                Response.Redirect("StronaGlowna.aspx");
            }
            else
            {
                txtWarning.Text = "Nieprawidłowe hasło lub nazwa użytkownika";
            }
        }
    }
}