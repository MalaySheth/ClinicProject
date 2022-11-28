using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Manager
{
    public partial class SearchDoctorsAppointments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
                ddlDoctors.DataSource = new clsDoctor().GetAllDoctors();
                ddlDoctors.DataBind();
            }
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            Session["dtDoctorAppointments"] = new clsAppointment().GetDoctorAppointmentsForReportWithCount(txtDateFrom.Text,txtDateTo.Text,int.Parse(ddlDoctors.SelectedValue));
            string url = "PrintDoctorAppointmentReport.aspx";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "RedirectHallsCodes", "window.open('" + url + "', '_blank')", true);
        }
    }
}