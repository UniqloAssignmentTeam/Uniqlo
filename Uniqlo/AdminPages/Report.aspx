<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Uniqlo.AdminPages.Report" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


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
      

         

          <asp:Chart ID="ProductReviewChart" runat="server" Width="1100px" Height="500px">
    <Series>
        <asp:Series Name="Reviews" ChartType="Column" XValueMember="Product_Name" YValueMembers="ReviewCount">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
         <AxisX Title="Product Name">
     <MajorGrid Enabled="true" />
 </AxisX>
 <AxisY Title="Number of Review">
     <MajorGrid Enabled="true" />
 </AxisY>
    </ChartAreas>
</asp:Chart>


      



       
                   <asp:Chart ID="BestSellingProductsChart" runat="server" Width="1100px" Height="500px">
    <Series>
        <asp:Series Name="BestSellingSeries" ChartType="Column" XValueMember="Product_Name" YValueMembers="TotalQuantity">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1">
            <AxisX Title="Product Name">
                <MajorGrid Enabled="true" />
            </AxisX>
            <AxisY Title="Top 5 Best Selling">
                <MajorGrid Enabled="true" />
            </AxisY>
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>

          
        






        
  <asp:Chart ID="CategoryProductChart" runat="server" Width="1100px" Height="500px">
    <Series>
        <asp:Series Name="Products" ChartType="Bar" XValueMember="CategoryName" YValueMembers="ProductCount">
        </asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="ChartArea1">
            <AxisY Title="Category">
                <MajorGrid Enabled="true" />
            </AxisY>
            <AxisX Title="Number of Products">
                <MajorGrid Enabled="true" />
            </AxisX>
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>


        

       
      
       
      <asp:Chart ID="TopDiscountsChart" runat="server" Width="1100px" Height="500px">
    <Series>
        <asp:Series Name="Discounts" ChartType="Bar" XValueMember="Product_Name" YValueMembers="Discount_Amount"></asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="MainChartArea">
            <AxisX Title="Product Name">
                <MajorGrid Enabled="false" />
            </AxisX>
            <AxisY Title="Discount Amount (RM)">
                <MajorGrid Enabled="true" />
            </AxisY>
        </asp:ChartArea>
    </ChartAreas>
</asp:Chart>


        </div>
        
   

    <!--HEADING-->
    <div class="space"></div>

    <div class="header">
        <h2>Total Item Sold</h2>
      
       



         <asp:DropDownList ID="ddlMonths" runat="server" AutoPostBack="True" CssClass="drop-display" OnSelectedIndexChanged="ddlMonths_SelectedIndexChanged">
   
</asp:DropDownList>
</div>
           
    

    <!--LINE CHART-->

      <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>  
  
<asp:Chart ID="SalesChart" runat="server" Width="500px" Height="500px">
    <Series>
        <asp:Series Name="SalesSeries" ChartType="Column"></asp:Series>
    </Series>
    <ChartAreas>
        <asp:ChartArea Name="MainChartArea"></asp:ChartArea>
    </ChartAreas>
</asp:Chart>
         </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddlMonths" EventName="SelectedIndexChanged" />
    </Triggers>
</asp:UpdatePanel>

    <!--OVERVIEW GRAPH-->
  
      
           
           
         <div class="space"></div>
       
   
</div>    
<footer>
    <script src="../Javascript/productAdminDDL.js"></script>
    <script src="../Javascript/lineChart.js"></script>
    <script src="../Javascript/orderCompleted.js"></script>
  
</footer>



</asp:Content>