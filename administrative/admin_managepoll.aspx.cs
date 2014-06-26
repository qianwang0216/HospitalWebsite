using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class administrative_managepoll : System.Web.UI.Page
    
{
    linqSurveyclass objLinqQ = new linqSurveyclass();
    protected void Page_Load(object sender, EventArgs e)
    {
         if (!IsPostBack)
                GetQuestions();
    }

   protected void GetQuestions()
    {
    
    }

   protected void btnSubmit_Click(object sender, EventArgs e)
   {
       if (Page.IsValid)
       {
           Survey survey = new Survey();
           survey.Title = txt_title.Text;
           survey.Description = txt_desc.Text;
           survey.ExpiresOn = Convert.ToDateTime(txt_xdate.Text.Trim());
           survey.CreatedOn = Convert.ToDateTime(DateTime.Now);
           survey.CreatedBy = 2;
           List<surveyquestion> questions = new List<surveyquestion>();
           foreach (ListItem li in lsb_target.Items)
           {
               surveyquestion quest = new surveyquestion();
               quest.QuestionID = int.Parse(li.Value);
               //survey.surveyresponses.AddTo(quest);
               questions.Add(quest);
           }

       }
   }

        protected void btnAddAll_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lsb_source.Items)
                lsb_target.Items.Add(li);
            lsb_source.Items.Clear();
            lsb_source.SelectedIndex = -1;
            lsb_target.SelectedIndex = -1;
        }

        protected void btnAddOne_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lsb_source.Items)
                if (li.Selected)
                    lsb_target.Items.Add(li);
            foreach (ListItem li in lsb_target.Items)
            lsb_source.Items.Remove(li);
            lsb_source.SelectedIndex = -1;
            lsb_target.SelectedIndex = -1;
        }

        protected void btnRemoveOne_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lsb_target.Items)
                if (li.Selected)
                    lsb_source.Items.Add(li);
            foreach (ListItem li in lsb_source.Items)
                lsb_target.Items.Remove(li);
            lsb_source.SelectedIndex = -1;
            lsb_target.SelectedIndex = -1;
        }

        protected void btnRemoveAll_Click(object sender, EventArgs e)
        {
            foreach (ListItem li in lsb_target.Items)
                lsb_source.Items.Add(li);
            lsb_target.Items.Clear();
            lsb_source.SelectedIndex = -1;
            lsb_target.SelectedIndex = -1;
        }


        protected void lsb_source_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
}
