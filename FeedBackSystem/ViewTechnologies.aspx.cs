using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;

namespace FeedBackSystem
{
    public partial class ViewTechnologies : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSelectedTechnologies();
            }
        }

        private void LoadSelectedTechnologies()
        {
            try
            {
                string filePath = Server.MapPath("~/App_Data/Technology.txt");
                List<Course> courses = new List<Course>();

                if (File.Exists(filePath))
                {
                    string[] lines = File.ReadAllLines(filePath);
                    foreach (string line in lines)
                    {
                        string[] parts = line.Split('|');
                        if (parts.Length == 3)
                        {
                            Course course = new Course
                            {
                                CourseName = parts[0],
                                Description = parts[1],
                                ImagePath = parts[2]
                            };
                            courses.Add(course);
                        }
                    }
                }

                TechnologiesRepeater.DataSource = courses;
                TechnologiesRepeater.DataBind();
            }
            catch (Exception ex)
            {
                // Handle exception, log error message, or display error to user
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        public class Course
        {
            public string CourseName { get; set; }
            public string Description { get; set; }
            public string ImagePath { get; set; }
        }
    }
}