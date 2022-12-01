using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Counselor
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["CounselorId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                LblTotalAssignedPatients.Text = new clsAppointment().GetTotalPatientsAssignedToCounselorsCount(int.Parse(Session["CounselorId"].ToString())).ToString();
                LblTotalPendingTasks.Text = new clsAppointment().GetTotalPendingAppointmentsCount().ToString();

            }
        }
    }
}