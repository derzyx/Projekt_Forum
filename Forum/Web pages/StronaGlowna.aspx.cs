using Forum.BusinesLogic.Api;
using Forum.Controls;
using Forum.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Web_pages
{
    public partial class StronaGlowna1 : System.Web.UI.Page
    {

        private const string POSTPREV_CONTROL_PATH = "~/Controls/PostPreview.ascx";
        private int maxPostsInPage = 2;

        protected void Page_Load(object sender, EventArgs e)
        {
            

            Session["currentPost"] = null;
            InitButtons();

            if (!IsPostBack)
            {
                InitPostsPrev(1);
            }
        }

        protected void OnButtonClick(object sender, EventArgs args)
        {
            RemoveAllControls();

            Button btn = (Button)sender;
            InitPostsPrev(Convert.ToInt32(btn.Text));
        }

        protected void RemoveAllControls()
        {
            foreach (Control item in ButtonsPlaceholder.Controls.OfType<Button>().ToList())
            {
                ControlPlaceholder.Controls.Remove(item);
            }

            foreach (Control item in ControlPlaceholder.Controls.OfType<PostPreview>().ToList())
            {
                ControlPlaceholder.Controls.Remove(item);
            }
        }

        // Tworzenie podglądów postów
        protected void InitPostsPrev(int buttonNumber)
        {
            IList<Post> posts;

            ForumApi api = new ForumApi();
            posts = api.GetPosts(buttonNumber, maxPostsInPage);

            foreach (var post in posts)
            {
                PostPreview preview = (PostPreview)LoadControl(POSTPREV_CONTROL_PATH);
                preview.post = post;
                preview.URL = $"~/Web pages/StronaPostu.aspx?Id={post.Id}";
                ControlPlaceholder.Controls.Add(preview);
            }
        }

        // Tworzenie przycisków do zmiany stron
        protected void InitButtons()
        {
            float allPosts;
            int pages;

            ForumApi api = new ForumApi();
            allPosts = api.GetPostsCount();

            pages = (int)Math.Ceiling(allPosts / maxPostsInPage);

            for (int i = 1; i <= pages; i++)
            {
                Button button = new Button();
                button.Text = i.ToString();
                button.Click += new EventHandler(OnButtonClick);
                button.PostBackUrl = "StronaGlowna.aspx";
                ButtonsPlaceholder.Controls.Add(button);
            }
        }
    }
}