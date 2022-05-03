﻿using System;
using System.Web;
using System.Web.UI;

namespace MovieWatcher
{
    public partial class MovieWatcher : MasterPage
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

        protected void lnbLogout_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["UserInfo"] != null)
            {
                var cookie = new HttpCookie("UserInfo") {Expires = DateTime.Now.AddDays(-1)};
                Response.Cookies.Add(cookie);
            }

            Response.Redirect("Home.aspx");
        }
    }
}