using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class administrative_admin_event_calendar : System.Web.UI.Page
{
    //create an object of LinqClass
    calendarClassLinq objLinq = new calendarClassLinq();
    /*
     * Rebind the data sourse
     */
    private void _subRebind()
    {
        txt_event_titleI.Text = string.Empty;
        txt_event_contentI.Text = string.Empty;
        txt_dateI.Text = string.Empty;
        txt_start_timeI.Text = string.Empty;
        txt_end_timeI.Text = string.Empty;

        dtl_all.DataSource = objLinq.getEventsList();
        dtl_all.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                //insert data using Linq, and then call the _strMessage function to display the status
                _strMessage(objLinq.commitInsert(txt_event_titleI.Text, txt_event_contentI.Text, Convert.ToDateTime(txt_dateI.Text),
                    TimeSpan.Parse(txt_start_timeI.Text), TimeSpan.Parse(txt_end_timeI.Text)), "insert");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
    private void _strMessage(bool flag, string str)
    {
        if (flag)
        {
            lbl_message.Text = "event " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " event";
        }
    }
    protected void subUpDel(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_event_titleE");
                TextBox txtContent = (TextBox)e.Item.FindControl("txt_event_contentE");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateE");
                TextBox txtStart = (TextBox)e.Item.FindControl("txt_start_timeE");
                TextBox txtEnd = (TextBox)e.Item.FindControl("txt_end_timeE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                int proID = int.Parse(hdfID.Value.ToString());
                //update data using Linq, and then call the _strMessage function to display the status
                _strMessage(objLinq.commitUpdate(proID, txtTitle.Text, txtContent.Text, Convert.ToDateTime(txtDate.Text),
                    TimeSpan.Parse(txtStart.Text), TimeSpan.Parse(txtEnd.Text)), "update");
                _subRebind();
                break;
            case "Delete":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                //delete data using Linq, and then call the _strMessage function to display the status
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }
}