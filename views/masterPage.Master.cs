using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace POS.views
{
    public partial class masterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Web.UI.ScriptManager.RegisterClientScriptBlock(Page, typeof(Page), "Script", "if(typeof ($('.searchText').val()) != 'undefined') { $('.searchText').selectRange($('.searchText').val().length, $('.searchText').val().length); }", true);

            if (Session["username"] != null)
            {
                lblUsername.Text = Session["username"].ToString();
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}