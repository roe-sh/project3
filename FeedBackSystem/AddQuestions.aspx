<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddQuestions.aspx.cs" Inherits="FeedBackSystem.AddQuestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Question</title>
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

        .header-area {
            width: 100%;
            position: sticky;
            top: 0;
            z-index: 1000;
            background-color: #1e1e1e;
        }

        .form-container {
            margin-top: 1%;
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
                    .h22 {
    margin-top: 15px;
    margin-bottom: 20px;
    text-align: center;
    font-size: xx-large;
    color: white;
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
                            <img src="images/logo.png" alt="Logo" />
                            <!-- Replace with your logo path -->
                        </a>
                        <ul class="nav">
                            <li><a href="index.aspx" class="active">Home</a></li>
                            <li><a href="AdminDashboard.aspx">Admin Dashbord</a></li>
                            <%--<li class="has-sub">
                                <a href="javascript:void(0)">Pages</a>
                                <ul class="sub-menu">
                                    <li><a href="meetings.html">Upcoming Meetings</a></li>
                                    <li><a href="meeting-details.html">Meeting Details</a></li>
                                </ul>--%>
                            </li>

                            <li><a href="index.aspx">Log Out</a></li>
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
            <h2 class="h22">Add Question</h2>
            <div class="form-group">
                <label for="DropDownList1">Select Technology:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox1">Qusetion 1 : </label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 1"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox2">Qusetion 2 :</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 2"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox3">Qusetion 3 :</label>
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 3"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox4">Qusetion 4 :</label>
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 4"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox5">Qusetion 5 :</label>
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 5"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox6">Qusetion 6 :</label>
                        <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 6"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox7">Qusetion 7 :</label>
                        <asp:TextBox ID="TextBox7" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 7"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox8">Qusetion 8 :</label>
                        <asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 8"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox9">Qusetion 9 :</label>
                        <asp:TextBox ID="TextBox9" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 9"></asp:TextBox>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group">
                        <label for="TextBox10">Qusetion 10 :</label>
                        <asp:TextBox ID="TextBox10" runat="server" CssClass="form-control" placeholder="Enter your Qusetion 10"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="text-center mt-4">
                <asp:Button ID="Button1" CssClass="btn btn-orange" runat="server" Text="Submit" OnClick="Btnsubmit" Width="200px" />
            </div>
        </form>
    </div>
</body>
</html>
