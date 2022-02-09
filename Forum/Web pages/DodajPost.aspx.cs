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
    public partial class DodajPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["currentUser"] == null)
            {
                Response.Redirect("StronaGlowna.aspx");
            }
        }

        protected void btnPrześlij_Click(object sender, EventArgs e)
        {
            ForumApi api = new ForumApi();
            User currnetUser = (User)Session["currentUser"];
            Post post = new Post
            {
                Title = txtTitle.Text,
                Contents = txtContents.Text,
                AuthorId = new User { Id = Convert.ToInt32(currnetUser.Id) },
                Date = DateTime.Now
            };
            var result = api.AddPost(post);
            if (result.Succes)
            {
                testLabel.Text = "OK!";
            }
            else
            {
                testLabel.Text = result.Message;
            }
        }
    }
}