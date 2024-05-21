<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="Uniqlo.AdminPages.Reports.SalesReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
     <style>
      #chart_div {
          border: 1px solid #ccc;
          box-shadow: 0px 0px 10px #aaa;
          border-radius: 10px;
          padding: 20px;
          background-color: #f9f9f9;
      }
  </style>
   <script type="text/javascript">
       google.charts.load('current', { packages: ['corechart'] });
       google.charts.setOnLoadCallback(drawChart);

       function drawChart() {
           var data = google.visualization.arrayToDataTable([
               ['Month', 'Total Sales'],
            <%= GetChartData() %>
        ]);

           var options = {
               title: 'Number of Sales Report',
               titleTextStyle: {
                   color: '#333',
                   fontSize: 24,
                   bold: true,
                   fontName: 'Arial'
               },
               chartArea: { width: '60%', height: '70%' },
               colors: ['#1E88E5'],
               backgroundColor: '#f9f9f9',
               hAxis: {
                   title: 'Month',
                   minValue: 0,
                   titleTextStyle: {
                       italic: false,
                       bold: true,
                       color: '#333',
                       fontSize: 16
                   },
                   textStyle: {
                       fontSize: 12
                   }
               },
               vAxis: {
                   title: 'Total Sales',
                   titleTextStyle: {
                       italic: false,
                       bold: true,
                       color: '#333',
                       fontSize: 16
                   },
                   textStyle: {
                       fontSize: 12
                   }
               },
               legend: { position: 'top', alignment: 'end' },
               animation: {
                   startup: true,
                   duration: 1000,
                   easing: 'out',
               },
               tooltip: {
                   textStyle: { color: '#333' },
                   showColorCode: true
               }
           };

           var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
           chart.draw(data, options);
       }
   </script>

    <div id="chart_div" style="width: 900px; height: 500px; margin: auto;"></div>>
 

</asp:Content>
