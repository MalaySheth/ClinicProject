using BLL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Counselor
{
    public partial class SearchPatient : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CounselorId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }
      

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblFeedback.Text = "";
            gvPatients.DataSource = new clsPatient().SearchPatientsForDoctorsAndCounselors(txtName.Text, txtEmail.Text, txtAddress.Text, txtPhoneNumber.Text);
            gvPatients.DataBind();
        }

        protected void gvPatients_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                lblFeedback.Text = "";
                gvPatients.PageIndex = e.NewPageIndex;
                gvPatients.DataSource = new clsPatient().SearchPatientsForDoctorsAndCounselors(txtName.Text, txtEmail.Text, txtAddress.Text, txtPhoneNumber.Text);
                gvPatients.DataBind();
            }
            catch (Exception ex)
            {

                lblFeedback.Text = ex.Message;
                lblFeedback.ForeColor = Color.Red;
            }
        }



        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Button btnsender = sender as Button;
                GridViewRow gvr = btnsender.NamingContainer as GridViewRow;



                bool Delete = new clsPatient().SoftDeletePatient(int.Parse(gvPatients.DataKeys[gvr.RowIndex].Values[0].ToString()));
                if (Delete)
                {
                    lblFeedback.ForeColor = Color.Green;
                    lblFeedback.Text = Feedback.DeleteSuccessfull();
                    gvPatients.DataSource = new clsPatient().SearchPatientsForDoctorsAndCounselors(txtName.Text, txtEmail.Text, txtAddress.Text, txtPhoneNumber.Text);
                    gvPatients.DataBind();
                }
                else
                {
                    lblFeedback.Text = Feedback.DeleteException();
                    lblFeedback.ForeColor = Color.Red;
                }
            }
            catch (Exception ex)
            {

                lblFeedback.Text = Feedback.DeleteException();
                lblFeedback.ForeColor = Color.Red;
            }
        }

    }
}