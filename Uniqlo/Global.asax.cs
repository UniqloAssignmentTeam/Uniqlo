using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Uniqlo
{
    public class Global : System.Web.HttpApplication
    {
        public const string CS = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Uniqlo.mdf;Integrated Security=True";
        protected void Application_Start(object sender, EventArgs e)
        {
           //RoleManagement roleManagement = new RoleManagement();
            //roleManagement.AddRoles();
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session.Timeout = 120;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }

    }
}