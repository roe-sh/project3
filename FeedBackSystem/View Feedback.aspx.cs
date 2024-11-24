using System;
using System.IO;
using System.Web.UI.WebControls;

namespace FeedBackSystem
{
    public partial class View_Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Populate dropdowns only on initial page load
                PopulateStudentsDropDown();
                PopulateCoursesDropDown();
            }
        }

        private void PopulateStudentsDropDown()
        {
            string filePath = Server.MapPath("~/App_Data/Students.txt");

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                DropDownList2.Items.Clear();

                foreach (string line in lines)
                {
                    string[] parts = line.Split(',');
                    if (parts.Length > 1)
                    {
                        string email = parts[1].Trim();
                        string name = email.Substring(0, email.IndexOf('@'));
                        DropDownList2.Items.Add(new ListItem(name, email)); // Use email as value
                    }
                }
            }
            else
            {
                DropDownList2.Items.Clear();
                DropDownList2.Items.Add(new ListItem("File not found", "0"));
            }
        }

        private void PopulateCoursesDropDown()
        {
            string filePath = Server.MapPath("~/App_Data/Courses.txt");

            if (File.Exists(filePath))
            {
                try
                {
                    // Read all lines from Courses.txt
                    string[] lines = File.ReadAllLines(filePath);

                    // Clear any existing items in DropDownListCourses
                    DropDownListCourses.Items.Clear();

                    // Add each course from the file to DropDownListCourses
                    foreach (string line in lines)
                    {
                        DropDownListCourses.Items.Add(new ListItem(line, line));
                    }
                }
                catch (Exception ex)
                {
                    // Handle exceptions if any
                    DropDownListCourses.Items.Clear();
                    DropDownListCourses.Items.Add(new ListItem("Error reading file", "0"));
                    // You might want to log the exception or handle it differently
                }
            }
            else
            {
                // Handle case where the file does not exist
                DropDownListCourses.Items.Clear();
                DropDownListCourses.Items.Add(new ListItem("File not found", "0"));
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedStudentEmail = DropDownList2.SelectedValue;
            string selectedCourse = DropDownListCourses.SelectedValue;

            // Generate the file path based on selected student, course, and feedback type
            string feedbackFileName = $"Feedback_{selectedCourse}_{selectedStudentEmail.Split('@')[0]}.txt";
            string filePath = Server.MapPath($"~/Feedback/{feedbackFileName}");

            // Check if the feedback file exists
            if (File.Exists(filePath))
            {
                try
                {
                    // Read the feedback content from the file
                    string feedbackContent = File.ReadAllText(filePath);

                    // Display the feedback in the respective labels
                    Label1.Text = GetFeedbackQuestion(feedbackContent, 1); // Adjust according to your labels
                    Label2.Text = GetFeedbackQuestion(feedbackContent, 2);
                    Label3.Text = GetFeedbackQuestion(feedbackContent, 3);
                    Label4.Text = GetFeedbackQuestion(feedbackContent, 4);

                    Label5.Text = GetFeedbackQuestion(feedbackContent, 5);
                    Label6.Text = GetFeedbackQuestion(feedbackContent, 6);
                    Label7.Text = GetFeedbackQuestion(feedbackContent, 7);
                    Label8.Text = GetFeedbackQuestion(feedbackContent, 8);
                    Label9.Text = GetFeedbackQuestion(feedbackContent, 9);
                    Label10.Text = GetFeedbackQuestion(feedbackContent, 10);

                    // Continue for all labels you have

                    // You can also handle showing/hiding labels dynamically based on feedback content
                }
                catch (Exception ex)
                {
                    // Handle any exceptions reading the file
                    // For example, log the exception or display an error message
                    Label1.Text = "Error loading feedback.";
                }
            }
            else
            {
                // Handle case where the feedback file does not exist
                Label1.Text = "No feedback available.";
            }
        }

        private string GetFeedbackQuestion(string feedbackContent, int questionNumber)
        {
            // Example method to extract specific question from feedback content
            string[] lines = feedbackContent.Split(new[] { Environment.NewLine }, StringSplitOptions.RemoveEmptyEntries);
            if (lines.Length >= questionNumber)
            {
                return lines[questionNumber - 1]; // Assuming questions are separated by new lines
            }
            return "Question not found.";
        }
    }
}