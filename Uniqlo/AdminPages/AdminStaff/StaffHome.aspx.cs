using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Uniqlo.AdminPages.AdminStaff
{

    public partial class StaffHome : System.Web.UI.Page
    {
       
        string cs=Global.CS;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindRepeater();
            }

        }
        protected void addStaffBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("StaffAdd.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            var item = button.NamingContainer as RepeaterItem;
            var staffIdLabel = item.FindControl("staffID") as Label;
            Session["StaffID"] = staffIdLabel.Text;  // Store staff ID in session
            Response.Redirect("UpdateStaff.aspx");
        }

        protected void btnRemoveStaff_Click(object sender, EventArgs e)
        {
            int staffId = int.Parse(hiddenStaffId.Value);  // Retrieve the Staff ID from hidden field
            using (var db = new StaffDbContext())
            {
                var staff = db.Staff.Find(staffId);
                if (staff != null)
                {
                    db.Staff.Remove(staff);
                    db.SaveChanges();
                    Response.Redirect(Request.RawUrl);  // Refresh the page to reflect the changes
                }
            }
        }

        private void BindRepeater()
        {
            using (var db = new StaffDbContext())
            {
                var staffList = db.Staff.ToList();
                staffRepeater.DataSource = staffList;
                staffRepeater.DataBind();
            }
        }

        public void ExportDiscountsToExcel()
        {
            string connectionString = cs;
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = @"SELECT d.Discount_ID, d.Discount_Amount, d.Status, d.Start_Date, d.End_Date, d.Product_ID, 
        p.Product_Name FROM Discount d JOIN Product p ON d.Product_ID = p.Product_ID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        using (ExcelPackage pck = new ExcelPackage())
                        {
                            ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Discounts");
                            ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);

                            // Format the header
                            using (var range = ws.Cells[1, 1, 1, dt.Columns.Count])
                            {
                                range.Style.Font.Bold = true;
                                range.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
                                range.Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.FromArgb(79, 129, 189));
                                range.Style.Font.Color.SetColor(System.Drawing.Color.White);
                            }

                            // Format the date columns
                            int startDateColIndex = dt.Columns["Start_Date"].Ordinal + 1; // Adding 1 because EPPlus is 1-based index
                            int endDateColIndex = dt.Columns["End_Date"].Ordinal + 1;
                            ws.Column(startDateColIndex).Style.Numberformat.Format = "dd/MM/yyyy";
                            ws.Column(endDateColIndex).Style.Numberformat.Format = "dd/MM/yyyy";

                            // Save the Excel package
                            var memoryStream = new MemoryStream();
                            pck.SaveAs(memoryStream);

                            // Stream the file to the client
                            HttpContext.Current.Response.ContentType = "application/vnd.openxmlforts-officedocument.spreadsheetml.sheet";
                            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;  filename=Discounts.xlsx");
                            HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                            HttpContext.Current.Response.End();
                        }
                    }
                }
            }
        }
    }
}