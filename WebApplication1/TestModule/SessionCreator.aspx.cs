using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Testing
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            Session["u_name"] = "testadmin";
            Session["p_name"] = "Test Admin";
            Session["u_level"] = "admin";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            Session["u_name"] = "testlecturer";
            Session["p_name"] = "Test Lecturer";
            Session["u_level"] = "lecturer";
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Session.Contents.RemoveAll();
            Session["u_name"] = "teststudent";
            Session["p_name"] = "Test Student";
            Session["u_level"] = "student";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Session.Clear();
        }
    }
}