using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Counselor
{
    public partial class AssignDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["CounselorId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                if (Session["PatientAppointmentsId"] != null)
                {
                    int AppointmentId = int.Parse(Session["PatientAppointmentsId"].ToString());
                    hdfPatientAppointmentId.Value = AppointmentId.ToString();
                    DataTable dtAppointment = new clsAppointment().GetAppointmentDetailsbyAppointmentId(AppointmentId);
                    lblPatientName.Text = dtAppointment.Rows[0]["PatientName"].ToString();
                    lblAssessmentDate.Text = new clsAppointment().GetAssessmentDate(AppointmentId);
                    Session.Remove("PatientAppointmentsId");
                }
                else
                {
                    Page.RegisterStartupScript("close", "<script>self.close();</script>");
                }
                ddlDoctors.DataSource = new clsDoctor().GetAllDoctors();
                ddlDoctors.DataBind();

            }
        }

        protected void btnAssign_Click(object sender, EventArgs e)
        {
            try
            {
                int DoctorId = int.Parse(ddlDoctors.SelectedValue);
                int CounselorId = int.Parse(Session["CounselorId"].ToString());
                int AppointmentId = int.Parse(hdfPatientAppointmentId.Value);
                bool Update = new clsAppointment().AssignDoctortoAppointment(DoctorId, CounselorId, AppointmentId);
                if (Update)
                {
                    lblFeedback.Text = Feedback.UpdateSuccessfull();
                    lblFeedback.ForeColor = Color.Green;
                    ddlDoctors.SelectedIndex = -1;
                }
                else
                {
                    lblFeedback.Text = Feedback.UpdateException();
                    lblFeedback.ForeColor = Color.Red;
                }
            }
            catch (Exception)
            {

                lblFeedback.Text = Feedback.UpdateException();
                lblFeedback.ForeColor = Color.Red;
            }
        }

       
    }
}