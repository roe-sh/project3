using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace FeedBackSystem
{
    public partial class AddQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // قراءة البيانات من الملف النصي
                string filePath = Server.MapPath("~/App_Data/Technology.txt");
                List<string> technologies = new List<string>();

                if (File.Exists(filePath))
                {
                    technologies = new List<string>(File.ReadAllLines(filePath));
                }
                List<string> firstParts = new List<string>();

                foreach (string line in technologies)
                {
                    char separator = '|'; // Space character
                    string[] parts = line.Split(separator); // returned array
                    if (parts.Length > 0)
                    {
                        firstParts.Add(parts[0]); // add only the first part to the list
                    }
                }

                // Set the DropDownList DataSource
                DropDownList1.DataSource = firstParts;
                Console.WriteLine(DropDownList1.DataSource);
                DropDownList1.DataBind();

            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedValue = DropDownList1.SelectedValue;
        }
        protected void Btnsubmit(object sender, EventArgs e)
        {

            string technology = DropDownList1.SelectedItem.Text;
            string[] questions = new string[10];
            questions[0] = TextBox1.Text;
            questions[1] = TextBox2.Text;
            questions[2] = TextBox3.Text;
            questions[3] = TextBox4.Text;
            questions[4] = TextBox5.Text;
            questions[5] = TextBox6.Text;
            questions[6] = TextBox7.Text;
            questions[7] = TextBox8.Text;
            questions[8] = TextBox9.Text;
            questions[9] = TextBox10.Text;
            string file = Server.MapPath($"~/App_Data/AdminQuestions{technology}.txt"); // تحديد مسار الملف
            if (!File.Exists(file)) // التحقق من وجود الملف
            {
                using (StreamWriter sw = File.CreateText(file))
                {
                    sw.WriteLine(technology);
                    for (int i = 0; i < questions.Length; i++)
                    {
                        sw.WriteLine(questions[i]);
                    }
                    DropDownList1.SelectedIndex = -1;
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                    TextBox8.Text = "";
                    TextBox9.Text = "";
                    TextBox10.Text = "";

                }
            }
            else
            {
                using (StreamWriter sw = new StreamWriter(file))
                {
                    sw.WriteLine(technology);
                    for (int i = 0; i < questions.Length; i++)
                    {
                        sw.WriteLine(questions[i]);
                    }
                    DropDownList1.SelectedIndex = -1;
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                    TextBox8.Text = "";
                    TextBox9.Text = "";
                    TextBox10.Text = "";
                }
            }
            Response.Write("<script>alert('Your Question saved successfully.');</script>");
        }
    }
}