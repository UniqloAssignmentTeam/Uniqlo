<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="viewMoreProduct.aspx.cs" Inherits="Uniqlo.AdminPages.viewMoreProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">

    
        <header>
            <link href="../css/addProduct.css" rel="stylesheet" />
        </header>
       
 
 
 
           <div class="container">
        <div class="productItemCard">
            <h2 class="product-title">Uniqlo Add Product</h2>
        </div>
        <div class="modal-content">
            <div class="upload-image-section">
                <div class="image-gallery">
                    <div class="image-box">
                         <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt1.jpg" alt = "uniqlo image"/>
                    </div>
                    <div class="image-box">
                       <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt2.jpg" alt = "uniqlo image"/>
                    </div>
                    <div class="image-box">
                       <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt3.jpg" alt = "uniqlo image"/>
                    </div>
                    <div class="image-box">
                        <img src="../../../Images/Categories/Woman/Tops/AIRismCottonShortSleeveT-Shirt4.jpg" alt = "uniqlo image"/>
                    </div>
                </div>
            </div>

            <div class="product-content">
                <div class="form-group">
    <label for="productName">Product ID</label>
    <input type="text" name="productName" value="1001" disabled>
</div>
                <div class="form-group">
                    <label for="productName">Product Name</label>
                    <input type="text" name="productName" value="AIRism Cotton Short Sleeve T-Shirt" disabled>
                </div>

                <div class="form-group">
                    <label for="productName">Description</label>
                    <textarea class="form-field" rows="4" cols="50" disabled>Smooth AIRism fabric with the look of cotton. Refined fabric and design.</textarea>
                </div>

                <div class="form-group">
                    <label for="productName">Price</label>
                    <input class="form-field" type="text" value="RM 30.00" disabled>
                </div>

                <div class="form-group">
         
                    <label for="productName">Category</label>
                <input class="form-field" type="text" value="Men" disabled>
                </div>

                <div class="form-group">
                    <label for="productName">Color</label>
                    <input type="text" id="newColorInput">
                    <button id="addColorButton" class="addColor-button">Add color</button>
                </div>
            </div>

             <table class="sizeQtyTable">
     <thead>
         <tr>
             <th><h2>Blue</h2></th>
         </tr>
     </thead>
     <tbody>
         <tr>
             <td>
                 <div class="form-group">
                     <label for="productName">XL</label>
                     <input type="number" class="form-field" placeholder="122">
                 </div>
             </td>
             <td></td>
         </tr>
         <tr>
             <td>
                 <div class="form-group">
                     <label for="productName">M</label>
                     <input type="number" class="form-field" placeholder="123">
                 </div>
             </td>
             <td></td>
         </tr>
         <tr>
             <td>
                 <div class="form-group">
                     <label for="productName">L</label>
                     <input type="number" class="form-field" placeholder="124">
                 </div>
             </td>
             <td></td>
         </tr>
         <tr>
             <td>
                 <div class="form-group">
                     <label for="productName">XL</label>
                     <input type="number" class="form-field" placeholder="122">
                 </div>
             </td>
             <td></td>
         </tr>
     </tbody>
 </table>

            <div class="button-container">
                <div class="cancel-div">
                    <a href="Product.aspx" class="cancel-button">Cancel</a>
                </div>
                <div class="continue-div">
                    <a href="Product.aspx" class="continue-button">Update</a>
                </div>
            </div>
        </div>
    </div>
    


        <footer>

        <script src="../Javascript/productAdminDDL.js"></script>
            </footer>







</asp:Content>
