using System;
using System.Data.SqlClient;
using System.IO;
using System.Text;
using StudentRegistrationSystem.Models;

namespace StudentRegistrationSystem
{
    public partial class Setup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtServerName.Text = ".";
                ddlAuth.SelectedValue = "Integrated";
            }
        }

        protected void ddlAuth_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAuth.SelectedValue == "SQL")
            {
                // Show SQL auth fields
                ScriptManager.RegisterStartupScript(this, typeof(Page), "ShowSQLAuth",
                    "document.getElementById('sqlAuthDiv').style.display = 'block';", true);
            }
            else
            {
                // Hide SQL auth fields
                ScriptManager.RegisterStartupScript(this, typeof(Page), "HideSQLAuth",
                    "document.getElementById('sqlAuthDiv').style.display = 'none';", true);
            }
        }

        protected void btnTestConnection_Click(object sender, EventArgs e)
        {
            try
            {
                string connString = BuildConnectionString();
                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    ShowConnectionStatus("✓ Connection successful!", "success");
                }
            }
            catch (Exception ex)
            {
                ShowConnectionStatus($"✗ Connection failed: {ex.Message}", "danger");
            }
        }

        protected void btnCreateDatabase_Click(object sender, EventArgs e)
        {
            try
            {
                string connString = BuildConnectionString();
                ExecuteSQLScript(connString, "Database/CreateDatabase.sql", "Database");
            }
            catch (Exception ex)
            {
                ShowDatabaseStatus($"✗ Error: {ex.Message}", "danger");
            }
        }

        protected void btnCreateStoredProcedures_Click(object sender, EventArgs e)
        {
            try
            {
                string connString = BuildConnectionString();
                ExecuteSQLScript(connString, "Database/StoredProcedures.sql", "Stored Procedures");
            }
            catch (Exception ex)
            {
                ShowStoredProcStatus($"✗ Error: {ex.Message}", "danger");
            }
        }

        private string BuildConnectionString()
        {
            string server = txtServerName.Text.Trim();
            if (string.IsNullOrEmpty(server)) server = ".";

            if (ddlAuth.SelectedValue == "Integrated")
            {
                return $"Data Source={server};Initial Catalog=master;Integrated Security=True;";
            }
            else
            {
                string username = txtUsername.Text.Trim();
                string password = txtPassword.Text.Trim();
                return $"Data Source={server};Initial Catalog=master;User ID={username};Password={password};";
            }
        }

        private void ExecuteSQLScript(string connString, string scriptPath, string scriptName)
        {
            try
            {
                string fullPath = Server.MapPath("~/" + scriptPath);
                if (!File.Exists(fullPath))
                {
                    if (scriptName == "Database")
                        ShowDatabaseStatus($"✗ Script file not found: {scriptPath}", "danger");
                    else
                        ShowStoredProcStatus($"✗ Script file not found: {scriptPath}", "danger");
                    return;
                }

                string scriptContent = File.ReadAllText(fullPath);

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();

                    // Split by GO statements
                    string[] sqlBatches = scriptContent.Split(new[] { "\nGO", "\r\nGO" }, StringSplitOptions.RemoveEmptyEntries);

                    foreach (string batch in sqlBatches)
                    {
                        if (string.IsNullOrWhiteSpace(batch)) continue;

                        using (SqlCommand cmd = new SqlCommand(batch, conn))
                        {
                            cmd.CommandTimeout = 300;
                            cmd.ExecuteNonQuery();
                        }
                    }
                }

                if (scriptName == "Database")
                    ShowDatabaseStatus($"✓ {scriptName} created successfully!", "success");
                else
                    ShowStoredProcStatus($"✓ {scriptName} created successfully!", "success");
            }
            catch (Exception ex)
            {
                if (scriptName == "Database")
                    ShowDatabaseStatus($"✗ Error: {ex.Message}", "danger");
                else
                    ShowStoredProcStatus($"✗ Error: {ex.Message}", "danger");
            }
        }

        private void ShowConnectionStatus(string message, string type)
        {
            lblConnectionStatus.Text = message;
            lblConnectionStatus.CssClass = $"badge bg-{type}";
            lblConnectionStatus.Visible = true;
        }

        private void ShowDatabaseStatus(string message, string type)
        {
            lblDatabaseStatus.Text = message;
            lblDatabaseStatus.CssClass = $"badge bg-{type}";
            lblDatabaseStatus.Visible = true;
        }

        private void ShowStoredProcStatus(string message, string type)
        {
            lblStoredProcStatus.Text = message;
            lblStoredProcStatus.CssClass = $"badge bg-{type}";
            lblStoredProcStatus.Visible = true;
        }
    }
}
