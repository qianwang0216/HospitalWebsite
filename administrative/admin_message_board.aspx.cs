using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class administrative_admin_message_board : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }
    lingTbForms objLinq = new lingTbForms();
    forumInfosLinq obj = new forumInfosLinq();

    protected void subAdmin(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "del":
                int _id = int.Parse(((Label)e.Item.FindControl("hdf_id")).Text);
                //delete data using Linq, and then call the _strMessage function to display the status
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    private void _showDelete(int id)
    {
        ltv_main.DataSource = objLinq.getTbForumsById(id);
        ltv_main.DataBind();
    }
    
    /*
     * Rebind the data sourse
     */
    private void _subRebind()
    {        
        ltv_main.DataSource = obj.getForumInfos();
        ltv_main.DataBind();
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_msg.Text = "Topic deleted successfully!";
        else
            lbl_msg.Text = "Topic deleted failed!";
    }

    override protected void OnInit(EventArgs e)
    {

        this.ltv_main.PagePropertiesChanged += UserListView_PagePropertiesChanged;
        base.OnInit(e);

    }

    void UserListView_PagePropertiesChanged(object sender, EventArgs e)
    {
        this.ContactsDataPager.SetPageProperties(ContactsDataPager.StartRowIndex, ContactsDataPager.PageSize, true);
        //data bind
        this._subRebind();
    }  

}