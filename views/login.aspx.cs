using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POS.views
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void posLogin_Authenticate(object sender, AuthenticateEventArgs e)
        {
            if (Authenticate(posLogin.UserName, posLogin.Password))
            {
                e.Authenticated = true;

                Session["UserName"] = posLogin.UserName;
            }
        }

        public bool Authenticate(string UN, string PSW)
        {
            if (UN.CompareTo("supervisor") == 0 && PSW.CompareTo("supervisor") == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}