using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Linq;

public partial class admin_news_accordion : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _rebind();
        }
    }

    //bind the news list to the gridview control
    private void _rebind()
    {
        linqNewsAccordion objNews = new linqNewsAccordion();
        var allNews = objNews.getNewsAccordion();
        grv_news.DataSource = allNews;
        grv_news.DataBind();
    }

    //while clicking the news title, change the formview to readonly mode and show the detail
    protected void hplShowDetails_Command(object sender, CommandEventArgs e)
    {

        int _id = Convert.ToInt32(e.CommandArgument.ToString());
        linqNewsAccordion objNews = new linqNewsAccordion();
        fmv_news.ChangeMode(FormViewMode.ReadOnly);
        fmv_news.DataSource = objNews.getNewsAccordionByID(_id);
        fmv_news.DataBind();
        if (Object.ReferenceEquals(null, objNews.getNewsAccordionByID(_id).First().an_img))
        {
            ((Image)(fmv_news.FindControl("img_newsimageV"))).Visible = false;
        }
        else
        {
            ((Image)(fmv_news.FindControl("img_newsimageV"))).ImageUrl = "../ShowNewsAccordionImage.ashx?an_id=" + _id.ToString();
        }

        _showPanel(pnl_news);
    }
    //change the formview to insert mode and show it
    protected void btn_addNews_Click(object sender, EventArgs e)
    {
        fmv_news.ChangeMode(FormViewMode.Insert);
        _showPanel(pnl_news);
    }

    //show related panel only and hide all others
    private void _showPanel(Panel pnl)
    {
        pnl_all.Visible = false;
        pnl_news.Visible = false;
        pnl.Visible = true;
    }
    //while clicking cancel, back to all news view
    protected void btn_cancel_insert_news_Click(object sender, EventArgs e)
    {
        _showPanel(pnl_all);
        //reset the input text box
        ((TextBox)(((Button)sender).NamingContainer.FindControl("txt_titleI"))).Text = string.Empty;
        ((TextBox)(((Button)sender).NamingContainer.FindControl("txt_contentI"))).Text = string.Empty;
    }
    //insert the news
    protected void btn_insert_news_Click(object sender, EventArgs e)
    {
        string _title = ((TextBox)(((Button)sender).NamingContainer.FindControl("txt_titleI"))).Text.ToString();
        string _content = ((TextBox)(((Button)sender).NamingContainer.FindControl("txt_contentI"))).Text.ToString();

        Binary _news_img = null;

        FileUpload _ful_image = (FileUpload)(((Button)sender).NamingContainer.FindControl("ful_imageI"));

        //get the uploaded image
        if (_ful_image.HasFile && _ful_image.PostedFile.ContentLength > 0)
        {
            string fileName = _ful_image.FileName;

            byte[] fileByte = _ful_image.FileBytes;
            _news_img = new Binary(fileByte);
        }

        linqNewsAccordion objNews = new linqNewsAccordion();
        objNews.commitInsert(_title, _content, _news_img);
        _rebind();
        //reset the input text box
        ((TextBox)(((Button)sender).NamingContainer.FindControl("txt_titleI"))).Text = string.Empty;
        ((TextBox)(((Button)sender).NamingContainer.FindControl("txt_contentI"))).Text = string.Empty;
        _showPanel(pnl_all);
    }

    //change to edit mode
    protected void btn_edit_news_Click(object sender, EventArgs e)
    {
        int _id = Convert.ToInt32(((HiddenField)(((Button)sender).NamingContainer.FindControl("hdf_id"))).Value.ToString());
        linqNewsAccordion objNews = new linqNewsAccordion();
        fmv_news.ChangeMode(FormViewMode.Edit);
        fmv_news.DataSource = objNews.getNewsAccordionByID(_id);
        fmv_news.DataBind();
        if (Object.ReferenceEquals(null, objNews.getNewsAccordionByID(_id).First().an_img))
        {
            ((Image)(fmv_news.FindControl("img_newsImageE"))).Visible = false;

            ((Button)(fmv_news.FindControl("btn_deleteImage"))).Visible = false;
        }
        else
        {
            ((Image)(fmv_news.FindControl("img_newsImageE"))).ImageUrl = "../ShowNewsAccordionImage.ashx?an_id=" + _id.ToString();
        }

    }
    //while clicking cancel, back to all news view
    protected void btn_cancel_view_Click(object sender, EventArgs e)
    {
        _showPanel(pnl_all);
    }
    //delete the news
    protected void btn_delete_news_Click(object sender, EventArgs e)
    {
        linqNewsAccordion objNews = new linqNewsAccordion();
        int _id = Convert.ToInt32(((HiddenField)(((Button)sender).NamingContainer.FindControl("hdf_id"))).Value.ToString());
        objNews.commitDelete(_id);
        _rebind();
        _showPanel(pnl_all);
    }

    //update the news
    protected void btn_update_news_Click(object sender, EventArgs e)
    {
        int _id = Convert.ToInt32(((HiddenField)(((Button)sender).NamingContainer.FindControl("hdf_idE"))).Value.ToString());
        string _title = ((TextBox)(((Button)sender).NamingContainer.FindControl("txt_titleE"))).Text.ToString();
        string _content = ((TextBox)(((Button)sender).NamingContainer.FindControl("txt_contentE"))).Text.ToString();

        Binary _news_img = null;
        bool deleteImage = false;
        FileUpload _ful_image = (FileUpload)(((Button)sender).NamingContainer.FindControl("ful_imageE"));

        //get the uploaded image
        if (_ful_image.HasFile && _ful_image.PostedFile.ContentLength > 0)
        {
            string fileName = _ful_image.FileName;

            byte[] fileByte = _ful_image.FileBytes;
            _news_img = new Binary(fileByte);
        }
        else
        {
            //if no file is selected and original image is deleted, that means need to delete the image
            if (((Button)(((Button)sender).NamingContainer.FindControl("btn_deleteImage"))).Text.ToString() == "Undo Delete")
            {
                deleteImage = true;
            }
        }

        linqNewsAccordion objNews = new linqNewsAccordion();
        objNews.commitUpdate(_id, _title, _content, _news_img, deleteImage);
        _rebind();
        _showPanel(pnl_all);
    }

    //while clicking cancel, back to all news view
    protected void btn_cancel_update_news_Click(object sender, EventArgs e)
    {
        _showPanel(pnl_all);
    }

    //while clicking the delete image button, hide or show the image and set the button text according to the actually operation
    protected void btn_deleteImage_Click(object sender, EventArgs e)
    {
        Image newsImage = (Image)(fmv_news.FindControl("img_newsImageE"));
        newsImage.Visible = !newsImage.Visible;
        Button btnDeleteImage = (Button)(fmv_news.FindControl("btn_deleteImage"));
        if (btnDeleteImage.Text == "Delete Image")
        {
            btnDeleteImage.Text = "Undo Delete";
        }
        else
        {
            btnDeleteImage.Text = "Delete Image";
        }

    }
}