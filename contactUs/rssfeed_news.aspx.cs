using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;//imported

public partial class rssfeed_news : System.Web.UI.Page
{
    linqNewsAccordion objLinq = new linqNewsAccordion();//Create class from News and Events table
    protected void Page_Load(object sender, EventArgs e)
    {
        //create the XML
        Response.Clear();
        Response.ContentType = "text/xml";
        XmlWriter objX = XmlWriter.Create(Response.OutputStream);
        objX.WriteStartDocument();
        objX.WriteStartElement("rss"); //create the xml declaration
        objX.WriteAttributeString("version", "2.0");
        objX.WriteStartElement("news");//create the parent element of xml file
        objX.WriteElementString("title", "Nipigon Hospital News & Event");//create the child for description of xml file
        objX.WriteElementString("link", "http://www.tundeobatayo.name/contactUs/rssfeed.aspx");
        objX.WriteElementString("content", "The latest headlines and articles from the Nipigon hospital.");
        objX.WriteElementString("lastupdate", "The date of the news");
        objX.WriteElementString("copyright", "(c) 2014, Humber College. All rights reserved.");

        var rssFeeds = objLinq.getRecentNewsAccordion(); //Define a new variable to call the function from Linq class page
        foreach (var rowRss in rssFeeds)// It says that for each row (as a new variable with the name of "var rowRss") in "rssFeeds" as an array do bellows
        {
            //Read the xml from database
            objX.WriteStartElement("item");// this element includes other child elements from database 
            objX.WriteElementString("title", rowRss.an_title);
            objX.WriteElementString("content", rowRss.an_content);
            objX.WriteElementString("updateDate", rowRss.an_lastupdate.ToString());
            objX.WriteEndElement();
        }

        objX.WriteEndElement();
        objX.WriteEndElement();
        objX.WriteEndDocument();
        objX.Flush();
        objX.Close();
        Response.End();
    }
}