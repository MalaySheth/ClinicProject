using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Manager
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                LblTotalAppointments.Text = new clsAppointment().GetTotalAppointmentsCount().ToString();
                LblTotalCounselors.Text = new clsCounselor().GetTotalCountOfCounselors().ToString();
                LblTotalDoctors.Text = new clsDoctor().GetTotalCountOfDoctors().ToString();
                LblTotalPatients.Text = new clsPatient().GetTotalCountOfPatients().ToString();

            }
        }
    }
}