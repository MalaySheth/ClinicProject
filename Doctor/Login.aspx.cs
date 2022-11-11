using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doctor
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = new clsUsers().Login(txtEmail.Text, txtPassword.Text,2);
            if (dt.Rows.Count > 0)
            {
                

                DataTable dtDoctors = new clsDoctor().GetDoctorInfoByUserId(int.Parse(dt.Rows[0]["UsersId"].ToString()));
                bool Approved = new clsDoctor().CheckApproveDoctor(int.Parse(dtDoctors.Rows[0]["DoctorsId"].ToString()));

                if(!Approved)
                {
                    lblFeedback.Text = Feedback.NotApproved();
                    lblFeedback.ForeColor = Color.Red;
                    return;
                }


                bool update = new clsUsers().UpdateLastLogin(int.Parse(dt.Rows[0]["UsersId"].ToString()));
                if (update)
                {
                    Session["DoctorId"] = dtDoctors.Rows[0]["DoctorsId"];
                    Session["DoctorName"] = dtDoctors.Rows[0]["FullName"];
                    Session["Email"] = dt.Rows[0]["Email"];
                    Response.Redirect("~/Dashboard.aspx");
                }
                else
                {
                    lblFeedback.Text = Feedback.IncorrectUsernameOrPassword();
                    lblFeedback.ForeColor = Color.Red;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }

                //Response.Redirect("~/ChangePassword.aspx");
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