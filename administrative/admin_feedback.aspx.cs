using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_feedback : System.Web.UI.Page
{
    linqFeedback objLinqFB = new linqFeedback();

    private void _subRebind()// Define the function
    {

        grvComp.DataSource = objLinqFB.getfeedbackByType("complaint"); //Grab the database and add to Data Bound Control: here is DataList for Appreciation list
        grvComp.DataBind();

        grvComm.DataSource = objLinqFB.getfeedbackByType("comment"); //Grab the database and add to Data Bound Control: here is DataList for Appreciation list
        grvComm.DataBind();

        grvApp.DataSource = objLinqFB.getfeedbackByType("appreciation"); //Grab the database and add to Data Bound Control: here is DataList for Appreciation list
        grvApp.DataBind();

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //Refresh the page
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    protected void actionComp(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "DeleteComp": //Delete the database
                int indexDel = Convert.ToInt32(e.CommandArgument.ToString());
                int _idComp = int.Parse(((HiddenField)grvComp.Rows[indexDel].FindControl("hdf_idComp")).Value);
                _txtmassge(objLinqFB.commitDelete(_idComp)); //display the proper message
                 lbl_titleSelect.Text = "";// this is related to jQuery for pop-up page
                 txt_contentSelect.Text = "";// this is related to jQuery for pop-up page
                _subRebind();
                break;

            case "SelectComp"://Display the content of complaint by click
                int indexSel = Convert.ToInt32(e.CommandArgument.ToString());
                Label titleComp = (Label)grvComp.Rows[indexSel].FindControl("lbl_titleComp");
                HiddenField contentComp = (HiddenField)grvComp.Rows[indexSel].FindControl("hdf_contentComp");
                lbl_titleSelect.Text = titleComp.Text.ToString();
                txt_contentSelect.Text = contentComp.Value.ToString();
                _subRebind();
                break;
        }
    }

    protected void grvComp_PageIndexChanging(object sender, GridViewPageEventArgs e) // create the paging of gridview for compalint
    {

        grvComp.PageIndex = e.NewPageIndex;
        lbl_titleSelect.Text = "";// this is related to jQuery for pop-up page
        txt_contentSelect.Text = "";// this is related to jQuery for pop-up page
        grvComp.DataSource = objLinqFB.getfeedbackByType("complaint");
        grvComp.DataBind();
    }

    protected void actionComm(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {

            case "DeleteComm": //Delete the database
                int indexDel = Convert.ToInt32(e.CommandArgument.ToString());
                int _idComm = int.Parse(((HiddenField)grvComm.Rows[indexDel].FindControl("hdf_idComm")).Value);
                _txtmassge(objLinqFB.commitDelete(_idComm)); //display the proper message
                lbl_titleSelect.Text = "";
                txt_contentSelect.Text = "";
                _subRebind();
                break;

            case "SelectComm"://Display the content of complaint by click
                int indexSel = Convert.ToInt32(e.CommandArgument.ToString());
                Label titleComm = (Label)grvComm.Rows[indexSel].FindControl("lbl_titleComm");
                HiddenField contentComm = (HiddenField)grvComm.Rows[indexSel].FindControl("hdf_contentComm");
                lbl_titleSelect.Text = titleComm.Text.ToString();
                txt_contentSelect.Text = contentComm.Value.ToString();
                _subRebind();
                break;

        }
    }

    protected void grvComm_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        grvComm.PageIndex = e.NewPageIndex;
        lbl_titleSelect.Text = "";
        txt_contentSelect.Text = "";
        grvComm.DataSource = objLinqFB.getfeedbackByType("comment");
        grvComm.DataBind();
    }

    protected void actionApp(object sender, GridViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {

            case "DeleteApp": //Delete the database
                int indexDel = Convert.ToInt32(e.CommandArgument.ToString());
                int _idApp = int.Parse(((HiddenField)grvApp.Rows[indexDel].FindControl("hdf_idApp")).Value);
                _txtmassge(objLinqFB.commitDelete(_idApp)); //display the proper message
                lbl_titleSelect.Text = "";
                txt_contentSelect.Text = "";
                _subRebind();
                break;

            case "SelectApp"://Display the content of complaint by click
                int indexSel = Convert.ToInt32(e.CommandArgument.ToString());
                Label titleApp = (Label)grvApp.Rows[indexSel].FindControl("lbl_titleApp");
                HiddenField contentApp = (HiddenField)grvApp.Rows[indexSel].FindControl("hdf_contentApp");
                lbl_titleSelect.Text = titleApp.Text.ToString();
                txt_contentSelect.Text = contentApp.Value.ToString();
                _subRebind();
                break;
        }
    }


    protected void grvApp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        grvApp.PageIndex = e.NewPageIndex;
        lbl_titleSelect.Text = "";
        txt_contentSelect.Text = "";
        grvApp.DataSource = objLinqFB.getfeedbackByType("appreciation");
        grvApp.DataBind();
    }

    private void _txtmassge(bool flag) // create the message of success or faild
    {
        if (flag)
            txtMsg.Text = " The feedback has been deleted successfully";
        else
            txtMsg.Text = "Sorry, unable to deleted it";
    }
}