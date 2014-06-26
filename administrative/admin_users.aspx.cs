using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class admin_users : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
        }
    }

    private void _subRebind()
    {
        linqUsers objUsers = new linqUsers();
        var allRegisteredUsers = objUsers.getAllRegisteredUsers();
        rpt_registeredUsers.DataSource = allRegisteredUsers;
        rpt_registeredUsers.DataBind();

        var allDoctors = objUsers.getAllDoctors();
        rpt_doctors.DataSource = allDoctors;
        rpt_doctors.DataBind();
    }

    protected void cuw_main_CreatedUser(object sender, EventArgs e)
    {
        //Add the user to the role "Registered User"
        Roles.AddUserToRole((sender as CreateUserWizard).UserName, "Doctor");

        //Save the additional information 
        Guid _userId = (Guid)Membership.GetUser((sender as CreateUserWizard).UserName).ProviderUserKey;
        string _firstName = txt_firstName.Text.ToString();
        string _lastName = txt_lastName.Text.ToString();
        string _phone = txt_phone.Text.ToString();

        linqUsers objUsers = new linqUsers();
        objUsers.insertUserAdditionalInfo(_userId, _firstName, _lastName, _phone);

        _subRebind();

    }

    //switch the users tab
    protected void mnu_users_MenuItemClick(object sender, MenuEventArgs e)
    {
        if (e.Item.Text == "Doctors")
        {
            mtv_users.ActiveViewIndex = 0;
        }
        else
        {
            mtv_users.ActiveViewIndex = 1;
        }
    }
}