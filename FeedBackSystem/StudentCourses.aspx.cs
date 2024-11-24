using System;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FeedbackSystem
{
    public partial class StudentCourses : Page
    {
        private string studentId;
        private string email;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentId"] != null && Session["Email"] != null)
            {
                studentId = Session["StudentId"].ToString();
                email = Session["Email"].ToString();

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

                LoadFeedbackQuestions(courseName);
            }
        }

        private void LoadFeedbackQuestions(string courseName)
        {
            pnlQuestions.Controls.Clear();
            string filePath = Server.MapPath($"~/App_Data/AdminQuestion{courseName}.txt");
            try
            {
                string[] questions = File.ReadAllLines(filePath);
                for (int i = 0; i < questions.Length; i++)
                {
                    string question = questions[i];
                    Label lblQuestion = new Label();
                    lblQuestion.Text = Server.HtmlEncode(question);
                    pnlQuestions.Controls.Add(lblQuestion);

                    RadioButtonList rblAnswers = new RadioButtonList();
                    rblAnswers.ID = "rblAnswer" + i;
                    rblAnswers.Items.Add(new ListItem("Excellent"));
                    rblAnswers.Items.Add(new ListItem("Very Good"));
                    rblAnswers.Items.Add(new ListItem("Good"));
                    rblAnswers.Items.Add(new ListItem("Poor"));
                    pnlQuestions.Controls.Add(rblAnswers);

                    pnlQuestions.Controls.Add(new LiteralControl("<br /><br />"));
                }
                feedbackSection.Visible = true;
                feedbackSection.Attributes["data-course"] = courseName;
            }
            catch (Exception ex)
            {
                pnlQuestions.Controls.Add(new Literal { Text = "Error reading file: " + ex.Message });
            }
        }

        protected void btnSubmitFeedback_Click(object sender, EventArgs e)
        {
            string courseName = feedbackSection.Attributes["data-course"];
            var feedbackData = new System.Text.StringBuilder();

            foreach (Control control in pnlQuestions.Controls)
            {
                if (control is RadioButtonList rbl)
                {
                    string questionIndex = rbl.ID.Replace("rblAnswer", "");
                    int index = int.Parse(questionIndex);
                    string selectedAnswer = rbl.SelectedValue;
                    feedbackData.AppendLine($"{studentId},{email},{index},{selectedAnswer}");
                }
            }

            string path = Server.MapPath($"~/App_Data/{courseName}_Feedback.txt");
            File.AppendAllText(path, feedbackData.ToString());

            feedbackSection.Visible = false;
            Response.Write("<script>alert('Feedback submitted successfully.');</script>");
        }
    }
}
