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
using System.Data.Entity;
using static Uniqlo.Staff;
using System.Text;

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

        protected void roleSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var db = new StaffDbContext())
            {
                string selectedRole = roleSortDDL.SelectedValue;
                // Fetch all if the "--All--" option (empty value) is selected
                var staffList = string.IsNullOrEmpty(selectedRole)?
                                db.Staff.ToList() :
                                db.Staff.Where(s => s.Role == selectedRole).ToList();

                staffRepeater.DataSource = staffList;
                staffRepeater.DataBind();
            }
        }
        protected void genderSortDDL_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (var db = new StaffDbContext())
            {
                string selectedGender = genderSortDDL.SelectedValue;
                // Fetch all if the "--All--" option (empty value) is selected
                var staffList = string.IsNullOrEmpty(selectedGender) ?
                                db.Staff.ToList() :
                                db.Staff.Where(s => s.Gender == selectedGender).ToList();

                staffRepeater.DataSource = staffList;
                staffRepeater.DataBind();
            }
        }

        protected void excelBtn_Click(object sender, EventArgs e)
        {
            ExportStaffsToExcel();
        }


        private void ExportProductsToExcel()
        {
            try
            {
                string connectionString = Global.CS; // Ensure this is correctly defined
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();  // Ensure the connection is opened before executing the command

                    // Start building the base query
                    StringBuilder query = new StringBuilder(@"SELECT Staff_ID, Name, Gender, Contact_No, Email, Password, Role FROM Staff");

                    // Initialize a SqlCommand with an empty query string
                    using (SqlCommand cmd = new SqlCommand("", conn))
                    {
                        // Retrieve the selected values from the dropdowns
                        string selectedCategory = genderSortDDL.SelectedValue;


                        // Check if there are any conditions to add based on dropdown selection
                        if (!string.IsNullOrEmpty(selectedCategory) && selectedCategory != "Status")
                        {
                            query.Append(" WHERE c.Status = @Status");
                            cmd.Parameters.AddWithValue("@Status", selectedCategory);
                        }


                        // Set the SqlCommand's CommandText to the built query
                        cmd.CommandText = query.ToString();

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            da.Fill(dt);
                            using (ExcelPackage pck = new ExcelPackage())
                            {
                                ExcelWorksheet ws = pck.Workbook.Worksheets.Add("Discount");
                                ws.Cells["A1"].LoadFromDataTable(dt, true, OfficeOpenXml.Table.TableStyles.Light1);
                                var memoryStream = new MemoryStream();
                                pck.SaveAs(memoryStream);
                                memoryStream.Position = 0;

                                HttpContext.Current.Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=Discount.xlsx");
                                HttpContext.Current.Response.BinaryWrite(memoryStream.ToArray());
                                HttpContext.Current.Response.End();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "error", "alert('An error occurred while downloading the discount.');", true);
                // Handle or log the error
            }

        }

      
    }
}