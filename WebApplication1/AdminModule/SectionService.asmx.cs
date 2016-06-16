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
    /// Summary description for SectionService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class SectionService : System.Web.Services.WebService
    {
        [WebMethod]
        public XmlDocument GetSection()
        {
            CampuswebDataContext campusweb = new CampuswebDataContext();
            System.Xml.Linq.XElement xlinq = new XElement("sections",
                from sec in campusweb.sections
                join co in campusweb.course_offereds on sec.co_id equals co.co_id
                join s in campusweb.semesters on co.s_id equals s.s_id
                join c in campusweb.courses on co.c_id equals c.c_id
                join p in campusweb.profiles on sec.u_name equals p.u_name
                select new XElement("section", new XAttribute("sec_id", sec.sec_id),
                    new XElement("sec_no", sec.sec_no),
                    new XElement("user", new XAttribute("u_name", p.p_name), new XElement("name", p.u_name)),
                    new XElement("course", new XAttribute("c_id", c.c_id), new XElement("name", c.c_code +" "+ c.c_name)),
                    new XElement("semester", new XAttribute("s_id", s.s_id), new XElement("name", s.s_year + "/" + s.s_sem))
                    )
            );
            var doc = new XmlDocument();
            doc.LoadXml(xlinq.ToString());
            return doc;
            // load some XML ...
        }
    }
}
