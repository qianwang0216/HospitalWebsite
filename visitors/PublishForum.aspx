<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PublishForum.aspx.cs" Inherits="PublishForum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../App_Themes/publishForum.css" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">

<table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td class="style3" 
                    style="font-family:Times New Roman, Arial, Helvetica, sans-serif; font-size: 20px">
                    &nbsp; 
                    <asp:Label ID="Label1" runat="server" Text="Post a new topic"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="center"  class="style2">
                
                    <table border="1" cellpadding="0" cellspacing="0" class="style15">
                        <tr>
                            <td>
                    <!--Post a new topic-->
                    <table cellpadding="0" cellspacing="0" class="style10" 
                        style="font-family:Times New Roman, Arial, Helvetica, sans-serif; font-size: 13px">
                        <tr>
                            <td class="style13" style="text-align: right">
                                Title：</td>
                            <td >
                                <asp:TextBox ID="TextBox1" runat="server" Width="288px" BorderStyle="None" 
                                    Height="22px"></asp:TextBox>
                            </td>
                            <td class="style18" colspan="2">
                                Category：</td>
                            <td class="style14">
                            <!--Choose a category-->
                                <asp:DropDownList ID="DropDownList1" runat="server" Height="16px" Width="91px" 
                                    AutoPostBack="True" 
                                    onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11" style="text-align: right; vertical-align:top">
                                Content：</td>
                            <td class="" colspan="4">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="480px" 
                                    BorderStyle="None" Height="141px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="style11">
                                &nbsp;</td>
                            <td align="right" class="style16" colspan="2">
                                Captcha：<asp:TextBox ID="TextBox3" runat="server" Width="101px"></asp:TextBox>
                                <span>
                                <asp:Image ID="Image2" runat="server" Height="22px" ImageUrl="~/ValidNums.aspx" 
                                    Width="58px" />
                                </span>
                            </td>
                            <td style="text-align: right; width:150px" colspan="2">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Post" 
                                    Width="45px" />
                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Cancel" />
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

