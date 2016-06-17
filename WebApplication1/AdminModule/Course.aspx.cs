using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.AdminModule
{
    public partial class Course : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBox TextBox1 = (TextBox)GridView1.FooterRow.FindControl("TextBox1");
            TextBox TextBox2 = (TextBox)GridView1.FooterRow.FindControl("TextBox2");
            TextBox TextBox3 = (TextBox)GridView1.FooterRow.FindControl("TextBox3");

            System.Collections.Specialized.ListDictionary listDictionary = new System.Collections.Specialized.ListDictionary();
            listDictionary.Add("c_code", TextBox1.Text);
            listDictionary.Add("c_name", TextBox2.Text);
            listDictionary.Add("c_credit", TextBox3.Text);
            LinqDataSource1.Insert(listDictionary);

            TextBox1.Text = String.Empty;
            TextBox2.Text = String.Empty;
            TextBox3.Text = String.Empty;
            GridView1.DataBind();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            if (GridView1.EditIndex > -1)
                GridView1.FooterRow.Visible = false;
            else
                GridView1.FooterRow.Visible = true;
        }
    }
}