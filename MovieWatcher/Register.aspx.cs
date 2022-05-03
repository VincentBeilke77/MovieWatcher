using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.UI;
using System.Web.UI.WebControls;
using MovieWatcher.Models;

namespace MovieWatcher
{
    public partial class Register : Page
    {
        private User RegisterUser { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            LoadValues();
            var connectionString = ConfigurationManager.ConnectionStrings["strConnection"].ConnectionString;

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("CheckForExisting", conn))
                    {
                        var parameter = new SqlParameter("@Email", txtEmail.Text);
                        cmd.Parameters.Add(parameter);
                        cmd.CommandType = CommandType.StoredProcedure;
                        var exists = (int) cmd.ExecuteScalar();
                        if (exists > 0)
                        {
                            pnlError.Visible = true;
                            lblError.Text = "Email already in use";
                        }
                        else
                        {
                            pnlError.Visible = false;
                        }
                    }

                    using (var cmd = new SqlCommand("RegisterNewUser", conn))
                    {
                        var parameters = CreateParameters();
                        cmd.Parameters.AddRange(parameters);
                        cmd.CommandType = CommandType.StoredProcedure;
                        var id = (int) cmd.ExecuteScalar();
                        RegisterUser.Id = id;
                    }

                    Response.Redirect("Login.aspx");
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex);
                pnlError.Visible = true;
                lblError.Text = "There was an error while registering you, please try again later.";
            }
        }

        private SqlParameter[] CreateParameters()
        {
            return new[]
            {
                new SqlParameter("@Username", RegisterUser.Username),
                new SqlParameter("@Password", RegisterUser.Password),
                new SqlParameter("@Email", RegisterUser.Email),
                new SqlParameter("@FirstName", RegisterUser.FirstName),
                new SqlParameter("@LastName", RegisterUser.LastName),
                new SqlParameter("@Address", RegisterUser.Address),
                new SqlParameter("@City", RegisterUser.City),
                new SqlParameter("@State", RegisterUser.State),
                new SqlParameter("@Zip", RegisterUser.Zip),
                new SqlParameter("@Phone", RegisterUser.Phone)
            };
        }

        private void LoadValues()
        {
            RegisterUser = new User
            {
                Username = txtEmail.Text, 
                Email = txtEmail.Text,
                Password = Crypto.HashPassword(txtPassword.Text),
                FirstName = txtFirstName.Text,
                LastName = txtLastName.Text,
                Address = txtAddress.Text,
                City = txtCity.Text,
                State = txtState.Text,
                Zip = txtZip.Text,
                Phone = txtPhone.Text
            };
        }
    }
}