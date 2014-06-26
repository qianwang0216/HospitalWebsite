<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_rssfeed.aspx.cs" Inherits="admin_rssfeed" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="../App_Themes/Theme/RssStyleSheet.css" type="text/css" media="screen" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">

         <%-- Show the messagebased on Insert/ Edit and Delete the databases --%>
        <div class="lbl_msg">
            <asp:Label ID="lbl_txtMsg" runat="server" />
        </div>

        <%-- create table for insert section --%>
        <div class="fieldsetRss_admin">
            <fieldset>
                <legend>Insert RSS Field</legend>
                <div class="contentRss_admin">
                    <table>
                        <tr class="row_header">
                            <th><asp:Label ID="lbl_rssTitleI" runat="server" Text="Title of RSS Feed" /></th>
                            <th><asp:Label ID="lbl_rssUrlI" runat="server" Text="Url of XML File" /></th>
                            <th><asp:Label ID="lbl_rssOperationI" runat="server" Text="Operation" /></th>
                        </tr>
                        <tr>

                            <td>
                                <%-- Title Textbox with validation and pattern --%>
                                <asp:TextBox ID="txt_rssTitleI" runat="server" />
                                <asp:RequiredFieldValidator ID="rfv_rssTitleI" runat="server" ControlToValidate="txt_rssTitleI" ValidationGroup="val_insert"
                                    Text="<span style=color:red;>*Title of RSS required</span>" Display="Dynamic" ErrorMessage="Should be less than 50 characters" />
                            </td>

                            <td>
                                <%-- Url Textbox with validation and pattern --%>
                                <asp:TextBox ID="txt_rssUrlI" runat="server" />
                                <asp:RequiredFieldValidator ID="rfv_rssUrlI" runat="server" ControlToValidate="txt_rssUrlI" ValidationGroup="val_insert"
                                    Text="<span style=color:red;>*Url address required</span>" Display="Dynamic" />
                            </td>
               
                             <td>
                                <%-- Make the Insert and Cancel button for the first table --%>
                                <asp:Button ID="btn_insertI" runat="server"  Text="Insert" OnCommand="adminRss" CommandName="Insert" 
                                    ValidationGroup="val_insert" />
                                <asp:Button ID="btn_cancelI" runat="server" Text="Cancel" OnCommand="adminRss" CommandName="Cancel" />

                            </td>
                        </tr>
                        </table>
                </div>
            </fieldset>
        </div>
        <div class="fieldsetRss_admin">
            <fieldset>
                <legend>Edit or delete the RSS field</legend>
                <div class="contentRss_admin">
                    <table>
                        <%-- Edit/delete the information with creating the DataList --%>
                    <asp:DataList ID="dls_adminRss" runat="server" OnItemCommand="actionRss" >
                      <%-- Display the Header of edit table --%>
                        <HeaderTemplate>
                        <tr class="headerRow_admin">
                            <th><asp:Label ID="lbl_rssTitleE" runat="server" Text="Title of RSS Feed" /></th>
                            <th><asp:Label ID="lbl_rssUrlE" runat="server" Text="Url of XML File" /></th>
                            <th><asp:Label ID="lbl_rssOperationE" runat="server" Text="Operation" /></th>
                        </tr>
                      </HeaderTemplate>
                        <%-- Introduce the TextBox of second table with their validation --%>
                      <ItemTemplate>
                        <tr>
                    
                            <td>
                                <%-- Title Textbox with validation and pattern --%>
                                <asp:HiddenField ID="hdf_rssId" runat="server" Value='<%#Eval("rss_Id")%>' />
                                <asp:TextBox ID="txt_rssTitleE" runat="server" Text='<%#Bind("rss_title")%>' />
                                <asp:RequiredFieldValidator ID="rfv_rssTitleE" runat="server" ControlToValidate="txt_rssTitleE" ValidationGroup="val_edit"
                                    Text="<span style=color:red;>*Title of RSS required</span>" Display="Dynamic" ErrorMessage="Should be less than 50 characters" />
                            </td>

                            <td>
                                <%-- Url Textbox with validation and pattern --%>
                                <asp:TextBox ID="txt_rssUrlE" runat="server" Text='<%#Bind("rss_url")%>' />
                                <asp:RequiredFieldValidator ID="rfv_rssUrlE" runat="server" ControlToValidate="txt_rssUrlE" ValidationGroup="val_edit"
                                    Text="<span style=color:red;>*Url address required</span>" Display="Dynamic" />
                            </td>
                            <td>
                                <asp:Button ID="btn_edit" runat="server" Text="Edit" CommandName="Edit" ValidationGroup="val_edit"/>
                                <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" 
                                    OnClientClick = "return confirm('Do you want to delete the record ? ');" />
                                <asp:Button ID="btn_cancelE" runat="server" Text="Cancel" CommandName="Cancel" />
                            </td>
                        </tr>
                    </ItemTemplate>
                  </asp:DataList>
                </table>
                </div>
            </fieldset>
        </div>

</asp:Content>


