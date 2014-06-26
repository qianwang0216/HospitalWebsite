<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rssfeed.aspx.cs" Inherits="rssfeed" %>

<%-- Change the name of the page --%>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <%-- Style Sheet for RSS page --%>
    <link rel="stylesheet" href="../App_Themes/Theme/RssStyleSheet.css" type="text/css" />
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <div id="rss_content">
        <%-- Logo of RSS page --%>
            <div id="content_img">
                <asp:Image ID="img_rss" runat="server" ImageUrl="~/App_Themes/Theme/img/RssFeed_logo.png" AlternateText="Logo of RSS" />
            </div>
        <%-- Define the Name of the page --%>
            <div id="content_label">
                <asp:Label ID="header_rss" runat="server" Text="RSS Feed" />
            </div>
            <br />
        <%-- Explanation to user that how they can use this RSS page --%>
            <fieldset id="fieldset_rss">
                <legend>Guideline</legend>
                <h5>In this page you can get the latest news from variety events related to the Nipigon Distric Memorial Hospital.</h5>
                <h5>Moreover, you can access to our news by Rss Readers. 
                    Also, we are very glad and appreciate if you share our news in your blog or website from our RSS links</h5>
            </fieldset>
            
        <div id="content_rss">
            <table>
            <asp:Repeater ID="rptRSS" runat="server" >

                    <%-- Display the category and content of RSS page --%>
                    <HeaderTemplate>
                         <tr class="row_header">
                            <td>&nbsp;</td>
                            <th>Category name</th>
                            <th> Url</th>
                        </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%-- Display the data from database --%>
                        <tr>
                            <td class="rsstable_td"><asp:HiddenField ID="hfd_rssID" runat="server" Value='<%#Eval("rss_Id") %>' /></td>
                            <td class="rsstable_td"><asp:Label ID="lbl_rssTitle" runat="server" Text='<%#Eval("rss_title") %>' /></td>
                            <td class="rsstable_td"><asp:HyperLink ID="hpl_rssUrl" runat="server" Text='<%#Eval("rss_url") %>' 
                                NavigateUrl='<%#Eval("rss_url") %>' Target="_blank" /></td>              
                        </tr>
                    </ItemTemplate>
            </asp:Repeater>
        </table>
        </div>
    </div>
</asp:Content>


