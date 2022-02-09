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
    public partial class StronaPostu : System.Web.UI.Page
    {
        private const string ANSWER_CONTROL_PATH = "~/Controls/AnswerControl.ascx";

        public Post currentPost;

        protected void Page_Load(object sender, EventArgs e)
        {
            string postId = Request.QueryString["Id"];

            if(postId == null)
            {
                Response.Redirect("StronaGlowna.aspx");
            }


            ForumApi api = new ForumApi();
            currentPost = api.GetPost(Convert.ToInt32(postId));
            IList<Answer> answers = api.GetPostAnswers(Convert.ToInt32(postId));

            if (!IsPostBack)
            {
                btnAuthor.Text = currentPost.AuthorId.Username == null ? "Usunięty użytkownik" : currentPost.AuthorId.Username;
                txtDate.Text = currentPost.Date.ToString();
                txtTitle.InnerText = currentPost.Title;
                txtContents.InnerText = currentPost.Contents;
            }

            foreach (Answer answer in answers)
            {
                AnswerControl answerControl = (AnswerControl)LoadControl(ANSWER_CONTROL_PATH);
                answerControl.Author = answer.AuthorId.Username;
                answerControl.Date = answer.Date.ToString();
                answerControl.Contents = answer.Contents;
                AnswersPlaceholder.Controls.Add(answerControl);
            }
        }

        protected void btnAddAnswer_Click(object sender, EventArgs e)
        {
            if (Session["currentUser"] == null)
            {
                Response.Redirect("Logowanie.aspx");
            }
            else
            {
                ForumApi api = new ForumApi();
                if(api.AddAnswer(new Answer
                {
                    AuthorId = (User)Session["currentUser"],
                    PostId = currentPost,
                    Date = DateTime.Now,
                    Contents = txtAnswerContents.Text
                }))
                {
                    // Odśwież stronę
                    Response.Redirect(Request.RawUrl);
                }
            }
        }

        protected void btnAuthor_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect($"~/Web pages/StronaUzytkownika.aspx?User={btn.Text}");
        }
    }
}