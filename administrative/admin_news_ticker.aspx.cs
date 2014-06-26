using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_news_ticker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _rebind();
        }
    }

    //bind the datalist control
    private void _rebind()
    {
        tickerNewsLinq objNews = new tickerNewsLinq();
        dtl_tickerNews.DataSource = objNews.getAllTickerNews();
        dtl_tickerNews.DataBind();
    }

     protected void dtl_tickerNews_ItemCommand(object source, DataListCommandEventArgs e)
    {
        tickerNewsLinq objNews = new tickerNewsLinq();
        string _tn_content;
        bool _display_status;
        int _tn_id;
        switch (e.CommandName)
        { 
            //insert a news
            case "Insert":
                //get the content
                _tn_content = ((TextBox)(e.Item.FindControl("txt_contentI"))).Text.ToString();
                //get the display status
                _display_status = Convert.ToBoolean(Convert.ToInt32(((RadioButtonList)(e.Item.FindControl("rbl_statusI"))).SelectedValue.ToString()));
                objNews.commitInsert(_tn_content, _display_status);
                _rebind(); 
                break;
            //change a news to edit mode
            case "Edit":
                dtl_tickerNews.EditItemIndex = e.Item.ItemIndex;
                _rebind();
                break;
            //update a news
            case "Update":
                //get the id
                _tn_id = Convert.ToInt32(((HiddenField)(e.Item.FindControl("hdf_tn_idE"))).Value.ToString());
                //get the content
                _tn_content = ((TextBox)(e.Item.FindControl("txt_contentE"))).Text.ToString();
                //get the display status
                _display_status = Convert.ToBoolean(Convert.ToInt32(((RadioButtonList)(e.Item.FindControl("rbl_statusE"))).SelectedValue.ToString()));
                objNews.commitUpdate(_tn_id, _tn_content, _display_status);
                dtl_tickerNews.EditItemIndex = -1;
                _rebind();
                break;
            //delete a news
            case "Delete":
                //get the id
                _tn_id = Convert.ToInt32(((HiddenField)(e.Item.FindControl("hdf_tn_idV"))).Value.ToString());
                objNews.commitDelete(_tn_id);
                _rebind();
                break;
            //cancel the edit
            case "Cancel":
                dtl_tickerNews.EditItemIndex = -1;
                _rebind();
                break;
        }
    }

    //set the status in the edit template
    protected void dtl_tickerNews_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.EditItem)
        {
            ((RadioButtonList)(e.Item.FindControl("rbl_statusE"))).SelectedValue = ((bool)DataBinder.Eval(e.Item.DataItem, "display_status")) ? "1" : "0";
        }
    }
}