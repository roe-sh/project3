<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseQuestions.aspx.cs" Inherits="FeedBackSystem.CourseQuestions" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Course Questions</title>

    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css" />
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css" />
    <link rel="stylesheet" href="assets/css/owl.css" />
    <link rel="stylesheet" href="assets/css/lightbox.css" />

    <style>
        .question-container {
            margin-bottom: 20px;
        }

        .question-label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px; /* Space between question and radio buttons */
        }

        .validation-message {
            color: red;
            font-size: 12px;
            display: block;
        }

        input#btnSubmit {
            background-color: #ff7900;
            border: none;
            border-radius: 6px;
            padding: 7px;
            color: white;
            width: 24%;
            margin-right: 39%;
        }

        div#pnlQuestions {
            background-color: white;
            align-content: center;
            align-items: center;
            justify-content: center;
        }

        body {
            font-family: Arial, sans-serif;
            background: white;
            height: 158em;
        }

        form#form1 {
    width: 1000px;
    border: 1px solid #ff7900;
    border-radius: 10px;
    background-color: #ff7900;
    align-items: center;
    justify-content: center;
    padding: 10px;
    height: auto;
    margin: 6%;
    margin-left: 17%;
}

        .header-area {
            width: 100%;
            position: sticky;
            top: 0;
            z-index: 1000;
            background-color: #1e1e1e;
        }

        .logo img {
            max-height: 80px;
            width: auto;
        }

        .form-check .form-check-label {
            margin-left: 10px; /* Space between radio button and value */
        }

        .form-check {
            margin-bottom: 10px; /* Space between each radio button */
        }

        span#lblQuestion2, span#lblQuestion1, span#lblQuestion3, span#lblQuestion4, span#lblQuestion5, span#lblQuestion6, span#lblQuestion7, span#lblQuestion8, span#lblQuestion9, span#lblQuestion10 {
            font-weight: bold
        }

        input#rblAnswer1_0, input#rblAnswer1_1, input#rblAnswer1_2, input#rblAnswer1_3, input#rblAnswer1_4 
        ,input#rblAnswer2_0,input#rblAnswer2_1,input#rblAnswer2_2,input#rblAnswer2_3,input#rblAnswer2_4,
        input#rblAnswer3_0,input#rblAnswer3_1,input#rblAnswer3_2,input#rblAnswer3_3,input#rblAnswer3_4
        ,input#rblAnswer4_0,input#rblAnswer4_1,input#rblAnswer4_2,input#rblAnswer4_3,input#rblAnswer4_4
        ,input#rblAnswer5_0,input#rblAnswer5_1,input#rblAnswer5_2,input#rblAnswer5_3,input#rblAnswer5_4,
        input#rblAnswer6_0,input#rblAnswer6_1,input#rblAnswer6_2,input#rblAnswer6_3,input#rblAnswer6_4,input#rblAnswer6_5,
        input#rblAnswer7_0,input#rblAnswer7_1,input#rblAnswer7_2,input#rblAnswer7_3,input#rblAnswer7_4,
        input#rblAnswer8_0,input#rblAnswer8_1,input#rblAnswer8_2,input#rblAnswer8_3,input#rblAnswer8_4,
        input#rblAnswer9_0,input#rblAnswer9_1,input#rblAnswer9_2,input#rblAnswer9_3,input#rblAnswer9_4,
        input#rblAnswer10_0,input#rblAnswer10_1,input#rblAnswer10_2,input#rblAnswer10_3,input#rblAnswer10_4
        {
            margin-right: 10px;
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
                            <li><a href="ViewTechnologies.aspx">View Technologies</a></li>
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
    <form id="form1" runat="server" class="px-4">
        <div class="mx-0 mx-sm-auto">
            <div class="card">
                <div class="card-body">
                    <div class="text-center">
                        <i class="far fa-file-alt fa-4x mb-3 text-primary"></i>
                        <p>
                            <strong style="font-size: 1.5em">Your opinion matters</strong>
                        </p>
                        <p style="font-size: .9em">
                            Have some ideas on how to improve our Courses?
                            <strong>Give us your feedback.</strong>
                        </p>
                    </div>
                    <hr />
                    <div id="pnlQuestions" runat="server"></div>
                </div>
                <div class="card-footer text-end">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
