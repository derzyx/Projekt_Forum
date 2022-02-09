using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Controls
{
    public partial class AnswerControl : System.Web.UI.UserControl
    {
        public string Author
        {
            get { return btnAuthor.Text; }
            set { btnAuthor.Text = value; }
        }

        public string Date
        {
            get { return lblDate.Text; }
            set { lblDate.Text = value; }
        }

        public string Contents
        {
            get { return txtAnswer.InnerText; }
            set { txtAnswer.InnerText = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAuthor_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            Response.Redirect($"~/Web pages/StronaUzytkownika.aspx?User={btn.Text}");
        }
    }
}