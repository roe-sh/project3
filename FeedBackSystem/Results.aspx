<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="FeedBackSystem.Results" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Results</title>
    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />

    <style>
        body {
            background-color: white;
            height: 150vh
        }

        .table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px 100px;
            font-size: 18px;
            text-align: left;
            border: 2px solid black;
            /* margin-top: 50px; */
            box-shadow: 20px;
        }

        .header-area {
            width: 100%; /* Ensure full width */
            position: sticky; /* Sticky or static based on need */
            top: 0; /* Stick to top */
            z-index: 1000; /* Ensure it stays on top */
            background-color: #1e1e1e; /* Background color to match the theme */
        }

        .logo img {
            max-height: 80px; /* Adjust the height as needed */
            width: auto;
        }

        th.text-center {
            color: white;
        }

        .table-striped > tbody > tr:nth-of-type(odd) > * {
            --bs-table-accent-bg: var(--bs-table-striped-bg);
            color: #cdd5dc;
        }

        .table td {
            color: white;
            padding: 12px 15px;
            border: 1px solid #ddd;
        }

        select#courseDropdown {
            margin: 30px;
            margin-left: 42%;
            width: 18%;
            /* height: 10%; */
            padding: 1%;
        }

        .table th {
            background-color: black;
            text-align: center;
            color: white;
        }

        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .table tr:hover {
            background-color: #f1f1f1;
        }

        .text-center {
            text-align: center;
        }

        .search-box {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .table1-striped > tbody > tr:nth-of-type(odd) > * {
            --bs-table-accent-bg: var(--bs-table-striped-bg);
            color: #fff;
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
                            <li><a href="ViewTechnologies.aspx">Veiw Technologies</a></li>
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


    <form id="form1" runat="server">
        <div class="search-box">
            <asp:DropDownList ID="courseDropdown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="courseDropdown_SelectedIndexChanged">
                <asp:ListItem Text="Select Course" Value="" />
                <asp:ListItem Text="HTML" Value="HTML" />
                <asp:ListItem Text="CSS" Value="CSS" />
                <asp:ListItem Text="JavaScript" Value="JavaScript" />
            </asp:DropDownList>
        </div>

        <asp:Table ID="studentTable" runat="server" CssClass="table table-bordered table-striped">
        </asp:Table>
    </form>

</body>
</html>
