using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
/// <summary>
/// tbForumStyleLinq Class
/// tb_forum_style table is used to store the categories
/// </summary>

public class tbForumStyleLinq
{
    //get categorie list
    public IQueryable<tb_forum_style> getTbForumStyle()
    {
        linqTbForumStyleDataContext obj = new linqTbForumStyleDataContext();
        var list = obj.tb_forum_style.Select(x => x);
        return list;
    }
    //get categorie list by style
    public IQueryable<tb_forum_style> getTbForumStyleByStyle(string _style)
    {
        linqTbForumStyleDataContext obj = new linqTbForumStyleDataContext();
        var list = obj.tb_forum_style.Where(x => x.forum_style == _style).Select(x => x);
        return list;
    }
}