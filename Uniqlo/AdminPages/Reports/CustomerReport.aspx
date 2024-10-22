﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="CustomerReport.aspx.cs" Inherits="Uniqlo.AdminPages.CustomerReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
   <style>
        #chart_div {
            border: 1px solid #ccc;
            box-shadow: 0px 0px 10px #aaa;
            border-radius: 10px;
            padding: 20px;
            background-color: #f9f9f9;
        }
    </style>

    <header>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', { packages: ['corechart'] });
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Customer Name');
                data.addColumn('number', 'Total Spending');
                data.addRows([
                    <% Response.Write(GetChartData()); %>
                ]);

                var formatter = new google.visualization.NumberFormat({
                    fractionDigits: 2
                });
                formatter.format(data, 1); // Apply formatter to second column

                var options = {
                    title: 'Top 5 Customers with Most Spending',
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
                        title: 'Total Spending',
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
                        title: 'Customer Name',
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

                var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
  
    </header>
    <div id="chart_div" style="width: 900px; height: 500px; margin: auto;"></div>


</asp:Content>
