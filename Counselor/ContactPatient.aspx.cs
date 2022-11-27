using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Net.Mail;
using System.Text;

namespace Counselor
{
    public partial class ContactPatient : System.Web.UI.Page
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
                    DataTable dtAppointment = new clsAppointment().GetAppointmentDetailsbyAppointmentId(AppointmentId);
                    DataTable dtPatient = new clsPatient().GetPatientInfoByPatientId(int.Parse(dtAppointment.Rows[0]["PatientsNo"].ToString()));
                    txtEmail.Text = dtPatient.Rows[0]["Email"].ToString();
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

        protected void btnSendEmail_Click(object sender, EventArgs e)
        {
            #region try1
            try
            {
                string counseloremail = new clsCounselor().GetCounselorEmail(int.Parse(Session["CounselorId"].ToString()));
                string counselorpassword = new clsCounselor().GetCounselorPassword(int.Parse(Session["CounselorId"].ToString()));
                string to = txtEmail.Text; //To address    
                string from = counseloremail; //From address    
                MailMessage message = new MailMessage(from, to);

                string mailbody = "In this article you will learn how to send a email using Asp.Net & C#";
                message.Subject = "Sending Email Using Asp.Net & C#";
                message.Body = mailbody;
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.zoho.com", 465); //Zoho smtp    
                System.Net.NetworkCredential basicCredential1 = new
                System.Net.NetworkCredential(counseloremail, counselorpassword);
                client.EnableSsl = false;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                    lblFeedback.Text = Feedback.EmailSent();
                    lblFeedback.ForeColor = Color.Green;
                }

                catch (Exception ex)
                {
                    lblFeedback.Text = ex.Message;
                    lblFeedback.ForeColor = Color.Red;
                }

            }
            catch (Exception ex)
            {
                lblFeedback.Text = Feedback.EmailNotSent();
                lblFeedback.ForeColor = Color.Red;
            }

            #endregion
            //try
            //{
            //    string counseloremail = new clsCounselor().GetCounselorEmail(int.Parse(Session["CounselorId"].ToString()));
            //    string counselorpassword = new clsCounselor().GetCounselorPassword(int.Parse(Session["CounselorId"].ToString()));
            //    SmtpClient smtpClient = new SmtpClient("smtp.zoho.com", 465);

            //    smtpClient.Credentials = new System.Net.NetworkCredential(counseloremail, counselorpassword);
            //    // smtpClient.UseDefaultCredentials = true; // uncomment if you don't want to use the network credentials
            //    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
            //    smtpClient.EnableSsl = true;
            //    MailMessage mail = new MailMessage();

            //    //Setting From , To and CC
            //    mail.From = new MailAddress(counseloremail, "Zoho");
            //    mail.To.Add(new MailAddress(txtEmail.Text));
            //    mail.Subject = txtSubject.Text;
            //    mail.Body = kt_docs_ckeditor_classic.Text;

            //    smtpClient.Send(mail);
            //    lblFeedback.Text = Feedback.EmailSent();
            //    lblFeedback.ForeColor = Color.Green;

            //}
            //catch (Exception)
            //{
            //    lblFeedback.Text = Feedback.EmailNotSent();
            //    lblFeedback.ForeColor = Color.Red;
            //}

        }
    }
}