using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Uniqlo.AdminPages.AdminDiscount;
using static Uniqlo.Discount;

namespace Uniqlo.AdminPages
{
    public partial class addDiscount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownListProductName();
            }
                
        }
        protected void addBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                DateTime startInput;
                DateTime endInput;
                DateTime today = DateTime.Now.Date;
                bool startDateParsed = DateTime.TryParse(startDate.Text, out startInput);
                bool endDateParsed = DateTime.TryParse(endDate.Text, out endInput);
                DateTime startDateInput = startInput.Date;
                DateTime endDateInput = endInput.Date;
                if (!startDateParsed || !endDateParsed)
                {

                    return;
                }
                string status = (today >= startDateInput && today <= endDateInput) ? "Active" : "Inactive";

               

                using (var db = new DiscountDbContext())
                {
                    int productId= Int32.Parse(DdlProductName.SelectedValue);

                    Discount newDiscount = new Discount
                    {

                        Product_ID = productId,
                        Discount_Amount = float.Parse(discountAmount.Text),
                        Start_Date = startDateInput,
                        End_Date = endDateInput,
                        Status = status

                    };

                    db.Discount.Add(newDiscount);
                    db.SaveChanges();

                    Response.Redirect("DiscountHome.aspx");
                }
            }
        }

        private void DropDownListProductName()
        {
            using (var db = new ProductDbContext())
            {


                var products = db.Product
                                 .Where(p => !p.IsDeleted) 
                                 .Select(p => new { p.Product_ID, p.Product_Name })
                                 .ToList();

               
                DdlProductName.Items.Clear();

                
                DdlProductName.Items.Add(new ListItem("--Select Product--", ""));

                
                foreach (var product in products)
                {
                    ListItem item = new ListItem(product.Product_Name, product.Product_ID.ToString());
                    DdlProductName.Items.Add(item);
                }

            }
        }
        protected void cancelBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DiscountHome.aspx");
        }
    }
}