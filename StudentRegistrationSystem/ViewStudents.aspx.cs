using System;
using System.Data;
using System.Web.UI.WebControls;
using StudentRegistrationSystem.Models;

namespace StudentRegistrationSystem
{
    public partial class ViewStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        private void LoadStudents()
        {
            try
            {
                DataTable dt = DatabaseHelper.ExecuteStoredProcedure("sp_GetStudentsWithEnrollmentCount");
                
                gvStudents.DataSource = dt;
                gvStudents.DataBind();

                if (dt.Rows.Count == 0)
                {
                    ShowMessage("No students found in the database.", "info");
                }
                else
                {
                    lblMessage.Visible = false;
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading students: {ex.Message}", "danger");
            }
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            LoadStudents();
            ShowMessage("Student list refreshed successfully.", "success");
        }

        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            LoadStudents();
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = $"alert alert-{type}";
            lblMessage.Visible = true;
        }
    }
}
