using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.AccountModule
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLogIn_Click(object sender, EventArgs e)
        {
            //Create Connection String And SQL Statement
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string strSelect = "SELECT u.u_name, p.p_name, u_level FROM [user] AS u JOIN [profile] AS p ON u.u_name = p.u_name WHERE u.u_name = @Username AND u.u_password = @Password";

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
            SqlDataReader sdr = cmd.ExecuteReader();

            if (sdr.HasRows)
            {
                sdr.Read();
                Session["u_name"] = sdr.GetString(0);
                Session["p_name"] = sdr.GetString(1);
                Session["u_level"] = sdr.GetString(2);
                Response.Redirect("~/");
            }
            else
            {
                lblMsg.Text = "Incorrect Username or Password";
            }
            con.Close();
        }
    }
}