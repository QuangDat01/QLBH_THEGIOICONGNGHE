using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBH.Admin
{
    public partial class AdminHome1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserControl uch = Page.Master.FindControl("LeftMenu") as UserControl;
            if (!this.Page.User.Identity.IsAuthenticated)
            {
                uch.Visible = false;
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                uch.Visible = true;
            }
        }
    }
}