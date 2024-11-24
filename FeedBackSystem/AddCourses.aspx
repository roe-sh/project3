<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCourses.aspx.cs" Inherits="FeedBackSystem.AddCourses" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />

    <style>
        .btn-primary {
            color: #fff;
            background-color: #000;
            border-color: #000;
            width: 109px;
        }

        body {
            background-color: #ff7900;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* لضمان أن الـ footer يكون في الأسفل */
        }

        .dashboard-title {
            text-align: center;
            font-size: 28px;
            color: #FFFFFF;
            padding: 20px;
        }

        .logo img {
            max-height: 80px; /* Adjust the height as needed */
            width: auto;
        }

        .dashboard {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 0 20px 20px;
            justify-content: center;
        }

        .card {
            background-color: #1e1e1e;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.2s;
            width: calc(33.333% - 20px);
            display: flex;
            flex-direction: column;
        }

            .card:hover {
                transform: scale(1.05);
            }

            .card img {
                width: 100%;
                height: 200px; /* زيادة ارتفاع الصورة لتكون أوضح */
                object-fit: cover; /* تكبير الصورة لتملأ المساحة المخصصة لها */
                margin: 0; /* إزالة الهوامش */
            }

        .card-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

            .card-content h2 {
                color: #ff7f00;
            }

            .card-content button {
                background-color: #ff7f00;
                color: #fff;
                border: none;
                border-radius: 5px;
                padding: 10px 20px;
                cursor: pointer;
                transition: background-color 0.3s;
                align-self: center;
            }

                .card-content button:hover {
                    background-color: #cc6600;
                }


        .header-area {
            width: 100%; /* Ensure full width */
            position: sticky; /* Sticky or static based on need */
            top: 0; /* Stick to top */
            z-index: 1000; /* Ensure it stays on top */
            background-color: #1e1e1e; /* Background color to match the theme */
        }



        .dashboard {
            margin-top: 60px; /* Adjust this value based on the actual height of your header */
        }

        .button-container {
            text-align: center;
            margin: 20px 0;
        }

        footer {
            background-color: #1e1e1e;
            padding: 15px 0;
            text-align: center;
            margin-top: auto; /* Ensure footer is at the bottom */
            box-shadow: 0 -2px 4px rgba(0,0,0,0.1); /* إضافة ظل خفيف */
        }

            footer p {
                margin: 0;
                color: #fff;
            }

        .h22 {
            margin-top: 75px;
            margin-bottom: 44px;
            text-align: center;
            font-size: xxx-large;
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
        <div class="container mt-4">
            <h2 class="text-center mb-4">Select Your Courses</h2>
            <div class="dashboard">
                <div class="card">
                    <img src="Images/html.png" alt="HTML" />
                    <div class="card-content">
                        <h2>HTML</h2>
                        <asp:CheckBox ID="course1" runat="server" CssClass="card-checkbox" Text="Select HTML" />
                    </div>
                </div>
                <div class="card">
                    <img src="Images/css.png" alt="CSS" />
                    <div class="card-content">
                        <h2>CSS</h2>
                        <asp:CheckBox ID="course2" runat="server" CssClass="card-checkbox" Text="Select CSS" />
                    </div>
                </div>
                <div class="card">
                    <img src="Images/javascript.png" alt="JavaScript" />
                    <div class="card-content">
                        <h2>JavaScript</h2>
                        <asp:CheckBox ID="course3" runat="server" CssClass="card-checkbox" Text="Select JavaScript" />
                    </div>
                </div>
            </div>
            <div class="button-container">
                <asp:Button ID="SubmitSelection" runat="server" Text="Submit" OnClick="SubmitSelection_Click" CssClass="btn btn-primary " />
            </div>
        </div>
    </form>

    <footer>
        <div class="container">
            <p>&copy; 2024 Your Company. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
