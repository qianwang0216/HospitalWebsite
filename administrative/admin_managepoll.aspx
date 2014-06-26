<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" Debug="true" AutoEventWireup="true" CodeFile="admin_managepoll.aspx.cs" Inherits="administrative_managepoll" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <div>
      <table cellpadding="2" class="style1">
        <tr>
            <td style="width: 25%; text-align: left;">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                <asp:Label ID="lbl_title" runat="server" Text="Title" AssociatedControlID="txt_title" Font-Bold="true" /></td>
            <td>
                <asp:TextBox ID="txt_title" runat="server" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                <asp:Label ID="lbl_desc" runat="server" Text="Description" AssociatedControlID="txt_desc" Font-Bold="true" /></td>
            <td>
                <asp:TextBox ID="txt_desc" runat="server" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                <asp:Label ID="lbl_xdate" runat="server" Text="Expires On" Font-Bold="true"  /></td>
            <td>
                <asp:TextBox ID="txt_xdate" runat="server" Width="40%"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                <asp:Label ID="lbl_slqst" runat="server" Text="Select Questions" Font-Bold="true" /></td>
            <td>
                <table cellpadding="2" class="style1">
                    <tr>
                        <td style="width: 40%;">
                            Source</td>
                        <td style="width: 20%;">
                            &nbsp;</td>
                        <td style="width: 40%;">
                            Target</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            <asp:ListBox ID="lsb_source" runat="server" Rows="6" Width="100%" DataSourceID="LinqDataSource1" DataTextField="Text" DataValueField="Text" OnSelectedIndexChanged="lsb_source_SelectedIndexChanged">
                                <asp:ListItem></asp:ListItem>
                            </asp:ListBox>
                            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="linqSurveyDataContext" EntityTypeName="" GroupBy="Text" OrderGroupsBy="key desc" Select="new (key as Text, it as questions)" TableName="questions">
                            </asp:LinqDataSource>
                        </td>
                        <td class="style3" style="text-align: center;">
                            <asp:Button ID="btnAddAll" runat="server" CausesValidation="False" 
                                onclick="btnAddAll_Click" Text="&gt;&gt;" />
                            <br />
                            <asp:Button ID="btnAddOne" runat="server" CausesValidation="False" 
                                onclick="btnAddOne_Click" Text=" &gt; " />
                            <br />
                            <asp:Button ID="btnRemoveOne" runat="server" CausesValidation="False" 
                                onclick="btnRemoveOne_Click" Text=" &lt; " />
                            <br />
                            <asp:Button ID="btnRemoveAll" runat="server" CausesValidation="False" 
                                onclick="btnRemoveAll_Click" Text="&lt;&lt;" />
                        </td>
                        <td class="style2">
                            <asp:ListBox ID="lsb_target" runat="server" Rows="6" Width="100%" DataSourceID="LinqDataSource2" DataTextField="QuestionID" DataValueField="QuestionID"></asp:ListBox>
                            <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="linqSurveyDataContext" EntityTypeName="" GroupBy="QuestionID" OrderGroupsBy="key desc" Select="new (key as QuestionID, it as surveyquestions)" TableName="surveyquestions">
                            </asp:LinqDataSource>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" onclick="btnSubmit_Click" 
                    Text="Submit" />
                <asp:Button ID="btnCancel" runat="server" CausesValidation="False" 
                    Text="Cancel" />
            </td>
        </tr>
        <tr>
            <td style="width: 25%; text-align: left;">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_footer" Runat="Server">
</asp:Content>

