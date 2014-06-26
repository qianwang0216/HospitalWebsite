<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_feedback.aspx.cs" Inherits="admin_feedback" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link  rel="stylesheet" href="../App_Themes/Theme/FeedbackStyleSheet.css" type="text/css" media="screen" />
    <script src="../scripts/jquery-1.10.2.js" type="text/javascript"></script>
    <script src="../scripts/FeedbackAdmin_JavaScript.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">

   <div class="txtmsg">
       <asp:Label ID="txtMsg" runat="server" />
   </div>

                                <%------------------------------- Complaints Section---------------------------------%>
   <div id="feedback_tables">
       <div class="fieldset_feedback">
         <fieldset>
            <legend>Complaints</legend>
            <table>
             <%-- Display & delete the user feedback in the DataList --%>
             <asp:GridView ID="grvComp" runat="server" AllowPaging="true" PageSize="3" AutoGenerateColumns="false" DataKeyNames="section"
                  OnPageIndexChanging="grvComp_PageIndexChanging" OnRowCommand="actionComp" >
                 <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="20px"/>
                 <PagerSettings Position="Bottom" FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                 <%-- Introduce the Header of table --%>
                 <Columns>
                 <asp:TemplateField>
                     <HeaderTemplate>   
                         <tr>
                             <th class="tableFormat_th">&nbsp;</th>
                             <th class="tableFormat_th"><asp:Label runat="server" Text="Date"  /></th>
                             <th class="tableFormat_th"><asp:Label runat="server" Text="Full Name"  /></th>
                             <th class="tableFormat_th"><asp:Label runat="server" Text="Email" /></th>
                             <th class="tableFormat_th"><asp:Label runat="server" Text="Related To" /></th>
                             <th class="tableFormat_th"><asp:Label runat="server" Text="Title" /></th>
                             <th class="tableFormat_th"><asp:Label runat="server" Text="Operation" /></th>
                     
                         </tr>
                     </HeaderTemplate>
                     <ItemTemplate>
                <%-- Display the complain of user--%>
                        <tr class="tableFormat_tr">
                        <%-- hidden file for helping us to find the database based on the section and id--%>
                            <td class="tableFormat_td">
                                <asp:HiddenField ID="hdf_idComp" runat="server" Value='<%#Eval("fb_Id")%>' />
                                <asp:HiddenField ID="hdf_sectionComp" runat="server" Value='<%#Eval("section")%>' />
                                <asp:HiddenField ID="hdf_contentComp" runat="server" Value='<%#Eval("content")%>' />
                            </td>
                   
                            <%-- show the database --%>
                            <td class="tableFormat_td"><asp:Label ID="lbl_dateComp" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"feedbackDate", "{0:dd.MM.yyyy}") %>' /></td>
                            <td class="tableFormat_td"><asp:Label ID="lbl_fnameComp" runat="server" Text='<%#Eval("fname") %>' /></td>
                            <td class="tableFormat_td"><asp:Label ID="lbl_emailComp" runat="server" Text='<%#Eval("email") %>' /></td>
                            <td class="tableFormat_td"><asp:Label ID="lbl_rdepartmentComp" runat="server" Text='<%#Eval("rdepartment") %>' /></td>
                            <td class="tableFormat_td"><asp:Label ID="lbl_titleComp" runat="server" Text='<%#Eval("title") %>' /></td>  
                            <td class="tableFormat_td">
                                <asp:Button ID="btn_SelectComp" runat="server" Text="Content" CommandName="SelectComp"
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
                                <asp:Button ID="btn_DeleteComp" runat="server" Text="Delete" CommandName="DeleteComp" 
                                     OnClientClick = "return confirm('Do you want to delete the record ? ');" 
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                            </td>                    
                        </tr>
                </ItemTemplate>
                 </asp:TemplateField>
                 </Columns>
          </asp:GridView>
        </table>
        </fieldset>
       <br />

                                <%------------------------------- Comments Section---------------------------------%>
       <div class="fieldset_feedback">
           <fieldset>
               <legend>Comments</legend>
               <table>
                   <%-- Display & delete the user feedback in the DataList --%>
                   <asp:GridView ID="grvComm" runat="server" AllowPaging="true" PageSize="3" AutoGenerateColumns="false" DataKeyNames="section"
                       OnPageIndexChanging="grvComm_PageIndexChanging" OnRowCommand="actionComm">
                       <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="20px" />
                       <PagerSettings Position="Bottom" FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                       <%-- Introduce the Header of table --%>
                       <Columns>
                           <asp:TemplateField>
                               <HeaderTemplate>
                                   <tr>
                                       <th class="tableFormat_th">&nbsp;</th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Date" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Full Name" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Email" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Related To" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Title" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Operation" /></th>

                                   </tr>
                               </HeaderTemplate>
                               <ItemTemplate>
                                   <%-- Display the complain of user--%>
                                   <tr>
                                       <%-- hidden file for helping us to find the database based on the section and id--%>
                                       <td class="tableFormat_td">
                                           <asp:HiddenField ID="hdf_idComm" runat="server" Value='<%#Eval("fb_Id")%>' />
                                           <asp:HiddenField ID="hdf_sectionComm" runat="server" Value='<%#Eval("section")%>' />
                                           <asp:HiddenField ID="hdf_contentComm" runat="server" Value='<%#Eval("content")%>' />
                                       </td>

                                       <%-- show the database --%>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_dateComm" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"feedbackDate", "{0:dd.MM.yyyy}") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_fnameComm" runat="server" Text='<%#Eval("fname") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_emailComm" runat="server" Text='<%#Eval("email") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_rdepartmentComm" runat="server" Text='<%#Eval("rdepartment") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_titleComm" runat="server" Text='<%#Eval("title") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Button ID="btn_SelectComm" runat="server" Text="Content" CommandName="SelectComm" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                           <asp:Button ID="btn_DeleteComm" runat="server" Text="Delete" CommandName="DeleteComm"
                                               OnClientClick="return confirm('Do you want to delete the record ? ');" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                       </td>
                                   </tr>
                               </ItemTemplate>
                           </asp:TemplateField>
                       </Columns>
                   </asp:GridView>
               </table>
           </fieldset>
       <br />

                                <%------------------------------- Appreciations Section---------------------------------%>
       <div class="fieldset_feedback">    
            <fieldset>
               <legend>Appreciations</legend>
               <table>
                   <%-- Display & delete the user feedback in the DataList --%>
                   <asp:GridView ID="grvApp" runat="server" AllowPaging="true" PageSize="3" AutoGenerateColumns="false" DataKeyNames="section"
                       OnPageIndexChanging="grvApp_PageIndexChanging" OnRowCommand="actionApp">
                       <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" Font-Size="20px" />
                       <PagerSettings Position="Bottom" FirstPageText="First" LastPageText="Last" Mode="NumericFirstLast" />
                       <%-- Introduce the Header of table --%>
                       <Columns>
                           <asp:TemplateField>
                               <HeaderTemplate>
                                   <tr>
                                       <th class="tableFormat_th">&nbsp;</th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Date" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Full Name" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Email" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Related To" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Title" /></th>
                                       <th class="tableFormat_th">
                                           <asp:Label runat="server" Text="Operation" /></th>

                                   </tr>
                               </HeaderTemplate>
                               <ItemTemplate>
                                   <%-- Display the complain of user--%>
                                   <tr>
                                       <%-- hidden file for helping us to find the database based on the section and id--%>
                                       <td class="tableFormat_td">
                                           <asp:HiddenField ID="hdf_idApp" runat="server" Value='<%#Eval("fb_Id")%>' />
                                           <asp:HiddenField ID="hdf_sectionApp" runat="server" Value='<%#Eval("section")%>' />
                                           <asp:HiddenField ID="hdf_contentApp" runat="server" Value='<%#Eval("content")%>' />
                                       </td>

                                       <%-- show the database --%>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_dateApp" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"feedbackDate", "{0:dd.MM.yyyy}") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_fnameApp" runat="server" Text='<%#Eval("fname") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_emailApp" runat="server" Text='<%#Eval("email") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_rdepartmentApp" runat="server" Text='<%#Eval("rdepartment") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Label ID="lbl_titleApp" runat="server" Text='<%#Eval("title") %>' /></td>
                                       <td class="tableFormat_td">
                                           <asp:Button ID="btn_SelectApp" runat="server" Text="Content" CommandName="SelectApp" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                           <asp:Button ID="btn_DeleteApp" runat="server" Text="Delete" CommandName="DeleteApp"
                                               OnClientClick="return confirm('Do you want to delete the record ? ');" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                       </td>
                                   </tr>
                               </ItemTemplate>
                           </asp:TemplateField>
                       </Columns>
                   </asp:GridView>
               </table>
           </fieldset>
       <br />

       <div class="selectView">
           <div id="selectEdit">
               <h4>Title</h4>
               <asp:Label ID="lbl_titleSelect" runat="server" />
               <br />
               <br />
               <h4>Content</h4>
               <asp:TextBox ID="txt_contentSelect" runat="server" TextMode="MultiLine" Width="500" Rows="10" ReadOnly="true" />
               <br />
               <asp:Button ID="btn_cancelView" runat="server" Text="Cancel" CommandName="Cancel" />
           </div>
       </div>

   </div>

</asp:Content>


