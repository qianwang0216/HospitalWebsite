<%@ WebHandler Language="C#" Class="TickerNewsRSS" %>

using System;
using System.Web;
using System.Xml;

public class TickerNewsRSS : IHttpHandler {
    
    //return the ticker news RSS to browser as an XML format file
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/xml";

        XmlTextWriter xWriter = new XmlTextWriter(context.Response.OutputStream, System.Text.Encoding.UTF8);
        xWriter.Formatting = Formatting.Indented;
        xWriter.WriteStartDocument();
        //Create rss element
        xWriter.WriteStartElement("rss");
        xWriter.WriteAttributeString("version", "2.0");
        //Create channel elements
        xWriter.WriteStartElement("channel");
        
        
        tickerNewsLinq objTickerNews = new tickerNewsLinq();
        foreach (var objNewsItem in objTickerNews.getPublicTickerNews())
        { 
            //create item element
            xWriter.WriteStartElement("item");
            
            //write id element
            xWriter.WriteElementString("id", objNewsItem.tn_id.ToString());
            //write content element
            xWriter.WriteElementString("content", objNewsItem.tn_content);
            
            //create end element for item
            xWriter.WriteEndElement();
        }

        //create end element for channel
        xWriter.WriteEndElement();
        
        //create end element for rss
        xWriter.WriteEndElement();

        xWriter.WriteEndDocument();
        xWriter.Close();
        context.Response.End();
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}