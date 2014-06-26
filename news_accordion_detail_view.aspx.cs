using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int _id = Convert.ToInt32(Request.QueryString["an_id"]); ;
        linqNewsAccordion objNews = new linqNewsAccordion();
        frm_accordion_news.DataSource = objNews.getNewsAccordionByID(_id);
        frm_accordion_news.DataBind();
        if (Object.ReferenceEquals(null, objNews.getNewsAccordionByID(_id).First().an_img))
        {
            ((Image)(frm_accordion_news.FindControl("img_newsimageV"))).Visible = false;
        }
        else
        {
            ((Image)(frm_accordion_news.FindControl("img_newsimageV"))).ImageUrl = "ShowNewsAccordionImage.ashx?an_id=" + _id.ToString();
        }
    }
}