<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="SalesReport.aspx.cs" Inherits="Uniqlo.AdminPages.Reports.SalesReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
   <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', { packages: ['corechart'] });
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'Total Sales'],
                <%= GetChartData() %>
            ]);

            var options = {
                title: 'Monthly Sales Report',
                hAxis: { title: 'Month' },
                vAxis: { title: 'Total Sales' },
                legend: 'none'
            };

            var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
    <div id="chart_div" style="width: 100%; height: 500px;"></div>>
 

</asp:Content>
