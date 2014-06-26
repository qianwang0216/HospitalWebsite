using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
public partial class administrative_admin_job_application : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CareersApplicationClass obj = new CareersApplicationClass();

            rpt_main.DataSource = obj.getApplications();
            rpt_main.DataBind();

            //get the resumes category
            string strfilepath = Server.MapPath("../careers/resumes/");
            //create the path
            DirectoryInfo dir = new DirectoryInfo(strfilepath);
            //get all the files in the category
            FileSystemInfo[] files = dir.GetFileSystemInfos();
            //display the files' names in ListBox
            ListItem items;
            foreach (FileSystemInfo infoflies in files)
            {
                items = new ListItem();
                items.Text = infoflies.Name;
                items.Value = infoflies.FullName;
                //ListBox1.Items.Add(items);
            }

        }
    }

    protected void Button1_Click(object sender, CommandEventArgs e)
    {
        int userID = int.Parse(e.CommandArgument.ToString());
        CareersApplicationClass obj = new CareersApplicationClass();
        string resumePath = obj.getApplicationsByID(userID).First().resume;
        string resumeName = resumePath.Substring((resumePath.LastIndexOf("\\") + 1),21);
        //get the download path
        string downfiles = "../careers/resumes/" + resumeName;
        DownLoad(downfiles);
    }

    /// <summary>
    /// file download
    /// </summary>
    /// <param name="fileURL">the file path</param>
    public Boolean DownLoad(string fileURL)
    {
        Boolean Dok = false;
        try
        {
            string FullPathURL = Server.MapPath(fileURL);
            System.IO.FileInfo file = new System.IO.FileInfo(FullPathURL);
            if (file.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(file.Name));

                Response.AddHeader("Content-Length", file.Length.ToString());
                Response.ContentType = "application/application/octet-stream";
                Response.WriteFile(file.FullName);
                Response.End();
                Response.Flush();
                Response.Clear();

                Dok = true;
            }
            else
            {
                this.Page.RegisterStartupScript("ss", "<script>alert('The file doesn't exist!')</script>");
            }
        }
        catch
        {
            this.Page.RegisterStartupScript("ss", "<script>alert('The file doesn't exist!')</script>");
        }
        return Dok;
    }

}
