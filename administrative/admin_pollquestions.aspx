<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_pollquestions.aspx.cs" Inherits="administrative_pollquestions" %>




<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    
    <div>
        <asp:Label ID="lbl_msg" runat="server"></asp:Label>
        <br />
    
        <table cellpadding="2" class="style1">
            <tr>
                <td style="width: 25%; text-align: left;">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    Question Type
                    <asp:Label ID="lbl_qtype" runat="server" Text="Question Type" AssociatedControlID="ddl_qtype" /></td>
                <td>
                    <asp:DropDownList ID="ddl_qtype" runat="server" Width="41%" AutoPostBack="true" OnSelectedIndexChanged="ddl_qtype_SelectedIndexChanged">
                        <asp:ListItem Value="1" Text="SingleLineTextBox" />
                        <asp:ListItem Value="2" Text="MultiLineTextBox" />
                        <asp:ListItem Value="3" Text="YesOrNo" />
                        <asp:ListItem Value="4" Text="SingleSelect" />
                        <asp:ListItem Value="5" Text="MultiSelect" />
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    <asp:Label ID="lbl_desc" runat="server" Text="Description" AssociatedControlID="txt_desc" Font-Bold="true" /></td>
                <td>
                    <asp:TextBox ID="txt_desc" runat="server" Rows="3" TextMode="MultiLine" 
                        Width="40%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    <asp:Label ID="lbl_values" runat="server" Text="Values" AssociatedControlID="txt_values" Font-Bold="true" /></td>
                <td>
                    <asp:TextBox ID="txt_values" runat="server" Rows="3" TextMode="MultiLine" 
                        Width="40%"></asp:TextBox>
                    (Enter values as comma seperated)</td>
            </tr>
            <tr>
                <td style="width: 25%; text-align: left;">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSubmit" runat="server" Text="Insert" CommandName="Insert"
                     OnCommand="btnSubmit_Click"  />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                        Text="Cancel" />
                </td>
            </tr>
        </table>
    
    </div>



</asp:Content>


