<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateDiscount.aspx.cs" Inherits="Uniqlo.AdminPages.UpdateDiscount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    
    <header>
        <link href="../../css/Admin/addDiscount.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.all.min.js"></script>
    </header>

    <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">UNIQLO UPDATE DISCOUNT</h2>
        </div>
        <div class="modal-content">
            <div class="product-content">
                <div class="form-group">
                    <label for="discountID">Discount ID</label>
                    <asp:TextBox ID="discountID" runat="server" Enabled="False"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <asp:DropDownList ID="DdlProductName" runat="server" CssClass="scrollable-dropdown dropdown-display"></asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidatorProduct" runat="server" ValidateEmptyText="true" ControlToValidate="DdlProductName" ErrorMessage="Please select a product" ForeColor="Red" Display="Dynamic" OnServerValidate="ValidateProductName_ServerValidate"></asp:CustomValidator>
                </div>
                <div class="form-group">
                    <label for="discountAmount">Amount - Discount</label>
                    <asp:TextBox ID="discountAmount" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredValidatorDiscountAmount" runat="server" ControlToValidate="discountAmount" ErrorMessage="Discount amount is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidatorDiscountAmount" runat="server" ControlToValidate="discountAmount" MinimumValue="0.01" MaximumValue="300" Type="Currency" ErrorMessage="Discount amount must be between RM 0.01 and RM 300" ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                </div>
                <div class="form-group">
                    <label for="status">Status</label>
                    <asp:DropDownList ID="status" runat="server" CssClass="dropdown-display">
                        <asp:ListItem>Active</asp:ListItem>
                        <asp:ListItem>Inactive</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label for="startDate">Start Date</label>
                    <asp:TextBox ID="startDate" runat="server" type="date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="startDate" ErrorMessage="Start date is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidatorDate" runat="server" ControlToValidate="startDate" ErrorMessage="Start date must be before end date" ForeColor="Red" Display="Dynamic" OnServerValidate="CustomValidatorDate_ServerValidate"></asp:CustomValidator>
                </div>
                <div class="form-group">
                    <label for="endDate">End Date</label>
                    <asp:TextBox ID="endDate" runat="server" type="date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="endDate" ErrorMessage="End date is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="button-container">
                <asp:Button ID="cancelBtn" runat="server" Text="Cancel" CssClass="cancel-button" CausesValidation="false" OnClick="cancelBtn_Click"/>
                <asp:Button ID="addBtn" runat="server" Text="Update" CssClass="continue-button" CausesValidation="true" OnClick="updateBtn_Click"/>
            </div>
        </div>
    </div>

    <footer>
        <script src="../../Javascript/productAdminDDL.js"></script>
        <script type="text/javascript">
            function showConfirmation(event) {
                event.preventDefault(); // Prevent the default form submission
                Swal.fire({
                    title: 'Are you sure?',
                    text: "Do you want to update this discount?",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, update it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        document.getElementById('<%= addBtn.ClientID %>').click(); // Trigger the server-side click event
                    }
                });
            }

            function showSuccessMessage() {
                Swal.fire({
                    title: 'Success!',
                    text: 'Discount updated successfully!',
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then(() => {
                    window.location.href = 'DiscountHome.aspx'; // Redirect to the desired page after success message
                });
            }
            document.addEventListener('DOMContentLoaded', function () {
                var endDateInput = document.getElementById('<%= endDate.ClientID %>');
                var statusSelect = document.getElementById('<%= status.ClientID %>');

                function updateStatusOptions() {
                    var endDate = new Date(endDateInput.value);
                    var today = new Date();
                    today.setHours(0, 0, 0, 0); // Normalize today's date

                    // Disable selecting 'Active' if the end date is in the past
                    if (endDate < today) {
                        if (statusSelect.value === 'Active') {
                            statusSelect.value = 'Inactive';
                        }
                        Array.from(statusSelect.options).forEach(function (option) {
                            if (option.value === 'Active') {
                                option.disabled = true;
                            }
                        });
                    } else {
                        Array.from(statusSelect.options).forEach(function (option) {
                            option.disabled = false;
                        });
                    }
                }

                endDateInput.addEventListener('change', updateStatusOptions);
                updateStatusOptions(); // Call on page load to set initial state
            });
        </script>
    </footer>
</asp:Content>
