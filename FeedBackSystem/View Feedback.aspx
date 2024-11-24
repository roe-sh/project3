<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View Feedback.aspx.cs" Inherits="FeedBackSystem.View_Feedback" %>

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
            background-color: #ff7900;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 150vh;
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
    background-color: #000000fa;
    border-radius: 10px;
}
        .form-control {
    display: block;
    width: 100%;
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    border-radius: .5em;
    transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
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
            <div class="form-group">
                <label for="DropDownList2">Students Name:</label>
                <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="DropDownListCourses">Courses:</label>
                <asp:DropDownList CssClass="form-control" ID="DropDownListCourses" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                </asp:DropDownList>
            </div>

            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label1" runat="server" Text="Here Result 1  "></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label2" runat="server" Text="Here Result 2"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label3" runat="server" Text="Here Result 3"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label4" runat="server" Text="Here Result 4"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label5" runat="server" Text="Here Result 5"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label6" runat="server" Text="Here Result 6"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label7" runat="server" Text="Here Result 7"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label8" runat="server" Text="Here Result 8"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label9" runat="server" Text="Here Result 9"></asp:Label>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <asp:Label CssClass="form-control" ID="Label10" runat="server" Text="Here Result 10"></asp:Label>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>