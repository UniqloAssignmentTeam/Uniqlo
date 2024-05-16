using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Uniqlo
{
    public class SessionRoleProvider : RoleProvider
    {
        public override string Name => base.Name;

        public override string Description => base.Description;

        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override string[] GetRolesForUser(string username)
        {
            string role = (string)HttpContext.Current.Session["UserRole"];
            if (!string.IsNullOrEmpty(role))
            {
                return new[] { role };
            }
            return new string[] { };
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            // Check if the roleNames array contains only the roles present in your system
            foreach (var roleName in roleNames)
            {
                if (roleName != "Admin" && roleName != "Staff" && roleName != "Manager" && roleName != "Customer" && roleName != "?")
                {
                    throw new ArgumentException("Invalid role name.");
                }
            }

            // Assign each user to the specified roles
            foreach (var username in usernames)
            {
                // Check if the user is already assigned to any of the specified roles
                var userRoles = GetRolesForUser(username);
                foreach (var roleName in roleNames)
                {
                    if (!userRoles.Contains(roleName))
                    {
                        // Assign the user to the role
                        // You can implement your logic here to store this information
                        // For example, you can update a database table or store it in session
                        // Here, we are assuming the roles are stored in session
                        List<string> updatedRoles = new List<string>(userRoles);
                        updatedRoles.Add(roleName);
                        HttpContext.Current.Session["UserRole"] = string.Join(",", updatedRoles);
                    }
                }
            }
        }

        #region Not Implemented Methods

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            throw new NotImplementedException();
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string ToString()
        {
            return base.ToString();
        }

        public override bool Equals(object obj)
        {
            return base.Equals(obj);
        }

        public override int GetHashCode()
        {
            return base.GetHashCode();
        }

        public override void Initialize(string name, NameValueCollection config)
        {
            base.Initialize(name, config);
        }

        #endregion
    }

}