using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cuw_main_CreatedUser(object sender, EventArgs e)
    {
        //Add the user to the role "Registered User"
        Roles.AddUserToRole((sender as CreateUserWizard).UserName, "Registered User");
        
        //Save the additional information 
        Guid _userId = (Guid)Membership.GetUser((sender as CreateUserWizard).UserName).ProviderUserKey;
        string _firstName = txt_firstName.Text.ToString();
        string _lastName = txt_lastName.Text.ToString();
        string _phone = txt_phone.Text.ToString();

        linqUsers objUsers = new linqUsers();
        objUsers.insertUserAdditionalInfo(_userId, _firstName, _lastName, _phone);

    }
}