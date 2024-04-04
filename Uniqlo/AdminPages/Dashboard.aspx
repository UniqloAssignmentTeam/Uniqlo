<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Uniqlo.AdminPages.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
        <link href="../css/dashboard.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </header>

    <div class="bodyContent">
        <!--HEADING-->
        <div class="header">
            <h2>Dashboard</h2>
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
        

        <!--OVERVIEW GRAPH-->
        <div class="overviewGraph">
            <div class="ttlOrder">
                <div class="overviewName">
                    <h3>Total Orders</h3>
                    <h3 class="amt">16,289</h3>
                </div>
                <div class="overviewDetails">
                    <p>Last 7 days</p>
                </div>
                <div>
                    <canvas id="barChart"></canvas>
                </div>
            </div>
            <div class="newUser">
                <div class="overviewName">
                    <h3>Top 5 Product Sold</h3>
                </div>

                <div class="table">
                    <div class="row">
                        <div class="col prod">
                            Product
                        </div>
                        <div class="col ord">
                            Orders
                        </div>
                        <div class="col stat">
                            Status
                        </div>
                        <div class="col price">
                            Price
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col prod">
                            Mini Short Sleeve T-Shirt
                        </div>
                        <div class="col ord">
                            1,500
                        </div>
                        <div class="col stat inStock">
                            In Stock
                        </div>
                        <div class="col price">
                            RM 74,850
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col prod">
                            AIRism Cotton Sleeveless T-Shirt
                        </div>
                        <div class="col ord">
                            1,300
                        </div>
                        <div class="col stat inStock">
                            In Stock
                        </div>
                        <div class="col price">
                            RM 74,850
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col prod">
                            Pleated Straight Pants
                        </div>
                        <div class="col ord">
                            1,000
                        </div>
                        <div class="col stat lowInStock">
                            Low In Stock
                        </div>
                        <div class="col price">
                            RM 149,900
                        </div>
                    </div>
                    <hr />
                    <div class="row">
                        <div class="col prod">
                            Crew Neck Short Sleeve T-Shirt
                        </div>
                        <div class="col ord">
                            800
                        </div>
                        <div class="col stat inStock">
                            In Stock
                        </div>
                        <div class="col price">
                            RM 39,920
                        </div>
                    </div>
                    <hr />                    
                    <div class="row">
                        <div class="col prod">
                            KIDS AIRism Cotton Graphic Short Sleeve T-Shirt
                        </div>
                        <div class="col ord">
                            800
                        </div>
                        <div class="col stat inStock">
                            In Stock
                        </div>
                        <div class="col price">
                            RM 39,920
                        </div>
                    </div>
                    <hr />
                </div>
            </div>
        </div>
    </div>    
    <footer>
        <script src="../Javascript/lineChart.js"></script>
        <script src="../Javascript/barChartTtlOder.js"></script>
    </footer>

</asp:Content>
