using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages
{
    public partial class EditReview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*
         * 
        private void BindRatingRepeater(int orderListId)
        {
            int orderID = int.Parse(Request.QueryString["Order_ID"]);

            using (var db = new OrderDbContext())
            {
                var orderDetails = db.OrderList
                                    .Where(ol => ol.Order_ID == orderID && ol.OrderList_ID == orderListId)
                                    .SelectMany(ol => ol.Reviews, (ol, r) => new
                                    {
                                        OrderList_ID = ol.OrderList_ID,
                                        Rating = r.Rating,
                                        Review = r.Review1
                                    })
                                    .FirstOrDefault();

                ratingRepeater.DataSource = new List<object> { orderDetails };
                ratingRepeater.DataBind();

                updateRatingRepeater.DataSource = new List<object> { orderDetails };
                updateRatingRepeater.DataBind();

            }
        }

        protected void updateRating_Click(object sender, EventArgs e)
        {

            int orderListId = int.Parse(HiddenOrderListID.Value);
            int rating = int.Parse(HiddenRatingUpdate.Value);
            TextBox txtComment = (TextBox)ratingRepeater.FindControl("commentTextArea2");


            string comment = txtComment.Text;
            ScriptManager.RegisterStartupScript(this, GetType(), "redirectError", "alert('" + orderListId + "," + rating + "," + comment + "');", true);


            using (var context = new ReviewDbContext())
            {
                Review review = context.Review.FirstOrDefault(r => r.OrderList_ID == orderListId);

                if (review != null)
                {
                    review.Rating = rating;
                    review.Review1 = comment;
                    review.Date_Submitted = DateTime.Now;
                }
                context.SaveChanges();
            }

            Response.Redirect(Request.RawUrl);
        }
        */
    }
}