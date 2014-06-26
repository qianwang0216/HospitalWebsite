<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_login.aspx.cs" Inherits="admin_login" %>


<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <asp:Login ID="lgn_main" runat="server" DisplayRememberMe="false" ValidatorTextStyle-ForeColor="Red" DestinationPageUrl="~/administrative/admin_index.aspx" />
</asp:Content>


