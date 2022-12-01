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
    public partial class PrintPatientAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                DataTable dtPatientAssessment = (DataTable)Session["dtPatientAssessment"];
                Session.Remove("dtPatientAssessment");
                if (dtPatientAssessment.Rows.Count == 0)
                {
                    Response.Write(Feedback.NoDataFound());
                }
                else
                {

                    ReportDocument doc = new ReportDocument();
                    string filename = Server.MapPath("~/rptPatientAssessment.rpt");
                    doc.Load(filename);
                    doc.SetDataSource(dtPatientAssessment);


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

                Page.RegisterStartupScript("close", "<script>self.close();</script>");
            }
        }
    }
}