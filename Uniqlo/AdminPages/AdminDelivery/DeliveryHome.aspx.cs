using OfficeOpenXml;
using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminDelivery
{
    public partial class DeliveryHome : System.Web.UI.Page
    {
        string cs = Global.CS;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["StaffRole"]==null)
                {
                    // Redirect to adminLogin.aspx if the session role is invalid or not set
                    Response.Redirect("adminLogin.aspx");
                    Session["Unauthorized"] = true;
                }
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
            Payment p ON d.Delivery_ID = p.Delivery_ID
        ORDER BY 
            d.Delivery_ID ASC";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptDeliveries.DataSource = dt;
                        rptDeliveries.DataBind();
                        noDeliveryLabel.Visible = dt.Rows.Count == 0;
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

                if (!string.IsNullOrEmpty(selectedStatus))
                {
                    query += " WHERE d.Delivery_Status = @DeliveryStatus";
                }

                query += " ORDER BY d.Delivery_ID ASC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    if (!string.IsNullOrEmpty(selectedStatus))
                    {
                        cmd.Parameters.AddWithValue("@DeliveryStatus", selectedStatus);
                    }

                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptDeliveries.DataSource = dt;
                        rptDeliveries.DataBind();
                        noDeliveryLabel.Visible = dt.Rows.Count == 0;
                    }
                }
            }
        }

        protected void btnRemoveDelivery_Click(object sender, EventArgs e)
        {
            int deliveryId = Convert.ToInt32(hiddenDeliveryId.Value);
            string connectionString = cs;

            using (var connection = new SqlConnection(connectionString))
            {
                connection.Open();

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

                string updateDeliveryQuery = "UPDATE Delivery SET Address_ID = NULL WHERE Delivery_ID = @DeliveryID";
                using (var updateDeliveryCmd = new SqlCommand(updateDeliveryQuery, connection))
                {
                    updateDeliveryCmd.Parameters.AddWithValue("@DeliveryID", deliveryId);
                    updateDeliveryCmd.ExecuteNonQuery();
                }

                string deleteAddressQuery = "DELETE FROM Shipping_Address WHERE Address_ID = @AddressID";
                using (var deleteAddressCmd = new SqlCommand(deleteAddressQuery, connection))
                {
                    deleteAddressCmd.Parameters.AddWithValue("@AddressID", addressId);
                    deleteAddressCmd.ExecuteNonQuery();
                }

                string updatePaymentQuery = "UPDATE Payment SET Delivery_ID = NULL WHERE Delivery_ID = @DeliveryID";
                using (var updatePaymentCmd = new SqlCommand(updatePaymentQuery, connection))
                {
                    updatePaymentCmd.Parameters.AddWithValue("@DeliveryID", deliveryId);
                    updatePaymentCmd.ExecuteNonQuery();
                }

                string deleteDeliveryQuery = "DELETE FROM Delivery WHERE Delivery_ID = @DeliveryID";
                using (var deleteDeliveryCmd = new SqlCommand(deleteDeliveryQuery, connection))
                {
                    deleteDeliveryCmd.Parameters.AddWithValue("@DeliveryID", deliveryId);
                    deleteDeliveryCmd.ExecuteNonQuery();
                }
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "showDeleteSuccess", "showDeleteSuccess();", true);
        }

        protected void searchBox_TextChanged(object sender, EventArgs e)
        {
            string searchTerm = searchBox.Text.Trim();
            int deliveryID;
            bool isValidDeliveryID = int.TryParse(searchTerm, out deliveryID);

            // Base query
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

            DataTable dt = new DataTable();

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // Check if the search term is a valid integer
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        if (isValidDeliveryID)
                        {
                            query += " WHERE d.Delivery_ID = @DeliveryID";
                            cmd.Parameters.AddWithValue("@DeliveryID", deliveryID);
                        }
                        else
                        {
                            query += " WHERE 1 = 0"; // Ensure no results for non-integer input
                        }
                    }

                    query += " ORDER BY d.Delivery_ID ASC";
                    cmd.CommandText = query;

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(dt);
                    }
                }
            }

            // Bind the data to the Repeater
            rptDeliveries.DataSource = dt.Rows.Count > 0 ? dt : null;
            rptDeliveries.DataBind();
            noDeliveryLabel.Visible = dt.Rows.Count == 0;
        }







        protected void addDeliveryBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDelivery.aspx");
        }

        protected void btnExcel_Click(object sender, EventArgs e)
        {
            string connectionString = cs;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

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
            Payment p ON d.Delivery_ID = p.Delivery_ID
        ORDER BY 
            d.Delivery_ID ASC");

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
