using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.AdminModule
{
    public partial class Section1 : System.Web.UI.Page
    {
        CampuswebDataContext campusweb;

        protected void Page_Load(object sender, EventArgs e)
        {
            campusweb = new CampuswebDataContext();
        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var courseOffered = campusweb.SelectSection();
            e.Result = courseOffered;
        }

        protected void LinqDataSource3_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            e.Result = campusweb.SelectCourseOffered();
        }

        protected void LinqDataSource4_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            var profile = from p in campusweb.profiles
                          join u in campusweb.users on p.u_name equals u.u_name
                          where u.u_level.Equals("lecturer")
                           select new { name = p.p_name, p.u_name };

            e.Result = profile;
        }

        protected void GridView1_RowDeleting(Object sender, GridViewDeleteEventArgs e)
        {
            int id = (int)GridView1.DataKeys[e.RowIndex].Value;
            campusweb.DeleteSection(id);

            GridView1.DataBind();

            e.Cancel = true;
        }

        protected void GridView1_RowUpdating(Object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            int co_id = Int32.Parse(((DropDownList)row.FindControl("EditCourse")).SelectedValue);
            string u_name = ((DropDownList)row.FindControl("EditLecturer")).SelectedValue;
            int sec_no = Int32.Parse(((TextBox)row.FindControl("EditSectionNo")).Text);
            int s_id = (int)GridView1.DataKeys[e.RowIndex].Value;

            campusweb.UpdateSection(s_id, co_id, sec_no, u_name);

            GridView1.DataBind();
            GridView1.EditIndex = -1;
            e.Cancel = true;
        }

        protected void NewEntry(object sender, EventArgs e)
        {
            DropDownList course = (DropDownList)GridView1.FooterRow.FindControl("NewSectionCourse");
            DropDownList lecturer = (DropDownList)GridView1.FooterRow.FindControl("NewSectionLecturer");
            TextBox sectionNo = (TextBox)GridView1.FooterRow.FindControl("NewSectionNo");

            campusweb.InsertSection(Int32.Parse(course.SelectedValue), Int32.Parse(sectionNo.Text), lecturer.SelectedValue);
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