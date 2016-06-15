using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class Create_Profile_1 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                string query = "INSERT INTO [user] (u_name,u_password,u_level) VALUES(@u_name,@u_password,@u_level)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@u_name", txtU_name.Text);
                cmd.Parameters.AddWithValue("@u_password", txtU_passsword.Text);
                cmd.Parameters.AddWithValue("@u_level", txtU_level.Text);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                conn.Open();
                int i = cmd.ExecuteNonQuery();
                conn.Close();

                if (dt.Rows.Count > 0)
                {
                    Session["id"] = txtU_name.Text;
                    Response.Redirect("homepage.aspx");
                    Session.RemoveAll();
                }
                else
                {
                    Label1.Text = "You're username and word is incorrect";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }

                }
            catch (ArgumentException ex)
            {
                Label1.Text = "You're username and word is incorrect";
                //Label1.ForeColor = System.Drawing.Color.Red;
            }


        }

    }
    
}