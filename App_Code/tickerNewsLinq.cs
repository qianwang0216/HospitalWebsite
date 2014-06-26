using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for tickerNewsLinq
/// </summary>
public class tickerNewsLinq
{
	public tickerNewsLinq()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //get the all ticker news  
    public IQueryable<ticker_new> getAllTickerNews()
    {
        tickerNewsLinqDataContext objNewsDC = new tickerNewsLinqDataContext();
        var allNews = objNewsDC.ticker_news.Select(x => x).OrderByDescending(x => x.tn_id);
        return allNews;
    }

    //get all ticker news that should be shown to public user
    public IQueryable<ticker_new> getPublicTickerNews()
    {
        tickerNewsLinqDataContext objNewsDC = new tickerNewsLinqDataContext();
        //the (display_status == true) means the news need to be shown to public
        var publicNews = objNewsDC.ticker_news.Select(x => x).OrderByDescending(x => x.tn_id).Where(x => x.display_status == true);
        return publicNews;
    }

    //get the ticker news by id
    public IQueryable<ticker_new> getTickerNewsByID(int _tn_id)
    {
        tickerNewsLinqDataContext objNewsDC = new tickerNewsLinqDataContext();
        var allNews = objNewsDC.ticker_news.Where(x => x.tn_id == _tn_id).Select(x => x);
        return allNews;
    }

    //insert ticker news to database
    public bool commitInsert(string _tn_content, bool _display_status)
    {
        tickerNewsLinqDataContext objNewsDC = new tickerNewsLinqDataContext();
        using (objNewsDC)
        {
            ticker_new objNewTickerNews = new ticker_new();
            objNewTickerNews.tn_content = _tn_content;
            objNewTickerNews.display_status = _display_status;

            //insert to table
            objNewsDC.ticker_news.InsertOnSubmit(objNewTickerNews);
            //commit to database
            objNewsDC.SubmitChanges();
            return true;
        }
    }

    //update ticker news
    public bool commitUpdate(int _tn_id, string _tn_content, bool _display_status)
    {
        tickerNewsLinqDataContext objNewsDC = new tickerNewsLinqDataContext();
        using (objNewsDC)
        {
            var objUpdateTickerNews = objNewsDC.ticker_news.Single(x => x.tn_id == _tn_id);
            objUpdateTickerNews.tn_content = _tn_content;
            objUpdateTickerNews.display_status = _display_status;
            //commit to database
            objNewsDC.SubmitChanges();
            return true;
        }
    }

    //delete ticker news
    public bool commitDelete(int _tn_id)
    {
        tickerNewsLinqDataContext objNewsDC = new tickerNewsLinqDataContext();
        using (objNewsDC)
        {
            var objDelTickerNews = objNewsDC.ticker_news.Single(x => x.tn_id == _tn_id);
            objNewsDC.ticker_news.DeleteOnSubmit(objDelTickerNews);
            //commit to database
            objNewsDC.SubmitChanges();
            return true;
        }
    }

}