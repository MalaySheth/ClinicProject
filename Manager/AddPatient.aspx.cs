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
    public partial class AddPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
            }
        }

        protected void btnAddPatient_Click(object sender, EventArgs e)
        {
            try
            {
                if(btnAddPatient.Text !="Update")
                {
                    int UserId = new clsPatient().InsertPatients(txtFullName.Text, txtAddress.Text, txtPostCode.Text, txtDateOfBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text);
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
                    int PatientId = int.Parse(hdfPatientId.Value);
                    bool Update = new clsPatient().UpdatePatients(txtFullName.Text, txtAddress.Text, txtPostCode.Text, txtDateOfBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text,true, PatientId);
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

                if (btnAddPatient.Text != "Update")
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

            

        }
    }
}