using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminDiscount
{
    public partial class DiscountHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }
        }
        protected void addDiscountBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("addDiscount.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            var item = button.NamingContainer as RepeaterItem;
            var discountIdLabel = item.FindControl("discountId") as Label;
            Session["discountId"] = discountIdLabel.Text;  
            Response.Redirect("UpdateDiscount.aspx");
        }
        
        protected void btnRemoveDiscount_Click(object sender, EventArgs e)
        {
            int discountId = int.Parse(hiddenDiscountId.Value); 
            using (var db = new DiscountDbContext())
            {
                var discount = db.Discount.Find(discountId);
                if (discount != null)
                {
                    db.Discount.Remove(discount);
                    db.SaveChanges();
                    Response.Redirect("DiscountHome.aspx");
                }
            }
        }

        private void BindRepeater()
        {
            using (var db = new DiscountDbContext())
            {
                var discountList = db.Discount.Include("Product").ToList(); // Ensure that you include the Product navigation property
                discountRepeater.DataSource = discountList;
                discountRepeater.DataBind();
            }
        }
    }
}