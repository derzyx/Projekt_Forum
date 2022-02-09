using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Forum.Domain;
using Forum.Web_pages;

namespace Forum.Web_pages
{
    public partial class StronaGlowna : System.Web.UI.MasterPage
    {
        public string btnLogInOutSite;
        public string btnManageAccountSite;

        private User currentUser;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["currentUser"] != null)
            {
                currentUser = (User)Session["currentUser"];

                btnAddPost.Visible = true;

                btnLogInOut.Text = "Wyloguj";
                btnLogInOutSite = "StronaGlowna.aspx";

                btnManageAccount.Text = $"Witaj, {currentUser.Username}";
                btnManageAccountSite = "ZarzadzajKontem.aspx";
            }
            else
            {
                btnAddPost.Visible = false;

                btnLogInOut.Text = "Zaloguj";
                btnLogInOutSite = "Logowanie.aspx";

                btnManageAccount.Text = "Rejestracja";
                btnManageAccountSite = "Rejestracja.aspx";
            }
        }

        protected void btnManageAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect(btnManageAccountSite);
        }

        protected void btnLogInOut_Click(object sender, EventArgs e)
        {
            if(Session["currentUser"] != null) Session["currentUser"] = null;
            Response.Redirect(btnLogInOutSite);
        }

        protected void btnAddPost_Click(object sender, EventArgs e)
        {
            Response.Redirect("DodajPost.aspx");
        }

        protected void btnHomePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("StronaGlowna.aspx");
        }
    }
}