<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Uniqlo.Pages.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">
    <head>
        <link href="../css/aboutUs.css" rel="stylesheet" />
    </head>
     <main>
         <div class="mainBody">
        <section class="about-section">
            <h2>About Us</h2>
            <p>
                Uniqlo is a Japanese clothing company that offers innovative and functional apparel for people of all
                ages. We are dedicated to providing high-quality, comfortable clothing at affordable prices.
            </p>
            <img src="../Images/uniqlostore.jpg" width="100%"/>
            <p>
                Our mission is to create a better life for our customers by constantly improving our products and
                exploring new technologies and designs. We are committed to sustainability and ethical practices in all
                aspects of our business.
            </p>
        </section>

        <section class="mission-section">
            <h2>Our Mission</h2>
            <p>
                At Uniqlo, our mission is to enrich lives through clothing. We strive to innovate and provide clothing
                that combines fashion and functionality, always keeping our customers' needs in mind.
            </p>
        </section>
             <img src="../Images/storeLocator.jpg" width="100%"/>
        <section class="values-section">
            <h2>Our Values</h2>
            <ul>
                <li>Innovation</li>
                <li>Sustainability</li>
                <li>Customer-Centric Approach</li>
                <li>Quality</li>   
                
                
            </ul>
         <p><img src="../Images/3R.jpg" width="100%"/></p>
        </section>
         </div>
    </main>
</asp:Content>
