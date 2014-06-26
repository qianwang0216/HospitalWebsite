using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


    public partial class administrative_pollquestions : System.Web.UI.Page
    {
        linqSurveyclass objLinqQ = new linqSurveyclass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _subRebind();
            }
        }
        protected void ddl_qtype_SelectedIndexChanged(object sender, EventArgs e)
            {
               lbl_qtype.Text = ddl_qtype.SelectedItem.ToString();
            }
        protected void btnSubmit_Click(object sender, CommandEventArgs e)
        {
            _strMessage(objLinqQ.commitInsertQ(txt_desc.Text, lbl_qtype.Text, txt_values.Text),"insert");
            _subRebind();
        }
        private void _subRebind()
        {
            txt_desc.Text = string.Empty;
            lbl_qtype.Text = string.Empty;
            txt_values.Text = string.Empty;
            
        }
        private void _strMessage(bool flag, string str)
        {
            if (flag)
                lbl_msg.Text = "Question " + str + " operation carried out successfully!";
            else
                lbl_msg.Text = "Unable to create " + str + " Question";
        }
    }