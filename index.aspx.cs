using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Data.Common;
using System.Configuration;

public partial class _index : System.Web.UI.Page
{
    
    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        Master.pp_masterTitle = " HOME | NIPIGON DISTRICT MEMORIAL HOSPITAL";
    }

    sliderlinqClass objLinq = new sliderlinqClass();   
    private void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetImageUrl();
            }

        }

    private void SetImageUrl()
    {
            sliderlinqClass objLinq = new sliderlinqClass();   
            //creating a new dataset instance
            DataSet ds = new DataSet();

            string cs = ConfigurationManager.ConnectionStrings["DB_69755_aspclassConnectionString"].ToString();
            SqlConnection con = new SqlConnection(cs);
            SqlDataAdapter da = new SqlDataAdapter("getSliderImages", con);
            da.SelectCommand.CommandType = CommandType.StoredProcedure;

            da.Fill(ds, "image");


            ViewState["ImageData"] = ds;
            ViewState["ImageDisplayed"] = 1;

            DataRow imageDataRow = ds.Tables["image"].Select().FirstOrDefault(x => x["simageOrder"].ToString() == "1");
            img_slider.ImageUrl = "~/images/" + imageDataRow["simageName"].ToString();
            lbl_slider.Text = (imageDataRow["simageTitle"]).ToString();
            lbl_slider2.Text = (imageDataRow["simageText"]).ToString();
            

    }




        // This event is raised every one second as we have set
        // the interval to 3000 milliseconds
    protected void subTick(object sender, EventArgs e)
    {
            int i = (int)ViewState["ImageDisplayed"];
            i = i + 1;

            ViewState["ImageDisplayed"] = i;


            DataRow imageDataRow = ((DataSet)ViewState["ImageData"]).Tables["image"].Select().FirstOrDefault(x => x["simageOrder"].ToString() == i.ToString());
            if (imageDataRow != null)
            {
                img_slider.ImageUrl = "~/images/" + imageDataRow["simageName"].ToString();
                lbl_slider.ForeColor = System.Drawing.Color.AliceBlue;
                lbl_slider.Text = (imageDataRow["simageTitle"]).ToString();
                lbl_slider2.ForeColor = System.Drawing.Color.LightBlue;
                lbl_slider2.Text = (imageDataRow["simageText"]).ToString();
                
            }
            else
            {
                SetImageUrl();
            }
    }

    protected void Btn_Click(object sender, EventArgs e)
    {
        if (tmr_main.Enabled)
        {
            tmr_main.Enabled = false;
            btn_slide.Text = "Start";
        }
        else
        {
            tmr_main.Enabled = true;
            btn_slide.Text = "Stop";
        }
    }
}