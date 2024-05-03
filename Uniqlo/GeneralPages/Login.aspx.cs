using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Uniqlo.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        UniqloEntities1 db = new UniqloEntities1();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;

                // Login the user
                //find db and retrieve only one 

                //compare username received and stored whether their hash is same
                Customer u = db.Customers.SingleOrDefault(x => x.Username == username && x.Password == password);       //aspx dont allow function inside lambda
                Staff s = db.Customers.SingleOrDefault(x => x.Username == username && x.Password == password);       //aspx dont allow function inside lambda

                if (u != null)
                {
                    //user object found, correct username and password
                    //FormsAuthentication.RedirectFromLoginPage(u.Username, rememberMe);


                    //call security class, new login function that will process role
                    Security.LoginUser(u.Username, u.Role, rememberMe);     //user object come from view
                }
                else
                {
                    //user object not found, wrong username wrong password
                    cvNotMatched.IsValid = false;       //display error msg

                }

            }
        }
    }
}