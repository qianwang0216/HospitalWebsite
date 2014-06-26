<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_index" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <script src="scripts/jquery.webticker.js"></script>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">

    <%-- Ben: The following ticker area is for the news ticker--%>
    <div id="ticker">
            <%-- the ul following is for the scrolled news ticker, using the webticker plugin --%>
            <ul id="webticker">

            </ul>
        <%-- get the ticker news item from the RSS feed (dynamically created), re-check the rss feed every 1 minute --%>
        <script>
            $(function () {
                $("#webticker").webTicker({ duplicate: false, speed: 40, direction: 'left', rssurl: 'TickerNewsRSS.ashx', rssfrequency: 1, startEmpty: false, hoverpause: false });
            });
        </script>
    </div>
    <%-- Ben: end of the news ticker --%>
    <div id="home_slideshow">
        <asp:ScriptManager ID="scm_main" runat="server" />
        <asp:UpdatePanel ID="upd_main" runat="server">
            <ContentTemplate>
                <asp:Label ID="lbl_timer" runat="server"  />
                <asp:Timer ID="tmr_main" runat="server" Interval="4500" OnTick="subTick" />
           

                <asp:Image ID="img_slider" runat="server" CssClass="img_slider" />
                <br />
                <div class="sld">
                <asp:Label ID="lbl_slider" runat="server" Font-Bold="true" Font-Size="X-Large" /><br /><br />
                <asp:Label ID="lbl_slider2" runat="server" Font-Size="Large" /><br /><br /><br />

                <asp:Button ID="btn_slide" runat="server" Text="Stop" Font-Bold="true" CssClass="btnslider" OnClick="Btn_Click" />
                    </div>
                
                </ContentTemplate>
            </asp:UpdatePanel>
        
    </div>
    
    <div id ="home_welcome">
        <asp:Literal ID="ltl_welcome" runat="server" Mode="PassThrough" Text="<h1>WELCOME</h1>" />
        <h5>The community of Nipigon is located at the cross roads of Highway 11/17. We are minutes away from beautiful
            Lake Superior, rugged Lake Nipigon, and famous Nipigon River. Nipigon District Memorial Hospital opened its
            current site in 1992 serving the catchment area in Acute , Emergency and Long Term care services.</h5>
    </div>

</asp:Content>


