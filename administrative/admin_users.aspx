<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_users.aspx.cs" Inherits="admin_users" %>
<asp:Content id="cnt_header" ContentPlaceHolderID="head"  runat="server">
    <link href="../App_Themes/AdminUsers.css" rel="stylesheet" />
    <link href="../App_Themes/Appointment.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">

    <div id="menutab">
        <asp:Menu ID="mnu_users" runat="server" StaticDisplayLevels="1" Orientation="Horizontal" OnMenuItemClick="mnu_users_MenuItemClick">
            <Items>
                <asp:MenuItem Text="Doctors" Selected="true" />
                <asp:MenuItem Text="Registered Users" />
            </Items>
            <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="10px" />
        </asp:Menu>
    </div>
    <asp:MultiView ID="mtv_users" runat="server" ActiveViewIndex="0">
        <asp:View ID="vw_doctors" runat="server">
                <asp:Repeater ID="rpt_doctors" runat="server">
                    <HeaderTemplate>
                        <table Width="100%"  class="tblAppointment">
                            <tr>
                                <th class="tblth">First Name</th>
                                <th class="tblth">Last Name</th>
                                <th class="tblth">Email</th>
                                <th class="tblth">Phone</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td class="tabContent"><%#Eval("FirstName") %></td>
                                <td class="tabContent"><%#Eval("LastName") %></td>
                                <td class="tabContent"><%#Eval("Email") %></td>
                                <td class="tabContent"><%#Eval("Phone") %></td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
        </asp:View>
        <asp:View ID="vw_registeredUsers" runat="server">
                <asp:Repeater ID="rpt_registeredUsers" runat="server">
                    <HeaderTemplate>
                        <table  Width="100%"  class="tblAppointment">
                            <tr>
                                <th class="tblth">First Name</th>
                                <th class="tblth">Last Name</th>
                                <th class="tblth">Email</th>
                                <th class="tblth">Phone</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td class="tabContent"><%#Eval("FirstName") %></td>
                                <td class="tabContent"><%#Eval("LastName") %></td>
                                <td class="tabContent"><%#Eval("Email") %></td>
                                <td class="tabContent"><%#Eval("Phone") %></td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
        </asp:View>
    </asp:MultiView>
    <br />
    <br />

    <asp:Panel ID="pnl_create_doctor" runat="server" GroupingText="Add a new doctor">
    <asp:CreateUserWizard ID="cuw_main" runat="server" OnCreatedUser="cuw_main_CreatedUser" NavigationButtonStyle-CssClass="centeralign" ContinueDestinationPageUrl="~/administrative/admin_users.aspx" LoginCreatedUser="false" >
        <WizardSteps>
            <asp:WizardStep>
                
                <table border="0" style="font-size: 100%; font-family: Verdana" id="TABLE1" >
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_firstName" runat="server" AssociatedControlID="txt_firstName" Text="First Name: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_firstName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_firstName" runat="server" ControlToValidate="txt_firstName" Text="*" Display="Dynamic" CssClass="validatefail" />
                        </td>
                    </tr>
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_lastName" runat="server" AssociatedControlID="txt_lastName" Text="Last Name: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_lastName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_lastName" runat="server" ControlToValidate="txt_LastName" Text="*" Display="Dynamic" CssClass="validatefail" />
                        </td>
                    </tr>
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_phone" runat="server" AssociatedControlID="txt_phone" Text="Phone: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_phone" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_phone" runat="server" ControlToValidate="txt_phone" Text="*" Display="Dynamic" CssClass="validatefail" />
                            <br /><asp:RegularExpressionValidator ID="rev_phone" runat="server" ControlToValidate="txt_phone" Text="Invalid phone number" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" CssClass="validatefail" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:CreateUserWizardStep Title="">
                <CustomNavigationTemplate>
                  <table>
                      <tr>
                        <td>
                          <asp:Button ID="StepPreviousButton" runat="server" 
                                         CommandName="MovePrevious" Text="Previous" CausesValidation="false" />
                          <asp:Button ID="StepNextButton" runat="server" 
                                         CommandName="MoveNext" Text="Create User"
                                         ValidationGroup="CreateUserWizard1" />
                        </td>
                      </tr>
                  </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
    </asp:Panel>

</asp:Content>

