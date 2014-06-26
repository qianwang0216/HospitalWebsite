using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
/// <summary>
/// View_SubForum Class
/// this view is used to display the comments/replies information
/// </summary>

public class linqViewSubForum
{
    //get comments/replies information list
    public IQueryable<View_SubForum> getSubForum()
    {
        linqViewSubForumDataContext obj = new linqViewSubForumDataContext();
        var list = obj.View_SubForum.Select(x => x);
        return list;
    }
    //get comments/replies information list by id
    public IQueryable<View_SubForum> getSubForumByID(int _id)
    {
        linqViewSubForumDataContext obj = new linqViewSubForumDataContext();
        var list = obj.View_SubForum.Where(x => x.forumid == _id).Select(x => x);
        return list;
    }

}