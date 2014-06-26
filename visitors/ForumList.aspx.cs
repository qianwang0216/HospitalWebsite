using System;
using System.Collections;
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

public partial class ForumList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label7.Text = Session["strtitle"].ToString();          //show the topic title
            Label8.Text = Session["nums"].ToString();              //show the replies number
            //show the topic content and replying information
            linqViewSubForum vsf = new linqViewSubForum();
            DataList1.DataSource = vsf.getSubForumByID(Convert.ToInt32(Request["id"].ToString()));
            DataList1.DataBind();
 
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox2.Text == "" || TextBox4.Text == "")
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('Please input the title and the content.')</script>");
            return;
        }
        else
        {
            //check the captcha
            string num = this.TextBox3.Text.Trim();
            if (Session["ValidNums"].ToString() == num.ToUpper())
            {
                //get the replies
                int hfnums_tmp = 0;
                int hfnums = 0;
                lingTbForms tf = new lingTbForms();
                hfnums_tmp = Convert.ToInt32(Request["id"].ToString());
                hfnums = Convert.ToInt32(tf.getTbForumsById(hfnums_tmp).First().hf_nums) + 1;
                
                //change the replies in the main table
                tf.commitUpdate(Convert.ToInt32(Request["id"].ToString()), hfnums);

                //insert data into the child table
                Guid _userId = (Guid)Membership.GetUser().ProviderUserKey;
                tbSubForumsLinq tsfl = new tbSubForumsLinq();
                tsfl.commitInsert(Convert.ToInt32(Request["id"].ToString()), Convert.ToInt32(GetStyleId(Session["forumstyle"].ToString()).ToString()), 
                    this.TextBox4.Text.ToString(), this.TextBox2.Text.ToString(),DateTime.Now,_userId, 0);

                this.Page.RegisterStartupScript("ss", "<script>alert('Replied successfully!')</script>");
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        TextBox4.Focus();
    }
    /// <summary>
    /// get the category No.
    /// </summary>
    /// <param name="instr">category name</param>
    /// <returns>return the category No.</returns>
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

}
