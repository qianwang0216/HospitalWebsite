<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forumInfos.aspx.cs" Inherits="forumInfos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../App_Themes/forumInfo.css" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td style="text-align: center">
                    <table border="1" cellpadding="0" cellspacing="0" class="style2">
                        <tr>
                            <td style=" height:100px; font-family: Times New Roman, Arial, Helvetica, sans-serif; font-size: 15px;">
                                <h2>Message Board</h2></td>
                        </tr>
                        <tr>
                            <td class="style3">
                                <table cellpadding="0" cellspacing="0" class="style4">
                                    <tr>
                                        <td class="style7" style="font-family:Times New Roman, Arial, Helvetica, sans-serif; font-size: 15px">
                                            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">Post a new topic</asp:LinkButton>                     
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>
                        <!--Display the topic list-->
                            <td class="style3">
                                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                                    AllowSorting="True" AutoGenerateColumns="False" Font-Size="11pt" 
                                    onpageindexchanging="GridView1_PageIndexChanging"  
                                    onselectedindexchanging="GridView1_SelectedIndexChanging" PageSize="18" 
                                    style="text-align: center" Width="745px" BackColor="White" 
                                    BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                    Font-Strikeout="False" GridLines="Horizontal">
                                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                                    <Columns>
                                        <asp:BoundField DataField="id" HeaderText="Id" />
                                        <asp:BoundField DataField="title" HeaderText="Title" SortExpression="title" />
                                        <asp:BoundField DataField="forum_style" HeaderText="Category" SortExpression="forum_style" />
                                        <asp:BoundField DataField="FirstName" HeaderText="Author" SortExpression="FirstName" />
                                        <asp:BoundField DataField="dates" HeaderText="Date" SortExpression="dates" />
                                        <asp:BoundField DataField="hf_nums" HeaderText="Replies" SortExpression="hf_nums" />
                                        <asp:CommandField HeaderText="Detailed Information" ShowCancelButton="False" ShowHeader="True"
                                            ShowSelectButton="True" SelectText="View" >
                                            <ControlStyle ForeColor="Blue" />
                                        </asp:CommandField>
                                    </Columns>
                                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                    <AlternatingRowStyle BackColor="#F7F7F7" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Content>


