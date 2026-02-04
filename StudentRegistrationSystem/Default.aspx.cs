using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using StudentRegistrationSystem.Models;

namespace StudentRegistrationSystem
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStatistics();
            }
        }

        private void LoadStatistics()
        {
            try
            {
                // Get total students
                DataTable studentsResult = DatabaseHelper.ExecuteStoredProcedure("sp_GetAllStudents");
                int totalStudents = studentsResult.Rows.Count;
                lblTotalStudents.Text = totalStudents.ToString();

                // Get total subjects
                DataTable subjectsResult = DatabaseHelper.ExecuteStoredProcedure("sp_GetAllSubjects");
                int totalSubjects = subjectsResult.Rows.Count;
                lblTotalSubjects.Text = totalSubjects.ToString();

                // Get total enrollments
                string enrollmentQuery = "SELECT COUNT(*) as Total FROM StudentSubjects";
                DataTable enrollmentResult = DatabaseHelper.ExecuteQuery(enrollmentQuery);
                int totalEnrollments = enrollmentResult.Rows.Count > 0 ? Convert.ToInt32(enrollmentResult.Rows[0]["Total"]) : 0;
                lblTotalEnrollments.Text = totalEnrollments.ToString();
            }
            catch (Exception ex)
            {
                // If database is not available, show 0
                lblTotalStudents.Text = "0";
                lblTotalSubjects.Text = "0";
                lblTotalEnrollments.Text = "0";
            }
        }
    }
}