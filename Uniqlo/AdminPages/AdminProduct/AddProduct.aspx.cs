using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using Uniqlo.AdminPages.AdminProduct;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Web.Services.Description;
using System.Diagnostics;
using Uniqlo.AdminPages.AdminStaff;


namespace Uniqlo.AdminPages
{
    public partial class AddProduct : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
        }

        public class ColorSize
        {
            public string Color { get; set; }
            public string Size { get; set; }
            public string Image { get; set; }
        }
        
        
    }
}