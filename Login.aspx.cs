using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace QLBH.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserControl uch = Page.Master.FindControl("LeftMenu") as UserControl;
            if (this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
                uch.Visible = true;
            }
            else
            {
                uch.Visible = false;
            }
        }
        protected void ValidateUser(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = Security.Encrypt(txtPassword.Text.Trim());
            int userId = 0;
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Validate_User"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("Password", password);
                    cmd.Connection = con;
                    con.Open();
                    userId = Convert.ToInt32(cmd.ExecuteScalar());
                    con.Close();
                }
                switch (userId)
                {
                    case -1:
                        dvMessage.Visible = true;
                        lblMessage.Text = "Tên người dùng hoặc mật khẩu không chính xác.";
                        ClientScript.RegisterStartupScript(this.GetType(), "JS", "$(function () { $('#LoginModal').modal('show'); });", true);
                        break;
                    case -2:
                        dvMessage.Visible = true;
                        lblMessage.Text = "Tài khoản chưa được đăng ký";
                        ClientScript.RegisterStartupScript(this.GetType(), "JS", "$(function () { $('#LoginModal').modal('show'); });", true);
                        break;
                    default:
                        if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
                        {
                            FormsAuthentication.SetAuthCookie(username, chkRememberMe.Checked);
                            Response.Redirect(Request.QueryString["ReturnUrl"]);
                        }
                        else
                        {
                            FormsAuthentication.RedirectFromLoginPage(username, chkRememberMe.Checked);
                        }
                        break;
                }
            }
        }
    }
}
