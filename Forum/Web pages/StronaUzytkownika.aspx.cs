using Forum.BusinesLogic.Api;
using Forum.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Web_pages
{
    public partial class StronaUzytkownika : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string user = Request.QueryString["User"];

            if(user == null)
            {
                Response.Redirect("StronaGlowna.aspx");
            }

            if (!IsPostBack)
            {
                ForumApi api = new ForumApi();
                User userProfile = api.GetUser(user);

                txtUsername.InnerText = userProfile.Username;
                txtDescription.InnerText = userProfile.AccountDescription;
            }
        }
    }
}