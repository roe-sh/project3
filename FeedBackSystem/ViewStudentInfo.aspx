<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStudentInfo.aspx.cs" Inherits="FeedbackSystem.ViewStudentInfo" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Student Information</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">

    <style>
        body {
            background: #ff7900;
            font-family: Arial, sans-serif;
            /*padding-top: 4.375em;*/ /* Converted from 70px to approximately 4.375em */
            height: 94em;
        }

        .header-area {
            width: 100%; /* Ensure full width */
            position: sticky; /* Sticky or static based on need */
            top: 0; /* Stick to top */
            z-index: 1000; /* Ensure it stays on top */
            background-color: #1e1e1e; /* Background color to match the theme */
        }

        .logo img {
            max-height: 60px; /* Adjust the height as needed */
            width: auto;
        }

        input#btnSearch {
            margin: 10px;
        }



        .container {
            background-color: #444;
            color: white;
            padding: 1.25em;
            Converted from 20px to approximately 1.25em border-radius: 0.625em;
            Converted from 10px to approximately 0.625em box-shadow: 0 0 0.625em rgba(0, 0, 0, 0.3);
            Converted from 10px to approximately 0.625em width: 90%;
            margin: auto;
        }


        .container1 {
            color: white;
            /* padding: .5em;*/ /*Converted from 20px to approximately 1.25em */
            border-radius: 0.625em; /*Converted from 10px to approximately 0.625em */
            box-shadow: 0 0 0.625em rgba(0, 0, 0, 0.3); /* Converted from 10px to approximately 0.625em */
            width: 90%;
            margin: auto;
        }

        .table {
            color: white;
            background-color: #555;
        }

            .table th, .table td {
                color: white;
            }

        .btn-primary {
            color: black;
            font-weight: bold;
            background-color: #ff7900;
            border-color: #ff7900;
        }

        .h22 {
            margin-top: 75px;
            margin-bottom: 44px;
            text-align: center;
            font-size: xxx-large;
            color: white;
        }

        .table-striped1 > tbody > tr:nth-of-type(odd) > * {
            --bs-table-accent-bg: var(--bs-table-striped-bg);
            color: #eee;
        }


        .dashboard {
            margin-top: 60px; /* Adjust this value based on the actual height of your header */
        }
    </style>
</head>
<body>
    <!-- Main Header -->
    <header class="header-area header-sticky">
        <div class="container1">
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


                        <a class='menu-trigger'>
                            <span>Menu</span>
                        </a>
                    </nav>
                </div>
            </div>
        </div>
    </header>

    <form runat="server">
        <h2 class="h22">Student Information</h2>
        <div class="container">
            <!-- Adjusted margin-bottom to approximately 1.5em -->
            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" Placeholder="Search by Student ID, Email, or Courses"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary mt-1.25em" OnClick="btnSearch_Click" />
            <asp:Button ID="btnSort" CssClass="btn btn-primary mt-1.25em" runat="server" Text="Sort" OnClick="btnSort_Click" />
            <!-- Adjusted margin-top to approximately 1.25em -->
            <asp:GridView ID="gvStudentInfo" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
                <Columns>
                    <asp:HyperLinkField DataNavigateUrlFields="ID" DataNavigateUrlFormatString="StudentFeedbackDetails.aspx?ID={0}" DataTextField="ID" HeaderText="Student ID" />
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <a href='<%# "mailto:" + Eval("Email") %>'><%# Eval("Email") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Courses" HeaderText="Courses" />

                    <asp:TemplateField HeaderText="Student Result">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlStudentResult" runat="server" NavigateUrl='<%# "View Feedback.aspx?ID=" + Eval("ID") %>' Text="View Result"></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
