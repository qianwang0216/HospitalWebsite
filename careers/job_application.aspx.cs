using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Xml.Linq;
using System.Data;


public partial class job_application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //default item
            rbl.Items[0].Selected = true;
            rbl_1.Items[4].Selected = true;
            bindDropdownlist();
        }

    }
    //bind drop down list using linq
    protected void bindDropdownlist()
    {
        //Careers_listDataContext obj = new Careers_listDataContext(); 
        //var list = (from c in obj.careers_list select new {c.job_title }).Distinct();
        jobTitleLinq obj = new jobTitleLinq();

        ddl_job_type.DataSource = obj.getApplications();
        ddl_job_type.DataTextField = "job_title_name";
        ddl_job_type.DataBind();
    }

    protected void subSubmit(object sendor, EventArgs e)
    {
        if (rbl.SelectedValue == "")
        {
            rbl.SelectedIndex = 0;
        }
        if (rbl_1.SelectedValue == "")
        {
            rbl_1.SelectedIndex = 4;
        }

        //upload resume
        string savePath;

        string str1 = this.file_upload_resume.PostedFile.FileName;//get the content(filename) from the Upload textbox field
        if (str1 == "")
        {
            Response.Write("<script language=javascript>alert('Please choose one resume file')</script>");
        }
        else
        {
            int fileLength = this.file_upload_resume.PostedFile.ContentLength;//get the file size
            string getName = str1.Substring(str1.LastIndexOf("\\") + 1);//get the file name
            string exeName = str1.Substring(str1.LastIndexOf(".") + 1).ToUpper();//get the .xxx and transfer to upper words
            string saveName = DateTime.Now.ToString("yyyymmddhhmmssfff") + "." + exeName;//name the file by uploaded time
            savePath = Server.MapPath(@"~\careers\resumes\" + saveName);//config the save path

            try
            {
                if (exeName == "PDF" || exeName == "DOC") 
                {
                    if (File.Exists(savePath))
                    {
                        Response.Write("<script language=javascript>alert('This resume's name is already exist, please rename !')</script>");
                    }
                    else
                    {
                        this.file_upload_resume.PostedFile.SaveAs(savePath);
                        
                        //insert the uploaded link into database
                        CareersApplicationClass objLinq = new CareersApplicationClass();
                        objLinq.commitInsert(txt_fname.Text, txt_lname.Text, txt_email.Text, txt_phone.Text, txt_city.Text, ddl_job_type.SelectedItem.Text.ToString(), rbl_1.SelectedItem.Text.ToString(),savePath,rbl.SelectedItem.Text.ToString());

                        //Response.Write("<script>alert('Thank you for applying our hospital !')</script>");
                        //clear output
                        txt_fname.Text = string.Empty;
                        txt_lname.Text = string.Empty;
                        txt_email.Text = string.Empty;
                        txt_phone.Text = string.Empty;
                        txt_city.Text = string.Empty;
                        rbl.SelectedIndex = 0;
                        rbl_1.SelectedIndex = 4;
                        ddl_job_type.SelectedItem.Selected = false;

                        Response.Write("<script>alert('Thank you for applying our hospital !')</script>");
                        output.Text = "Thank you for applying our hospital! ";
                    }
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Please upload .doc or .pdf type file')</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script language=javascript>alert(ex.Message.ToString())</script>");
            }

            
        }
    }
    protected void upload_resume(object sender, EventArgs e)
    {

    }

    protected void upload_cover_letter(object sender, EventArgs e)
    {

    }

    protected void bindDropdownlist(object sender, EventArgs e)
    {

    }
    //clear data
    protected void subClear(object sendor, EventArgs e)
    {
        output.Text = string.Empty;
        txt_fname.Text = string.Empty;
        txt_lname.Text = string.Empty;
        txt_email.Text = string.Empty;
        txt_phone.Text = string.Empty;
        txt_city.Text = string.Empty;
        rbl.SelectedIndex = 0;
        rbl_1.SelectedIndex = 0;
        ddl_job_type.SelectedItem.Selected = false;
    }



}