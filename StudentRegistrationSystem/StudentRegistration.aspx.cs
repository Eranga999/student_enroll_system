using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using StudentRegistrationSystem.Models;

namespace StudentRegistrationSystem
{
    public partial class StudentRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize page
                // Close any modal backdrops
                ScriptManager.RegisterStartupScript(this, GetType(), "HideModals",
                    "document.body.classList.remove('modal-open'); " +
                    "var backdrops = document.querySelectorAll('.modal-backdrop'); " +
                    "backdrops.forEach(function(bd) { bd.remove(); });", true);
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate inputs
                if (!Page.IsValid)
                {
                    ShowMessage("Please fill all required fields correctly.", "danger");
                    return;
                }

                // Store student name and email before clearing
                string studentFirstName = txtFirstName.Text.Trim();
                string studentLastName = txtLastName.Text.Trim();
                string studentEmail = txtEmail.Text.Trim();

                // Create parameters for stored procedure
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@FirstName", studentFirstName),
                    new SqlParameter("@LastName", studentLastName),
                    new SqlParameter("@Email", studentEmail),
                    new SqlParameter("@PhoneNumber", txtPhoneNumber.Text.Trim()),
                    new SqlParameter("@DateOfBirth", Convert.ToDateTime(txtDateOfBirth.Text)),
                    new SqlParameter("@Address", txtAddress.Text.Trim()),
                    new SqlParameter("@Gender", ddlGender.SelectedValue),
                    new SqlParameter("@StudentID", SqlDbType.Int) { Direction = ParameterDirection.Output }
                };

                // Execute stored procedure
                DataTable result = DatabaseHelper.ExecuteStoredProcedure("sp_InsertStudent", parameters);

                if (result.Rows.Count > 0 && result.Rows[0]["Result"].ToString() == "Success")
                {
                    int studentId = Convert.ToInt32(result.Rows[0]["StudentID"]);

                    // Clear form immediately
                    ClearForm();

                    // Prepare success message - pass individual parameters
                    string script = $"showSuccessModal('{studentId}', '{studentFirstName}', '{studentLastName}', '{studentEmail}');";
                    
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowSuccessModal", script, true);
                }
                else
                {
                    string errorMsg = result.Rows[0]["ErrorMessage"].ToString();
                    ShowMessage($"Error: {errorMsg}", "danger");
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"An error occurred: {ex.Message}", "danger");
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        private void ClearForm()
        {
            txtFirstName.Text = string.Empty;
            txtLastName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhoneNumber.Text = string.Empty;
            txtDateOfBirth.Text = string.Empty;
            txtAddress.Text = string.Empty;
            ddlGender.SelectedIndex = 0;
            lblMessage.Visible = false;
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = $"alert alert-{type}";
            lblMessage.Visible = true;
        }
    }
}
