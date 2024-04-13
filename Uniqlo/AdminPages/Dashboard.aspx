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
                    <h2>57 orders</h2>
                    <p class="overviewP">To be ship</p>
                </div>
            </div>
            <div class="orderCompleted">
                <div>
                    <i class="fa-solid fa-receipt order"></i>
                </div>
                <div class="overviewContent">
                    <h2>100 orders</h2>
                    <p class="overviewP">Completed</p>
                </div>
            </div>
            <div class="productOutOfStock">
                <div>
                    <i class="fa-solid fa-boxes-stacked product"></i>
                </div>
                <div class="overviewContent">
                    <h2>5 products</h2>
                    <p class="overviewP">Out of stock</p>
                </div>
            </div>
            <div class="activeUser">
                <div>
                    <i class="fa-solid fa-users users"></i>
                </div>
                <div class="overviewContent">
                    <h2>10 register User</h2>
                    <p class="overviewP">Within 3 months</p>
                </div>
            </div>
        </div>

        <!--HEADING-->
        <div class="space"></div>

        <div class="header">
            <h2>Total Orders In 2024</h2>
            <p>Payment received across all channels</p>
        </div>

        <!--LINE CHART-->
        <canvas id="myChart" style="width:100%;"></canvas>
        <div class="space"></div>
       </div>
      
        
    <footer>
        <script src="../Javascript/lineChart.js"></script>
        <script src="../Javascript/barChartTtlOder.js"></script>
    </footer>

</asp:Content>
