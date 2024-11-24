<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="FeedbackSystem.StudentDashboard" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <style>
        body {
            background: #ff7900;
            font-family: Arial, sans-serif;
            /*  padding-top: 70px;*/
            height: 94em;
        }

        /*.container {
            background-color: #444;
            color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            width: 90%;
            margin: auto;
        }*/

        .table {
            color: white;
            background-color: #444;
        }

            .table th, .table td {
                color: white;
            }

        .feedback-section {
            margin-top: 20px;
        }

            .feedback-section h3 {
                color: orange;
            }

        .logo img {
            max-height: 60px; /* Adjust the height as needed */
            width: auto;
        }

        .header-area {
            width: 100%; /* Ensure full width */
            position: sticky; /* Sticky or static based on need */
            top: 0; /* Stick to top */
            z-index: 1000; /* Ensure it stays on top */
            background-color: #1e1e1e; /* Background color to match the theme */
        }

        .container {
            background-color: #444;
            color: white;
            padding: 1.25em;
            margin: auto;
            border-radius: 12px;
            width: 70%;
            border: 1px solid;
        }

        .container1 {
            color: white;
            /* padding: .5em;*/ /*Converted from 20px to approximately 1.25em */
            border-radius: 0.625em; /*Converted from 10px to approximately 0.625em */
            box-shadow: 0 0 0.625em rgba(0, 0, 0, 0.3); /* Converted from 10px to approximately 0.625em */
            width: 90%;
            margin: auto;
        }

        h2#header {
            text-align: center;
            margin-top: 55px;
            color: white;
            font-size: xxx-large;
            margin-bottom: 55px !important;
        }

        h3 {
            font-size: x-large;
            margin-bottom: 20px;
            text-align: center;
        }

        table table-striped1 {
            color: white;
        }

        input[type="button"] {
            position: absolute;
            left: 69%;
            width: 10%;
            font-size: 14px;
            border-radius: 10px;
            /* background-color: #ffffffe8; */
        }

        tbody, td, tfoot, th, thead, tr {
            border-color: inherit;
            border-style: solid;
            border-width: 0;
            background-color: #444;
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

    <div id="divcontainer">
        <h2 id="header" class="mb-4">Welcome
 <asp:Label ID="lblStudentName" runat="server" Text=""></asp:Label></h2>

    </div>
    <form runat="server">

        <div class="container">

            <h3>Your Registered Courses</h3>
            <asp:GridView ID="gvCourses" runat="server" CssClass="table table-striped1" AutoGenerateColumns="False" OnRowCommand="gvCourses_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                    <asp:ButtonField Text="Give Feedback" CommandName="GiveFeedback" ButtonType="Button" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
