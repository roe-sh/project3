using System;
using System.IO;
using System.Web.UI;

namespace AddStudent
{
    public partial class AddStudent : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string id = txtName.Text;  // This should be student ID
            string email = txtEmail.Text;
            string choices = string.Empty;

            if (chkChoice1.Checked) choices += "HTML, ";
            if (chkChoice2.Checked) choices += "CSS, ";
            if (chkChoice3.Checked) choices += "JavaScript, ";
            

            if (choices.Length > 0)
                choices = choices.Substring(0, choices.Length - 2); // Remove trailing comma and space

            string data = $"{id},{email},{choices}";

            string path = Server.MapPath("~/App_Data/Students.txt");
            File.AppendAllText(path, data + Environment.NewLine);

            // Optionally clear the form fields after saving
            txtName.Text = string.Empty;
            txtEmail.Text = string.Empty;
            chkChoice1.Checked = false;
            chkChoice2.Checked = false;
            chkChoice3.Checked = false;
            

            // Optionally display a success message
            Response.Write("<script>alert('Student information saved successfully.');</script>");
        }
    }
}
