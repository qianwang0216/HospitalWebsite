using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_rssfeed : System.Web.UI.Page
{
    linqRssfeed objLinqRF = new linqRssfeed();

    private void _subRebind()// Define the function
    {
        txt_rssTitleI.Text = string.Empty;
        txt_rssUrlI.Text = string.Empty;
        dls_adminRss.DataSource = objLinqRF.getrssfeeds(); //Grab the database and add to Data Bound Control: here is DataList
        dls_adminRss.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //Refresh the page
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    protected void adminRss(object sender, CommandEventArgs e)
    {
        switch (e.CommandName) // Define the case of Inset the database
        {
            case "Insert":
                _txtMsg(objLinqRF.commitInsert(txt_rssTitleI.Text, txt_rssUrlI.Text), "Insert"); // Dispaly the proper message by click the insert button
                _subRebind();
                break;
            case "Cancel":// referesh the page
                _subRebind();
                break;
        }
    }
    // Define the message based on output from Insert/ Delete/ Update 
    private void _txtMsg(bool flag, string str)
    {
        if (flag)
        {
            lbl_txtMsg.Text = "Your RSS category has been " + str + "ed successfully";
        }
        else
        {
            lbl_txtMsg.Text = "Sorry, unable to " + str + " your contact";
        }
    }

    protected void actionRss(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Edit":// transfer the database to new variable and update to the new database
                TextBox txtRssTitle = (TextBox)e.Item.FindControl("txt_rssTitleE");
                TextBox txtRssUrl = (TextBox)e.Item.FindControl("txt_rssUrlE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_rssId");
                int RssID = int.Parse(hdfID.Value.ToString());
                _txtMsg(objLinqRF.commitEdit(RssID, txtRssTitle.Text, txtRssUrl.Text), "update");
                _subRebind();
                break;

            case "Delete": //Delete the database
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_rssId")).Value);
                _txtMsg(objLinqRF.commitDelete(_id), "delete"); //display the proper message
                _subRebind();
                break;

            case "Cancel"://do the function of subRebind()
                _subRebind();
                break;
        }
    }
}