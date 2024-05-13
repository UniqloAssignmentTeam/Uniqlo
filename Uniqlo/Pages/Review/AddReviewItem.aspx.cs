using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.Pages.Review
{
    public partial class AddReviewItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /*
        protected void submitRating_Click(object sender, EventArgs e)
        {
            int orderListId = int.Parse(HiddenOrderListID.Value); 
            int rating = int.Parse(HiddenRating.Value);
            string comment = commentTextArea.Text; // Make sure `commentTextArea` is a server control or properly retrieved

            // Insert into database
            using (var context = new ReviewDbContext())
            {
                Review review = new Review
                {
                    OrderList_ID = orderListId,
                    Rating = rating,
                    Review1 = comment,
                    Date_Submitted = DateTime.Now
                };
                context.Review.Add(review);
                context.SaveChanges();
            }

            Response.Redirect(Request.RawUrl);
        }
        */
    }
}