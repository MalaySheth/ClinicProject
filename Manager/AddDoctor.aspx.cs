using BLL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Manager
{
    public partial class AddDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
            }
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnAddDoctor.Text != "Update")
                {
                    int UserId = new clsDoctor().InsertDoctors(txtFullName.Text, txtAddress.Text, txtPostcode.Text, txtDateofBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text, chkApproved.Checked, DateTime.Now.ToString(), true, txtRegistrationNumber.Text);
                    if (UserId > 0)
                    {
                        Clear();
                        lblFeedback.Text = Feedback.InsertSuccessfull();
                        lblFeedback.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblFeedback.Text = Feedback.InsertException();
                        lblFeedback.ForeColor = Color.Red;
                    }
                }
                else
                {
                    int DoctorId = int.Parse(hdfDoctorId.Value);
                    bool Update = new clsCounselor().UpdateCounselors(txtFullName.Text, txtAddress.Text, txtPostcode.Text, txtDateofBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text, true, chkApproved.Checked, txtRegistrationApprovalDate.Text, txtRegistrationNumber.Text, DoctorId);
                    if (Update)
                    {
                        Clear();
                        lblFeedback.Text = Feedback.UpdateSuccessfull();
                        lblFeedback.ForeColor = Color.Green;
                    }
                    else
                    {
                        lblFeedback.Text = Feedback.UpdateException();
                        lblFeedback.ForeColor = Color.Red;
                    }
                }
            }
            catch (Exception)
            {

                if (btnAddDoctor.Text != "Update")
                {
                    lblFeedback.Text = Feedback.InsertException();
                    lblFeedback.ForeColor = Color.Red;
                }
                else
                {
                    lblFeedback.Text = Feedback.UpdateException();
                    lblFeedback.ForeColor = Color.Red;
                }

            }
        }
        protected void Clear()
        {
            txtAddress.Text = "";
            txtConfirmPassword.Text = "";
            txtDateofBirth.Text = "";
            txtEmail.Text = "";
            txtFullName.Text = "";
            txtPassword.Text = "";
            txtPhoneNumber.Text = "";
            txtPostcode.Text = "";

            txtRegistrationNumber.Text = "";

        }
    }
}