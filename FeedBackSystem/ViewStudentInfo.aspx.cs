using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FeedbackSystem
{
    public partial class ViewStudentInfo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindStudentInfo("");
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            BindStudentInfo(searchText);
        }

        protected void btnSort_Click(object sender, EventArgs e)
        {
            string searchText = txtSearch.Text.Trim();
            BindStudentInfo(searchText, true);
        }

        private void BindStudentInfo(string searchText, bool sort = false)
        {
            string filePath = Server.MapPath("~/App_Data/Students.txt");

            if (File.Exists(filePath))
            {
                string[] lines = File.ReadAllLines(filePath);
                var studentData = new List<Student>();

                foreach (string line in lines)
                {
                    string[] data = line.Split(',');
                    if (data.Length >= 3)
                    {
                        string id = data[0];
                        string email = data[1];
                        string courses = string.Join(", ", data, 2, data.Length - 2);

                        // Filter by searchText
                        if (string.IsNullOrEmpty(searchText) ||
                            id.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0 ||
                            email.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0 ||
                            courses.IndexOf(searchText, StringComparison.OrdinalIgnoreCase) >= 0)
                        {
                            studentData.Add(new Student { ID = id, Email = email, Courses = courses });
                        }
                    }
                }

                if (sort)
                {
                    studentData = studentData.OrderBy(s => s.ID).ToList();
                }

                gvStudentInfo.DataSource = studentData;
                gvStudentInfo.DataBind();
            }
            else
            {
                // Handle case where file does not exist or is inaccessible
                // For example, display an error message or log the issue
            }
        }

        protected string GetResultLink(object dataItem)
        {
            // Here you can customize how the "Student Result" column appears
            // For now, return an empty string or any default value
            return string.Empty;
        }

        // Define a class to hold student data
        public class Student
        {
            public string ID { get; set; }
            public string Email { get; set; }
            public string Courses { get; set; }
        }
    }
}