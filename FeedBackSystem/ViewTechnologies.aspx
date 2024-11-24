<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTechnologies.aspx.cs" Inherits="FeedBackSystem.ViewTechnologies" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Technologies</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Bootstrap Core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

<!-- Additional CSS Files -->
<link rel="stylesheet" href="assets/css/fontawesome.css"/>
<link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css"/>
<link rel="stylesheet" href="assets/css/owl.css"/>
<link rel="stylesheet" href="assets/css/lightbox.css"/>
    <style>
        body {
            background-color:#ff7900;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .logo img {
    max-height: 80px; /* Adjust the height as needed */
    width: auto;
}
        .dashboard-title {
    text-align: center;
    font-size: 28px;
    color: #FFFFFF;
    padding: 20px;
}
         .header-area {
     width: 100%; /* Ensure full width */
     position: sticky; /* Sticky or static based on need */
     top: 0; /* Stick to top */
     z-index: 1000; /* Ensure it stays on top */
     background-color: #1e1e1e; /* Background color to match the theme */
 }
        .header {
            text-align: center;
            padding: 20px;
            background-color: #007bff;
            color: #ffffff;
        }
        
        .header-area .main-nav .logo {
    line-height: 100px;
    color: #fff;
    font-size: 28px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 2px;
    float: left;
    position: absolute;
    left: 3%;
    -moz-transition: all 0.3s ease 0s;
    -o-transition: all 0.3s ease 0s;
    transition: all 0.3s ease 0s;
}
        .container {
    flex-grow: 1;
    
    display: flex;
    justify-content: flex-end;
    align-items: center;
    flex-wrap: wrap;
    padding-bottom: 20px;
}

     .container1 {
    flex-grow: 1;
    padding: 20px;
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    flex-wrap: wrap;
}
        .card {
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            margin: 10px;
            flex: 0 0 200px;
            display: flex;
            flex-direction: column;
        }
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
        }
        .card-content {
            padding: 15px;
            flex-grow: 1;
        }
        footer {
            background-color: #343a40;
            padding: 10px;
            text-align: center;
            color: #ffffff;
            margin-top: auto;
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
                    </a>
                    <ul class="nav">
                        <li><a href="index.aspx" class="active">Home</a></li>
                        <li><a href="AdminDashboard.aspx">Admin Dashboard</a></li>
                        
                               
                                <li><a href="index.aspx">Log Out</a></li>
                            </ul>
                        </li>
                      
                    </ul>
                    <a class='menu-trigger'>
                        <span>Menu</span>
                    </a>
                </nav>
            </div>
        </div>
    </div>
</header>
   
    <div class="container1">
        <asp:Repeater ID="TechnologiesRepeater" runat="server">
            <ItemTemplate>
                <div class="card">
                    <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("CourseName") %>' />
                    <div class="card-content">
                        <h4><%# Eval("CourseName") %></h4>
                       
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <%--<footer>
        <p>&copy; 2024 Your Company. All rights reserved.</p>
    </footer>--%>
</body>
</html>