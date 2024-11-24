<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="FeedbackSystem.AdminLogin" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

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
            font-family: Arial, sans-serif;
            /*background: #ff7900;*/
            background-image:url(https://images-ext-1.discordapp.net/external/so3A3eCq76B6vt5kNidmxPKPAiR8OYpwpUkQVPj1FCQ/%3Ffm%3Djpg%26w%3D3000%26auto%3Dformat%26fit%3Dcrop%26q%3D60%26ixlib%3Drb-4.0.3%26ixid%3DM3wxMjA3fDB8MHxzZWFyY2h8N3x8YWRtaW58ZW58MHx8MHx8fDA%253D/https/images.unsplash.com/photo-1520607162513-77705c0f0d4a?format=webp&width=981&height=655);
           background-size:cover;
            height: 100vh;
            display: flex;
            align-items: center; /* Center vertically */
            justify-content: center; /* Center horizontally */
            margin: 0;
            padding-top: 70px; /* Added padding at the top to push everything down */
        }
        .login-container {
            background-color: rgba(255, 255, 255, 0.9); /* Lighter transparent background */
            padding: 70px; /* Larger padding for a bigger container */
            border-radius: 10px; /* Smoothed corners */
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3); /* Lighter and softer shadow for subtlety */
            width: 500px; /* Increased width for a bigger form */
            height: 400px; /* Fixed height */
            text-align: center;
            margin-top: 30px; /* Additional margin to push down from the header */
        }
        .form-group {
            margin-bottom: 15px;
            position: relative;
        }
        .form-control, .fa {
            height: 40px;
            line-height: 40px;
        }
        .fa {
            position: absolute;
            left: 10px;
            color: #333;
        }
        .form-control {
            padding-left: 40px;
            border-radius: 20px;
            border: 1px solid #ccc;
        }
        .btn-primary {
            width: 100%;
            background-color: #333;
            border: none;
            border-radius: 20px;
            padding: 10px;
            color: white;
            margin-top: 20px;
        }
        .btn-primary:hover {
            background-color: #555;
        }
        /* Updated header styles */
        .header-area {
            width: 100%;
            position: fixed;
            top: 0;
            z-index: 1000;
            background-color: #333; /* Darker blackish tone */
        }
        /* Center the user icon */
        .user-icon {
            width: 100px; /* Adjust the size as needed */
            height: 100px; /* Adjust the size as needed */
            margin: 0 auto 20px; /* Center horizontally and add space below */
            display: block;
        }
        /* Adjust logo size in navbar */
        .logo img {
            max-height: 50px; /* Adjust the height as needed */
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
                            <li><a href="meetings.html">Meetings</a></li>
                            <li><a href="#apply">Apply Now</a></li>
                           
                            <li><a href="#courses">Courses</a></li>
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

    <div class="login-container">
        <img src="images/icon.png" alt="User Icon" class="user-icon" /> <!-- Update the src attribute with the correct path to your icon -->
        <form runat="server">
            <div class="form-group">
                <i class="fa fa-user"></i>
                <asp:TextBox ID="txtAdminUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
            </div>
            <div class="form-group">
                <i class="fa fa-lock"></i>
                <asp:TextBox ID="txtAdminPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
            </div>
            <asp:Button ID="btnAdminLogin" runat="server" Text="Login" CssClass="btn btn-primary" OnClick="btnAdminLogin_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
            
        </form>
    </div>

</body>
</html>
