using Forum.BusinesLogic.Api;
using Forum.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Controls
{
    public partial class PostPreview : System.Web.UI.UserControl
    {
        private Post _post;
        public Post post
        {
            get { return _post; }
            set { _post = value; }
        }

        private string _URL;
        public string URL
        {
            get { return _URL; }
            set { _URL = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            btnPostTitle.Text = post.Title;
            txtAuthor.InnerText = post.AuthorId.Username;
            txtDate.InnerText = post.Date.ToString();
            btnPostTitle.PostBackUrl = URL;

            txtAnswersCount.InnerText = CountAnswers();
        }


        protected string CountAnswers()
        {
            ForumApi api = new ForumApi();
            var answersList = api.GetPostAnswers(post.Id);
            return answersList.Count.ToString();
        }
    }
}