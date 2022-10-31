using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Manager
{
    public partial class SearchDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

     

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblFeedback.Text = "";
            gvDoctors.DataSource = new clsDoctor().SearchDoctors(txtName.Text, txtEmail.Text, txtAddress.Text, txtRegistrationNumber.Text, txtPhoneNumber.Text);
            gvDoctors.DataBind();
        }

        protected void gvDoctors_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                lblFeedback.Text = "";
                gvDoctors.PageIndex = e.NewPageIndex;
                gvDoctors.DataSource = new clsDoctor().SearchDoctors(txtName.Text, txtEmail.Text, txtAddress.Text, txtRegistrationNumber.Text, txtPhoneNumber.Text);
                gvDoctors.DataBind();
            }
            catch (Exception ex)
            {

                lblFeedback.Text = ex.Message;
                lblFeedback.ForeColor = Color.Red;
            }
        }

        protected void gvDoctors_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Session["DoctorsId"] = gvDoctors.SelectedDataKey.Values[0].ToString();
                string url = "AddDoctor.aspx";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "RedirectHallsCodes", "window.open('" + url + "', '_blank')", true);

            }
            catch (Exception ex)
            {

                lblFeedback.Text = ex.Message;
                lblFeedback.ForeColor = Color.Red;
            }
        }

        protected void btnDeleteDoctors_Click(object sender, EventArgs e)
        {
            try
            {
                Button btnsender = sender as Button;
                GridViewRow gvr = btnsender.NamingContainer as GridViewRow;
                
                

                bool Delete = new clsDoctor().DeleteDoctor(int.Parse(gvDoctors.DataKeys[gvr.RowIndex].Values[0].ToString()));
                if (Delete)
                {
                    lblFeedback.ForeColor = Color.Green;
                    lblFeedback.Text = Feedback.DeleteSuccessfull();
                    gvDoctors.DataSource = new clsDoctor().SearchDoctors(txtName.Text,txtEmail.Text,txtAddress.Text,txtRegistrationNumber.Text,txtPhoneNumber.Text);
                    gvDoctors.DataBind();
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
    }
}