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
    public partial class AddCounselor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
            }
        }

        protected void btnAddCounsellor_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnAddCounsellor.Text != "Update")
                {
                    int UserId = new clsCounselor().InsertCounselors(txtFullName.Text, txtAddress.Text, txtPostCode.Text, txtDateOfBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text, chkApproved.Checked, DateTime.Now.ToString(), true, txtRegistrationNumber.Text);
                    if(UserId>0)
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
                    int CounselorId = int.Parse(hdfCounselorId.Value);
                    bool Update = new clsCounselor().UpdateCounselors(txtFullName.Text, txtAddress.Text, txtPostCode.Text, txtDateOfBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text, true, chkApproved.Checked,txtRegistrationApprovalDate.Text, txtRegistrationNumber.Text,CounselorId);
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

                if (btnAddCounsellor.Text != "Update")
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
            txtDateOfBirth.Text = "";
            txtEmail.Text = "";
            txtFullName.Text = "";
            txtPassword.Text = "";
            txtPhoneNumber.Text = "";
            txtPostCode.Text = "";

            txtRegistrationNumber.Text = "";
            
        }
    }
}