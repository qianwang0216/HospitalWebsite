using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
///CareersApplicationClass
/// </summary>
public class CareersApplicationClass
{
    //get job applications
    public IQueryable<Careers_applications> getApplications()
    {

        Careers_applicationDataContext obj = new Careers_applicationDataContext();
        var list = obj.Careers_applications.Select(x => x);
        return list;
    }
    //get job applications by user id
    public IQueryable<Careers_applications> getApplicationsByID(int _id)
    {
        Careers_applicationDataContext obj = new Careers_applicationDataContext();
        var list = obj.Careers_applications.Where(x => x.Id == _id).Select(x => x);
        return list;
    }
    //insert new job applications into database
    public bool commitInsert(string _fname, string _lname, string _email, string _phone,string _city,string _job_type,string _way_find_us,string _resume,string _recieveInfo)
    {
        Careers_applicationDataContext objList = new Careers_applicationDataContext();
        using (objList)
        {
            Careers_applications obj = new Careers_applications();
            obj.firstname = _fname;
            obj.lastname = _lname;
            obj.email = _email;
            obj.phone = _phone;
            obj.city = _city;
            obj.job_type = _job_type;
            obj.way_find_us = _way_find_us;
            obj.resume = _resume;
            obj.recieveInfo = _recieveInfo;
            objList.Careers_applications.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }
    //delete job application by job id
    public bool commitDelete(int _id)
    {
        Careers_applicationDataContext objList = new Careers_applicationDataContext();
        using (objList)
        {
            var obj = objList.Careers_applications.Single(x => x.Id == _id);
            objList.Careers_applications.DeleteOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }
}