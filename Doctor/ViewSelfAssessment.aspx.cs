using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doctor
{
    public partial class ViewSelfAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["DoctorId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (Session["PatientAppointmentsId"] != null)
                {
                    int AppointmentId = int.Parse(Session["PatientAppointmentsId"].ToString());
                    DataTable dtAssessment = new clsAppointment().GetSelfAssessmentOfAppointment(AppointmentId);
                    gvPatientAssessment.DataSource = dtAssessment;
                    gvPatientAssessment.DataBind();
                    lblAssessmentDate.Text = new clsAppointment().GetAssessmentDate(AppointmentId);
                    Session.Remove("PatientAppointmentsId");
                }
                else
                {
                    Page.RegisterStartupScript("close", "<script>self.close();</script>");
                }
            }
        }
    }
}