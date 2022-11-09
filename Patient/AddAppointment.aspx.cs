using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient
{
    public partial class AddAppointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["PatientId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }

                BindRepeater();
            }
        }

        protected void BindRepeater()
        {
            rpAssessment.DataSource = new clsAppointment().GetAllQuestionsSelfAssessment();
                rpAssessment.DataBind();
                for (int i = 0; i < rpAssessment.Items.Count; i++)
                {


                    RadioButtonList rdAnswer = rpAssessment.Items[i].FindControl("rdAnswer") as RadioButtonList;
                    DataTable dtAnswers = new clsAppointment().GetAllAnswersSelfAssessment();
                    foreach (DataRow dr in dtAnswers.Rows)
                    {
                        rdAnswer.Items.Insert(dtAnswers.Rows.IndexOf(dr), new ListItem("&nbsp;&nbsp;" + dr["Answer"].ToString(), dr["AssessmentAnswersId"].ToString()));
                    }

                }
        }

        protected void rpAssessment_PreRender(object sender, EventArgs e)
        {
            for (int i = 0; i < rpAssessment.Items.Count; i++)
            {
                Label lblQuestionNumber = rpAssessment.Items[i].FindControl("lblQuestionNumber") as Label;

                lblQuestionNumber.Text = (i + 1).ToString();

                
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                int PatientId = int.Parse(Session["PatientId"].ToString());
                DataTable dtAssessment = new DataTable();
                dtAssessment.Columns.Add("AssessmentQuestionsNo");
                dtAssessment.Columns.Add("AssessmentAnswersNo");

                foreach (RepeaterItem item in rpAssessment.Items)
                {
                    if (item.ItemType == ListItemType.Item || item.ItemType == ListItemType.AlternatingItem)
                    {
                        HiddenField hdfAssessmentQuestionsId = (HiddenField)item.FindControl("hdfAssessmentQuestionsId");
                        RadioButtonList rdAnswer = (RadioButtonList)item.FindControl("rdAnswer");
                        DataRow dr = dtAssessment.NewRow();
                        bool isChecked = false;
                        for (int i = 0; i < 4; i++)
                        {
                            if (rdAnswer.Items[i].Selected)
                            {
                                isChecked = true;
                                break;

                            }
                        }
                        if (!isChecked)
                        {
                            lblFeedback.Text = Feedback.PleaseAnswerAlltheQuestions();
                            lblFeedback.ForeColor = Color.Red;
                            return;

                        }
                        dr["AssessmentQuestionsNo"] = hdfAssessmentQuestionsId.Value;
                        dr["AssessmentAnswersNo"] = rdAnswer.SelectedValue;
                        dtAssessment.Rows.Add(dr);
                    }

                }


                int AppointmentId = new clsAppointment().InsertPatientAppointment(PatientId, dtAssessment);
                if (AppointmentId > 0)
                {
                    BindRepeater();
                    lblFeedback.Text = Feedback.InsertSuccessfull();
                    lblFeedback.ForeColor = Color.Green;
                }
                else
                {
                    lblFeedback.Text = Feedback.InsertException();
                    lblFeedback.ForeColor = Color.Red;
                }
            }
            catch (Exception ex)
            {

                lblFeedback.Text = Feedback.InsertException();
                lblFeedback.ForeColor = Color.Red;
            }
        }

       
    }
}