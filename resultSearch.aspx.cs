using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class resultSearch : System.Web.UI.Page
{
    linqSearchengine objLinqSE = new linqSearchengine();// create the new class
    protected void Page_Load(object sender, EventArgs e)
    {
        string keyword = Session["search"].ToString();//grab the search text from master page

        if (string.IsNullOrEmpty(keyword)) // if user did not write anything 
        {
            label1.Text = "No keywords entered, please try again";
        }

        else if ((objLinqSE.getContentBySearch(keyword).Count() == 0))// if user keyword didn't match with accordion_new table
        {
            label1.Text = "No result found of "+ keyword +", please try again";
        }

        else
        {
            int searchCount = objLinqSE.getContentBySearch(keyword).Count();// if user keyword match with accordion_new table
            label1.Text = searchCount + " result(s) of " + keyword + " found"; // show the number of result(s)
            dtlSearch.DataSource = objLinqSE.getContentBySearch(keyword); // display the result
            dtlSearch.DataBind();
        }

    }
}