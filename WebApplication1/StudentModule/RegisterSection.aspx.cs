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
            e.Result = campusweb.SelectSectionWithCourseOffered(Int32.Parse(AvaiableCourse.SelectedValue));
        }
    }
}