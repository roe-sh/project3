using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FeedBackSystem
{
    public partial class CourseQuestions : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["course"] != null && Request.QueryString["name"] != null)
                {
                    string course = Server.UrlDecode(Request.QueryString["course"]);
                    string email = Server.UrlDecode(Request.QueryString["name"]);

                    ViewState["Course"] = course;
                    ViewState["StudentEmail"] = email;

                    if (HasAlreadySubmittedFeedback(course, email))
                    {
                        pnlQuestions.Controls.Add(new Literal { Text = "You have already submitted feedback for this course." });
                        btnSubmit.Visible = false;
                    }
                    else
                    {
                        LoadCourseQuestions(course);
                    }
                }
                else
                {
                    pnlQuestions.Controls.Add(new Literal { Text = "Course or student name missing in the query string." });
                }
            }
            else
            {
                // Recreate the controls on postback
                CreateQuestionControls();
            }
        }

        private void LoadCourseQuestions(string course)
        {
            string filePath = Server.MapPath($"~/App_Data/AdminQuestions{course}.txt");
            try
            {
                if (File.Exists(filePath))
                {
                    string[] questions = File.ReadAllLines(filePath);
                    for (int i = 1; i < questions.Length; i++)
                    {
                        string question = questions[i].Trim(); // Trim to remove any leading or trailing whitespace

                        if (!string.IsNullOrEmpty(question))
                        {
                            pnlQuestions.Controls.Add(new LiteralControl("<div class='form-group'>"));

                            // Add line before each question except the first one
                            if (i > 1)
                            {
                                pnlQuestions.Controls.Add(new LiteralControl("<hr />"));
                            }

                            Label lblQuestion = new Label
                            {
                                ID = $"lblQuestion{i}",
                                Text = Server.HtmlEncode(question),
                                CssClass = "font-weight-bold"
                            };
                            pnlQuestions.Controls.Add(lblQuestion);

                            RadioButtonList rblAnswers = new RadioButtonList
                            {
                                ID = $"rblAnswer{i}",
                                CssClass = "form-check"
                            };

                            rblAnswers.Items.Add(new ListItem("Excellent"));
                            rblAnswers.Items.Add(new ListItem("Very Good"));
                            rblAnswers.Items.Add(new ListItem("Good"));
                            rblAnswers.Items.Add(new ListItem("Poor"));


                            foreach (ListItem item in rblAnswers.Items)
                            {
                                item.Attributes.CssStyle.Add("margin-bottom", "10px");
                            }

                            pnlQuestions.Controls.Add(rblAnswers);
                            pnlQuestions.Controls.Add(new LiteralControl("</div>"));
                        }
                    }
                    pnlQuestions.Visible = true;
                    btnSubmit.Visible = true;
                }
                else
                {
                    pnlQuestions.Controls.Add(new Literal { Text = "No questions found for this course." });
                }
            }
            catch (Exception ex)
            {
                pnlQuestions.Controls.Add(new Literal { Text = "Error reading file: " + ex.Message });
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ValidateAnswers())
            {
                string course = ViewState["Course"].ToString();
                string email = ViewState["StudentEmail"].ToString();
                string studentName = GetStudentNameByEmail(email);
                string feedbackDirectory = Server.MapPath("~/Feedback");
                string feedbackFilePath = Path.Combine(feedbackDirectory, $"Feedback_{course}_{studentName}.txt");

                // Check if feedback file already exists
                if (!File.Exists(feedbackFilePath))
                {
                    try
                    {
                        // Create new feedback file and write feedback responses
                        using (StreamWriter writer = new StreamWriter(feedbackFilePath, true))
                        {
                            foreach (Control control in pnlQuestions.Controls)
                            {
                                if (control is RadioButtonList rbl)
                                {
                                    string questionIndex = rbl.ID.Replace("rblAnswer", "");
                                    if (int.TryParse(questionIndex, out int index))
                                    {
                                        string selectedAnswer = rbl.SelectedValue ?? "No answer selected";
                                        writer.WriteLine($"Question {index}: {selectedAnswer}");
                                    }
                                    else
                                    {
                                        writer.WriteLine($"Invalid question index: {questionIndex}");
                                    }
                                }
                            }
                        }

                        // Show alert message after successful submission
                        ShowAlertMessage("Feedback submitted successfully!");
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Error writing to file: {ex.Message}");
                        // Optionally, handle or log the exception
                    }
                }
                else
                {
                    // Feedback already submitted for this course, handle as per your application's logic
                    // For example, display a message or redirect the user
                    Response.Redirect("index.aspx");
                }
            }
        }

        private void CreateQuestionControls()
        {
            string course = ViewState["Course"]?.ToString();
            if (!string.IsNullOrEmpty(course))
            {
                LoadCourseQuestions(course);
            }
        }

        private bool ValidateAnswers()
        {
            bool allQuestionsAnswered = true;
            var controlsToValidate = new List<RadioButtonList>();

            // First, collect the controls to validate
            foreach (Control control in pnlQuestions.Controls)
            {
                if (control is RadioButtonList rbl)
                {
                    controlsToValidate.Add(rbl);
                }
            }

            // Now validate the collected controls
            foreach (var rbl in controlsToValidate)
            {
                if (string.IsNullOrEmpty(rbl.SelectedValue))
                {
                    Label lblValidation = new Label
                    {
                        Text = "You need to select an answer for this question.",
                        ForeColor = System.Drawing.Color.Red,
                        CssClass = "validation-message"
                    };
                    pnlQuestions.Controls.AddAt(pnlQuestions.Controls.IndexOf(rbl) + 1, lblValidation);
                    allQuestionsAnswered = false;
                }
            }

            return allQuestionsAnswered;
        }

        private string GetStudentNameByEmail(string email)
        {
            string studentsFilePath = Server.MapPath("~/App_Data/Students.txt");
            string studentName = email.Split('@')[0]; // Default to the part before the "@" if no match is found

            if (File.Exists(studentsFilePath))
            {
                var studentRecords = File.ReadAllLines(studentsFilePath);

                foreach (var record in studentRecords)
                {
                    var fields = record.Split(',');
                    if (fields.Length > 1 && fields[1].Trim().Equals(email, StringComparison.OrdinalIgnoreCase))
                    {
                        studentName = fields[1].Split('@')[0]; // Use the part before the "@" as the name
                        break;
                    }
                }
            }

            return studentName;
        }

        private bool HasAlreadySubmittedFeedback(string course, string email)
        {
            string studentName = GetStudentNameByEmail(email);
            string feedbackDirectory = Server.MapPath("~/Feedback");
            string feedbackFilePath = Path.Combine(feedbackDirectory, $"Feedback_{course}_{studentName}.txt");

            return File.Exists(feedbackFilePath);
        }

        private void ShowAlertMessage(string message)
        {
            string script = $"<script type=\"text/javascript\">alert('{message}');window.location='index.aspx';</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Alert", script);
        }
    }
}