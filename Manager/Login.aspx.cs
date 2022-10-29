using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Manager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = new clsUsers().Login(txtEmail.Text, txtPassword.Text,1);
            if (dt.Rows.Count > 0)
            {
                bool update = new clsUsers().UpdateLastLogin(int.Parse(dt.Rows[0]["UsersId"].ToString()));
                if (update)
                {
                    Session["Email"] = dt.Rows[0]["Email"];
                    Response.Redirect("~/Dashboard.aspx");
                }
                else
                {
                    lblFeedback.Text = Feedback.IncorrectUsernameOrPassword();
                    lblFeedback.ForeColor = Color.Red;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
            }
            else
            {
                lblFeedback.Text = Feedback.IncorrectUsernameOrPassword();
                lblFeedback.ForeColor = Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }
    }
}