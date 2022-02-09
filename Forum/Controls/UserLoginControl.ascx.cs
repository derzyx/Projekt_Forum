using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Controls
{
    public partial class UserLoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region Properties

        public string username => txtUsername.Text;
        public string password => txtPassword.Text;

        #endregion
    }
}