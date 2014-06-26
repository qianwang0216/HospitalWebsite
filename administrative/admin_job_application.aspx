<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_job_application.aspx.cs" Inherits="administrative_admin_job_application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../App_Themes/job_applications.css" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <h2>Job Applications Management</h2>
    <div style="width:800px">   
            <asp:Repeater ID="rpt_main" runat="server">
                <HeaderTemplate>
                    <table id="Tab" class="Rep_tab">
                        <tr>
                            <th style="width:120px">
                            <asp:Label ID="lbl_ID" runat="server" Text="ID" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_fname" runat="server" Text="First Name" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_lname" runat="server" Text="Last Name" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_email" runat="server" Text="Email" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_phone" runat="server" Text="Phone Number" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_city" runat="server" Text="City" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_job_type" runat="server" Text="Job Name" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_way_find_us" runat="server" Text="Way to find us" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_recieveInfo" runat="server" Text="Recieve Info" />
                        </th>
                        <th style="width:120px">
                            <asp:Label ID="lbl_resume" runat="server" Text="Resume" />
                        </th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%#Eval("Id") %></td>
                            <td><%#Eval("firstname") %></td>
                            <td><%#Eval("lastname") %></td>
                            <td><%#Eval("email") %></td>
                            <td><%#Eval("phone") %></td>
                            <td><%#Eval("city") %></td>
                            <td><%#Eval("job_type") %></td>
                            <td><%#Eval("way_find_us") %></td>
                            <td><%#Eval("recieveInfo") %></td>
                            <td><asp:LinkButton ID="lkb_select" runat="server" Text="Download Resume" CommandArgument='<%#Eval("Id") %>' OnCommand="Button1_Click" /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
        </div>
        <br />

</asp:Content>
