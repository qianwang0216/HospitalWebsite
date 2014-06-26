<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="calendar.aspx.cs" Inherits="visitors_calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
<center><h2>Event Calendar</h2></center>
<br />
    <!--Calendar-->
    <div style="text-align:center">
        <table  border="1" cellpadding="3" cellspacing="0" style="width: 60%;margin:auto">
            <td align="center">
                <asp:Calendar ID="Calendar1" runat="server" Width="330px" Height="230px" ondayrender="MyDayRenderer" OnSelectionChanged="Calender1_SelectionChanged" />
            </td>
        </table>
    </div>
        <br />
        <!--Display the event list-->
        <center>
        <div id="myGridview">
                <asp:GridView ID="grv_main" runat="server" BorderStyle="Solid" AllowSorting="True" DataKeyNames="event_id" AutoGenerateColumns="False" CellPadding="4">
                    <RowStyle Font-Size="12px" Height="17px" ForeColor="#333333" BackColor="White" BorderWidth="1" BorderStyle="Solid" BorderColor="Gray" />
                    <HeaderStyle  Font-Size="12px"  Height="20px" ForeColor="White" BackColor="#969696" BorderWidth="1" BorderStyle="Solid" BorderColor="Gray" HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="Event Name">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("event_title") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("event_content") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("date").ToString().Substring(0,9) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap= "False " /> 
                            <ItemStyle HorizontalAlign= "Center" /> 
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Start Time">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("start_time") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap= "False " /> 
                            <ItemStyle HorizontalAlign= "Center" /> 
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="End Time">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("end_time") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Wrap= "False " /> 
                            <ItemStyle HorizontalAlign= "Center" /> 
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>   
            </div>
            </center>
    </div>
</asp:Content>


