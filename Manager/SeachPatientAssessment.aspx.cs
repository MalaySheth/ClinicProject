using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Manager
{
    public partial class SeachPatientAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                txtDateFrom.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtDateTo.Text = DateTime.Now.ToString("yyyy-MM-dd");

            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Session["dtPatientAssessment"] = new clsAppointment().GetPatientsAssessmentByDate(txtDateFrom.Text, txtDateTo.Text);
            string url = "PrintPatientAssessment.aspx"; 
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "RedirectHallsCodes", "window.open('" + url + "', '_blank')", true);
        }
    }
}