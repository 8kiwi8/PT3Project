using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Xml;
using System.Xml.Linq;

namespace WebApplication1.AdminModule
{
    /// <summary>
    /// Summary description for CourseOfferedService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CourseOfferedService : System.Web.Services.WebService
    {

        [WebMethod]
        public XmlDocument ReturnXml()
        {
            CampuswebDataContext campusweb = new CampuswebDataContext();
            System.Xml.Linq.XElement xlinq = new XElement("course_offereds",
                from c in campusweb.courses
                join co in campusweb.course_offereds on c.c_id equals co.c_id
                join s in campusweb.semesters on co.s_id equals s.s_id
                select new XElement("course_offered", new XAttribute("co_id", co.co_id),
                    new XElement("course", new XAttribute("c_id", c.c_id), new XElement("name", c.c_code + c.c_name)),
                    new XElement("semester", new XAttribute("s_id", s.s_id), new XElement("name", s.s_year+s.s_sem))
                    )
            );
            var doc = new XmlDocument();
            doc.LoadXml(xlinq.ToString());
            return doc;
            // load some XML ...
        }
    }
}
