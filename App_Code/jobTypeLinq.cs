using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for jobTypeLinq
/// there are four job types stored in database: full time, part time, full time/part time, contract
/// </summary>
public class jobTypeLinq
{
    //get job type list
    public IQueryable<job_type> getTypeList()
    {
        linqJobTypeDataContext obj = new linqJobTypeDataContext();
        var list = obj.job_type.Select(x => x);
        return list;
    }
    //get job type list by id
    public IQueryable<job_type> getTypeListByID(int _id)
    {
        linqJobTypeDataContext obj = new linqJobTypeDataContext();
        var list = obj.job_type.Where(x => x.id == _id).Select(x => x);
        return list;
    }
    //get job type list by job type
    public IQueryable<job_type> getTypeListByType(string _type)
    {
        linqJobTypeDataContext obj = new linqJobTypeDataContext();
        var list = obj.job_type.Where(x => x.type == _type).Select(x => x);
        return list;
    }

}