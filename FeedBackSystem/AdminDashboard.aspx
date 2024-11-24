<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="FeedBackSystem.AdminDashboard" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <!-- Bootstrap Core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css"/>
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css"/>
    <link rel="stylesheet" href="assets/css/owl.css"/>
    <link rel="stylesheet" href="assets/css/lightbox.css"/>

    <style>
        body {
            /*background-color:black;*/
            background-color:#ff7900;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .dashboard-title {
            text-align: center;
            font-size: 28px;
            color: #FFFFFF;
            padding: 20px;
        }
        .dashboard {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 0 20px 20px;
            justify-content: center;
        }
        .card {
            background-color:black;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: white;
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
            max-height: 150px;
            object-fit: contain;
            margin: auto;
            display: block;
        }
        .card-content {
            padding: 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .card-content h2 {
            color: #ff7f00;
        }
        .card-content button {
            background-color: #ff7f00;
            color: black;
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
    background-color: #1e1e1e;
               /* background-image:url(https://cdn.photoroom.com/v1/assets-cached.jpg?path=backgrounds_v3/black/Photoroom_black_background_extremely_fine_te*/xture_only_black_co_b32f51c1-a202-4f73-ab2c-9dd711cfcf97.jpg);

}

.dashboard {
    margin-top: 60px; /* Adjust this value based on the actual height of your header */
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    padding: 0 20px;
    justify-content: center;
}

/* Existing styles */
.card {
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
    max-height: 150px;
    object-fit: contain;
    margin: auto;
    display: block;
}

.card-content {
    padding: 20px;
    flex-grow: 1;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    
}

.card-content h2 {
    color: #ff7f00;
}

.card-content button {
    background-color: #ff7f00;
    color: black;
    border: none;
    border-radius: 5px;
    padding: 10px 20px;
    cursor: pointer;
    transition: background-color 0.3s;
    align-self: center;
}

.card-content button:hover {
    background-color: #cc6600;
    color:white;
}
.logo img {
    max-height: 80px; /* Adjust the height as needed */
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
     <img src="images/logo.png" alt="Logo" />
     <!-- Replace with your logo path -->
 </a>
                        <ul class="nav">
                            <li><a href="index.aspx" class="active">Home</a></li>
                           
                          <%-- <li><a href="#apply">Apply Now</a></li>
                          <li class="has-sub">
                                <a href="javascript:void(0)">Pages</a>
                                <ul class="sub-menu">
                                    <li><a href="meetings.html">Upcoming Meetings</a></li>
                                    <li><a href="meetings.html">Upcoming Meetings</a></li>
                                </ul>
                            </li>--%>
                            
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

    <form id="form1" runat="server">
        
        <div class="dashboard">
            <div class="card">
                <img src="images/add_courses.jpg" alt="Add Courses">
                <div class="card-content">
                    <%--<h2>Add Courses</h2>--%>
                    <%--<p>Add, edit, and delete courses.</p>--%>
                    <button type="button" onclick="window.location.href='AddCourses.aspx'">Add Courses</button>
                </div>
            </div>
            <div class="card">
                <img src="images/add_questions.jpg" alt="Add Questions">
                <div class="card-content">
                   <%-- <h2>Add Questions</h2>--%>
                    <%--<p>Add, edit, and delete questions.</p>--%>
                    <button type="button" onclick="window.location.href='AddQuestions.aspx'">Add Questions</button>
                </div>
            </div>
            <div class="card">
                <img src="images/view_technologies.jpg" alt="View Technologies">
                <div class="card-content">
                    <%--<h2>Show Technologies</h2>--%>
                    <%--<p>See the list of available technologies.</p>--%>
                    <button type="button" onclick="window.location.href='ViewTechnologies.aspx'">View Technologies</button>
                </div>
            </div>
            <div class="card">
                <img src="images/view_questions.jpg" alt="View Questions">
                <div class="card-content">
                   <%-- <h2>Show Questions</h2>--%>
                    <%--<p>See the list of available questions.</p>--%>
                    <button type="button" onclick="window.location.href='ShowQuestions.aspx'">View Questions</button>
                </div>
            </div>
            <div class="card">
                <img src="images/view_student_info.jpg" alt="View Student Info">
                <div class="card-content">
                  
                  <%--  <p>See the list of registered students.</p>--%>
                    <button type="button" onclick="window.location.href='ViewStudentInfo.aspx'">View Student Info</button>
                </div>
            </div>
            <div class="card">
                <img src="images/view_results.jpg" alt="View Results">
                <div class="card-content">
                   <%-- <h2>Show Results</h2>--%>
                    <%--<p>See the results of student assessments.</p>--%>
                    <button type="button" onclick="window.location.href='Results.aspx'">View Results</button>
                </div>
            </div>
            <div class="card">
                <img src="images/add_student.jpg" alt="Add Student">
                <div class="card-content">
                   <%-- <h2>Add Student</h2>--%>
                   <%-- <p>Add a new student to the system.</p>--%>
                    <button type="button" onclick="window.location.href='AddStudent.aspx'">Add Student</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
