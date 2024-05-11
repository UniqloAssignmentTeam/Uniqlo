using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Uniqlo.Product;
using Uniqlo.Pages;
using static Uniqlo.Staff;
using OfficeOpenXml;
using System.IO;
using System.Text;

namespace Uniqlo.AdminPages.AdminDelivery
{
    public partial class DeliveryHome : System.Web.UI.Page
    {
        string cs = Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRepeater();
            }

        }
        private void bindRepeater()
        {
            string connString = cs;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = @"
            SELECT 
                d.Delivery_ID,
                sa.Address + ', ' + sa.State + ', ' + sa.City + ', ' + sa.Postcode + ', ' + sa.Country AS DeliveryAddress,
                d.Delivery_Status,
                p.Order_ID
            FROM 
                Delivery d
            INNER JOIN 
                Shipping_Address sa ON d.Address_ID = sa.Address_ID
            INNER JOIN 
                Payment p ON d.Delivery_ID = p.Delivery_ID";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptDeliveries.DataSource = dt;
                        rptDeliveries.DataBind();
                    }
                }
            }
        }

        protected void statusSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connString = cs;
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string selectedStatus = statusSortDDL.SelectedValue;
                string query = @"
            SELECT 
                d.Delivery_ID,
                CONCAT(sa.Address, ', ', sa.State, ', ', sa.City, ', ', sa.Postcode, ', ', sa.Country) AS DeliveryAddress,
                d.Delivery_Status,
                p.Order_ID
            FROM 
                Delivery d
            INNER JOIN 
                Shipping_Address sa ON d.Address_ID = sa.Address_ID
            INNER JOIN 
                Payment p ON d.Delivery_ID = p.Delivery_ID";

                // If a specific status is selected, filter by that status
                if (!string.IsNullOrEmpty(selectedStatus))
                {
                    query += $" WHERE d.Delivery_Status = '{selectedStatus}'";
                }

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptDeliveries.DataSource = dt;
                        rptDeliveries.DataBind();
                    }
                }
            }
        }

        protected void btnRemoveDelivery_Click(object sender, EventArgs e)
        {
            int deliveryId = Convert.ToInt32(hiddenDeliveryId.Value); // Retrieve the Delivery ID
            string connectionString = cs;

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

                // Step 1: Retrieve the Address_ID associated with the given Delivery_ID
                int addressId = 0;
                string getAddressIdQuery = "SELECT Address_ID FROM Delivery WHERE Delivery_ID = @DeliveryID";
                using (var getAddressIdCmd = new SqlCommand(getAddressIdQuery, connection))
                {
                    getAddressIdCmd.Parameters.AddWithValue("@DeliveryID", deliveryId);
                    using (var reader = getAddressIdCmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            addressId = Convert.ToInt32(reader["Address_ID"]);
                        }
                    }
                }

                // Step 2: Set the Address_ID in the Delivery table to null for the corresponding Delivery_ID
                string updateDeliveryQuery = "UPDATE Delivery SET Address_ID = NULL WHERE Delivery_ID = @DeliveryID";
                using (var updateDeliveryCmd = new SqlCommand(updateDeliveryQuery, connection))
                {
                    updateDeliveryCmd.Parameters.AddWithValue("@DeliveryID", deliveryId);
                    updateDeliveryCmd.ExecuteNonQuery();
                }

                // Step 3: Delete the Address record associated with the retrieved Address_ID
                string deleteAddressQuery = "DELETE FROM Shipping_Address WHERE Address_ID = @AddressID";
                using (var deleteAddressCmd = new SqlCommand(deleteAddressQuery, connection))
                {
                    deleteAddressCmd.Parameters.AddWithValue("@AddressID", addressId);
                    deleteAddressCmd.ExecuteNonQuery();
                }

                // Step 4: Set the Delivery_ID in the Payment table to null for the corresponding Delivery_ID
                string updatePaymentQuery = "UPDATE Payment SET Delivery_ID = NULL WHERE Delivery_ID = @DeliveryID";
                using (var updatePaymentCmd = new SqlCommand(updatePaymentQuery, connection))
                {
                    updatePaymentCmd.Parameters.AddWithValue("@DeliveryID", deliveryId);
                    updatePaymentCmd.ExecuteNonQuery();
                }

                // Step 5: Delete the Delivery record associated with the given Delivery_ID
                string deleteDeliveryQuery = "DELETE FROM Delivery WHERE Delivery_ID = @DeliveryID";
                using (var deleteDeliveryCmd = new SqlCommand(deleteDeliveryQuery, connection))
                {
                    deleteDeliveryCmd.Parameters.AddWithValue("@DeliveryID", deliveryId);
                    deleteDeliveryCmd.ExecuteNonQuery();
                }
            }
            Response.Redirect(Request.RawUrl);

        }

        protected void searchBox_TextChanged(object sender, EventArgs e)
        {
            string searchTerm = searchBox.Text.Trim();
            string query = @"
SELECT 
    d.Delivery_ID,
    sa.Address + ', ' + sa.State + ', ' + sa.City + ', ' + sa.Postcode + ', ' + sa.Country AS DeliveryAddress,
    d.Delivery_Status,
    p.Order_ID
FROM 
    Delivery d
INNER JOIN 
    Shipping_Address sa ON d.Address_ID = sa.Address_ID
INNER JOIN 
    Payment p ON d.Delivery_ID = p.Delivery_ID";

            // If the search term is empty, do not filter by delivery ID
            if (!string.IsNullOrEmpty(searchTerm))
            {
                query += " WHERE d.Delivery_ID = @DeliveryID";
            }

            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(Global.CS))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Add parameter only if the search term is not empty
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@DeliveryID", searchTerm);
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            rptDeliveries.DataSource = dt;
            rptDeliveries.DataBind();
        }


        protected void addDeliveryBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDelivery.aspx");
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            string connectionString = cs; // Ensure this is correctly defined
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();  // Ensure the connection is opened before executing the command

                StringBuilder query = new StringBuilder(@"
            SELECT 
                d.Delivery_ID,
                sa.Address + ', ' + sa.State + ', ' + sa.City + ', ' + sa.Postcode + ', ' + sa.Country AS DeliveryAddress,
                d.Delivery_Status,
                p.Order_ID
            FROM 
                Delivery d
            INNER JOIN 
                Shipping_Address sa ON d.Address_ID = sa.Address_ID
            INNER JOIN 
                Payment p ON d.Delivery_ID = p.Delivery_ID");

                using (SqlCommand cmd = new SqlCommand(query.ToString(), conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        using (ExcelPackage pck = new ExcelPackage())
                        {
                            ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Delivery");
                            ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);
                            var memoryStream = new MemoryStream();
                            pck.SaveAs(memoryStream);
                            memoryStream.Position = 0;

                            HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                            HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=DeliveryDetails.xlsx");
                            HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                            HttpContext.Current.Response.End();
                        }
                    }
                }
            }
        }
    }
}
