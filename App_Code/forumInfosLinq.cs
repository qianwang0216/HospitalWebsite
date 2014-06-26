using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
///View_forum Class
///this view is used to display the topics, categories, authors, publish dates, etc.
/// </summary>
public class forumInfosLinq
{
    //get forum information list
    public IQueryable<View_forum> getForumInfos()
    {
        linqForumInfosDataContext obj = new linqForumInfosDataContext();
        var list = obj.View_forum.Select(x => x);
        return list;
    }
    //get forum information list by id
    public IQueryable<View_forum> getForumInfosByID(int _id)
    {
        linqForumInfosDataContext obj = new linqForumInfosDataContext();
        var list = obj.View_forum.Where(x => x.id == _id).Select(x => x);
        return list;
    }
    //delete information
    public bool commitDelete(int _id)
    {
        tbforumsLinqDataContext obj = new tbforumsLinqDataContext();
        using (obj)
        {
            var objList = obj.tb_forums.Single(x => x.id == _id);

            //delete command
            obj.tb_forums.DeleteOnSubmit(objList);
            //commit delete against database
            obj.SubmitChanges();
            return true;
        }
    }


}