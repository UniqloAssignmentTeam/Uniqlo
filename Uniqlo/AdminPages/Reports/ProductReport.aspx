<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductReport.aspx.cs" Inherits="Uniqlo.AdminPages.ProductReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <header>
            <style>
    #chart_div {
        border: 1px solid #ccc;
        box-shadow: 0px 0px 10px #aaa;
        border-radius: 10px;
        padding: 20px;
        background-color: #f9f9f9;
    }
</style>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', { packages: ['corechart'] });
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Product Name');
                data.addColumn('number', 'Rating');
                data.addRows([
                    <% Response.Write(GetChartData()); %>
                ]);

                var options = {
                    title: 'Top 5 Reviews with Highest Ratings by Product',
                    titleTextStyle: {
                        color: '#4A4A4A',
                        fontSize: 20,
                        bold: true
                    },
                    chartArea: { width: '60%', height: '70%' },
                    colors: ['#1E88E5'],
                    hAxis: {
                        title: 'Rating',
                        minValue: 0,
                        maxValue: 5,
                        titleTextStyle: {
                            italic: false
                        },
                        textStyle: {
                            fontSize: 12
                        }
                    },
                    vAxis: {
                        title: 'Product Name',
                        titleTextStyle: {
                            italic: false
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
                    tooltip: { textStyle: { color: '#FF0000' }, showColorCode: true }
                };

                var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
    </header>
    <div id="chart_div" style="width: 900px; height: 500px; margin: auto;"></div>

</asp:Content>
