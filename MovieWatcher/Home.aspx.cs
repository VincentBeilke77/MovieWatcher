using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieWatcher
{
    public partial class Home : Page
    {
        protected bool LoggedIn { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            CheckLogin();
        }

        private void CheckLogin()
        {
            LoggedIn = Request.Cookies["UserInfo"] != null;
        }

        protected void gdvMovies_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header
                || e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[1].Visible = false;
            }
        }

        protected void gdvMovies_SelectedIndexChanged(object sender, EventArgs e)
        {
            var row = gdvMovies.SelectedRow;
            Response.Redirect($"MovieDetails.aspx?id={row.Cells[1].Text}");
        }
    }
}