﻿using BLL;
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
    public partial class SearchAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }


            }
        }
        protected void gvPatientAppointment_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                lblFeedback.Text = "";
                gvPatientAppointment.PageIndex = e.NewPageIndex;
                gvPatientAppointment.DataSource = new clsAppointment().SearchAppointments(txtDateFrom.Text, txtDateTo.Text, txtFullName.Text, txtPhoneNumber.Text, 0, 0);
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
                gvPatientAppointment.DataSource = new clsAppointment().SearchAppointments(txtDateFrom.Text, txtDateTo.Text, txtFullName.Text, txtPhoneNumber.Text, 0, 0);
                gvPatientAppointment.DataBind();
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



                bool Delete = new clsAppointment().DeleteAppointments(int.Parse(gvPatientAppointment.DataKeys[gvr.RowIndex].Values[0].ToString()));
                if (Delete)
                {
                    lblFeedback.ForeColor = Color.Green;
                    lblFeedback.Text = Feedback.DeleteSuccessfull();
                    gvPatientAppointment.DataSource = new clsAppointment().SearchAppointments(txtDateFrom.Text, txtDateTo.Text, txtFullName.Text, txtPhoneNumber.Text, 0, 0);
                    gvPatientAppointment.DataBind();
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