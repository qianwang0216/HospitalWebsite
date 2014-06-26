using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Event Calendar Class
/// </summary>
public class calendarClassLinq
{
    //get the events list
    public IQueryable<event_calendar> getEventsList()
    {
        CalendarDataContext obj = new CalendarDataContext();
        var list = obj.event_calendar.Select(x => x);
        return list;
    }
    //get the events list by event id
    public IQueryable<event_calendar> getEventsListByID(int _id)
    {
        CalendarDataContext obj = new CalendarDataContext();
        var list = obj.event_calendar.Where(x => x.event_id == _id).Select(x => x);
        return list;
    }
    //get the events list by date
    public IQueryable<event_calendar> getEventsListByDate(DateTime _date)
    {
        CalendarDataContext obj = new CalendarDataContext();
        //var list = obj.event_calendar.Where(x => DateTime.Parse(x.date.ToString()).ToString("yyyy-MM-dd") == _date.ToString("yyyy-MM-dd")).Select(x => x);
        var list = obj.event_calendar.Where(x =>x.date == _date).Select(x => x);
        return list;
    }

    //insert new events into database
    public bool commitInsert(string _event_title, string _event_content, DateTime _date, TimeSpan _start_time, TimeSpan _end_time)
    {
        CalendarDataContext objList = new CalendarDataContext();
        using (objList)
        {
            event_calendar obj = new event_calendar();
            obj.event_title = _event_title;
            obj.event_content = _event_content;
            obj.date = Convert.ToDateTime(_date);
            obj.start_time = _start_time;
            obj.end_time = _end_time;
            objList.event_calendar.InsertOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }
    //uodate events
    public bool commitUpdate(int _id, string _event_title, string _event_content, DateTime _date, TimeSpan _start_date, TimeSpan _end_date)
    {
        CalendarDataContext objList = new CalendarDataContext();
        using (objList)
        {
            var obj = objList.event_calendar.Single(x => x.event_id == _id);
            obj.event_title = _event_title;
            obj.event_content = _event_content;
            obj.date = _date;
            obj.start_time = _start_date;
            obj.end_time = _end_date;
            objList.SubmitChanges();
            return true;
        }
    }
    //delete event by id
    public bool commitDelete(int _id)
    {
        CalendarDataContext objList = new CalendarDataContext();
        using (objList)
        {
            var obj = objList.event_calendar.Single(x => x.event_id == _id);
            objList.event_calendar.DeleteOnSubmit(obj);
            objList.SubmitChanges();
            return true;
        }
    }
    

}