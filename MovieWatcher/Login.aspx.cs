using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Helpers;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MovieWatcher.Models;

namespace MovieWatcher
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var user = ValidateUser();

            if (user == null) return;

            var cookie = new HttpCookie("UserInfo")
            {
                ["Username"] = user.Username, 
                ["Email"] = user.Email,
                ["FirstName"] = user.FirstName,
                ["LastName"] = user.LastName,
                ["Address"] = user.Address,
                ["City"] = user.City,
                ["State"] = user.State,
                ["Zip"] = user.Zip,
                ["Phone"] = user.Phone
            };

            if (chkRememberMe.Checked)
            {
                cookie.Expires = DateTime.Now.AddDays(14);
            }
            else
            {
                cookie.Expires = DateTime.Now.AddMinutes(30);
            }

            Response.Cookies.Add(cookie);

            Response.Redirect("Home.aspx");
        }

        private User ValidateUser()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["strConnection"].ConnectionString;
            User user = null;
            try
            {
                string password = null;

                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("GetMovieWatcherUser", conn))
                    {
                        var parameter = new SqlParameter("@Username", txtEmail.Text);
                        cmd.Parameters.Add(parameter);
                        cmd.CommandType = CommandType.StoredProcedure;
                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                password = reader["Password"].ToString();

                                user = new User()
                                {
                                    Username = reader["Username"].ToString(),
                                    Email = reader["Email"].ToString(),
                                    FirstName = reader["FirstName"].ToString(),
                                    LastName = reader["LastName"].ToString(),
                                    Address = reader["Address"].ToString(),
                                    City = reader["City"].ToString(),
                                    State = reader["State"].ToString(),
                                    Zip = reader["Zip"].ToString(),
                                    Phone = reader["Phone"].ToString()
                                };
                            }
                        }
                    }
                }

                if (string.IsNullOrEmpty(password))
                {
                    pnlError.Visible = true;
                    lblError.Text = "User was not found, please try again.";
                    return null;
                }

                if (Crypto.VerifyHashedPassword(password, txtPassword.Text)) return user;

                pnlError.Visible = true;
                lblError.Text = "Password incorrect, please try again.";
                return null;

            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex);
                pnlError.Visible = true;
                lblError.Text = "There was an error logging you in, please try again later.";
            }

            return null;
        }
    }
}