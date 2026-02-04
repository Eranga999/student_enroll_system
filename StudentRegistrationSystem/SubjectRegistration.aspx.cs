using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using StudentRegistrationSystem.Models;

namespace StudentRegistrationSystem
{
    public partial class SubjectRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
                LoadSubjects();
            }
        }

        private void LoadStudents()
        {
            try
            {
                DataTable dt = DatabaseHelper.ExecuteStoredProcedure("sp_GetAllStudents");
                
                ddlStudent.Items.Clear();
                ddlStudent.Items.Add(new ListItem("-- Select Student --", ""));

                foreach (DataRow row in dt.Rows)
                {
                    string studentName = $"{row["FirstName"]} {row["LastName"]} ({row["Email"]})";
                    ddlStudent.Items.Add(new ListItem(studentName, row["StudentID"].ToString()));
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading students: {ex.Message}", "danger");
            }
        }

        private void LoadSubjects()
        {
            try
            {
                DataTable dt = DatabaseHelper.ExecuteStoredProcedure("sp_GetAllSubjects");
                
                ddlSubject.Items.Clear();
                ddlSubject.Items.Add(new ListItem("-- Select Subject --", ""));

                foreach (DataRow row in dt.Rows)
                {
                    string subjectText = $"{row["SubjectCode"]} - {row["SubjectName"]} ({row["Credits"]} Credits)";
                    ddlSubject.Items.Add(new ListItem(subjectText, row["SubjectID"].ToString()));
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading subjects: {ex.Message}", "danger");
            }
        }

        protected void ddlStudent_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlStudent.SelectedValue))
            {
                LoadStudentEnrollments();
            }
            else
            {
                pnlEnrollments.Visible = false;
            }
        }

        private void LoadStudentEnrollments()
        {
            try
            {
                int studentId = Convert.ToInt32(ddlStudent.SelectedValue);
                
                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@StudentID", studentId)
                };

                DataTable dt = DatabaseHelper.ExecuteStoredProcedure("sp_GetStudentEnrollments", parameters);
                
                gvEnrollments.DataSource = dt;
                gvEnrollments.DataBind();
                pnlEnrollments.Visible = true;
            }
            catch (Exception ex)
            {
                ShowMessage($"Error loading enrollments: {ex.Message}", "danger");
            }
        }

        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsValid)
                {
                    ShowMessage("Please fill all required fields.", "danger");
                    return;
                }

                int studentId = Convert.ToInt32(ddlStudent.SelectedValue);
                int subjectId = Convert.ToInt32(ddlSubject.SelectedValue);

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@StudentID", studentId),
                    new SqlParameter("@SubjectID", subjectId)
                };

                DataTable result = DatabaseHelper.ExecuteStoredProcedure("sp_EnrollStudentInSubject", parameters);

                if (result.Rows.Count > 0)
                {
                    string resultStatus = result.Rows[0]["Result"].ToString();
                    string message = result.Rows[0]["Message"].ToString();

                    if (resultStatus == "Success")
                    {
                        ShowMessage(message, "success");
                        ddlSubject.SelectedIndex = 0;
                        LoadStudentEnrollments();
                    }
                    else
                    {
                        ShowMessage(message, "warning");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"An error occurred: {ex.Message}", "danger");
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ddlStudent.SelectedIndex = 0;
            ddlSubject.SelectedIndex = 0;
            pnlEnrollments.Visible = false;
            lblMessage.Visible = false;
        }

        protected void btnAddSubject_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtSubjectCode.Text) || 
                    string.IsNullOrWhiteSpace(txtSubjectName.Text) || 
                    string.IsNullOrWhiteSpace(txtCredits.Text))
                {
                    ShowMessage("Please fill all required fields for subject.", "danger");
                    return;
                }

                if (!int.TryParse(txtCredits.Text, out int credits) || credits <= 0)
                {
                    ShowMessage("Credits must be a valid positive number.", "danger");
                    return;
                }

                SqlParameter[] parameters = new SqlParameter[]
                {
                    new SqlParameter("@SubjectCode", txtSubjectCode.Text.Trim()),
                    new SqlParameter("@SubjectName", txtSubjectName.Text.Trim()),
                    new SqlParameter("@Credits", credits),
                    new SqlParameter("@SubjectID", System.Data.SqlDbType.Int) { Direction = System.Data.ParameterDirection.Output }
                };

                DataTable result = DatabaseHelper.ExecuteStoredProcedure("sp_AddNewSubject", parameters);

                if (result.Rows.Count > 0)
                {
                    string resultStatus = result.Rows[0]["Result"].ToString();
                    string message = result.Rows[0]["Message"].ToString();

                    if (resultStatus == "Success")
                    {
                        ShowMessage(message, "success");
                        
                        ClearSubjectFields();
                        LoadSubjects();
                    }
                    else
                    {
                        ShowMessage(message, "warning");
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage($"An error occurred: {ex.Message}", "danger");
            }
        }

        protected void btnClearSubject_Click(object sender, EventArgs e)
        {
            ClearSubjectFields();
        }

        private void ClearSubjectFields()
        {
            txtSubjectCode.Text = string.Empty;
            txtSubjectName.Text = string.Empty;
            txtCredits.Text = string.Empty;
        }

        private void ShowMessage(string message, string type)
        {
            lblMessage.Text = message;
            lblMessage.CssClass = $"alert alert-{type}";
            lblMessage.Visible = true;

            // Auto-hide success messages after 5 seconds
            if (type == "success")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "hideMessage", 
                    "setTimeout(function() { document.getElementById('" + lblMessage.ClientID + "').style.display = 'none'; }, 5000);", true);
            }
        }
    }
}
