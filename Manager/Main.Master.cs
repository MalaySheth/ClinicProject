using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Manager
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["Email"]==null)
                {
                    Response.Redirect("~/Login.aspx");
                }
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