﻿using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["PatientId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                LblTotalAppointments.Text = new clsAppointment().GetTotalAppointmentsOfPatientsCount(int.Parse(Session["PatientId"].ToString())).ToString();
                LblTotalVisits.Text = new clsAppointment().GetTotalVisitsOfPatientCount(int.Parse(Session["PatientId"].ToString())).ToString();
            }
        }
    }
}