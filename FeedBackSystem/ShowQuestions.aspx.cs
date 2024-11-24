using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FeedBackSystem
{
    public partial class ShowQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Read data from the text file
                string filePath = Server.MapPath("~/App_Data/Technology.txt");
                List<string> technologies = new List<string>();

                if (File.Exists(filePath))
                {
                    technologies = new List<string>(File.ReadAllLines(filePath));
                }

                // Extract only the first part of each technology string
                var firstParts = technologies
                    .Select(t => t.Split('|')[0])
                    .Distinct() // Ensure there are no duplicate entries
                    .ToList();

                // Bind the first parts to the DropDownList
                DropDownList2.DataSource = firstParts;
                DropDownList2.DataBind();
            }
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = DropDownList2.SelectedValue;
            string file = Server.MapPath($"~/App_Data/AdminQuestions{selectedValue}.txt");

            if (File.Exists(file)) // Check if file exists 
            {
                DisplayFileContent(file);
            }
            else
            {
                ClearLabels();
                Label1.Text = "File does not exist.";
            }
        }

        private void DisplayFileContent(string filePath)
        {
            string[] lines = File.ReadAllLines(filePath);

            if (lines.Length >= 10)
            {
                Label1.Text = lines[1];
                Label2.Text = lines[2];
                Label3.Text = lines[3];
                Label4.Text = lines[4];
                Label5.Text = lines[5];
                Label6.Text = lines[6];
                Label7.Text = lines[7];
                Label8.Text = lines[8];
                Label9.Text = lines[9];
                Label10.Text = lines[10];
            }
            else
            {
                ClearLabels();
                Label1.Text = "Not enough lines in the file.";
            }
        }

        private void ClearLabels()
        {
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";
            Label4.Text = "";
            Label5.Text = "";
            Label6.Text = "";
            Label7.Text = "";
            Label8.Text = "";
            Label9.Text = "";
            Label10.Text = "";
        }
    }
}
