using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CareersListClass
/// </summary>
public class CareersListClass
{
    //get job list
    public IQueryable<careers_list> getCareersList()
    {
        Careers_listDataContext obj = new Careers_listDataContext();
        var list = obj.careers_list.Select(x => x);
        return list;
    }

    public IQueryable<careers_list> getCareersListByID(int _id)
    {
        Careers_listDataContext obj = new Careers_listDataContext();
        var list = obj.careers_list.Where(x => x.Id == _id).Select(x => x);
        return list;
    }

    public IQueryable<careers_list> getCareersListSorting()
    {
        Careers_listDataContext obj = new Careers_listDataContext();
        //var list = obj.careers_list.Select(x => x);
        var list = from o in obj.careers_list orderby o.publish_date descending select o;
        return list;
    }

    public bool commitInsert(string _job_title, string _job_type, string _desc, string _rq, DateTime _publish_date)
    {
        Careers_listDataContext objList = new Careers_listDataContext();
        using (objList)
        {
            careers_list obj = new careers_list();
            obj.job_title = _job_title;
            obj.job_type = _job_type;
            obj.job_description = _desc;
            obj.requirements = _rq;
            obj.publish_date = System.DateTime.Now;
            objList.careers_list.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }

    public bool commitUpdate(int _id, string _job_title, string _job_type, string _desc, string _rq, DateTime _publish_date)
    {
        Careers_listDataContext objList = new Careers_listDataContext();
        using (objList)
        {
            var obj = objList.careers_list.Single(x => x.Id == _id);
            obj.job_title = _job_title;
            obj.job_type = _job_type;
            obj.job_description = _desc;
            obj.requirements = _rq;
            obj.publish_date = _publish_date;
            objList.SubmitChanges();
            return true;
        }
    }
    public bool commitDelete(int _id)
    {
        Careers_listDataContext objList = new Careers_listDataContext();
        using (objList)
        {
            var obj = objList.careers_list.Single(x => x.Id == _id);
            objList.careers_list.DeleteOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }

}