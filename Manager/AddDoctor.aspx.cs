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
    public partial class AddDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (Session["DoctorsId"] != null)
                {
                    int DoctorsId = int.Parse(Session["DoctorsId"].ToString());
                    hdfDoctorId.Value = DoctorsId.ToString();
                    DataTable dtDoctors = new clsDoctor().GetDoctorInfoByDoctorId(DoctorsId);
                    DataRow dr = dtDoctors.Rows[0];
                    txtDateofBirth.Text = DateTime.Parse(dr["DateOfBirth"].ToString()).ToString("yyyy-MM-dd");
                    if (string.IsNullOrEmpty(dr["Registration_Approval_DateTime"].ToString()))
                    {
                        txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
                    }
                    else
                    {
                        txtRegistrationApprovalDate.Text = DateTime.Parse(dr["Registration_Approval_DateTime"].ToString()).ToShortDateString();
                    }
                    txtAddress.Text = dr["Adress"].ToString();
                    txtConfirmPassword.Text = dr["Password"].ToString();
                    txtPassword.Text = dr["Password"].ToString();
                    txtEmail.Text = dr["Email"].ToString();
                    txtFullName.Text = dr["FullName"].ToString();
                    txtRegistrationNumber.Text = dr["RegistrationNumber"].ToString();
                    txtPhoneNumber.Text = dr["PhoneNumber"].ToString();
                    txtPostcode.Text = dr["PostalCode"].ToString();
                    btnAddDoctor.Text = "Update";
                    Session.Remove("DoctorsId");
                    pnlPassword.Visible = false;
                    RequiredFieldValidator10.Enabled = false;
                    RequiredFieldValidator11.Enabled = false;
                    cv.Enabled = false;
                    txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
                }
                else
                {

                    txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
                }
            }
        }

        protected void btnAddDoctor_Click(object sender, EventArgs e)
        {
            try
            {
                if (DateTime.Parse(txtDateofBirth.Text) > DateTime.Now)
                {
                    lblFeedback.Text = Feedback.BirthdateGreaterthanTodayError();
                    lblFeedback.ForeColor = Color.Red;
                    return;
                }
                if (btnAddDoctor.Text != "Update")
                {
                    int UserId = new clsDoctor().InsertDoctors(txtFullName.Text, txtAddress.Text, txtPostcode.Text, txtDateofBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text, chkApproved.Checked, DateTime.Now.ToString(), chkApproved.Checked, txtRegistrationNumber.Text);
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
                    bool Update = new clsDoctor().UpdateDoctors(txtFullName.Text, txtAddress.Text, txtPostcode.Text, txtDateofBirth.Text, txtPhoneNumber.Text, txtEmail.Text, chkApproved.Checked, chkApproved.Checked, txtRegistrationApprovalDate.Text, txtRegistrationNumber.Text, DoctorId);
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
            btnAddDoctor.Text = "Add Doctor";
            txtRegistrationNumber.Text = "";
            hdfDoctorId.Value = "";
            pnlPassword.Visible = true;
            RequiredFieldValidator10.Enabled = true;
            RequiredFieldValidator11.Enabled = true;
            cv.Enabled = true;
            txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
            chkApproved.Checked = false;
        }
    }
}