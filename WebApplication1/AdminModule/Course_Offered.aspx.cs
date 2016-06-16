using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.AdminModule
{
    public partial class Course_Offered : System.Web.UI.Page
    {
        CampuswebDataContext campusweb;

        protected void Page_Load(object sender, EventArgs e)
        {
            campusweb = new CampuswebDataContext();
        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var courseOffered = campusweb.SelectCourseOffered();
            e.Result = courseOffered;
        }

        protected void LinqDataSource3_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var courses = from c in campusweb.courses
                          select new { name = c.c_code + " " + c.c_name, c.c_id };

            e.Result = courses;
        }

        protected void LinqDataSource2_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var semester = from s in campusweb.semesters
                           select new { name = s.s_year + " " + s.s_sem, s.s_id };

            e.Result = semester;
        }

        protected void GridView1_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)GridView1.DataKeys[e.RowIndex].Value;
            campusweb.DeleteCourseOffered(id);

            GridView1.DataBind();

            e.Cancel = true;
        }

        protected void GridView1_RowUpdating(Object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            int s_id = Int32.Parse(((DropDownList)row.FindControl("EditSemester")).SelectedValue);
            int c_id = Int32.Parse(((DropDownList)row.FindControl("EditCourse")).SelectedValue);
            int co_id = (int)GridView1.DataKeys[e.RowIndex].Value;
            campusweb.UpdateCourseOffered(s_id, c_id, co_id);

            GridView1.DataBind();
            GridView1.EditIndex = -1;
            e.Cancel = true;
        }


        protected void NewEntry(object sender, EventArgs e)
        {
            DropDownList semester = (DropDownList)GridView1.FooterRow.FindControl("DropDownList1");
            DropDownList course = (DropDownList)GridView1.FooterRow.FindControl("DropDownList2");
            campusweb.InsertCourseOffered(Int32.Parse(semester.SelectedValue), Int32.Parse(course.SelectedValue));
            GridView1.DataBind();
        }
    }
}