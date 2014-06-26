using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class linqSearchengine
{
    public  IQueryable<accordion_new> getContentBySearch(string _type) 
        {
            news_accordionDataContext objse = new news_accordionDataContext();// create the function for grab the allresult from accordian_news table based on keyword from the seach engine
            var allresults = objse.accordion_news.Where(x => x.an_title.Contains(_type) || x.an_content.Contains(_type)).Select(x => x);
            return allresults;
        }
}