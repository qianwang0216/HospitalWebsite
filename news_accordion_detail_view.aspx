<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="news_accordion_detail_view.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <link href="Theme/AccordionNewsView.css" rel="stylesheet" media="screen" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
        <div class="accordion_news_detail">
         <asp:FormView ID="frm_accordion_news" runat="server">
            <ItemTemplate>
                <h1><%#Eval("an_title") %></h1>
                <p class="an_posttime"><span>Posted: <%#Eval("an_postedtime", "{0:MMMM dd, yyyy hh:mm:ss tt}") %></span> <span>   |    Last Updated: <%#Eval("an_lastupdate", "{0:MMMM dd, yyyy hh:mm:ss tt}") %></span></p>
                <div><asp:Image ID="img_newsimageV" runat="server" CssClass="an_img" /></div>
                <div class="an_content"><%#Eval("an_content").ToString().Replace(((char)13).ToString(), "<br />") %></div>
            </ItemTemplate>
        </asp:FormView>       
    </div>
    <script>
            $(function () {
                $("#news_accordion").accordion("option", "active", <%= Request.QueryString["accordionid"]%>);
            });
	</script>
</asp:Content>


