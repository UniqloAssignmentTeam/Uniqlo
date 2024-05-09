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

                    Discount newDiscount = new Discount
                    {

                        Product_ID = Int32.Parse(productID.Text),
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
    }
}