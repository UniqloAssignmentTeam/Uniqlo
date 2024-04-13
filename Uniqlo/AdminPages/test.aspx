<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Uniqlo.AdminPages.test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    <link href="../css/test.css" rel="stylesheet" />

   <h2>Image</h2>
<div class="image-gallery">
  <div class="image-box">
    <img src="path-to-your-image-1.jpg" alt="Image 1">
  </div>
  <div class="image-box">
    <img src="path-to-your-image-2.jpg" alt="Image 2">
  </div>
  <div class="image-box">
    <img src="path-to-your-image-3.jpg" alt="Image 3">
  </div>
  <div class="image-box add-image">+</div>
</div>

    

<div class="form-group">
  <label for="productDescription">Description</label>
  <textarea id="productDescription" name="productDescription">Introducing Fikri Studio's Chart Library UI Kit: A Curated Collection of Over 90 Chart Types—Tailored to Empower Your Design Workflow.</textarea>
</div>

</asp:Content>
