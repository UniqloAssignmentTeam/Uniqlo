<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Uniqlo.AdminPages.Report" %>
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
        <div id="curve_chart" style="width: 100%; height:100%"></div>
            </div>

        <div class="orderCompleted">
            <div id="curve_chart2" style="width: 100%; height:100%">         
            </div>
        </div>

        <div class="productOutOfStock">
            <div id="curve_chart3" style="width: 100%; height:100%"></div>
        </div>

        <div class="activeUser">
           <div id="curve_chart4" style="width: 100%; height:100%"></div>
        </div>
    </div>

    <!--HEADING-->
    <div class="space"></div>

    <div class="header">
        <h2>Total Sales</h2>
      
       



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