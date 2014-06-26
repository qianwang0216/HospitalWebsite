using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class book_appointment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    //rebind the active and archived appointments
    private void _subRebind()
    {
        Guid _userId = (Guid)Membership.GetUser().ProviderUserKey;
        linqUsers objUsers = new linqUsers();
        
        rpt_activeappointment.DataSource = objUsers.getAppointmentByPatientId(_userId, "active");
        rpt_activeappointment.DataBind();
        //if (rpt_activeappointment.Items.Count == 0)
        //{
        //    rpt_activeappointment.Visible = false;
        //}
        //else
        //{
        //    rpt_activeappointment.Visible = true;
        //}
        rpt_archivedappointment.DataSource = objUsers.getAppointmentByPatientId(_userId, "archived");
        rpt_archivedappointment.DataBind();
        //if (rpt_archivedappointment.Items.Count == 0)
        //{
        //    rpt_archivedappointment.Visible = false;
        //}
        //else
        //{
        //    rpt_archivedappointment.Visible = true;
        //}
    }

    //get current user full name (First Name + Last Name)
    public string getCurrentUserFullName()
    {
        //get current user id
        Guid _userId = (Guid)Membership.GetUser().ProviderUserKey;

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

    //while clicking make a new appointment, show the doctor list and time slots
    protected void btn_makeappointment_Click(object sender, EventArgs e)
    {
        linqUsers objUser = new linqUsers();
        var allDoctors = objUser.getAllDoctors();
        ddl_doctorlist.Items.Clear();
        ddl_availabledate.Items.Clear();
        cbl_timeslot.Items.Clear();

        //use this kind of code to bind the doctor/date/timeslot
        //because doctor and timeslot are using multipul columns for the text field
        //keep same style in this page
        foreach (var doctor in allDoctors)
        {
            ddl_doctorlist.Items.Add(new ListItem(doctor.FirstName + " " + doctor.LastName, doctor.UserId.ToString()));
        }

        btn_submitAppointment.Enabled = false;

        if (ddl_doctorlist.Items.Count > 0)
        {
            setAvailableDateList();
        }

        _showPanel(pnl_makeappointment);
    }

    //Cancel an appointment
    protected void subCancelAppointment(object sender, CommandEventArgs e)
    {
        int _appointment_id = Int32.Parse(e.CommandArgument.ToString());
        linqUsers objUser = new linqUsers();
        objUser.cancelAppointment(_appointment_id);
        _subRebind();
    }

    private void _showPanel(Panel pnl)
    {
        pnl_appointmentlist.Visible = false;
        pnl_makeappointment.Visible = false;
        pnl.Visible = true;
    }

    //while doctor changed, change the available dates accordingly
    protected void ddl_doctorlist_SelectedIndexChanged(object sender, EventArgs e)
    {
        setAvailableDateList();
    }

    //list all available dates no earlier than today
    private void setAvailableDateList()
    {
        linqUsers objUser = new linqUsers();
        Guid _doctor_id = new Guid(ddl_doctorlist.SelectedValue);
        var allDates = objUser.getDistinctActiveAvailableDateByDocID(_doctor_id);
        ddl_availabledate.Items.Clear();
        cbl_timeslot.Items.Clear();
        foreach (var availabledate in allDates)
        {
            ddl_availabledate.Items.Add(new ListItem(availabledate.available_date, availabledate.available_date));
        }

        btn_submitAppointment.Enabled = false;

        //if there is available dates, show the timeslots of it
        if (ddl_availabledate.Items.Count > 0)
        {
            setTimeSlotList();
        }

    }

    //show the time slots
    private void setTimeSlotList()
    {
        cbl_timeslot.Items.Clear();
        linqUsers objUser = new linqUsers();
        Guid _doctor_id = new Guid(ddl_doctorlist.SelectedValue);
        DateTime _available_date = DateTime.Parse(ddl_availabledate.SelectedValue);
        var allTimeslots = objUser.getDoctorAvailableTimeslotOfDate(_doctor_id, _available_date);
        foreach (var timeslot in allTimeslots)
        {
            cbl_timeslot.Items.Add(new ListItem(timeslot.available_starttime.ToString(@"hh\:mm") + " - " + timeslot.available_endtime.ToString(@"hh\:mm"), timeslot.appointment_id.ToString()));
        }
        if (cbl_timeslot.Items.Count > 0)
        {
            btn_submitAppointment.Enabled = true;
        }
        else
        {
            btn_submitAppointment.Enabled = false;
        }

    }

    //when the avaliable date is changed, change the timeslots accordingly
    protected void ddl_availabledate_SelectedIndexChanged(object sender, EventArgs e)
    {
        setTimeSlotList();
    }

    //submit the appointment
    protected void btn_submitAppointment_Click(object sender, EventArgs e)
    {
        Guid _patient_id = (Guid)Membership.GetUser().ProviderUserKey;
        linqUsers objUser = new linqUsers();
        foreach (ListItem item in cbl_timeslot.Items)
        {
            if (item.Selected)
            {
                objUser.makeAppointment(_patient_id, Int32.Parse(item.Value));
            }
        }

        ddl_doctorlist.Items.Clear();
        ddl_availabledate.Items.Clear();
        cbl_timeslot.Items.Clear();
        _subRebind();
        _showPanel(pnl_appointmentlist);
    }

    //cancel appointment submission
    protected void btn_cancelSubmitAppointment_Click(object sender, EventArgs e)
    {
        ddl_doctorlist.Items.Clear();
        ddl_availabledate.Items.Clear();
        cbl_timeslot.Items.Clear();
        _showPanel(pnl_appointmentlist);
    }

    //when clicking the "archived" or "active" menu, switch the view accordingly
    protected void mnu_myappointment_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text == "Archived")
        {
            mtv_myappointment.ActiveViewIndex = 1;
        }
        else
        {
            mtv_myappointment.ActiveViewIndex = 0;
        }
    }
}