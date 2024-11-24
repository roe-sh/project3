using System;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace FeedbackSystem
{
    public partial class StudentLogin : Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string studentId = txtStudentId.Text;
            string[] lines = File.ReadAllLines(Server.MapPath("~/App_Data/Students.txt"));

            bool isValidStudent = lines.Any(line => line.Contains($"{studentId},{email}"));
            if (isValidStudent)
            {
                Session["StudentId"] = studentId;
                Session["Email"] = email;
                Response.Redirect("StudentDashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid credentials or not registered for any courses');</script>");
            }
        }
    }
}
