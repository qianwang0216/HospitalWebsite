using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class rssfeed : System.Web.UI.Page
{
    linqRssfeed objLinqRF = new linqRssfeed();

    protected void Page_LoadComplete(object sender, EventArgs e)// change the title of master page
    {
        Master.pp_masterTitle = " RSS Feed | NIPIGON DISTRICT MEMORIAL HOSPITAL";
        rptRSS.DataSource = objLinqRF.getrssfeeds(); //Grab the database and add to Data Bound Control
        rptRSS.DataBind();

    }
    
}