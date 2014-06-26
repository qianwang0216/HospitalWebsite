using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_job_listing : System.Web.UI.Page
{

    //create an object of LinqClass
    CareersListClass objLinq=new CareersListClass();
    jobTypeLinq objType = new jobTypeLinq();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //jobTypeLinq obj = new jobTypeLinq();
            ddl_job_typeI.DataSource = objType.getTypeList();
            ddl_job_typeI.DataTextField = "type"; //dropdownlist - Text filed
            ddl_job_typeI.DataValueField = "id";//dropdownlist - Value field
            ddl_job_typeI.DataBind();
            _subRebind();
        }
    }

    /*
    * Rebind the data sourse
    */
    private void _subRebind()
    {
        txt_job_titleI.Text = string.Empty;
        ddl_job_typeI.SelectedIndex = 0;
        //txt_job_typeI.Text = string.Empty;
        txt_job_descriptionI.Text = string.Empty;
        txt_requirementsI.Text = string.Empty;
        //txt_publish_dateI.Text = string.Empty;
        dtl_all.DataSource = objLinq.getCareersList();
        dtl_all.DataBind();

    }

    protected void subAdmin(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                //insert data using Linq, and then call the _strMessage function to display the status
                _strMessage(objLinq.commitInsert(txt_job_titleI.Text, ddl_job_typeI.SelectedItem.Text, txt_job_descriptionI.Text, txt_requirementsI.Text, System.DateTime.Now), "insert");
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
            lbl_message.Text = "Job " + str + " was successful";
        }
        else
        {
            lbl_message.Text = "Sorry, unable to " + str + " job";
        }
    }
    protected void subUpDel(object sender, DataListCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_job_titleE");
                TextBox txtType = (TextBox)e.Item.FindControl("txt_job_typeE");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_job_descriptionE");
                TextBox txtRq = (TextBox)e.Item.FindControl("txt_requirementsE");
                TextBox txtDdl = (TextBox)e.Item.FindControl("txt_publish_dateE");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");

                int proID = int.Parse(hdfID.Value.ToString());
                //update data using Linq, and then call the _strMessage function to display the status
                _strMessage(objLinq.commitUpdate(proID, txtTitle.Text, txtType.Text, txtDesc.Text, txtRq.Text, DateTime.Parse(txtDdl.Text.ToString())), "update");
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