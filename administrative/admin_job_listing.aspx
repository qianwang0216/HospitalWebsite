<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_job_listing.aspx.cs" Inherits="admin_job_listing" %>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_content" Runat="Server">
     <h2>Job List Management</h2>
        <asp:Label ID="lbl" runat="server" Text="Insert a new job" />
        <br /><br />
        <table border="1">
            <tr>
                <td><asp:Label ID="lbl_job_titleI" runat="server" Text="Job Title:" /></td>
                <td>
                    <asp:TextBox ID="txt_job_titleI" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_job_titleI" runat="server" Text="*Required" ControlToValidate="txt_job_titleI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lbl_job_typeI" runat="server" Text="Job Type: " /></td>
                <td>
                    <asp:DropDownList ID="ddl_job_typeI" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top"><asp:Label ID="lbl_job_descriptionI" runat="server" Text="Description: " /></td>
                <td>
                    <asp:TextBox ID="txt_job_descriptionI" runat="server" TextMode="MultiLine" Wrap="true" Rows="3" />
                    <asp:RequiredFieldValidator ID="rfv_job_descriptionI" runat="server" Text="*Required" ControlToValidate="txt_job_descriptionI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
            <tr>
                <td style="vertical-align:top"><asp:Label ID="lbl_requirementsI" runat="server" Text="Requirements: " /></td>
                <td>
                    <asp:TextBox ID="txt_requirementsI" runat="server" TextMode="MultiLine" Wrap="true" Rows="3" />
                    <asp:RequiredFieldValidator ID="rfv_requirementsI" runat="server" Text="*Required" ControlToValidate="txt_requirementsI" ValidationGroup="insert" SetFocusOnError="true" />
                </td>
            </tr>
        </table>
        <asp:Button ID="btn_insert" runat="server" Text="Insert" OnCommand="subAdmin" CommandName="Insert" ValidationGroup="insert" />
        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" OnCommand="subAdmin" CommandName="Cancel" />
        <br />
        <asp:Label ID="lbl_message" runat="server" />
        <br /><br /><br />
        <!--Bind the job data using DataList-->
            <asp:DataList ID="dtl_all" runat="server" OnItemCommand="subUpDel" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Table">
                <HeaderTemplate>
                    <table border="1" style="border:1px solid #80c2a9">
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>Job Title: </td>
                        <td>
                            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Bind("Id") %>' />
                            <asp:TextBox ID="txt_job_titleE" runat="server" Text='<%#Bind("job_title") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Job Type: </td>
                        <td>
                            <asp:TextBox ID="txt_job_typeE" runat="server" Text='<%#Bind("job_type") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">Job Description: </td>
                        <td>
                            <asp:TextBox ID="txt_job_descriptionE" runat="server" Text='<%#Bind("job_description") %>' TextMode="MultiLine" Wrap="true" Rows="3" style="text-align:left" />
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align:top">Requirements/Skills: </td>
                        <td>
                            <asp:TextBox ID="txt_requirementsE" runat="server" Text='<%#Bind("requirements") %>' TextMode="MultiLine" Wrap="true" Rows="3" style="text-align:left" />
                        </td>
                    </tr>
                    <tr>
                        <td>Publish Date: </td>
                        <td>
                            <asp:TextBox ID="txt_publish_dateE" runat="server" Text='<%#Bind("publish_date") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                            <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                            <asp:Button ID="Button1" runat="server" Text="Cancel" CommandName="Cancel" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                     </table>
                </FooterTemplate>
            </asp:DataList>
        
       

</asp:Content>


