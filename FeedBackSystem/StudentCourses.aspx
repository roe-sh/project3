<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentCourses.aspx.cs" Inherits="FeedbackSystem.StudentCourses" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Courses</title>
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
    <style>
       body {
    background: #ff7900 url('path_to_your_image.jpg') no-repeat center center;
    background-size: cover;
    font-family: Arial, sans-serif;
    padding-top: 70px;
}

/* Ensure no other background styling is causing the duplication */
.container {
    background-color: #444;
    color: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    width: 90%;
    margin: auto;
}

/* Ensure responsive behavior */
@media (max-width: 429px) {
    body {
        background-size: contain;
        
    }
}
    </style>
</head>
<body>
    <form runat="server">
        <div class="container">
            <h2 class="mb-4">Registered Courses</h2>
            <asp:GridView ID="gvCourses" runat="server" CssClass="table table-striped" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                    <asp:ButtonField Text="Give Feedback" CommandName="GiveFeedback" ButtonType="Button" />
                </Columns>
            </asp:GridView>
            <div id="feedbackSection" runat="server" class="feedback-section" visible="false">
                <h3>Provide Feedback</h3>
                <asp:Panel ID="pnlQuestions" runat="server"></asp:Panel>
                <asp:Button ID="btnSubmitFeedback" runat="server" Text="Submit Feedback" OnClick="btnSubmitFeedback_Click" CssClass="btn btn-primary mt-2" />
            </div>
        </div>
    </form>
</body>
</html>
