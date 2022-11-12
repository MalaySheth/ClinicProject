using BLL;
using System;
using System.Collections.Generic;
using System.Data;
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
                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (Session["PatientsId"] != null)
                {
                    int PatientsId = int.Parse(Session["PatientsId"].ToString());
                    hdfPatientId.Value = PatientsId.ToString();
                    DataTable dtPatients = new clsPatient().GetPatientInfoByPatientId(PatientsId);
                    DataRow dr = dtPatients.Rows[0];
                    txtDateOfBirth.Text = DateTime.Parse(dr["DateOfBirth"].ToString()).ToString("yyyy-MM-dd");
                    txtAddress.Text = dr["Adress"].ToString();
                    txtConfirmPassword.Text = dr["Password"].ToString();
                    txtPassword.Text = dr["Password"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtFullName.Text = dr["FullName"].ToString();
                    txtPhoneNumber.Text = dr["PhoneNumber"].ToString();
                    txtPostCode.Text = dr["PostalCode"].ToString();
                    pnlPassword.Visible = false;
                    RequiredFieldValidator9.Enabled = false;
                    RequiredFieldValidator10.Enabled = false;
                    cv.Enabled = false;
                    btnAddPatient.Text = "Update";
                    Session.Remove("PatientsId");

                }
            }
        }

        protected void btnAddPatient_Click(object sender, EventArgs e)
        {
            try
            {
                if (DateTime.Parse(txtDateOfBirth.Text) > DateTime.Now)
                {
                    lblFeedback.Text = Feedback.BirthdateGreaterthanTodayError();
                    lblFeedback.ForeColor = Color.Red;
                    return;
                }
                if (btnAddPatient.Text !="Update")
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
                    bool Update = new clsPatient().UpdatePatients(txtFullName.Text, txtAddress.Text, txtPostCode.Text, txtDateOfBirth.Text, txtPhoneNumber.Text, txtEmail.Text,true, PatientId);
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
            hdfPatientId.Value = "";
            btnAddPatient.Text = "Add Patient";
            pnlPassword.Visible = true;
            RequiredFieldValidator9.Enabled = true;
            RequiredFieldValidator10.Enabled = true;
            cv.Enabled = true;

        }
    }
}