using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doctor
{
    public partial class ScheduleAppointment : System.Web.UI.Page
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
             

            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                bool Update = new clsAppointment().ScheduleDateTimeOfAssignment(int.Parse(hdfPatientAppointmentId.Value), txtDate.Text, txtTime.Text);
                if (Update)
                {
                    txtDate.Text = "";
                    txtTime.Text = "";
                    lblFeedback.Text = Feedback.UpdateSuccessfull();
                    lblFeedback.ForeColor = Color.Green;
                }
                else
                {
                    lblFeedback.Text = Feedback.UpdateException();
                    lblFeedback.ForeColor = Color.Red;

                }
            }
            catch (Exception)
            {

                lblFeedback.Text=Feedback.UpdateException();
                lblFeedback.ForeColor = Color.Red;
            }
        }
    }
}