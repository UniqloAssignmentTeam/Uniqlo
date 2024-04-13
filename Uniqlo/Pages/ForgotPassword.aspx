<%@ Page Title="" Language="C#" MasterPageFile="~/Uniqlo.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Uniqlo.Pages.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="main" runat="server">


    <style>
        .container {
    
    flex-direction: column; /* Arrange content in a column */
    justify-content: center; /* Center content vertically */
    align-items: center; /* Center content horizontally */
    height: 60vh; /* Occupy the full height of the viewport */
    padding: 100px; /* Add padding for spacing */
}

        form-group {
            background-color:red;
        }

        btn btn-lg btn-primary btn-block{
            background-color:red;
        }
    </style>



    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<div class="form-gap"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">Forgot Password?</h2>
                  <p>You can reset your password here.</p>
                  <div class="panel-body">
    
                    <form id="register-form" role="form" autocomplete="off" class="form" method="post">
    
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                          <input id="email" name="email" placeholder="Email" class="form-control"  type="email">
                        </div>
                      </div>
                      <div class="form-group">
                        <input name="recover-submit" class="btn btn-lg btn-primary btn-block" value="Reset Password" type="submit" style="background-color: red" onclick="myFunction()">
                      </div>
                      
                      <input type="hidden" class="hide" name="token" id="token" value=""> 
                    </form>


                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
    <script>
        function myFunction() {
            alert("Please check your Email Inbox");
        }
    </script>
</asp:Content>
