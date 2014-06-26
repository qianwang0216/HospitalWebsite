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
public class jobTitleLinq
{
    //get job applications
    public IQueryable<job_title> getApplications()
    {
        linqJobTitleDataContext obj = new linqJobTitleDataContext();
        var list = obj.job_title.Select(x => x);
        return list;
    }
    //get job applications by user id
    public IQueryable<job_title> getApplicationsByID(int _id)
    {
        linqJobTitleDataContext obj = new linqJobTitleDataContext();
        var list = obj.job_title.Where(x => x.job_title_id == _id).Select(x => x);
        return list;
    }
}