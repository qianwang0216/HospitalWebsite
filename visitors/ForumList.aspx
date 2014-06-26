<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForumList.aspx.cs" Inherits="ForumList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../App_Themes/ForumList.css" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td align ="center">
                <table cellpadding="0" cellspacing="0" class="style10" style="font-family:Times New Roman, Arial, Helvetica, sans-serif; font-size: 13px">
                    <tr>
                        <td class="style19" style="text-align:left">
                           Message Board Topics List</td>
                    </tr>
                    <tr>
                        <td class="style12" style="text-align:center">
                            <table cellpadding="0" cellspacing="0" class="style30">
                                <tr>
                                    <td align ="center"  colspan="2">
                                        <table cellpadding="0" cellspacing="0" class="style29 manage_lines1" bgcolor="#3366FF">
                                <tr>
                                    <td align ="left" style="font-weight:bold; color:White">
                                        &nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="11pt" ForeColor="White" Text='' />
                                    </td>
                                    <td style="font-weight:bold; color:White; width:150px">
                                        <asp:Label ID="Label1" runat="server" Text='Reply ' />
                                        <asp:Label ID="Label8" runat="server" Text='' />
                                        <asp:Label ID="Label10" runat="server" Text=' time' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <!--Bind the tb_Sub_View using Datalist-->
                            <asp:DataList ID="DataList1" runat="server" Width="559px">
                                <ItemTemplate>
                                    <table cellpadding="0" cellspacing="0" class="style13">
                                        <tr>
                                            <td style =" width:145px" class=" manage_lines1">
                                                <asp:Label ID="Label12" runat="server" Text='User：'></asp:Label>
                                                <asp:Label ID="Label2" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FirstName") %>' />
                                            </td>
                                            <td style="width:420px" align ="left" class="style16 manage_lines5">&nbsp;
                                                <asp:Label ID="Label5" runat="server" Text='Published at：' />
                                                <asp:Label ID="Label3" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"dates")%>' />
                                            </td>
                                        </tr>
                                        <tr>
                                        <!--user images-->
                                        <td style =" width:145px; vertical-align:middle" class=" manage_lines2">
                                                <asp:Image ID="Image1" runat="server" Height="60px" Width="60px" ImageUrl="~/images/userIcon.gif" />
                                        </td>
                                            <td align ="left" valign ="top" class="manage_lines3">&nbsp;
                                                <table cellpadding="0" cellspacing="0" class="style23">
                                                    <tr>
                                                        <td valign ="top" class="style28">&nbsp;
                                                            <asp:Label ID="Label4" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"title")%>' />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="style27" valign="top">&nbsp;&nbsp;
                                                            <asp:Label ID="Label6" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"contents")%>' />&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" >
                                                            <asp:Button ID="Button3" runat="server" Text="Reply" Width="70px" onclick="Button3_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
        <td class="style12" style="text-align: center">
            <!--Reply to the topic-->
            <table border="1" cellpadding="0" cellspacing="0" class="style15">
                <tr>
                    <td class ="manage_lines2">
                        <table cellpadding="0" cellspacing="0" class="style10" style="font-family:Times New Roman, Arial, Helvetica, sans-serif; font-size: 13px">
                            <tr><td>&nbsp;</td></tr>
                            <tr>
                                <td class="style20" style="text-align: right">Title：</td>
                                <td class="style21" colspan="2" >
                                    <asp:TextBox ID="TextBox4" runat="server" Width="470px" Height="21px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style11" style="text-align: right; vertical-align:top">Content：</td>
                                <td class="" colspan="2">
                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="471px" BorderStyle="Solid" Height="141px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style11">&nbsp;</td>
                                <td align="right" class="style16">Captcha：
                                    <asp:TextBox ID="TextBox3" runat="server" Width="101px" />
                                    <span>
                                        <asp:Image ID="Image2" runat="server" Height="22px" ImageUrl="~/ValidNums.aspx" Width="58px" />
                                    </span>
                                </td>
                                <td style="text-align: right; width:150px">
                                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Post" Width="54px" />
                                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cancel" Width="52px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </table>
            </td>
            </tr>
            </table>
                
            </td>
            </tr>
        </table>
</asp:Content>


