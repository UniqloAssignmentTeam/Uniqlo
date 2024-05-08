﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using static Uniqlo.Image;
using static Uniqlo.Product;

namespace Uniqlo.AdminPages
{
    public partial class UpdateProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                formView.DataBound += new EventHandler(formView_DataBound);

                int productId = 0;
                if (Request.QueryString["ProdID"] != null && int.TryParse(Request.QueryString["ProdID"], out productId))
                {
                    BindFormView(productId); 
                }
            }

        }

        private void BindFormView(int productId)
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


        protected void updateButton_Click(object sender, EventArgs e)
        {

        }        
        
        protected void btnDelete_Click(object sender, CommandEventArgs e)
        {
            int imageId = Convert.ToInt32(e.CommandArgument);


            using (var dbContext = new ImageDbContext())  
            {
                var quantitiesToDelete = dbContext.Quantities.Where(q => q.Image_ID == imageId).ToList();

                foreach (var quantity in quantitiesToDelete)
                {
                    dbContext.Quantities.Remove(quantity);
                }

                dbContext.SaveChanges();
            }
        }
    }
}