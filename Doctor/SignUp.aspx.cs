using BLL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doctor
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            try
            {
                int UserId = new clsDoctor().InsertDoctors(txtFullName.Text, txtAddress.Text, txtPostalcode.Text, txtDateofBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text,false,null,false,null);
                if (UserId > 0)
                {
                    clear();
                    lblFeedback.Text = Feedback.RegistrationSuccessfull();
                    lblFeedback.ForeColor = Color.Green;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
                }
                else
                {
                    lblFeedback.Text = Feedback.RegistrationException();
                    lblFeedback.ForeColor = Color.Red;
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

                }

            }
            catch (Exception)
            {

                lblFeedback.Text = Feedback.RegistrationException();
                lblFeedback.ForeColor = Color.Red;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);
            }
        }
        protected void clear()
        {
            txtFullName.Text = "";
            txtAddress.Text = "";
            txtConfirmPassword.Text = "";
            txtDateofBirth.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtPhoneNumber.Text = "";
            txtPostalcode.Text = "";

        }

    }
}