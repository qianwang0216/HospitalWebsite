using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class MasterPage : System.Web.UI.MasterPage
{
    private string _title = "Welcome To Nipigon District Memorial Hospital";
    public string pp_masterTitle
    {
        get { return _title; }
        set { _title = value; }
    }
    // transfer the keyword(s) of search engine to resultSearch
    protected void searchData(object sender, CommandEventArgs e)
    {
        Session["search"] = txt_search.Text;
        Server.Transfer("~/resultSearch.aspx");
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        this.Page.Header.DataBind();    // NOTE: this resolves any <%# ... %> tags in <head>

        if (!Page.IsPostBack)
        {
            initAccordionNews();
            //trv_collapsemenu.ExpandDepth = 1;
            //trv_collapsemenu.ExpandAll();
            trv_collapsemenu.CollapseAll();
        }
    }

    //initial the accordion news content
    private void initAccordionNews()
    {
        int MAXTITLEWORDS = 15;
        int MAXCONTENTWORDS = 300;
        int i = 0; //the order of the accordion
        string strNewsAccordionContent = string.Empty;
        string strAnTitle = string.Empty;
        string strAnContent = string.Empty;
        linqNewsAccordion objAccordionNews = new linqNewsAccordion();

        var objRecentNews = objAccordionNews.getRecentNewsAccordion();
        foreach (var objNews in objRecentNews)
        {
            strAnTitle = objNews.an_title.ToString();
            strAnContent = objNews.an_content.ToString();
            strNewsAccordionContent += "<h3>" + strAnTitle.Substring(0, strAnTitle.Length > MAXTITLEWORDS ? MAXTITLEWORDS : strAnTitle.Length) + (strAnTitle.Length > MAXTITLEWORDS ? "..." : "") + "</h3>";
            strNewsAccordionContent += "<div>" + strAnContent.Substring(0, strAnContent.Length > MAXCONTENTWORDS ? MAXCONTENTWORDS : strAnContent.Length) + (strAnContent.Length > MAXCONTENTWORDS ? "..." : "") + "<br />";
            strNewsAccordionContent += "<p><a href='" + ResolveUrl("~/news_accordion_detail_view.aspx") + "?accordionid=" + i + "&an_id=" + objNews.an_id + "'>Read full story</a></p></div>";
            i++;
        }

        ltl_news_accordion.Text = strNewsAccordionContent;
    
    }

    //get current user full name (First Name + Last Name)
    public string getCurrentUserFullName()
    {
        //get current user id
        Guid _userId = (Guid)Membership.GetUser().ProviderUserKey;

        linqUsers objUsers = new linqUsers();
        int count = objUsers.getUserAdditionalInfoByUserId(_userId).Count();

        if (count == 0)
            return "";
        else
        {
            var objCurrentUser = objUsers.getUserAdditionalInfoByUserId(_userId).First();
            return objCurrentUser.FirstName + " " + objCurrentUser.LastName;
        }
    }


    //protected void trv_collapsemenu_TreeNodePopulate(object sender, TreeNodeEventArgs e)
    //{
    //    e.Node.SelectAction = TreeNodeSelectAction.Expand;
    //}

    protected void trv_collapsemenu_DataBound(object sender, EventArgs e)
    {
        trv_collapsemenu.CollapseAll();
    }
    //get current user Id 
    public string getCurrentUserId()
    {
        //get current user id
        Guid _userId = (Guid)Membership.GetUser().ProviderUserKey;

        linqUsers objUsers = new linqUsers();
        int count = objUsers.getUserAdditionalInfoByUserId(_userId).Count();

        if (count == 0)
            return "";
        else
        {
            string userId = Convert.ToString((Guid)Membership.GetUser().ProviderUserKey);
            return userId;
        }
    }
}
