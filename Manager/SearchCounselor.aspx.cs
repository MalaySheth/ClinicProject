using BLL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Manager
{
    public partial class SearchCounselor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Email"] == null)
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblFeedback.Text = "";
            gvCounselors.DataSource = new clsCounselor().SearchCounselor(txtName.Text, txtEmail.Text, txtAddress.Text, txtRegistrationNumber.Text, txtPhoneNumber.Text);
            gvCounselors.DataBind();
        }

        protected void gvCounselors_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                lblFeedback.Text = "";
                gvCounselors.PageIndex = e.NewPageIndex;
                gvCounselors.DataSource = new clsCounselor().SearchCounselor(txtName.Text, txtEmail.Text, txtAddress.Text, txtRegistrationNumber.Text, txtPhoneNumber.Text);
                gvCounselors.DataBind();
            }
            catch (Exception ex)
            {

                lblFeedback.Text = ex.Message;
                lblFeedback.ForeColor = Color.Red;
            }
        }

        protected void gvCounselors_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Session["CounselorsId"] = gvCounselors.SelectedDataKey.Values[0].ToString();
                string url = "AddCounselor.aspx";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "RedirectHallsCodes", "window.open('" + url + "', '_blank')", true);

            }
            catch (Exception ex)
            {

                lblFeedback.Text = ex.Message;
                lblFeedback.ForeColor = Color.Red;
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                Button btnsender = sender as Button;
                GridViewRow gvr = btnsender.NamingContainer as GridViewRow;



                bool Delete = new clsCounselor().DeleteCounselor(int.Parse(gvCounselors.DataKeys[gvr.RowIndex].Values[0].ToString()));
                if (Delete)
                {
                    lblFeedback.ForeColor = Color.Green;
                    lblFeedback.Text = Feedback.DeleteSuccessfull();
                    gvCounselors.DataSource = new clsCounselor().SearchCounselor(txtName.Text, txtEmail.Text, txtAddress.Text, txtRegistrationNumber.Text, txtPhoneNumber.Text);
                    gvCounselors.DataBind();
                }
                else
                {
                    lblFeedback.Text = Feedback.DeleteException();
                    lblFeedback.ForeColor = Color.Red;
                }
            }
            catch (Exception ex)
            {

                lblFeedback.Text = Feedback.DeleteException();
                lblFeedback.ForeColor = Color.Red;
            }
        }

        protected void btnUpdateApprove_Click(object sender, EventArgs e)
        {
            try
            {
                Button btnsender = sender as Button;
                GridViewRow gvr = btnsender.NamingContainer as GridViewRow;



                bool Update = new clsCounselor().UpdateCounselorIsAprrovedField(int.Parse(gvCounselors.DataKeys[gvr.RowIndex].Values[0].ToString()));
                if (Update)
                {
                    lblFeedback.ForeColor = Color.Green;
                    lblFeedback.Text = Feedback.UpdateSuccessfull();
                    gvCounselors.DataSource = new clsCounselor().SearchCounselor(txtName.Text, txtEmail.Text, txtAddress.Text, txtRegistrationNumber.Text, txtPhoneNumber.Text);
                    gvCounselors.DataBind();
                }
                else
                {
                    lblFeedback.Text = Feedback.UpdateException();
                    lblFeedback.ForeColor = Color.Red;
                }
            }
            catch (Exception ex)
            {

                lblFeedback.Text = Feedback.UpdateException();
                lblFeedback.ForeColor = Color.Red;
            }
        }
    }
}