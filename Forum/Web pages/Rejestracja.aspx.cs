using Forum.BusinesLogic.Api;
using Forum.BusinesLogic.Api.Interface;
using Forum.Domain;
using Forum.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Forum.Web_pages
{
    public partial class Rejestracja : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTestNHibernate_Click(object sender, EventArgs e)
        {
            IForum api = new ForumApi();
            api.TestNHibernate();
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (ctrlRegisterUser.isEmailValid &&
                ctrlRegisterUser.isUsernameValid &&
                ctrlRegisterUser.isPasswordVaild)
            {
                var api = new ForumApi();
                api.RegisterUser(new User()
                {
                    Username = ctrlRegisterUser.Username,
                    Password = ctrlRegisterUser.Password,
                    AccountDescription = ctrlRegisterUser.AccountDesc,
                    Email = ctrlRegisterUser.Email
                });
            }
        }
    }
}