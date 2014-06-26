using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class job_listing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //bind the gridview using linq
            CareersListClass obj = new CareersListClass();
            grv_main.DataSource = obj.getCareersListSorting();
            grv_main.DataBind();
            this.grv_main.Columns[0].ItemStyle.Width = 100;
            this.grv_main.Columns[1].ItemStyle.Width = 100;
            this.grv_main.Columns[2].ItemStyle.Width = 100;
            this.grv_main.Columns[3].ItemStyle.Width = 200;
            this.grv_main.Columns[4].ItemStyle.Width = 200;
        }
    }
}