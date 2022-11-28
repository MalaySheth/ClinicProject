using BLL;
using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Manager
{
    public partial class PrintDoctorAppointmentReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dtDoctorAppointments = (DataTable)Session["dtDoctorAppointments"];
                Session.Remove("dtDoctorAppointments");
                if (dtDoctorAppointments.Rows.Count == 0)
                {
                    Response.Write(Feedback.NoDataFound());
                }
                else
                {

                    ReportDocument doc = new ReportDocument();
                    string filename = Server.MapPath("~/rptDoctorAppointments.rpt");
                    doc.Load(filename);
                    doc.SetDataSource(dtDoctorAppointments);
                  

                    doc.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, false, "");
                    doc.Close();
                    doc.Dispose();
                    Response.Clear();
                    Response.Buffer = true;
                    Response.ContentType = "application/pdf";
                    Response.End();

                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}