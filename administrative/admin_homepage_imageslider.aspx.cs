using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_homepage_imageslider : System.Web.UI.Page
{
    sliderlinqClass objLinq = new sliderlinqClass();
    protected void subAdmin(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Upd":
                TextBox txtsimageName = (TextBox)e.Item.FindControl("txt_name");
                TextBox txtsimageOrder = (TextBox)e.Item.FindControl("txt_order");
                TextBox txtsimageText = (TextBox)e.Item.FindControl("txt_text");
                TextBox txtsimageTitle = (TextBox)e.Item.FindControl("txt_title");
                
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_id");

                int SID = int.Parse(hdfID.Value.ToString());
                _strMessage(objLinq.commitUpdate(SID, txtsimageName.Text, int.Parse(txtsimageOrder.Text.ToString()), txtsimageText.Text, txtsimageTitle.Text), "update");
                _subRebind();
                break;
            case "del":
                int _id = int.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
                _strMessage(objLinq.commitDelete(_id), "delete");
                _subRebind();
                break;

            case "Cancel":
                _subRebind();
                break;

        }
    }

    protected void btn_insert_Click(object sender, CommandEventArgs e)
    {
        if (fud_sliderimgI.HasFile && fud_sliderimgI.PostedFile.ContentLength > 0)
        {
            fud_sliderimgI.PostedFile.SaveAs(Server.MapPath("~/images/") + fud_sliderimgI.FileName);
            string fileName = fud_sliderimgI.FileName;
            
            byte[] fileByte = fud_sliderimgI.FileBytes;

           
        }
        _strMessage(objLinq.commitInsert(txt_nameI.Text, int.Parse(txt_orderI.Text.ToString()), txt_textI.Text, txt_titleI.Text), "insert");
        _subRebind();
    }

    private void _showUpdate(int id)
    {
        sliderlinqClass _linq = new sliderlinqClass();
        ltv_main.DataSource = _linq.getSimageByID(id);
        ltv_main.DataBind();

    }
    private void _showDelete(int id)
    {
        ltv_main.DataSource = objLinq.getSimageByID(id);
        ltv_main.DataBind();
    }


    private void _subRebind()
    {
        txt_nameI.Text = string.Empty;
        txt_orderI.Text = string.Empty;
        txt_textI.Text = string.Empty;
        txt_titleI.Text = string.Empty;
        
        
        ltv_main.DataSource = objLinq.getSimages();
        ltv_main.DataBind();

    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_msg.Text = "Image upload " + str + " was successful";
        else
            lbl_msg.Text = "Sorry, was unable to " + str + " upload the image";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }
}