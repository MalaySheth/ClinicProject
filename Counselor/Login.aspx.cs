using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Counselor
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = new clsUsers().Login(txtEmail.Text, txtPassword.Text,3);
            if (dt.Rows.Count > 0)
            {
                DataTable dtCounselor = new clsCounselor().GetCounselorInfoByUserId(int.Parse(dt.Rows[0]["UsersId"].ToString()));
                bool Approved = new clsCounselor().CheckApproveCounselor(int.Parse(dtCounselor.Rows[0]["CounselorsId"].ToString()));

                if (!Approved)
                {
                    lblFeedback.Text = Feedback.NotApproved();
                    lblFeedback.ForeColor = Color.Red;
                    return;
                }
                bool update = new clsUsers().UpdateLastLogin(int.Parse(dt.Rows[0]["UsersId"].ToString()));
                if (update)
                {
                    Session["CounselorId"] = dtCounselor.Rows[0]["CounselorsId"];
                    Session["CounselorName"] = dtCounselor.Rows[0]["FullName"];
                    Session["Email"] = dt.Rows[0]["Email"];
                    Response.Redirect("Dashboard.aspx");
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