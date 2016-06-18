using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.StudentModule
{
    public partial class ViewResult : System.Web.UI.Page
    {
        CampuswebDataContext campusweb;
        protected void Page_Load(object sender, EventArgs e)
        {
            campusweb = new CampuswebDataContext();
            Session["u_name"] = "teststudent";
        }

        protected void UpdateTable(Object sender, EventArgs e)
        {
            DropDownList2.DataBind();
            GridView1.DataBind();
        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            DetailsView dv1 = (DetailsView)UpdatePanel1.FindControl("DetailsView1");
            int s_id = Int32.Parse(DropDownList1.SelectedValue);
            int sec_id = Int32.Parse(DropDownList2.SelectedValue);
            var scorelist = campusweb.SelectStudentMarkWithStudentIDAndSemesterAndSection(Session["u_name"].ToString(), s_id, sec_id).ToList();
            double sum = 0;
            for(int i = 0; i < scorelist.Count; ++i)
            {
                scorelist[i].sm_percentage *= 100;
                scorelist[i].total_percentage = scorelist[i].stum_score / scorelist[i].sm_total * scorelist[i].sm_percentage;
                sum += Double.Parse(scorelist[i].total_percentage.ToString());
            }

            Label6.Text = sum.ToString();
            sum /= 100;

            if (sum >= 0.9)
            {
                gred.Text = ("A+").ToString();
            }

            if (sum >= 0.8 && sum < 0.9)
            {
                gred.Text = ("A").ToString();
            }

            if (sum >= 0.7 && sum < 0.8)
            {
                gred.Text = ("B+").ToString();
            }

            if (sum >= 0.6 && sum < 0.7)
            {
                gred.Text = ("B").ToString();
            }

            if (sum >= 0.55 && sum < 0.6)
            {
                gred.Text = ("C").ToString();
            }

            if (sum >= 0.5 && sum < 0.55)
            {
                gred.Text = ("D").ToString();
            }

            if (sum >= 0.4 && sum < 0.5)
            {
                gred.Text = ("E").ToString();
            }

            if (sum <= 0.39)
            {
                gred.Text = ("F").ToString();
            }

            e.Result = scorelist;
        }
    }
}