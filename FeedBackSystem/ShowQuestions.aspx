<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowQuestions.aspx.cs" Inherits="FeedBackSystem.ShowQuestions" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Questions</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />
    <style>
        body {
            background-color:#ff7900;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 150vh;
        }
   .h22 {
    margin-top: 15px;
    margin-bottom: 20px;
    text-align: center;
    font-size: xx-large;
    color: white;
}
        .header-area {
            width: 100%;
            position: sticky;
            top: 0;
            z-index: 1000;
            background-color: #1e1e1e;
        }

        .form-container {
            margin-top: 3%;
            padding: 20px;
           background-color: #1e1e1e;
            border-radius: 10px;
        }

        .form-group label {
            color: #ff7f00;
        }

        .form-container .row {
            display: flex;
            flex-wrap: wrap;
        }

        .form-container .col-6 {
            flex: 0 0 50%;
            max-width: 50%;
            padding: 10px;
        }

        .form-container .form-control {
            width: 100%;
        }

        .logo img {
            max-height: 80px; /* Adjust the height as needed */
            width: auto;
        }

        .btn-orange {
            background-color: #ff7f00;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn-orange:hover {
            background-color: #cc6600;
        }
    </style>
</head>
<body>
    <header class="header-area header-sticky">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav class="main-nav">
                        <a href="index.html" class="logo">
                            <img src="images/logo.png" alt="Logo" />
                            <!-- Replace with your logo path -->
                        </a>
                        <ul class="nav">
                            <li><a href="index.aspx" class="active">Home</a></li>
                            <li><a href="AdminDashboard.aspx">Admin Dashboard</a></li>
                          
                            <li><a href="#contact">Contact Us</a></li>
                        </ul>
                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <div class="container form-container">
        <form id="form1" runat="server">
             <h2 class="h22">Show Question</h2>
            <div class="form-group">
                <label for="DropDownList2">Select Technology:</label>
                <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox1">Question 1 : </label>
                        <asp:Label CssClass="form-control" ID="Label1" runat="server" Text="Here Question 1"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox2">Question 2 :</label>
                        <asp:Label CssClass="form-control" ID="Label2" runat="server" Text="Here Question 2"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox3">Question 3 :</label>
                        <asp:Label CssClass="form-control" ID="Label3" runat="server" Text="Here Question 3"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox4">Question 4 :</label>
                        <asp:Label CssClass="form-control" ID="Label4" runat="server" Text="Here Question 4"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox5">Question 5 :</label>
                        <asp:Label CssClass="form-control" ID="Label5" runat="server" Text="Here Question 5"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox6">Question 6 :</label>
                        <asp:Label CssClass="form-control" ID="Label6" runat="server" Text="Here Question 6"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox7">Question 7 :</label>
                        <asp:Label CssClass="form-control" ID="Label7" runat="server" Text="Here Question 7"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox8">Question 8 :</label>
                        <asp:Label CssClass="form-control" ID="Label8" runat="server" Text="Here Question 8"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox9">Question 9 :</label>
                        <asp:Label CssClass="form-control" ID="Label9" runat="server" Text="Here Question 9"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox10">Question 10 :</label>
                        <asp:Label CssClass="form-control" ID="Label10" runat="server" Text="Here Question 10"></asp:Label>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
