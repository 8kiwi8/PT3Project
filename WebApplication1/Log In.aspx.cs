using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1.TestModule
{
    public partial class Log_In : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            //Create Connection String And SQL Statement
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string strSelect = "SELECT COUNT(*) FROM [user] WHERE u_name = @Username AND u_password = @Password";

            SqlConnection con = new SqlConnection(strCon);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSelect;

            SqlParameter username = new SqlParameter("@Username", SqlDbType.VarChar, 45);
            username.Value = txtUserName.Text.Trim().ToString();
            cmd.Parameters.Add(username);

            SqlParameter password = new SqlParameter("@Password", SqlDbType.VarChar, 255);
            password.Value = txtPwd.Text.Trim().ToString();
            cmd.Parameters.Add(password);

            con.Open();
            int result = (Int32)cmd.ExecuteScalar();
            con.Close();

            if (result >= 1)
            {
                Response.Redirect("homepage.aspx");
            }
            else
                lblMsg.Text = "Incorrect Username or Password";

        }
    }
}