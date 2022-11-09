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
    public partial class AddCounselor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (Session["CounselorsId"] != null)
                {
                    int CounselorsId = int.Parse(Session["CounselorsId"].ToString());
                    hdfCounselorId.Value = CounselorsId.ToString();
                    DataTable dtCounselors = new clsCounselor().GetCounselorInfoByCounselorId(CounselorsId);
                    DataRow dr = dtCounselors.Rows[0];
                    txtDateOfBirth.Text = DateTime.Parse(dr["DateOfBirth"].ToString()).ToString("yyyy-MM-dd");
                    if(string.IsNullOrEmpty(dr["Registration_Approval_DateTime"].ToString()))
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
                    txtPostCode.Text = dr["PostalCode"].ToString();
                    btnAddCounsellor.Text = "Update";
                    pnlPassword.Visible = false;
                    RequiredFieldValidator10.Enabled = false;
                    RequiredFieldValidator11.Enabled = false;
                    cv.Enabled = false;
                    Session.Remove("CounselorsId");
                    txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
                }
                else
                {

                    txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
                }
            }
        }

        protected void btnAddCounsellor_Click(object sender, EventArgs e)
        {
            try
            {
                if (btnAddCounsellor.Text != "Update")
                {
                    int UserId = new clsCounselor().InsertCounselors(txtFullName.Text, txtAddress.Text, txtPostCode.Text, txtDateOfBirth.Text, txtPhoneNumber.Text, txtPassword.Text, txtEmail.Text, chkApproved.Checked, DateTime.Now.ToString(), chkApproved.Checked, txtRegistrationNumber.Text);
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
                    bool Update = new clsCounselor().UpdateCounselors(txtFullName.Text, txtAddress.Text, txtPostCode.Text, txtDateOfBirth.Text, txtPhoneNumber.Text, txtEmail.Text, chkApproved.Checked, chkApproved.Checked,txtRegistrationApprovalDate.Text, txtRegistrationNumber.Text,CounselorId);
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
            hdfCounselorId.Value = "";
            txtRegistrationNumber.Text = "";
            btnAddCounsellor.Text = "Add Counselor";
            pnlPassword.Visible = true;
            RequiredFieldValidator9.Enabled = true;
            RequiredFieldValidator10.Enabled = true;
            cv.Enabled = true;
            txtRegistrationApprovalDate.Text = DateTime.Now.ToShortDateString();
            chkApproved.Checked = false;
        }
    }
}