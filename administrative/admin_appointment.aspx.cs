using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_appointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebindDocList();
            _showPanel(pnl_doctorList);
        }
    }

    //rebind the doctor list
    private void _subRebindDocList()
    {
        linqUsers objUsers = new linqUsers();

        var allDoctors = objUsers.getAllDoctors();
        rpt_doctorlist.DataSource = allDoctors;
        rpt_doctorlist.DataBind();
    }

    //rebind the doctor timeslot
    private void _subRebindDocTimeslot()
    {
        Guid _doctor_id = new Guid(ViewState["doctor_id"].ToString());
        linqUsers objUser = new linqUsers();
        ddl_docavailable_date.DataSource = objUser.getDistinctActiveAvailableDateByDocID(_doctor_id);
        ddl_docavailable_date.DataTextField = "available_date";
        ddl_docavailable_date.DataValueField = "available_date";
        ddl_docavailable_date.DataBind();
        rpt_doctimeslotlist.DataSource = null;
        rpt_doctimeslotlist.DataBind();
        if (ddl_docavailable_date.Items.Count != 0)
        {
            rpt_doctimeslotlist.DataSource = objUser.getAppOfDocCertainDay(_doctor_id, Convert.ToDateTime(ddl_docavailable_date.SelectedItem.Value));
            rpt_doctimeslotlist.DataBind();
        }
    }

    private void _showPanel(Panel pnl)
    {
        pnl_doctorList.Visible = false;
        pnl_appointments.Visible = false;
        pnl_timeslot.Visible = false;
        pnl_addtimeslot.Visible = false;
        pnl.Visible = true;
    }

    //show different panel and bind data based on the which link button is clicked
    protected void subAdmin(object sender, CommandEventArgs e)
    {
        Guid _doctor_id;
        _doctor_id = new Guid(e.CommandArgument.ToString());
        ViewState["doctor_id"] = e.CommandArgument.ToString();
        
        switch (e.CommandName)
        {
            case "ViewAppointment":
                lbl_docappointment.Text = "Appointments for DR. " + getUserFullName(_doctor_id);
                _subRebindDocAppointment();
                _showPanel(pnl_appointments);
                break;
            case "ViewTimeslot":
                _showPanel(pnl_timeslot);
                lbl_doctimeslot.Text = "Time slots for DR. " + getUserFullName(_doctor_id);
                //lbl_doctimeslot.Text = e.CommandArgument.ToString();
                _subRebindDocTimeslot();
                break;
        }
    }

    //rebind the doctor appointment list
    private void _subRebindDocAppointment()
    {
        Guid _doctor_id = new Guid(ViewState["doctor_id"].ToString());
        linqUsers objUser = new linqUsers();
        rpt_activeappointmentlist.DataSource = objUser.getActiveAppointmentOfDoc(_doctor_id);
        rpt_activeappointmentlist.DataBind();
        rpt_archiveappointmentlist.DataSource = objUser.getArchivedAppointmentOfDoc(_doctor_id);
        rpt_archiveappointmentlist.DataBind();

    }

    //Get user full name
    public string getUserFullName(Guid _userId)
    {
        linqUsers objUsers = new linqUsers();
        int count = objUsers.getUserAdditionalInfoByUserId(_userId).Count();

        if (count == 0)
            return "";
        else
        {
            var objCurrentUser = objUsers.getUserAdditionalInfoByUserId(_userId).First();
            return objCurrentUser.FirstName + " " + objCurrentUser.LastName;
        }
    }

    //back to doctor list
    protected void lkb_backtodoclist_Click(object sender, EventArgs e)
    {
        _showPanel(pnl_doctorList);
    }

    //show the timeslot panel
    protected void btn_addtimeslot_Click(object sender, EventArgs e)
    {
        _showPanel(pnl_addtimeslot);
        Guid _doctor_id = new Guid(ViewState["doctor_id"].ToString());
        lbl_docaddtimeslot.Text = "Add new available time slot for DR. " + getUserFullName(_doctor_id);
    }

    //save new available time slots for a doctor
    protected void btn_savetimeslot_Click(object sender, EventArgs e)
    {
        Guid _doctor_id = new Guid(ViewState["doctor_id"].ToString());
        linqUsers objUser = new linqUsers();
        TimeSpan _starttime = TimeSpan.Parse(ddl_starttime.SelectedItem.Value);
        TimeSpan _endtime = TimeSpan.Parse(ddl_endtime.SelectedItem.Value);
        DateTime _available_date = Convert.ToDateTime(txt_timeslotdate.Text);
        TimeSpan i;
        //add the available time slots as 30 minutes per slot
        for (i = _starttime; i < _endtime; i = i + TimeSpan.FromMinutes(30))
        {
            objUser.insertAppointment(_doctor_id, _available_date, i, i + TimeSpan.FromMinutes(30));
        }
        //reset the input controls
        txt_timeslotdate.Text = "";
        ddl_starttime.SelectedIndex = ddl_starttime.Items.IndexOf(ddl_starttime.Items.FindByText("09:00"));
        ddl_endtime.SelectedIndex = ddl_endtime.Items.IndexOf(ddl_endtime.Items.FindByText("09:30"));
        _subRebindDocTimeslot();
        _showPanel(pnl_timeslot);
    }

    //cancel saving time slots, back to previous view
    protected void btn_cancelsave_Click(object sender, EventArgs e)
    {
        txt_timeslotdate.Text = "";
        ddl_starttime.SelectedIndex = ddl_starttime.Items.IndexOf(ddl_starttime.Items.FindByText("09:00"));
        ddl_endtime.SelectedIndex = ddl_endtime.Items.IndexOf(ddl_endtime.Items.FindByText("09:30"));
        _showPanel(pnl_timeslot);
    }

    //while available date is changed, change the timeslots accordingly.
    protected void ddl_docavailable_date_SelectedIndexChanged(object sender, EventArgs e)
    {
        Guid _doctor_id;
        _doctor_id = new Guid(ViewState["doctor_id"].ToString());
        linqUsers objUser = new linqUsers();
        if (ddl_docavailable_date.SelectedItem.Value != "")
        {
            rpt_doctimeslotlist.DataSource = objUser.getAppOfDocCertainDay(_doctor_id, Convert.ToDateTime(ddl_docavailable_date.SelectedItem.Value));
            rpt_doctimeslotlist.DataBind();
        }

    }

    //cancel appointment from doctor side
    protected void lkb_doctimeslotcancelappointment_Command(object sender, CommandEventArgs e)
    {
        int _appointment_id = Int32.Parse(e.CommandArgument.ToString());
        linqUsers objUser = new linqUsers();
        objUser.cancelAppointment(_appointment_id);

        Guid _doctor_id;
        _doctor_id = new Guid(ViewState["doctor_id"].ToString());
        if (ddl_docavailable_date.SelectedItem.Value != "")
        {
            rpt_doctimeslotlist.DataSource = objUser.getAppOfDocCertainDay(_doctor_id, Convert.ToDateTime(ddl_docavailable_date.SelectedItem.Value));
            rpt_doctimeslotlist.DataBind();
        }
    }

    //remove a timeslot
    protected void lkb_removetimeslot_Command(object sender, CommandEventArgs e)
    {
        int _appointment_id = Int32.Parse(e.CommandArgument.ToString());
        linqUsers objUser = new linqUsers();
        objUser.removeTimeslot(_appointment_id);
        Guid _doctor_id;
        _doctor_id = new Guid(ViewState["doctor_id"].ToString());
        if (ddl_docavailable_date.SelectedItem.Value != "")
        {
            rpt_doctimeslotlist.DataSource = objUser.getAppOfDocCertainDay(_doctor_id, Convert.ToDateTime(ddl_docavailable_date.SelectedItem.Value));
            rpt_doctimeslotlist.DataBind();
        }
    }

    //cancel an appointment
    protected void lkb_docappintmentcancelappointment_Command(object sender, CommandEventArgs e)
    {
        int _appointment_id = Int32.Parse(e.CommandArgument.ToString());
        linqUsers objUser = new linqUsers();
        objUser.cancelAppointment(_appointment_id);
        _subRebindDocAppointment();
    }

    //these two server validation are not working because they are in a hidden panel when loading, it is a bug of .NET
    protected void ctv_endtime_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (TimeSpan.Parse(ddl_endtime.SelectedValue) > TimeSpan.Parse(ddl_starttime.SelectedValue))
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
    protected void ctv_timeslotdate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
        {
            if (DateTime.Parse(args.Value) >= DateTime.Now)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
        catch (Exception e)
        {
            args.IsValid = false;
        }

    }

    //switch the view according to clicked menu item
    protected void mnu_appointment_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text == "Archived")
        {
            mtv_docappointment.ActiveViewIndex = 1;
        }
        else
        {
            mtv_docappointment.ActiveViewIndex = 0;
        }
    }
}