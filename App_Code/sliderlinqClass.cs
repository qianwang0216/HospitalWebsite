using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for sliderlinqClass
/// </summary>
public class sliderlinqClass
{
	public IQueryable<sliderImage> getSimages()
	{
		//creating an instance of the LINQ object
        sliderLinqDataContext objSimgDC = new sliderLinqDataContext();
        //creating annonymous variable 
        var allSimages = objSimgDC.sliderImages.Select(x => x);
        //return the IQueryable<sliderImage> for binding by databound control
        return allSimages;	
	}
    public IQueryable<sliderImage> getSimageByID(int _id)
    {
        sliderLinqDataContext objSimgDC = new sliderLinqDataContext();
        var allSimages = objSimgDC.sliderImages.Where(x => x.sliderID == _id).Select(x => x);
        return allSimages;
    }
    public bool commitInsert(string _name, int _order, string _text, string _title)
    {
        sliderLinqDataContext objSimgDC = new sliderLinqDataContext();
        //ensuring all data is disposed when finished
        using (objSimgDC)
        {
            //creating a new instance of the table
            sliderImage objNewSI = new sliderImage();
            //setting table columns to new values 
            objNewSI.simageName = _name;
            objNewSI.simageOrder = _order;
            objNewSI.simageText = _text;
            objNewSI.simageTitle = _title;
            //insert command execute
            objSimgDC.sliderImages.InsertOnSubmit(objNewSI);
            //committing against database
            objSimgDC.SubmitChanges();
            return true;
        }
    }
    public bool commitUpdate(int _id, string _name, int _order, string _text, string _title)
    {
        sliderLinqDataContext objSimgDC = new sliderLinqDataContext();
        using (objSimgDC)
        {
            var objUPSI = objSimgDC.sliderImages.Single(x => x.sliderID == _id);
            objUPSI.simageName = _name;
            objUPSI.simageOrder = _order;
            objUPSI.simageText = _text;
            objUPSI.simageTitle = _title;
            //commiting the update command against the database
            objSimgDC.SubmitChanges();
            return true;
        }
    }
    public bool commitDelete(int _id)
    {
        sliderLinqDataContext objSimgDC = new sliderLinqDataContext();
        using (objSimgDC)
        {
            var objDelSI = objSimgDC.sliderImages.Single(x => x.sliderID == _id);
            //delete command
            objSimgDC.sliderImages.DeleteOnSubmit(objDelSI);
            //commit delete against database
            objSimgDC.SubmitChanges();
            return true;
        }
    }


    public object get(int id)
    {
        throw new NotImplementedException();
    }
}