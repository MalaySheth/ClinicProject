using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Doctor
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["DoctorId"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }

                lblName.Text = Session["DoctorName"].ToString();
                lblEmail.Text = Session["Email"].ToString();
            }
        }
        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Login.aspx");
        }
    }
}