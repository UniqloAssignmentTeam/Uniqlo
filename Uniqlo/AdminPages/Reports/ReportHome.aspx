<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="ReportHome.aspx.cs" Inherits="Uniqlo.AdminPages.Reports.ReportHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

   <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }

        #main {
            padding: 20px;
            max-width: 1200px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .report-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .report-link {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 150px;
            background-color: #004080; /* Navy blue */
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .report-link:hover {
            background-color: #003060; /* Darker navy blue */
        }

        .rectangle-link {
            grid-column: span 2;
            height: 150px; /* Adjust height as needed */
        }
    </style>

    <div id="main">
        <h2>Report Home</h2>
        <div class="report-container">
            <asp:HyperLink ID="ProductReportLink" runat="server" NavigateUrl="ProductReport.aspx" CssClass="report-link"><h3><i class="fa-solid fa-p"></i></h3>roduct Report</asp:HyperLink>
            <asp:HyperLink ID="DiscountReportLink" runat="server" NavigateUrl="DiscountReport.aspx" CssClass="report-link"><h3><i class="fa-solid fa-d"></i></h3>iscount Report</asp:HyperLink>
            <asp:HyperLink ID="CustomerReportLink" runat="server" NavigateUrl="CustomerReport.aspx" CssClass="report-link"><h3><i class="fa-solid fa-c"></i></h3>ustomer Report</asp:HyperLink>
            <asp:HyperLink ID="ReviewReportLink" runat="server" NavigateUrl="ReviewReport.aspx" CssClass="report-link"><h3><i class="fa-solid fa-r"></i></h3>eview Report</asp:HyperLink>
            <asp:HyperLink ID="SalesReportLink" runat="server" NavigateUrl="SalesReport.aspx" CssClass="report-link rectangle-link"><h3><i class="fa-solid fa-s"></i></h3>ales Report</asp:HyperLink>
        </div>
    </div>
</asp:Content>
