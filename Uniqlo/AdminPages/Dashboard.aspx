<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Uniqlo.AdminPages.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/dashboard.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </header>

    <div class="bodyContent">
        <!--HEADING-->
        <div class="header">
            <h2>UNIQLO DASHBOARD</h2>
            <p>Here’s what’s going on at your business right now</p>
        </div>

        <!--OVERVIEW CONTAINER-->
        <div class="overview">
            <div class="orderOnHold">
                <div>
                    <i class="fa-solid fa-truck truck"></i>
                </div>
                <div class="overviewContent">
                    <h2><asp:Label ID="lblNotDeliveredCount" runat="server" Text="Loading..."></asp:Label>
 Orders</h2>
                    <p class="overviewP">To be delivered</p>
                </div>
            </div>
            <div class="orderCompleted">
                <div>
                    <i class="fa-solid fa-receipt order"></i>
                </div>
                <div class="overviewContent">
                    <h2><asp:Label ID="lblNotPaid" runat="server" Text="Loading..."> </asp:Label> Orders</h2>
                    <p class="overviewP">To be Paid</p>
                </div>
            </div>
            <div class="productOutOfStock">
                <div>
                   <i class="fa-solid fa-users users"></i>
                </div>
                <div class="overviewContent">
                    <h2><asp:Label ID="lblStaff" runat="server" Text="Loading..."> </asp:Label> Staffs</h2>
                    <p class="overviewP">Currently</p>
                </div>
            </div>
            <div class="activeUser">
                <div>
                    <i class="fa-solid fa-users users"></i>
                </div>
                <div class="overviewContent">
                    <h2><asp:Label ID="lblCustomer" runat="server" Text="Loading..."> </asp:Label> Customer</h2>
                    <p class="overviewP">Registered</p>
                </div>
            </div>
        </div>

        <!--HEADING-->
        <div class="space"></div>

        <div class="header">
            <h2>Revenue In 2024</h2>
            <p>Payment received across all channels</p>
        </div>

        <!--LINE CHART-->
   <!--LINE CHART-->
<asp:Chart ID="SalesChart" runat="server" Width="1100px" Height="500px">
    <Series>
        <asp:Series Name="SalesSeries" ChartType="Column" XValueMember="SaleMonth" YValueMembers="TotalSales"
                    ToolTip="Month: #VALX, Total Sales: RM #VALY{N2}" LabelFormat="{N2}" IsValueShownAsLabel="true">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="MainChartArea">
            <AxisX Title="Month">
                <MajorGrid Enabled="false" />
            </AxisX>
            <AxisY Title="Total Sales (RM)">
                <MajorGrid Enabled="true" />
            </AxisY>
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>


        <div class="space"></div>
       </div>
      
        
    <footer>
        <script src="../Javascript/lineChart.js"></script>
        <script src="../Javascript/barChartTtlOder.js"></script>
    </footer>

</asp:Content>
