<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ProductReport.aspx.cs" Inherits="Uniqlo.AdminPages.ProductReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
            <script type="text/javascript">
                google.charts.load('current', { packages: ['corechart'] });
                google.charts.setOnLoadCallback(drawChart);

                function drawChart() {
                    var data = google.visualization.arrayToDataTable([
                        ['Category', 'Total Sales Amount'],
                        <%= GetChartData() %>
                    ]);

                    var options = {
                        title: 'Total Sales Amount by Category',
                        hAxis: { title: 'Category' },
                        vAxis: { title: 'Total Sales Amount' },
                        legend: 'none'
                    };

                    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }

                Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
                    drawChart();
                });
            </script>

            <div id="chart_div" style="width: 100%; height: 500px;"></div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
