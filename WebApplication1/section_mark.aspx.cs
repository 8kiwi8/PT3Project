using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class section_mark : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {

            // find values for update
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
            TextBox txtid = (TextBox)GridView1.FooterRow.FindControl("txts_id");
            TextBox txtitem = (TextBox)GridView1.FooterRow.FindControl("txtsm_item");
            TextBox txttotal = (TextBox)GridView1.FooterRow.FindControl("txtsm_total");
            TextBox txtpercentage = (TextBox)GridView1.FooterRow.FindControl("txtsm_percentage");

            // insert values into database
            string query = "insert into section_mark (s_id, sm_item, sm_total, sm_percentage) values ('"+ txtid.Text + "','" + txtitem.Text + "','" + txttotal.Text + "','" + txtpercentage.Text + "')";
            SqlCommand cmd = new SqlCommand(query, conn);
            //Console.Write(query);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            GridView1.DataBind();
        }
    }
}