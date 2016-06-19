using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.StudentModule
{
    public partial class RegisterSection : System.Web.UI.Page
    {
        CampuswebDataContext campusweb;

        protected void Page_Load(object sender, EventArgs e)
        {
            campusweb = new CampuswebDataContext();
        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = campusweb.SelectCourseOffered();
        }

        protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = campusweb.SelectSectionWithCourseOfferedAndStudent(Int32.Parse(AvaiableCourse.SelectedValue), "teststudent");
        }

        protected void AvaiableCourse_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv1 = (GridView)UpdatePanel1.FindControl("GridView1");
            gv1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView gv1 = (GridView)UpdatePanel1.FindControl("GridView1");
            int sec_id = Int32.Parse(gv1.SelectedValue.ToString());
            campusweb.InsertSectionStudent("teststudent", sec_id);
            gv1.DataBind();
        }
    }
}