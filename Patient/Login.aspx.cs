using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Patient
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = new clsUsers().Login(txtEmail.Text, txtPassword.Text);
            if (dt.Rows.Count > 0)
            {
                DataTable dtpatients = new clsPatient().GetPatientInfoByUserId(int.Parse(dt.Rows[0]["UsersId"].ToString()));
                Session["PatientId"] = dtpatients.Rows[0]["PatientsId"];
                Session["PatientName"] = dtpatients.Rows[0]["FullName"];
            }
        }
    }
}