<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="TrackDelivery.aspx.cs" Inherits="Uniqlo.Pages.TrackDelivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <header>
          <link href="../css/delivery.css" rel="stylesheet" />
          <link href="../css/style.css" rel="stylesheet" />
          <link href="../css/style1.css" rel="stylesheet" />
    </header>
    <div class="body">
    <div class="container-fluid pt-5">
    <section class="step-wizard">
        <ul class="step-wizard-list">
            <li class="step-wizard-item current-item">
                <span class="progress-count">1</span>
                <span class="progress-label">Order Placed</span>
            </li>
            <li class="step-wizard-item">
                <span class="progress-count">2</span>
                <span class="progress-label">Arrived at sorting centre</span>
            </li>
            <li class="step-wizard-item">
                <span class="progress-count">3</span>
                <span class="progress-label">Out for delivery</span>
            </li>
            <li class="step-wizard-item">
                <span class="progress-count">4</span>
                <span class="progress-label">Delivered</span>
            </li>
        </ul>
    </section>
        </div>
        </div>
</asp:Content>
