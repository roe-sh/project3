using System;
using System.Web.UI;

namespace FeedbackSystem
{
    public partial class AdminLogin : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            string username = txtAdminUsername.Text;
            string password = txtAdminPassword.Text;

            // Define your admin credentials
            string adminUsername = "admin@gmail.com"; // Replace with your admin username
            string adminPassword = "1234567"; // Replace with your admin password

            if (username == adminUsername && password == adminPassword)
            {
                // Redirect to Admin Dashboard
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                lblMessage.Text = "Invalid credentials. Please try again.";
            }
        }
    }
}
