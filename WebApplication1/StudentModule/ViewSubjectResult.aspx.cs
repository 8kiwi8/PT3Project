using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls.WebParts;

namespace WebApplication1.TestModule
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        List<Part> parts = new List<Part>();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var name = txt_name.Text;
            using (CampuswebDataContext ctx = new CampuswebDataContext())
            {

                GridView1.DataSource = from a in ctx.section_marks
                                       join b in ctx.student_marks on a.sm_id equals b.sm_id
                                       join c in ctx.profiles on b.u_name equals c.u_name
                                       where b.u_name == name
                                       select new
                                       {
                                           u_name = c.u_name,
                                           assestment = a.sm_item,
                                           marks = b.stum_score,
                                           totalMarks = a.sm_total,
                                           percent = a.sm_percentage,
                                           actualMarks = (b.stum_score / a.sm_total * a.sm_percentage)

                                       };
                GridView1.DataBind();


                var result = (from a in ctx.section_marks
                              join b in ctx.student_marks on a.sm_id equals b.sm_id
                              join c in ctx.profiles on b.u_name equals c.u_name
                              where b.u_name == name
                              select new
                              {
                                  actualMarks = (b.stum_score / a.sm_total * a.sm_percentage)
                              }).ToList();
                System.Diagnostics.Debug.WriteLine(result);
                double sum = 0;
                foreach (var a in result)
                {
                    sum += a.actualMarks;
                }

                if (sum >= 0.9)
                {
                    finalMarks.Text = (sum * 100).ToString();
                    gred.Text = ("A+").ToString();
                }

                if (sum >= 0.8 && sum < 0.9)
                {
                    finalMarks.Text = (sum * 100).ToString();
                    gred.Text = ("A").ToString();
                }

                if (sum >= 0.7 && sum < 0.8)
                {
                    finalMarks.Text = (sum * 100).ToString();
                    gred.Text = ("B+").ToString();
                }

                if (sum >= 0.6 && sum < 0.7)
                {
                    finalMarks.Text = (sum * 100).ToString();
                    gred.Text = ("B").ToString();
                }

                if (sum >= 0.55 && sum < 0.6)
                {
                    finalMarks.Text = (sum * 100).ToString();
                    gred.Text = ("C").ToString();
                }

                if (sum >= 0.5 && sum < 0.55)
                {
                    finalMarks.Text = (sum * 100).ToString();
                    gred.Text = ("D").ToString();
                }

                if (sum >= 0.4 && sum < 0.5)
                {
                    finalMarks.Text = (sum * 100).ToString();
                    gred.Text = ("E").ToString();
                }

                if (sum <= 0.39)
                {
                    finalMarks.Text = (sum * 100).ToString();
                    gred.Text = ("F").ToString();
                }

            }


        }
    }
}