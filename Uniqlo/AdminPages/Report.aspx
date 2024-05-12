<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Uniqlo.AdminPages.Report" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">



      <header>
          <link href="../css/Admin/report.css" rel="stylesheet" />
           <script src="https://www.gstatic.com/charts/loader.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  
  </header>

     <div class="bodyContent">
     <!--HEADING--> 
     <div class="header">
         <h2 class="h2">UNIQLO REPORT</h2>
     </div>
        <!--OVERVIEW CONTAINER-->
    <div class="overview">
        <div  class="orderOnHold" >

         

           <asp:Chart ID="SalesChart" runat="server" Width="250px" Height="250px">
    <Series>
        <asp:Series Name="SalesSeries" ChartType="Line"></asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="MainChartArea"></asp:ChartArea>
    </ChartAreas>
</asp:Chart>

            </div>



        <div class="orderCompleted">
                     <asp:Chart ID="BestSellingProductsChart" runat="server" Width="250px" Height="250px">
    <Series>
        <asp:Series Name="BestSellingSeries" ChartType="Bar"></asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
    </ChartAreas>
</asp:Chart>
            </div>
        






        <div class="productOutOfStock">
    <asp:Chart ID="ChartWishlist" runat="server" Width="500px" Height="400px">
    <Series>
        <asp:Series Name="Series1" ChartType="Column"></asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
    </ChartAreas>
</asp:Chart>

        

        </div>

        <div class="activeUser">
         <asp:Chart ID="Chart1" runat="server">
    <Series>
        <asp:Series Name="Quantity" ChartType="Column">
           
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
    </ChartAreas>
</asp:Chart>


        </div>
    </div>

    <!--HEADING-->
    <div class="space"></div>

    <div class="header">
        <h2>Total Item Sold</h2>
      
       



         <div class="dropdown-container" onclick="toggleDropdown('dropdownList', 'dropdownDisplay')">
      <div class="dropdown-display" id="dropdownDisplay">Year</div>
      <div class="dropdown-list" id="dropdownList">
         <div onclick="selectOption('2024', 'dropdownDisplay')">2024</div>
         <div onclick="selectOption('2023', 'dropdownDisplay')">2023</div>
         <div onclick="selectOption('2022', 'dropdownDisplay')">2022</div>
      </div>
   </div>
</div>
           
    

    <!--LINE CHART-->
        
    <canvas id="myChart" style="width:100%;"></canvas>
   

    <!--OVERVIEW GRAPH-->
  
      
           
           
         <div class="space"></div>
       
   
</div>    
<footer>
    <script src="../Javascript/productAdminDDL.js"></script>
    <script src="../Javascript/lineChart.js"></script>
    <script src="../Javascript/orderCompleted.js"></script>
  
</footer>



</asp:Content>