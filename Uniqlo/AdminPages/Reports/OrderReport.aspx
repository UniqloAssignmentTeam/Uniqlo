    <%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="OrderReport.aspx.cs" Inherits="Uniqlo.AdminPages.OrderReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

     <header>
     <link href="../css/Admin/report.css" rel="stylesheet" />
     <script src="https://www.gstatic.com/charts/loader.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

 </header>
  <div class="bodyContent">
      <!--HEADING-->
      <div class="header">
          <h2 class="h2">UNIQLO ORDERS REPORT</h2>
      </div>


      
   <canvas id="fulfillmentChart" width="400" height="200"></canvas>



  </div>










    <footer>
      <script>
          window.onload = function () {
              var ctx = document.getElementById('fulfillmentChart').getContext('2d');
              var fulfillmentChart = new Chart(ctx, {
                  type: 'bar', // You can change this to 'line', 'pie', etc.
                  data: {
                      labels: <%= LabelsJson %>,
                    datasets: [{
                        label: 'Days to Fulfill',
                        data: <%= DaysToFulfillJson %>,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
          };
      </script>
    </footer>




</asp:Content>
