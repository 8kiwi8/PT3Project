using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.TestModule
{
    public partial class TestStudentMArk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinqDataSource1_Selecting(object sender, LinqDataSourceSelectEventArgs e)
        {
            CampuswebDataContext linq = new CampuswebDataContext();
            e.Result = linq.SelectStudentMarkWithStudentID("teststudent");
        }
    }
}