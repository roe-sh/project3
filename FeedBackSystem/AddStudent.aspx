<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="AddStudent.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous" />
    
    <!-- Bootstrap Core CSS -->
 <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 <!-- FontAwesome -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <!-- Additional CSS Files -->
 <link rel="stylesheet" href="assets/css/fontawesome.css">
 <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css">
 <link rel="stylesheet" href="assets/css/owl.css">
 <link rel="stylesheet" href="assets/css/lightbox.css">
    <style>
        body {
            background-color: #ff7900;; /* Dark background */
            color: white; /* White text */
            font-family: Arial, sans-serif; /* Font style */
            padding-top:110px;
            padding-bottom:100px;
        }
        
        .form-container {
            background-color: #444; /* Darker container background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width:800px;
            height:530px;
            margin: auto;
        }
        
        .form-control-label {
            color: orange; /* Orange label color */
            font-weight: bold;
        }
        
        .form-control {
            background-color: #555; /* Input field background */
            color: white; /* Input field text color */
            border: 1px solid #777; /* Input field border */
        }
        
        .form-check-input {
            background-color: #555; /* Checkbox background */
        }
        
        .form-check-label {
            color: white; /* Checkbox label color */
            font-weight: normal;
        }
        
        .btn-save {
            background-color: orange; /* Button background */
            border-color: orange; /* Button border */
            color: black; /* Button text color */
            font-weight: bold;
            padding: 10px 20px;
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        
        .btn-save:hover {
            background-color: white; /* Button hover background */
            color: black; /* Button hover text color */
        }
       
        .header-area {
    width: 100%;
    /*position: fixed;*/
    top: 0;
  /*  z-index: 1000;*/
    background-color: #333; /* Darker blackish tone */
}
        .logo img {
    max-height: 80px; /* Adjust the height as needed */
    width: auto;
}
    </style>
</head>
<body>
    <!-- Main Header -->
<header class="header-area header-sticky">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <nav class="main-nav">
                    <a href="index.html" class="logo">
                        <img src="images/logo.png" alt="Logo" /> <!-- Replace with your logo path -->
                    </a>
                    <ul class="nav">
                        <li><a href="index.aspx" class="active">Home</a></li>
                        <li><a href="AdminDashboard.aspx">Admin Dashboard</a></li>
                      
                        
                                
                                <li><a href="index.aspx">Log Out</a></li>
                   
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                </nav>
            </div>
        </div>
    </div>
</header>

    <form id="formStudentInfo" runat="server" class="form-container">
        <h2 class="mb-4" style="color: orange;">Student  Information</h2>
        <div class="mb-3">
            
            
            <label for="txtName" class="form-control-label">ID:</label><br />
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Required="true"></asp:TextBox><br /><br />
            
            <label for="txtEmail" class="form-control-label">E-mail:</label><br />
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" Required="true"></asp:TextBox><br /><br />
 
            <fieldset>
                <legend class="form-control-label">Choices:</legend>
                <div class="form-check">
                    <asp:CheckBox ID="chkChoice1" runat="server" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkChoice1">HTML</label>
                </div>
                <div class="form-check">
                    <asp:CheckBox ID="chkChoice2" runat="server" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkChoice2">CSS</label>
                </div>
                <div class="form-check">
                    <asp:CheckBox ID="chkChoice3" runat="server" CssClass="form-check-input" />
                    <label class="form-check-label" for="chkChoice3">JavaScript</label>
                </div>
                
            </fieldset>
        </div>
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-save" />
    </form>
    
</body>
</html>
