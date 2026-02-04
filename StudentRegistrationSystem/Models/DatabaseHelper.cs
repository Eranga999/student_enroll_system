using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace StudentRegistrationSystem.Models
{
    public class DatabaseHelper
    {
        private static string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["StudentRegistrationDB"].ConnectionString;
        }

        /// <summary>
        /// Checks if the database connection is working and database exists
        /// </summary>
        public static bool CheckDatabaseConnection()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(GetConnectionString()))
                {
                    conn.Open();
                    return true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Database Connection Error: {ex.Message}");
                return false;
            }
        }

        /// <summary>
        /// Gets the master connection string (for creating database)
        /// </summary>
        private static string GetMasterConnectionString()
        {
            string connString = GetConnectionString();
            // Replace StudentRegistrationDB with master
            return connString.Replace("StudentRegistrationDB", "master");
        }

        /// <summary>
        /// Creates database if it doesn't exist
        /// </summary>
        public static bool CreateDatabaseIfNotExists()
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(GetMasterConnectionString()))
                {
                    conn.Open();
                    
                    // Check if database exists
                    string checkDbQuery = "SELECT database_id FROM sys.databases WHERE name = 'StudentRegistrationDB'";
                    using (SqlCommand cmd = new SqlCommand(checkDbQuery, conn))
                    {
                        object result = cmd.ExecuteScalar();
                        if (result != null)
                        {
                            // Database exists
                            return true;
                        }
                    }

                    // Database doesn't exist, create it
                    string createDbQuery = "CREATE DATABASE StudentRegistrationDB";
                    using (SqlCommand cmd = new SqlCommand(createDbQuery, conn))
                    {
                        cmd.ExecuteNonQuery();
                    }

                    return true;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"Create Database Error: {ex.Message}");
                return false;
            }
        }


        public static DataTable ExecuteQuery(string query)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }
            return dt;
        }

        public static DataTable ExecuteStoredProcedure(string procedureName, SqlParameter[] parameters = null)
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(procedureName, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    conn.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }
            return dt;
        }

        public static int ExecuteNonQuery(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    conn.Open();
                    return cmd.ExecuteNonQuery();
                }
            }
        }

        public static object ExecuteScalar(string query, SqlParameter[] parameters = null)
        {
            using (SqlConnection conn = new SqlConnection(GetConnectionString()))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (parameters != null)
                    {
                        cmd.Parameters.AddRange(parameters);
                    }

                    conn.Open();
                    return cmd.ExecuteScalar();
                }
            }
        }
    }
}
