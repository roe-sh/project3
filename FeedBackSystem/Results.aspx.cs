using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FeedBackSystem
{
    public partial class Results : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadResults();
            }
        }

        protected void courseDropdown_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadResults(); // Reload results based on the selected course
        }

        protected void LoadResults()
        {
            string filePath = Server.MapPath("~/App_Data/Students.txt");
            List<Student> students = new List<Student>();

            try
            {
                List<string> cssFeedbackFilePaths = new List<string>();

                string feedbackDirectory = Server.MapPath("~/Feedback/");
                string[] feedbackFiles = Directory.GetFiles(feedbackDirectory, "Feedback_*.txt");

                foreach (string file in feedbackFiles)
                {
                    cssFeedbackFilePaths.Add(file);
                }

                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);

                    foreach (string line in lines)
                    {
                        string[] parts = line.Split(',');
                        if (parts.Length >= 3)
                        {
                            string studentID = parts[0].Trim();
                            string email = parts[1].Trim();
                            string studentName = email.Split('@')[0]; // Extract name from email

                            foreach (string course in parts.Skip(2).Select(p => p.Trim()))
                            {
                                string feedbackFilePath = Server.MapPath($"~/Feedback/Feedback_{course}_{studentName}.txt");

                                Student student = new Student
                                {
                                    StudentID = studentID,
                                    Email = email,
                                    StudentName = studentName,
                                    Course = course,
                                    FeedbackFileName = feedbackFilePath,
                                    OverallPercentage = CalculateOverallPercentage(cssFeedbackFilePaths, course)
                                };

                                students.Add(student);
                            }
                        }
                    }

                    // Filter students based on selected course
                    string selectedCourse = courseDropdown.SelectedValue;
                    if (!string.IsNullOrEmpty(selectedCourse))
                    {
                        students = students.Where(s => s.Course == selectedCourse).ToList();
                    }

                    PopulateStudentTable(students);
                }
                else
                {
                    // Handle file not found scenario
                    throw new FileNotFoundException("Students.txt not found.");
                }
            }
            catch (Exception ex)
            {
                // Handle and log errors
                Console.WriteLine($"Error loading results: {ex.Message}");
                // Optionally display a user-friendly error message on the UI
            }
        }

        private void PopulateStudentTable(List<Student> students)
        {
            studentTable.Rows.Clear(); // Clear existing rows

            // Create and add header row
            TableHeaderRow headerRow = new TableHeaderRow();

            TableHeaderCell headerCellCourse = new TableHeaderCell { Text = "Course", CssClass = "text-center" };
            TableHeaderCell headerCellPercentage = new TableHeaderCell { Text = "Overall Percentage", CssClass = "text-center" };

            headerRow.Cells.Add(headerCellCourse);
            headerRow.Cells.Add(headerCellPercentage);

            studentTable.Rows.Add(headerRow);

            // Use a dictionary to store the first found student for each course
            Dictionary<string, Student> courseStudents = new Dictionary<string, Student>();

            foreach (Student student in students)
            {
                // Check if the course has already been displayed
                if (!courseStudents.ContainsKey(student.Course))
                {
                    // Store the first found student for each course
                    courseStudents.Add(student.Course, student);

                    TableRow row = new TableRow();

                    // Set background color based on overall percentage
                    if (student.OverallPercentage > 85)
                    {
                        row.BackColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        row.BackColor = System.Drawing.Color.Red;
                    }

                    TableCell cellCourse = new TableCell { Text = student.Course, CssClass = "text-center" };
                    TableCell cellPercentage = new TableCell { Text = student.OverallPercentage.ToString("F2") + "%", CssClass = "text-center" };

                    row.Cells.Add(cellCourse);
                    row.Cells.Add(cellPercentage);

                    studentTable.Rows.Add(row);
                }
            }
        }


        private double CalculateOverallPercentage(List<string> feedbackFilePaths, string course)
        {
            int totalFiles = 0;
            int totalQuestions = 0;
            int totalCorrectAnswers = 0;

            foreach (string filePath in feedbackFilePaths)
            {
                // Check if the filePath contains the course name
                if (filePath.Contains(course))
                {
                    if (File.Exists(filePath))
                    {
                        string[] feedbackLines = File.ReadAllLines(filePath);

                        // Accumulate total questions and correct answers for files containing the course
                        totalQuestions += feedbackLines.Length;
                        totalCorrectAnswers += feedbackLines.Count(line => line.Contains("Excellent") || line.Contains("Very Good"));

                        totalFiles++; // Increment total files processed
                    }
                }
            }

            // Calculate overall percentage if there are files with questions
            if (totalQuestions > 0)
            {
                double averagePercentage = ((double)totalCorrectAnswers / totalQuestions) * 100;
                return averagePercentage;
            }

            return 0; // Return 0 if no files exist or no questions found for the specified course
        }
    }

    public class Student
    {
        public string StudentID { get; set; }
        public string Email { get; set; }
        public string StudentName { get; set; }
        public string Course { get; set; }
        public string FeedbackFileName { get; set; }
        public double OverallPercentage { get; set; }
    }
}
