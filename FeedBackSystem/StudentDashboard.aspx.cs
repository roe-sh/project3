using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FeedbackSystem
{
    public partial class StudentDashboard : Page
    {
        private string studentId;
        private string email;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentId"] != null && Session["Email"] != null)
            {
                studentId = Session["StudentId"].ToString();
                email = Session["Email"].ToString();

                // Extract the name from the email
                string studentName = email.Split('@')[0];
                lblStudentName.Text = studentName;

                if (!IsPostBack)
                {
                    LoadRegisteredCourses();
                }
            }
            else
            {
                Response.Redirect("StudentLogin.aspx");
            }
        }

        private void LoadRegisteredCourses()
        {
            string[] lines = File.ReadAllLines(Server.MapPath("~/App_Data/Students.txt"));
            var courses = lines
                .Where(line => line.StartsWith($"{studentId},{email}"))
                .Select(line => line.Split(',').Skip(2))
                .FirstOrDefault();

            var courseData = new System.Data.DataTable();
            courseData.Columns.Add("CourseName");

            if (courses != null)
            {
                foreach (var course in courses)
                {
                    courseData.Rows.Add(course.Trim());
                }
            }

            gvCourses.DataSource = courseData;
            gvCourses.DataBind();
        }

        protected void gvCourses_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "GiveFeedback")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = gvCourses.Rows[index];
                string courseName = selectedRow.Cells[0].Text;
                string studentName = email.Split('@')[0];

                Response.Redirect($"CourseQuestions.aspx?course={Uri.EscapeDataString(courseName)}&name={Uri.EscapeDataString(studentName)}");
            }
        }
    }
}