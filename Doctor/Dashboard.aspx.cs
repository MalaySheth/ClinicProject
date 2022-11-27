using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Doctor
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DoctorId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                LblTotalAppointments.Text = new clsAppointment().GetTotalAppointmentsAssignedToDoctorCount(int.Parse(Session["DoctorId"].ToString())).ToString();
                LblTotalAssignedPatients.Text = new clsAppointment().GetTotalPatientsAssignedToDoctorCount(int.Parse(Session["DoctorId"].ToString())).ToString();
            }
        }
    }
}