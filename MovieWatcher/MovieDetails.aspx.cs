using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MovieWatcher.Models;

namespace MovieWatcher
{
    public partial class MovieDetails : Page
    {
        protected bool InWatchList { get; set; }
        protected bool LoggedIn { get; set; }
        public Movie Movie { get; set; }
        private int _userId;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin();

            if (Request.QueryString["id"] == null) return;
            var movieId = int.Parse(Request.QueryString["id"]);
            LoadMovie(movieId);

            CheckWatchList();
        }

        private void CheckLogin()
        {
            LoggedIn = Request.Cookies["UserInfo"] != null;
            var userCookie = Request.Cookies["UserInfo"];
            if (userCookie != null) _userId = Convert.ToInt32(userCookie["UserId"]);
        }

        private void LoadMovie(int movieId)
        {
            Movie = new Movie();
            var connectionString = ConfigurationManager.ConnectionStrings["strConnection"].ConnectionString;

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand("GetMovieDetails", conn))
                    {;
                        var parameter = new SqlParameter("@MovieId", movieId);
                        cmd.Parameters.Add(parameter);
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Movie.Id = movieId;
                                Movie.Title = reader["MovieTitle"].ToString();
                                Movie.Description = reader["MovieDescription"].ToString();
                                Movie.RatingId = Movie.Rating.Id = int.Parse(reader["RatingId"].ToString());
                                Movie.TrailerId = Movie.Trailer.Id = int.Parse(reader["TrailerId"].ToString());
                                Movie.Rating.Name = reader["RatingName"].ToString();
                                Movie.Rating.Description = reader["RatingDescription"].ToString();
                                Movie.Trailer.Name = reader["TrailerName"].ToString();
                                Movie.Trailer.TrailerLink = reader["TrailerLink"].ToString();
                            }
                        }
                    }
                }

                ltlTrailerLink.Text = Movie.Trailer.TrailerLink;
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex);
                pnlError.Visible = true;
                lblError.Text = "There was an error while loading the movie, please try again later.";
            }
        }

        private void CheckWatchList()
        {
            var connectionString = ConfigurationManager.ConnectionStrings["strConnection"].ConnectionString;

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    using (var cmd = new SqlCommand("CheckForWatchList", conn))
                    {
                        var parameter1 = new SqlParameter("@UserId", _userId);
                        var parameter2 = new SqlParameter("@MovieId", Movie.Id);
                        cmd.Parameters.Add(parameter1);
                        cmd.Parameters.Add(parameter2);
                        cmd.CommandType = CommandType.StoredProcedure;
                        var exists = (int)cmd.ExecuteScalar();
                        InWatchList = exists > 0;
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex);
            }
        }

        protected void lnbWatchList_Click(object sender, EventArgs e)
        {
            var connectionString = ConfigurationManager.ConnectionStrings["strConnection"].ConnectionString;

            try
            {
                using (var conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (var cmd = new SqlCommand("AddMovieToWatchList", conn))
                    {
                        var parameter1 = new SqlParameter("@UserId", _userId);
                        var parameter2 = new SqlParameter("@MovieId", Movie.Id);
                        cmd.Parameters.Add(parameter1);
                        cmd.Parameters.Add(parameter2);
                        cmd.CommandType = CommandType.StoredProcedure;

                        using (var reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Movie.Title = reader["MovieTitle"].ToString();
                                Movie.Description = reader["MovieDescription"].ToString();
                                Movie.RatingId = Movie.Rating.Id = int.Parse(reader["RatingId"].ToString());
                                Movie.TrailerId = Movie.Trailer.Id = int.Parse(reader["TrailerId"].ToString());
                                Movie.Rating.Name = reader["RatingName"].ToString();
                                Movie.Rating.Description = reader["RatingDescription"].ToString();
                                Movie.Trailer.Name = reader["TrailerName"].ToString();
                                Movie.Trailer.TrailerLink = reader["TrailerLink"].ToString();
                            }
                        }
                    }
                }

                ltlTrailerLink.Text = Movie.Trailer.TrailerLink;
            }
            catch (SqlException ex)
            {
                Console.WriteLine(ex);
                pnlError.Visible = true;
                lblError.Text = "There was an error while loading the movie, please try again later.";
            }
        }
    }
}