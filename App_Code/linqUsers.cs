using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for linqUsers
/// </summary>
public class linqUsers
{
	public linqUsers()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    //insert the additional user information to database
    public bool insertUserAdditionalInfo (Guid _userId, string _firstName, string _lastName, string _phone)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        using (objUserDC)
        {
            User_AddtionalInfo objUserAdditional = new User_AddtionalInfo();
            objUserAdditional.UserId = _userId;
            objUserAdditional.FirstName = _firstName;
            objUserAdditional.LastName = _lastName;
            objUserAdditional.Phone = _phone;
            objUserDC.User_AddtionalInfos.InsertOnSubmit(objUserAdditional);
            objUserDC.SubmitChanges();
            return true;
        }
    }

    //get user additional information by userid
    public IQueryable<User_AddtionalInfo> getUserAdditionalInfoByUserId(Guid _userId)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allUsers = objUserDC.User_AddtionalInfos.Where(x => x.UserId == _userId).Select(x => x);
        return allUsers;
    }

    //get all registered users (registered_users is a view)
    public IQueryable<registered_user> getAllRegisteredUsers()
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allRegisteredUsers = objUserDC.registered_users.Select(x => x);
        return allRegisteredUsers;
    }

    //get all doctors (doctors is a view)
    public IQueryable<doctor> getAllDoctors()
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allDoctors = objUserDC.doctors.Select(x => x);
        return allDoctors;
    }

    //insert appointment
    public bool insertAppointment(Guid _doctor_id, DateTime _available_date, TimeSpan _available_starttime, TimeSpan _available_endtime)
    {
        //TO DO: check if the appointment time slot already there
        if (isExistingAppointmentTimeslot(_doctor_id, _available_date, _available_starttime))
        {
            return false;
        }
        UsersDataContext objUserDC = new UsersDataContext();
        using (objUserDC)
        {
            appointment objAppointment = new appointment();
            objAppointment.doctor_id = _doctor_id;
            objAppointment.available_date = _available_date;
            objAppointment.available_starttime = _available_starttime;
            objAppointment.available_endtime = _available_endtime;
            objUserDC.appointments.InsertOnSubmit(objAppointment);
            objUserDC.SubmitChanges();
            return true;
        }
    }

    //get distinct available date for a doctor
    public List<DoctorAvailableDate> getDistinctActiveAvailableDateByDocID(Guid _doctor_id)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allDates = objUserDC.appointments.Where(x => x.available_date >= DateTime.Now).Where(x => x.doctor_id == _doctor_id).Select(x => x.available_date).Distinct().Select(x => new DoctorAvailableDate {available_date = x.ToShortDateString()}).ToList();
        return allDates;
    }

    //get the doctor one day appointment list
    public IQueryable<appointment_list> getAppOfDocCertainDay(Guid _doctor_id, DateTime _date)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allAppointments = objUserDC.appointment_lists.Where(x => x.doctor_id == _doctor_id).Where(x => x.available_date == _date).Select(x => x);
        return allAppointments;
    }

    //get appointments of a patient, active or archived
    //type = "active" or "archived"
    public IQueryable<appointment_list> getAppointmentByPatientId(Guid _patient_id, string type)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        if (type == "active")
        {
            var allAppointments = objUserDC.appointment_lists.OrderBy(x => x.available_starttime).OrderBy(x => x.available_date).Where(x => x.patient_id == _patient_id).Where(x => x.available_date >= DateTime.Now).Select(x => x);
            return allAppointments;
        }
        else if (type == "archived")
        {
            var allAppointments = objUserDC.appointment_lists.OrderBy(x => x.available_starttime).OrderBy(x => x.available_date).Where(x => x.patient_id == _patient_id).Where(x => x.available_date < DateTime.Now).Select(x => x);
            return allAppointments;
        }
        return null;
    }

    //get doctor available time slots of a certain date
    public IQueryable<appointment> getDoctorAvailableTimeslotOfDate(Guid _doctor_id, DateTime _available_date)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allAppointments = objUserDC.appointments.Where(x => x.doctor_id == _doctor_id).Where(x => x.available_date == _available_date).Where(x => x.book_status == false).Select(x => x);
        return allAppointments;
    }

    //make an appointment for a patient
    public bool makeAppointment(Guid _patient_id, int _appointment_id)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        using (objUserDC)
        {
            var objAppointment = objUserDC.appointments.Single(x => x.appointment_id == _appointment_id);
            objAppointment.book_status = true;
            objAppointment.patient_id = _patient_id;
            //commit to database
            objUserDC.SubmitChanges();
            return true;
        }
    }

    //cancel an appointment
    public bool cancelAppointment(int _appointment_id)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        using (objUserDC)
        {
            var objAppointment = objUserDC.appointments.Single(x => x.appointment_id == _appointment_id);
            objAppointment.book_status = false;
            objAppointment.patient_id = null;
            //commit to database
            objUserDC.SubmitChanges();
            return true;
        }
    }

    //verify if a timeslot is already in the database
    public bool isExistingAppointmentTimeslot(Guid _doctor_id, DateTime _available_date, TimeSpan _available_starttime)
    {
        bool result = false;
        UsersDataContext objUserDC = new UsersDataContext();
        var allAppointment = objUserDC.appointments.Where(x => x.doctor_id == _doctor_id).Where(x => x.available_date == _available_date).Where(x => x.available_starttime == _available_starttime).Select(x => x);
        if (allAppointment.Any())
        {
            result = true;
        }
        return result;
    }

    //remove a timeslot
    public bool removeTimeslot(int _appointment_id)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        using (objUserDC)
        {
            var objRemoveTimeslot = objUserDC.appointments.Single(x => x.appointment_id == _appointment_id);
            objUserDC.appointments.DeleteOnSubmit(objRemoveTimeslot);
            //commit to database
            objUserDC.SubmitChanges();
            return true;
        }
    }

    //get active appointment list for one doctor
    public IQueryable<appointment_list> getActiveAppointmentOfDoc(Guid _doctor_id)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allAppointments = objUserDC.appointment_lists.Where(x => x.doctor_id == _doctor_id).Where(x => x.available_date >= DateTime.Now).Where(x => x.patient_id != null).Select(x => x);
        return allAppointments;
    }
    //get archived appointment list of one doctor
    public IQueryable<appointment_list> getArchivedAppointmentOfDoc(Guid _doctor_id)
    {
        UsersDataContext objUserDC = new UsersDataContext();
        var allAppointments = objUserDC.appointment_lists.Where(x => x.doctor_id == _doctor_id).Where(x => x.available_date < DateTime.Now).Where(x => x.patient_id != null).Select(x => x);
        return allAppointments;
    }

}

public class DoctorAvailableDate {
   public string available_date {get;set;}
}