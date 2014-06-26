<%@ WebHandler Language="C#" Class="ShowNewsAccordionImage" %>

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public class ShowNewsAccordionImage : IHttpHandler {
    
    //return the accordion news image to browser
    public void ProcessRequest (HttpContext context) {
        //get id from query string
        int _an_id = Convert.ToInt32(context.Request.QueryString["an_id"]);
        context.Response.ContentType = "image/jpeg";
        //get the image stream
        Stream strm = ShowImage(_an_id);
        
        //write to the browser
        byte[] buffer = new byte[4096];
        int byteSeq = strm.Read(buffer, 0, 4096);
        while (byteSeq > 0)
        {
            context.Response.OutputStream.Write(buffer, 0, byteSeq);
            byteSeq = strm.Read(buffer, 0, 4096);
        }  
    }

    //get the image from database 
    public Stream ShowImage(int _id)
    {
        
        linqNewsAccordion objNewsAccordion = new linqNewsAccordion();
        //the first row of the list is the record selected, get the image
        return new MemoryStream(objNewsAccordion.getNewsAccordionByID(_id).First().an_img.ToArray());
    }
    
    public bool IsReusable {
        get {
            return false;
        }
    }

}