<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="resultSearch.aspx.cs" Inherits="resultSearch" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <script src="../scripts/SearchHighlight.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <asp:Label ID="label1" runat="server" />
    <br /><br />
    <table>
             <%-- This is the search engine feature. The result(s) is only based on accordion_new table--%>
             <asp:DataList ID="dtlSearch" runat="server">
                 <ItemTemplate>
                         <tr>
                             <%-- displat the title of search result--%>
                             <asp:Label ID="lbl_titleSe" runat="server" Text="Title: "  />
                             <asp:Label ID="lbl_titleRe" runat="server" Text='<%#Eval("an_title") %>' />

                         </tr>
                         <br /><br />
                         <tr>
                              <%-- displat the content of search result--%>
                             <asp:Label ID="lbl_contentSe" runat="server" Text="Content: " />
                             <asp:Label ID="lbl_contentRe" runat="server" Text='<%#Eval("an_content") %>' />
                         </tr>
                         <br /><br />
                         <tr>
                             <%-- make the link to go to the actual page of search result --%>
                            <asp:HiddenField ID="hfd_searchLink" runat="server" Value='<%#Eval("an_Id") %>' />
                            <asp:HyperLink ID="hpl_moreinfo" runat="server" Text="More info"
                                NavigateUrl='<%# Eval("an_Id","~/news_accordion_detail_view.aspx?an_id={0}") %>' /> 
                         </tr>
                         <br /><br />
                     </ItemTemplate>
             </asp:DataList>
    </table>
</asp:Content>


