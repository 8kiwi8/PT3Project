using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


namespace WebApplication1.TestModule
{
    public partial class Test_Register : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            conn.Open();
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            /* SqlCommand cmd = conn.CreateCommand();
             cmd.CommandText = "INSERT INTO profile VALUES (@u_name,@p_name,@p_phone_no,p_email)";
             cmd.Parameters.AddWithValue("@u_name", txtUname.Text);
             cmd.Parameters.AddWithValue("@p_name", txtPname.Text);
             cmd.Parameters.AddWithValue("@p_phone_no", txtPPhoneNo);
             cmd.Parameters.AddWithValue("@p_email", txtPEmailAddress);
             cmd.ExecuteNonQuery();
             conn.Close();
             Label1.Visible = true;
             Label1.Text = "Your data Stored Succesfully";
             txtUname.Text = "";
             txtPname.Text = "";
             txtPass.Text = "";
             txtConfirm.Text = "";
             txtPPhoneNo.Text = "";
             txtPEmailAddress.Text = "";
             
                */

            try
            {
                string query = "INSERT INTO profile (u_name,p_name,p_phone_no,p_email) VALUES(@u_name,@p_name,@p_phone_no,@p_email)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@u_name", txtUname.Text);
                cmd.Parameters.AddWithValue("@p_name", txtPname.Text);
                cmd.Parameters.AddWithValue("@p_phone_no", txtPPhoneNo.Text);
                cmd.Parameters.AddWithValue("@p_email", txtPEmailAddress.Text);
                cmd.ExecuteScalar();
            }
            catch(ArgumentException ex)
            {
                Label1.Text = ex.ToString();
            }

                conn.Close();
    
               Label1.Visible = true;
               //Label1.Text = "Your data Stored Succesfully";
               txtUname.Text = "";
               txtPname.Text = "";
               txtPass.Text = "";
               txtConfirm.Text = "";
               txtPPhoneNo.Text = "";
               txtPEmailAddress.Text = "";

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }
    }
}
 