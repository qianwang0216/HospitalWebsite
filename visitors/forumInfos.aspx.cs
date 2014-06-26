using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security; 
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class forumInfos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDatas();
        }
    }
    /// <summary>
    /// Load data in GridView
    /// </summary>
    private void LoadDatas()
    {
        forumInfosLinq f = new forumInfosLinq();
        GridView1.DataSource = f.getForumInfos();
        GridView1.DataBind();
        GridView1.DataKeyNames = new string[] { "id" };
        // Label1.Text = "User name： " + Session["username"].ToString();
    }

    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        LoadDatas();
        //Comment No.
        int ids = Convert.ToInt32(GridView1.Rows[e.NewSelectedIndex].Cells[0].Text);
        //Replies number
        Session["nums"] = GridView1.Rows[e.NewSelectedIndex].Cells[5].Text;
        //Comment title
        Session["strtitle"] = GridView1.Rows[e.NewSelectedIndex].Cells[1].Text;
        //Comment category No.
        Session["forumstyle"] = GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;
        Response.Redirect("ForumList.aspx?id=" + ids + "");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadDatas();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("PublishForum.aspx");

    }
}
