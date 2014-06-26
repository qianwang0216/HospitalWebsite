<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_news_ticker.aspx.cs" Inherits="admin_news_ticker" %>

<asp:Content id="cnt_header" ContentPlaceHolderID="head"  runat="server">
    <link href="../App_Themes/AdminTickerNews.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="cnt_content" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:DataList ID="dtl_tickerNews" runat="server" RepeatColumns="3" RepeatLayout="Table" RepeatDirection="Horizontal" OnItemCommand="dtl_tickerNews_ItemCommand" OnItemDataBound="dtl_tickerNews_ItemDataBound">
        <HeaderTemplate>
            <asp:Panel GroupingText="Add Ticker News" ID="pnl_addTickerNews" runat="server" CssClass="add-ticker-news">
                
                <asp:Label ID="lbl_contentI" runat="server" Text="Content:" CssClass="bold" /> 
                <br />
                <asp:TextBox ID="txt_contentI" runat="server" TextMode="MultiLine" Columns="30" Rows="5" MaxLength="250" />
                <asp:RequiredFieldValidator ID="rfv_contentI" runat="server" ControlToValidate="txt_contentI" Display="Dynamic" Text="(Required)" CssClass="validatefail" SetFocusOnError="true" ValidationGroup="insert_tickerNews" />
                <%-- The maxlength does not work for multiline textbox, need to use regularexpressionvalidator to validate --%>
                <asp:RegularExpressionValidator ID="rev_contentI" ControlToValidate="txt_contentI" Text="Can't exceed 250 characters" ValidationExpression="^[\s\S]{1,250}$" runat="server" CssClass="validatefail" Display="Dynamic" SetFocusOnError="true" ValidationGroup="insert_tickerNews" />
                <br />
                <asp:Label ID="lbl_statusI" runat="server" Text="Show to public: " CssClass="bold" /> 
                <br />
                <asp:RadioButtonList ID="rbl_statusI" runat="server" RepeatColumns="2" >
                    <asp:ListItem Value="1" Selected="True" Text="Yes" />
                    <asp:ListItem Value="0" Text="No"  />
                </asp:RadioButtonList>
                <br />
                <asp:Button ID="btn_insertTickerNews" runat="server" CommandName="Insert" ValidationGroup="insert_tickerNews" Text="Insert" />
            </asp:Panel>
        </HeaderTemplate>
        <ItemTemplate>
            <div  class="ticker-news-item">
                <asp:HiddenField ID="hdf_tn_idV" runat="server" Value='<%# Eval("tn_id") %>' />
                <asp:Label ID="lbl_contentV" runat="server" Text="Content:" CssClass="bold" />
                <br /><asp:Literal ID="ltl_contentV" runat="server" Text='<%# Eval("tn_content") %>' />
                <br />
                <br /><asp:Label ID="lbl_statusV" runat="server" Text="Show to public: " CssClass="bold" />
                <%-- if the display status is true, show "Yes", otherwise show "No" --%>
                <br /><asp:Literal ID="ltl_statusV" runat="server" Text='<%# string.Format("{0}", (bool)Eval("display_status") ? "Yes" : "No") %>'/>
                <div class="buttons"><asp:Button ID="btn_editTickerNews" runat="server" Text="Edit"  CommandName="Edit" /><asp:Button ID="btn_deleteTickerNews" runat="server" Text="Delete"  CommandName="Delete"/></div>
            </div>
        </ItemTemplate>
        <EditItemTemplate>
            <div  class="ticker-news-item">
                <asp:HiddenField ID="hdf_tn_idE" runat="server" Value='<%# Eval("tn_id") %>' />
                <asp:Label ID="lbl_contentE" runat="server" Text="Content:" CssClass="bold" />
                <br />
                <asp:TextBox ID="txt_contentE" runat="server" TextMode="MultiLine" Columns="30" Rows="5" Text='<%#Bind("tn_content") %>' MaxLength="250" />
                <asp:RequiredFieldValidator ID="rfv_contentE" runat="server" ControlToValidate="txt_contentE" Display="Dynamic" Text="(Required)" CssClass="validatefail" SetFocusOnError="true" ValidationGroup="update_tickerNews" />
                <%-- The maxlength does not work for multiline textbox, need to use regularexpressionvalidator to validate --%>
                <asp:RegularExpressionValidator ID="rev_contentE" ControlToValidate="txt_contentE" Text="Can't exceed 250 characters" ValidationExpression="^[\s\S]{1,250}$" runat="server" CssClass="validatefail" Display="Dynamic" SetFocusOnError="true" ValidationGroup="update_tickerNews" />
                <br />
                <asp:RadioButtonList ID="rbl_statusE" runat="server" RepeatColumns="2">
                    <asp:ListItem Value="1"  Text="Yes" />
                    <asp:ListItem Value="0"  Text="No"  />
                </asp:RadioButtonList>
                <br />
                <div class="buttons"><asp:Button ID="btn_updateTickerNews" runat="server" Text="Update"  CommandName="Update" ValidationGroup="update_tickerNews" /><asp:Button ID="btn_cancelTickerNews" runat="server" Text="Cancel"  CommandName="Cancel" CausesValidation="false"/></div>
            </div>
        </EditItemTemplate>
        <FooterTemplate>
            
        </FooterTemplate>
    </asp:DataList>
</asp:Content>


