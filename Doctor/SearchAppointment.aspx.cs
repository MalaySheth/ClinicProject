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
    public partial class SearchAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DoctorId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                hdfDoctorId.Value = Session["DoctorId"].ToString();
            }
        }
        protected void gvPatientAppointment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {

                lblFeedback.Text = "";
                gvPatientAppointment.PageIndex = e.NewPageIndex;
                gvPatientAppointment.DataSource = new clsAppointment().SearchAppointments(txtDateFrom.Text, txtDateTo.Text, txtFullName.Text, txtPhoneNumber.Text, int.Parse(hdfDoctorId.Value));
                gvPatientAppointment.DataBind();
            }
            catch (Exception ex)
            {

                lblFeedback.Text = ex.Message;
                lblFeedback.ForeColor = Color.Red;
            }
        }

        protected void gvPatientAppointment_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["PatientAppointmentsId"] = gvPatientAppointment.SelectedDataKey.Values[0].ToString();
            string url = "ViewSelfAssessment.aspx";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "RedirectHallsCodes", "window.open('" + url + "', '_blank')", true);
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                gvPatientAppointment.DataSource = new clsAppointment().SearchAppointments(txtDateFrom.Text, txtDateTo.Text, txtFullName.Text, txtPhoneNumber.Text, int.Parse(hdfDoctorId.Value));
                gvPatientAppointment.DataBind();
            }
            catch (Exception ex)
            {

                lblFeedback.Text = ex.Message;
                lblFeedback.ForeColor = Color.Red;
            }
        }

        //protected void btnCancel_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        LinkButton btnsender = sender as LinkButton;
        //        GridViewRow gvr = btnsender.NamingContainer as GridViewRow;
        //        bool cancel = new clsAppointment().CancelAppointment(int.Parse(gvPatientAppointment.DataKeys[gvr.RowIndex].Values[0].ToString()));
        //        if (cancel)
        //        {
        //            lblFeedback.Text = Feedback.CancelSuccesfully();
        //            lblFeedback.ForeColor = Color.Green;
        //            gvPatientAppointment.DataSource = new clsAppointment().SearchAppointments(txtDateFrom.Text, txtDateTo.Text, txtFullName.Text, txtPhoneNumber.Text, 0);
        //            gvPatientAppointment.DataBind();
        //        }
        //        else
        //        {
        //            lblFeedback.Text = Feedback.CancelException();
        //            lblFeedback.ForeColor = Color.Red;
        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        lblFeedback.Text = Feedback.CancelException();
        //        lblFeedback.ForeColor = Color.Red;
        //    }
        //}

     
    }
}