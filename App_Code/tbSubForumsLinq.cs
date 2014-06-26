using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// View_SubForum
/// this view is used to show the replying information
/// </summary>

public class tbSubForumsLinq
{
    //get View_SubForum list
    public IQueryable<tb_Sub_forums> getTbForums()
    {
        linqTbSubForumsDataContext obj = new linqTbSubForumsDataContext();
        var list = obj.tb_Sub_forums.Select(x => x);
        return list;
    }

    //insert data into View_SubForum
    public bool commitInsert(int _forumid, int _styleid, string _title, string _contents, DateTime _dates, Guid _authorid, int _first_forum)
    {
        linqTbSubForumsDataContext objList = new linqTbSubForumsDataContext();
        using (objList)
        {
            tb_Sub_forums obj = new tb_Sub_forums();
            obj.forumid = _forumid;
            obj.styleid = _styleid;
            obj.title = _title;
            obj.contents = _contents;
            obj.dates = _dates;
            obj.authorid = _authorid;
            obj.first_forum = _first_forum;
            objList.tb_Sub_forums.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }
}