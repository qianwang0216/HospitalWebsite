<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_news_accordion.aspx.cs" Inherits="admin_news_accordion" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
        <div>
    <asp:Panel ID="pnl_all" runat="server" CssClass="container" GroupingText="News list">
         <asp:GridView ID="grv_news" runat="server" AutoGenerateColumns="false" Width="100%">
         <RowStyle CssClass="gridcell" />
        <Columns>
            <%-- Make the news title a clickable link button --%>
            <asp:TemplateField ItemStyle-CssClass="gridcell" HeaderText="Title">
              <ItemTemplate>
                <asp:LinkButton ID="hplShowDetails" runat="server" OnCommand="hplShowDetails_Command" CommandArgument='<%# Bind("an_id") %>' Text='<%# Bind("an_title") %>' />
              </ItemTemplate> 
            </asp:TemplateField>
            <asp:BoundField DataField="an_postedtime" HeaderText="Posted Time"  ItemStyle-CssClass="gridcell" DataFormatString="{0:MMMM dd, yyyy hh:mm:ss tt}" />
            <asp:BoundField DataField="an_lastupdate" HeaderText="Last Updated"  ItemStyle-CssClass="gridcell" DataFormatString="{0:MMMM dd, yyyy hh:mm:ss tt}" />
        </Columns>

        </asp:GridView>
        <div class="centeralign">
                <asp:Button ID="btn_addNews" runat="server" Text="Add News" OnClick="btn_addNews_Click" CausesValidation="false" />
        </div>
    </asp:Panel>

        <asp:Panel ID="pnl_news" runat="server" Visible="false"  CssClass="container">
        <asp:FormView runat="server" ID="fmv_news" Width="100%">
            <InsertItemTemplate>
                
                <br />
                <br />
                <table width="100%">
                    <tr>
                        <td colspan="2" class="centeralign"><asp:Label ID="lbl_headI" runat="server" Text="Add News" /></td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_titleI" runat="server" Text="Title: " /></td>
                        <td><asp:TextBox ID="txt_titleI" runat="server" MaxLength="200" CssClass="an_title"/>
                            <%-- title is required --%>
                            <asp:RequiredFieldValidator ID="rfv_titleI" runat="server" ControlToValidate="txt_titleI" Display="Dynamic" SetFocusOnError="true" Text="(Required)" CssClass="validatefail" ValidationGroup="add_news" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_imageI" runat="server" Text="Image: " /></td>
                        <td><asp:FileUpload ID="ful_imageI" runat="server" />
                            <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="ful_imageI" Text="Only .gif, .jpg files allowed"  CssClass="validatefail" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])$)"  ValidationGroup="add_news" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_contentI" runat="server" Text="Content: " /></td>
                        <td><asp:TextBox ID="txt_contentI" runat="server" TextMode="MultiLine" Rows="25" Columns="80"/>
                            <%-- content is required --%>
                            <asp:RequiredFieldValidator ID="rfv_contentI" runat="server" ControlToValidate="txt_contentI" Display="Dynamic" SetFocusOnError="true" Text="(Required)" CssClass="validatefail" ValidationGroup="add_news" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="centeralign">
                            <asp:Button ID="btn_insert_news" runat="server" OnClick="btn_insert_news_Click" Text="Insert" ValidationGroup="add_news" />
                            <asp:Button ID="btn_cancel_insert_news" runat="server" OnClick="btn_cancel_insert_news_Click" Text="Cancel" CausesValidation="false" />
                        </td>
                    </tr>
                </table>
                
            </InsertItemTemplate>
            <EditItemTemplate>

                <table width="100%">
                    <tr>
                        <td colspan="2" class="centeralign"><asp:Label ID="lbl_headE" runat="server" Text="Edit News" /></td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_titleE" runat="server" Text="Title: " /></td>
                        <td><asp:TextBox ID="txt_titleE" runat="server" MaxLength="200" Text='<%#Bind("an_title") %>' CssClass="an_title" />
                            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("an_id") %>' />
                            <%-- title is required --%>
                            <asp:RequiredFieldValidator ID="rfv_titleE" runat="server" ControlToValidate="txt_titleE" Display="Dynamic" SetFocusOnError="true" Text="(Required)" CssClass="validatefail" ValidationGroup="update_news" />
                        </td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_imageE" runat="server" Text="Image: " /></td>
                        <td>
                            <asp:Image ID="img_newsImageE" runat="server" CssClass="an_img" /><br />
                            <asp:Button ID="btn_deleteImage" runat="server" Text="Delete Image" OnClick="btn_deleteImage_Click" CausesValidation="false" /><br />
                            <asp:FileUpload ID="ful_imageE" runat="server" />
                            <asp:RegularExpressionValidator ID="rexp" runat="server" ControlToValidate="ful_imageE" Text="Only .gif, .jpg files allowed"  CssClass="validatefail" ValidationExpression="(.*\.([Gg][Ii][Ff])|.*\.([Jj][Pp][Gg])$)"  ValidationGroup="update_news" />
                        
                        </td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_contentE" runat="server" Text="Content: " /></td>
                        <td><asp:TextBox ID="txt_contentE" runat="server" TextMode="MultiLine" Rows="25" Columns="80"  Text='<%#Bind("an_content") %>'/>
                            <%-- content is required --%>
                            <asp:RequiredFieldValidator ID="rfv_contentE" runat="server" ControlToValidate="txt_contentE" Display="Dynamic" SetFocusOnError="true" Text="(Required)" CssClass="validatefail" ValidationGroup="update_news" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="centeralign">
                            <asp:Button ID="btn_update_news" runat="server" OnClick="btn_update_news_Click" Text="Update" ValidationGroup="update_news" />
                            <asp:Button ID="btn_cancel_update_news" runat="server" OnClick="btn_cancel_update_news_Click" Text="Cancel" CausesValidation="false" />
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>

                <table width="100%" border="1">
                    <tr>
                        <td colspan="2" class="centeralign"><asp:Label ID="lbl_headV" runat="server" Text="View News" /></td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_titleV" runat="server" Text="Title: " /></td>
                        <td><%#Eval("an_title") %>
                            <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("an_id") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_postedtimeV" runat="server" Text="Posted: " /></td>
                        <td><%#Eval("an_postedtime", "{0:MMMM dd, yyyy hh:mm:ss tt}") %></td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_lastupdateV" runat="server" Text="Last Updated: " /></td>
                        <td><%#Eval("an_lastupdate", "{0:MMMM dd, yyyy hh:mm:ss tt}") %></td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_imageV" runat="server" Text="Image:" /></td>
                        <td><asp:Image ID="img_newsimageV" runat="server" CssClass="an_img" /></td>
                    </tr>
                    <tr>
                        <td class="tablelable"><asp:Label ID="lbl_contentV" runat="server" Text="Content: " /></td>
                        <%-- replace the "change line" to <br> tag --%>
                        <td><%#Eval("an_content").ToString().Replace(((char)13).ToString(), "<br />") %></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="centeralign">
                            <asp:Button ID="btn_edit_news" runat="server" OnClick="btn_edit_news_Click" Text="Edit" />
                            <asp:Button ID="btn_cancel_view" runat="server" OnClick="btn_cancel_view_Click" Text="Cancel" />
                            <asp:Button ID="btn_delete_news" runat="server" OnClick="btn_delete_news_Click" Text="Delete" OnClientClick="return confirm('Confirm delete?');" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:FormView>
    </asp:Panel>     
    </div>
</asp:Content>

