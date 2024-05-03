using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


using System.Security.Cryptography;
using System.Text;

using System.Web.Security;
using System.Security.Principal;
using System.Threading;     /*At the same time more than one user login so enable for multiprocessing*/

namespace Uniqlo
{
    public class Security
    {
        public static string getHash(string oriPass)
        {
            //encoding convert password in String format -> binary format
            byte[] binPass = Encoding.Default.GetBytes(oriPass);

            //create hash function
            SHA256 sha = SHA256.Create();

            //calculate the hash value based on SHA256 algorithm
            byte[] binHash = sha.ComputeHash(binPass);

            //convert binary -> string why? to store password in string in Database
            string strHash = Convert.ToBase64String(binHash);

            return strHash;

        }

        public static void LoginUser(string username, string role, bool rememberMe)
        {
            HttpContext ctx = HttpContext.Current;

            HttpCookie authCookie = FormsAuthentication.GetAuthCookie(username, rememberMe);
            FormsAuthenticationTicket oldTicket = FormsAuthentication.Decrypt(authCookie.Value);
            FormsAuthenticationTicket newTicket = new FormsAuthenticationTicket(
                oldTicket.Version,
                oldTicket.Name,
                oldTicket.IssueDate,
                oldTicket.Expiration,
                oldTicket.IsPersistent,
                role
            );
            authCookie.Value = FormsAuthentication.Encrypt(newTicket);
            ctx.Response.Cookies.Add(authCookie);

            string redirectUrl = FormsAuthentication.GetRedirectUrl(username, rememberMe);
            ctx.Response.Redirect(redirectUrl);
        }

        public static void ProcessRoles()
        {
            HttpContext ctx = HttpContext.Current;

            if (ctx.User != null &&
                ctx.User.Identity.IsAuthenticated &&
                ctx.User.Identity is FormsIdentity)
            {
                FormsIdentity identity = (FormsIdentity)ctx.User.Identity;
                string[] roles = identity.Ticket.UserData.Split(',');

                GenericPrincipal principal = new GenericPrincipal(identity, roles);
                ctx.User = principal;
                Thread.CurrentPrincipal = principal;
            }
        }
    }
}