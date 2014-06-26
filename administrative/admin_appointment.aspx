<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_appointment.aspx.cs" Inherits="admin_appointment" %>

<asp:Content id="cnt_header" ContentPlaceHolderID="head"  runat="server">
    <link href="../App_Themes/AdminUsers.css" rel="stylesheet" />
    <link href="../App_Themes/Appointment.css" rel="stylesheet" />
    <script src="../scripts/jquery-1.10.2.js"></script>
    <script src="../scripts/ui/jquery-ui.js"></script>
    <link href="../App_Themes/css/smoothness/jquery-ui-1.10.4.custom.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Panel ID="pnl_doctorList" runat="server">
        <asp:Repeater ID="rpt_doctorlist" runat="server">
            <HeaderTemplate>
                <table class="tblDocList">
                    <tr>
                        <th class="tabHead">Doctor Name</th>
                        <th class="tabHead">&nbsp;</th>
                        <th class="tabHead">&nbsp;</th>
                    </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td class="tabContent">
                        <asp:Label ID="lbl_doctorName" runat="server" Text='<%# Eval("FirstName") + " " + Eval("LastName")%>' /> 
                    </td>
                    <td class="tabContent">
                        <asp:LinkButton ID="lkb_viewAppointment" runat="server" Text="View appointments" CommandArgument='<%# Eval("UserId")%>' CommandName="ViewAppointment" OnCommand="subAdmin" />
                    </td>
                    <td class="tabContent">
                        <asp:LinkButton ID="lkb_viewTimeSlot" runat="server" Text="Time slots" CommandArgument='<%# Eval("UserId")%>'  CommandName="ViewTimeslot" OnCommand="subAdmin"  />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>
    <asp:Panel ID="pnl_appointments" runat="server" Visible="false">
        <br />
        <asp:Label ID="lbl_docappointment" runat="server" />
        <br />
        <br />
        <div id="menutab">
        <asp:Menu ID="mnu_appointment" runat="server" StaticDisplayLevels="1" Orientation="Horizontal" OnMenuItemClick="mnu_appointment_MenuItemClick">
            <Items>
                <asp:MenuItem Text="Active" Selected="true" />
                <asp:MenuItem Text="Archived" />
            </Items>
            <StaticMenuItemStyle HorizontalPadding="10px" VerticalPadding="10px" />
        </asp:Menu>
        </div>
        <asp:MultiView ID="mtv_docappointment" runat="server" ActiveViewIndex="0">
            <asp:View ID="vw_docactiveappointment" runat="server">
                <asp:Repeater ID="rpt_activeappointmentlist" runat="server">
                    <HeaderTemplate>
                        <table class="tblAppointment">
                            <tr>
                                <th class="tblth">Patient Name</th>
                                <th class="tblth">Email</th>
                                <th class="tblth">Phone</th>
                                <th class="tblth">Date</th>
                                <th class="tblth">Time</th>
                                <th class="tblth">&nbsp;</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td><%# Eval("PatientFirstName") + " " + Eval("PatientLastName") %></td>
                                <td><%# Eval("Email") %></td>
                                <td><%# Eval("Phone") %></td>
                                <td><%# (DateTime.Parse(Eval("available_date").ToString())).ToString("MMMM dd, yyyy") %></td>
                                <td><%# (DateTime.Parse(Eval("available_starttime").ToString())).ToString("HH:mm") + " - " + (DateTime.Parse(Eval("available_endtime").ToString())).ToString("HH:mm") %></td>
                                <td><asp:LinkButton ID="lkb_docappintmentcancelappointment" runat="server" Text="Cancel Appointment" OnCommand="lkb_docappintmentcancelappointment_Command" CommandArgument='<%# Eval("appointment_id") %>' OnClientClick="return confirm('Confirm cancel?');" /></td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:View>
            <asp:View ID="vw_docarchivedappointment" runat="server">
                <asp:Repeater ID="rpt_archiveappointmentlist" runat="server">
                    <HeaderTemplate>
                        <table class="tblAppointment">
                            <tr>
                                <th class="tblth">Patient Name</th>
                                <th class="tblth">Email</th>
                                <th class="tblth">Phone</th>
                                <th class="tblth">Date</th>
                                <th class="tblth">Time</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                            <tr>
                                <td><%# Eval("PatientFirstName") + " " + Eval("PatientLastName") %></td>
                                <td><%# Eval("Email") %></td>
                                <td><%# Eval("Phone") %></td>
                                <td><%# (DateTime.Parse(Eval("available_date").ToString())).ToString("MMMM dd, yyyy") %></td>
                                <td><%# (DateTime.Parse(Eval("available_starttime").ToString())).ToString("HH:mm") + " - " + (DateTime.Parse(Eval("available_endtime").ToString())).ToString("HH:mm") %></td>
                            </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </asp:View>
        </asp:MultiView>
        <br />
        <asp:LinkButton ID="lkb_backtodoclist1" runat="server" OnClick="lkb_backtodoclist_Click" Text="Back" />
    </asp:Panel>
    <asp:Panel ID="pnl_timeslot" runat="server" Visible="false">
        <br />
        <asp:Label ID="lbl_doctimeslot" runat="server" />
        <br />
        <table class="tblDocTimeslot">
            <tr>
                <td>Date:</td>
                <td><asp:DropDownList ID="ddl_docavailable_date" runat="server" OnSelectedIndexChanged="ddl_docavailable_date_SelectedIndexChanged" AutoPostBack="true" /><asp:Button ID="btn_addtimeslot" runat="server" Text="Add new available time slot" OnClick="btn_addtimeslot_Click" /></td>
            </tr>
            <tr>
                <td>
                    Time slots:
                </td>
                <td>
                    <asp:Repeater ID="rpt_doctimeslotlist" runat="server">
                        <HeaderTemplate>
                            <table>
                                <tr>
                                    <th class="tblth">Time</th>
                                    <th class="tblth">Book Status</th>
                                    <th class="tblth">Patient Name</th>
                                    <th class="tblth">Action</th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><asp:Label ID="lbl_doctimeslottime" runat="server"  Text='<%# (DateTime.Parse(Eval("available_starttime").ToString())).ToString("HH:mm") + " - " + (DateTime.Parse(Eval("available_endtime").ToString())).ToString("HH:mm") %>' /></td>
                                <td><asp:Label ID="lbl_doctimeslotstatus" runat="server" Text='<%# (Eval("book_status").ToString() == "True") ? "Booked" : "Available" %>' /></td>
                                <td><asp:Label ID="lbl_doctimeslotpatientname" runat="server" Text='<%# Eval("PatientFirstName") + " " + Eval("PatientLastName") %>'  /></td>
                                <td><asp:LinkButton ID="lkb_doctimeslotcancelappointment" runat="server" Text="Cancel Appointment" Visible='<%# (Eval("book_status").ToString() == "True") ? true : false %>' OnCommand="lkb_doctimeslotcancelappointment_Command" CommandArgument='<%# Eval("appointment_id") %>'  OnClientClick="return confirm('Confirm cancel?');" />
                                    <asp:LinkButton ID="lkb_removetimeslot" runat="server" Text="Remove" Visible='<%# (Eval("book_status").ToString() == "True") ? false : true %>' OnCommand="lkb_removetimeslot_Command" CommandArgument='<%# Eval("appointment_id") %>'  OnClientClick="return confirm('Confirm remove?');" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="lkb_backtodoclist2" runat="server" OnClick="lkb_backtodoclist_Click" Text="Back" />
    </asp:Panel>
    <asp:Panel ID="pnl_addtimeslot" runat="server" Visible="false">
        <%-- The custom validators below are not working because they are in a visible=false panel. This is a bug of .NET and I cannot find a way to make it work. --%>
        <asp:Label ID="lbl_docaddtimeslot" runat="server" />
        <br />
        <table>
            <tr>
                <td>
                    Date:
                </td>
                <td>
                    <asp:TextBox ID="txt_timeslotdate" runat="server" CssClass="datepicker" />
                    <asp:RequiredFieldValidator ID="rfv_timeslotdate" runat="server" ControlToValidate="txt_timeslotdate" Text="*Required" CssClass="validatefail" SetFocusOnError="true" Display="Dynamic" ValidationGroup="addtimeslot" />
                    <asp:CompareValidator ID="cpv_timeslotdate" runat="server" ControlToValidate="txt_timeslotdate" Operator="DataTypeCheck" Type="Date" Text="Invalid date" CssClass="validatefail" SetFocusOnError="true" Display="Dynamic" ValidationGroup="addtimeslot" />
                    <asp:CustomValidator ID="ctv_timeslotdate" runat="server" ControlToValidate="txt_timeslotdate" OnServerValidate="ctv_timeslotdate_ServerValidate" Text="Cannot be a date earlier than today" CssClass="validatefail" Display="Dynamic" ValidationGroup="addtimeslot" />
                </td>
            </tr>
            <tr>
                <td>
                    Start time:
                </td>
                <td>
                    <asp:DropDownList ID="ddl_starttime" runat="server">
                        <asp:ListItem Text="00:00" Value="00:00" />
                        <asp:ListItem Text="00:30" Value="00:30" />
                        <asp:ListItem Text="01:00" Value="01:00" />
                        <asp:ListItem Text="01:30" Value="01:30" />
                        <asp:ListItem Text="02:00" Value="02:00" />
                        <asp:ListItem Text="02:30" Value="02:30" />
                        <asp:ListItem Text="03:00" Value="03:00" />
                        <asp:ListItem Text="03:30" Value="03:30" />
                        <asp:ListItem Text="04:00" Value="04:00" />
                        <asp:ListItem Text="04:30" Value="04:30" />
                        <asp:ListItem Text="05:00" Value="05:00" />
                        <asp:ListItem Text="05:30" Value="05:30" />
                        <asp:ListItem Text="06:00" Value="06:00" />
                        <asp:ListItem Text="06:30" Value="06:30" />
                        <asp:ListItem Text="07:00" Value="07:00" />
                        <asp:ListItem Text="07:30" Value="07:30" />
                        <asp:ListItem Text="08:00" Value="08:00" />
                        <asp:ListItem Text="08:30" Value="08:30" />
                        <asp:ListItem Text="09:00" Value="09:00" Selected="True" />
                        <asp:ListItem Text="09:30" Value="09:30" />
                        <asp:ListItem Text="10:00" Value="10:00" />
                        <asp:ListItem Text="10:30" Value="10:30" />
                        <asp:ListItem Text="11:00" Value="11:00" />
                        <asp:ListItem Text="11:30" Value="11:30" />
                        <asp:ListItem Text="12:00" Value="12:00" />
                        <asp:ListItem Text="12:30" Value="12:30" />
                        <asp:ListItem Text="13:00" Value="13:00" />
                        <asp:ListItem Text="13:30" Value="13:30" />
                        <asp:ListItem Text="14:00" Value="14:00" />
                        <asp:ListItem Text="14:30" Value="14:30" />
                        <asp:ListItem Text="15:00" Value="15:00" />
                        <asp:ListItem Text="15:30" Value="15:30" />
                        <asp:ListItem Text="16:00" Value="16:00" />
                        <asp:ListItem Text="16:30" Value="16:30" />
                        <asp:ListItem Text="17:00" Value="17:00" />
                        <asp:ListItem Text="17:30" Value="17:30" />
                        <asp:ListItem Text="18:00" Value="18:00" />
                        <asp:ListItem Text="18:30" Value="18:30" />
                        <asp:ListItem Text="19:00" Value="19:00" />
                        <asp:ListItem Text="19:30" Value="19:30" />
                        <asp:ListItem Text="20:00" Value="20:00" />
                        <asp:ListItem Text="20:30" Value="20:30" />
                        <asp:ListItem Text="21:00" Value="21:00" />
                        <asp:ListItem Text="21:30" Value="21:30" />
                        <asp:ListItem Text="22:00" Value="22:00" />
                        <asp:ListItem Text="22:30" Value="22:30" />
                        <asp:ListItem Text="23:00" Value="23:00" />
                        <asp:ListItem Text="23:30" Value="23:30" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    End time:
                </td>
                <td>
                    <asp:DropDownList ID="ddl_endtime" runat="server" CausesValidation="true">
                        <asp:ListItem Text="00:30" Value="00:30" />
                        <asp:ListItem Text="01:00" Value="01:00" />
                        <asp:ListItem Text="01:30" Value="01:30" />
                        <asp:ListItem Text="02:00" Value="02:00" />
                        <asp:ListItem Text="02:30" Value="02:30" />
                        <asp:ListItem Text="03:00" Value="03:00" />
                        <asp:ListItem Text="03:30" Value="03:30" />
                        <asp:ListItem Text="04:00" Value="04:00" />
                        <asp:ListItem Text="04:30" Value="04:30" />
                        <asp:ListItem Text="05:00" Value="05:00" />
                        <asp:ListItem Text="05:30" Value="05:30" />
                        <asp:ListItem Text="06:00" Value="06:00" />
                        <asp:ListItem Text="06:30" Value="06:30" />
                        <asp:ListItem Text="07:00" Value="07:00" />
                        <asp:ListItem Text="07:30" Value="07:30" />
                        <asp:ListItem Text="08:00" Value="08:00" />
                        <asp:ListItem Text="08:30" Value="08:30" />
                        <asp:ListItem Text="09:00" Value="09:00" />
                        <asp:ListItem Text="09:30" Value="09:30" Selected="True" />
                        <asp:ListItem Text="10:00" Value="10:00" />
                        <asp:ListItem Text="10:30" Value="10:30" />
                        <asp:ListItem Text="11:00" Value="11:00" />
                        <asp:ListItem Text="11:30" Value="11:30" />
                        <asp:ListItem Text="12:00" Value="12:00" />
                        <asp:ListItem Text="12:30" Value="12:30" />
                        <asp:ListItem Text="13:00" Value="13:00" />
                        <asp:ListItem Text="13:30" Value="13:30" />
                        <asp:ListItem Text="14:00" Value="14:00" />
                        <asp:ListItem Text="14:30" Value="14:30" />
                        <asp:ListItem Text="15:00" Value="15:00" />
                        <asp:ListItem Text="15:30" Value="15:30" />
                        <asp:ListItem Text="16:00" Value="16:00" />
                        <asp:ListItem Text="16:30" Value="16:30" />
                        <asp:ListItem Text="17:00" Value="17:00" />
                        <asp:ListItem Text="17:30" Value="17:30" />
                        <asp:ListItem Text="18:00" Value="18:00" />
                        <asp:ListItem Text="18:30" Value="18:30" />
                        <asp:ListItem Text="19:00" Value="19:00" />
                        <asp:ListItem Text="19:30" Value="19:30" />
                        <asp:ListItem Text="20:00" Value="20:00" />
                        <asp:ListItem Text="20:30" Value="20:30" />
                        <asp:ListItem Text="21:00" Value="21:00" />
                        <asp:ListItem Text="21:30" Value="21:30" />
                        <asp:ListItem Text="22:00" Value="22:00" />
                        <asp:ListItem Text="22:30" Value="22:30" />
                        <asp:ListItem Text="23:00" Value="23:00" />
                        <asp:ListItem Text="23:30" Value="23:30" />
                        <asp:ListItem Text="24:00" Value="24:00" />
                    </asp:DropDownList>
                    <asp:CustomValidator ID="ctv_endtime" runat="server" Display="Dynamic" Text="End time must be later than start time" ControlToValidate="ddl_endtime" SetFocusOnError="true" OnServerValidate="ctv_endtime_ServerValidate" CssClass="validatefail" ValidationGroup="addtimeslot" />
                </td>
            </tr>
            <tr>
                <td colspan="2"><asp:Button ID="btn_savetimeslot" runat="server" Text="Submit" OnClick="btn_savetimeslot_Click"  ValidationGroup="addtimeslot" /> <asp:Button ID="btn_cancelsave" runat="server" Text="Cancel" OnClick="btn_cancelsave_Click" CausesValidation="false" /></td>
            </tr>
        </table>
    </asp:Panel>
<script>
    $(function () {
        $(".datepicker").datepicker({
            dateFormat: "mm/dd/yy",
            buttonImageOnly: true,
            buttonImage: "../scripts/themes/base/images/calendar.gif",
            buttonText: "",
            showOn: "button",
            minDate: new Date()
        });
    });
</script>    
</asp:Content>


