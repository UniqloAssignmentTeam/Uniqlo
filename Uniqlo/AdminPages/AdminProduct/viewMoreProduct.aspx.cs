using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;
using System.Data.Entity;

namespace Uniqlo.AdminPages
{
    public partial class viewMoreProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                formView.DataBound += new EventHandler(formView_DataBound);

                int productId = 0;
                if (Request.QueryString["ProdID"] != null && int.TryParse(EncryptionHelper.Decrypt(Request.QueryString["ProdID"]), out productId))
                {
                    BindFormView(productId);
                }
            }
        }

        private void BindFormView(int productId)
        {
            try
            {
                using (var db = new ProductDbContext())
                {
                    var productList = db.Product
                        .Where(p => p.Product_ID == productId)
                        .Include(p => p.Category)
                        .Include(p => p.Quantities.Select(q => q.Image))
                        .Select(p => new
                        {
                            Product_ID = p.Product_ID,
                            Product_Name = p.Product_Name,
                            Description = p.Description,
                            Price = p.Price,
                            Category = p.Category,
                            ColorGroups = p.Quantities
                                .Where(q => q.IsDeleted == false)
                                .GroupBy(q => q.Color)
                                .Select(g => new
                                {
                                    Color = g.Key,
                                    Quantities = g.ToList(),
                                    FirstImageId = g.Select(q => q.Image_ID).FirstOrDefault()
                                }).ToList()
                        }).ToList();


                    formView.DataSource = productList;
                    formView.DataBind();
                }
            }
            catch (Exception ex)
            {

                // Optionally display error message on the page
                ScriptManager.RegisterStartupScript(this, GetType(), "errorAlert", "alert('An error occurred when Retrieving product.');", true);
            }

        }

        protected void dataList_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var repeater = e.Item.FindControl("RepeaterSizes") as Repeater;
                if (repeater != null)
                {
                    var quantities = ((dynamic)e.Item.DataItem).Quantities;
                    repeater.DataSource = quantities;
                    repeater.DataBind();
                }
                else
                {
                    // Log error or handle case where repeater is not found
                }
            }
        }




        protected void formView_DataBound(object sender, EventArgs e)
        {
            if (formView.DataItem != null)
            {
                DataList dataList = formView.FindControl("dataList") as DataList;
                if (dataList != null)
                {
                    var data = ((dynamic)formView.DataItem).ColorGroups;
                    dataList.DataSource = data;
                    dataList.DataBind();
                }
                else
                {
                    // Log error or handle case where dataList is not found
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("/AdminPages/AdminProduct/ProductHome.aspx");
        }
    }
}