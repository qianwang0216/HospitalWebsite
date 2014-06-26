using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq;

/// <summary>
/// Summary description for linqNewsAccordion
/// </summary>
public class linqNewsAccordion
{
	public linqNewsAccordion()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    
    //get the all news from the table view without the image for better performance 
    public IQueryable<accordion_news_info> getNewsAccordion()
    {
        news_accordionDataContext objNewsDC = new news_accordionDataContext();
        var allNews = objNewsDC.accordion_news_infos.Select(x => x).OrderByDescending(x => x.an_id);
        return allNews;
    }

    //get the recent 3 news from the table view without the image for better performance 
    public IQueryable<accordion_news_info> getRecentNewsAccordion()
    {
        news_accordionDataContext objNewsDC = new news_accordionDataContext();
        var recentNews = objNewsDC.accordion_news_infos.Select(x => x).OrderByDescending(x => x.an_id).Take(3);
        return recentNews;
    }

    //get the news by id
    public IQueryable<accordion_new> getNewsAccordionByID(int _an_id)
    {
        news_accordionDataContext objNewsDC = new news_accordionDataContext();
        var allNews = objNewsDC.accordion_news.Where(x => x.an_id == _an_id).Select(x => x);
        return allNews;
    }

    //insert news to database
    public bool commitInsert(string _an_title, string _an_content, Binary _an_img)
    {
        news_accordionDataContext objNewsDC = new news_accordionDataContext();
        using (objNewsDC)
        {
            accordion_new objNewNews_accordion = new accordion_new();
            objNewNews_accordion.an_title = _an_title;
            //set the posted time as now
            objNewNews_accordion.an_postedtime = DateTime.Now;
            //set the last update time as now
            objNewNews_accordion.an_lastupdate = DateTime.Now;
            objNewNews_accordion.an_content = _an_content;
            objNewNews_accordion.an_img = _an_img;

            //insert to table
            objNewsDC.accordion_news.InsertOnSubmit(objNewNews_accordion);
            //commit to database
            objNewsDC.SubmitChanges();
            return true;
        }
    }

    //update news
    public bool commitUpdate(int _an_id, string _an_title, string _an_content, Binary _an_img, bool _deleteImage)
    {
        news_accordionDataContext objNewsDC = new news_accordionDataContext();
        using (objNewsDC)
        {
            var objUpdateNews_accordion = objNewsDC.accordion_news.Single(x => x.an_id == _an_id);
            //the report date should not be able to change
            objUpdateNews_accordion.an_title = _an_title;
            //set the last update to now
            objUpdateNews_accordion.an_lastupdate = DateTime.Now;
            objUpdateNews_accordion.an_content = _an_content;

            //if image is deleted, set it to null
            if (_deleteImage)
            {
                objUpdateNews_accordion.an_img = null;
            }
            //else if new image uploaded, change it, otherwise the image is not changed
            else if (!(Object.ReferenceEquals(null, _an_img)))
            {
                objUpdateNews_accordion.an_img = _an_img;
            }
            //commit to database
            objNewsDC.SubmitChanges();
            return true;
        }
    }

    //delete news
    public bool commitDelete(int _an_id)
    {
        news_accordionDataContext objNewsDC = new news_accordionDataContext();
        using (objNewsDC)
        {
            var objDelNews_accordion = objNewsDC.accordion_news.Single(x => x.an_id == _an_id);
            objNewsDC.accordion_news.DeleteOnSubmit(objDelNews_accordion);
            //commit to database
            objNewsDC.SubmitChanges();
            return true;
        }
    }


}