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

public partial class PublishForum : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindDatasOptionStyle(DropDownList1); //show the category
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "" || TextBox2.Text == "")
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('Please input the comment's title and content')</script>");
            return;
        }
        else
        {
            //check the captcha
            string num = this.TextBox3.Text.Trim();
            if (Session["ValidNums"].ToString() == num.ToUpper())
            {
                lingTbForms ltf = new lingTbForms();
                ltf.commitInsert(this.TextBox1.Text.ToString(), DateTime.Now,
                    (Guid)Membership.GetUser().ProviderUserKey, 0);
                Session["forumid"] = ltf.getTbForumsByTitle(TextBox1.Text.Trim()).First().id;

                tbSubForumsLinq tsfl = new tbSubForumsLinq();
                tsfl.commitInsert(Convert.ToInt32(Session["forumid"].ToString()), Convert.ToInt32(GetStyleId(DropDownList1.Text).ToString()), this.TextBox1.Text.ToString(),
                    this.TextBox2.Text.ToString(), DateTime.Now, (Guid)Membership.GetUser().ProviderUserKey, 1);

                this.Page.RegisterStartupScript("ss", "<script>alert('Posted successfully!')</script>");
                Response.Redirect("forumInfos.aspx");
            }
            else
            {
                this.Page.RegisterStartupScript("ss", "<script>alert('You entered a wrong captcha!')</script>");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("forumInfos.aspx");
    }
    /// <summary>
    /// get the category No.
    /// </summary>
    /// <param name="instr">Category name</param>
    /// <returns>return category No.</returns>
    public int GetStyleId(string instr)
    {
        int Numsid = 0;
        if (instr == "")
        {
            Numsid = 1;
        }
        else
        {
            tbForumStyleLinq tfsl = new tbForumStyleLinq();
            Numsid = Convert.ToInt32(tfsl.getTbForumStyleByStyle(instr).First().id);
        }
        return Numsid;
    }
    /// <summary>
    /// Bind the categories
    /// </summary>
    /// <param name="droplist">DropDownList Control name</param>
    public void BindDatasOptionStyle(DropDownList droplist)
    {
        //droplist.Items.Add("");
        linqTbForumStyleDataContext ltfsdc = new linqTbForumStyleDataContext();
        droplist.DataSource = from tb in ltfsdc.tb_forum_style select tb.forum_style;
        droplist.DataBind();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

}
