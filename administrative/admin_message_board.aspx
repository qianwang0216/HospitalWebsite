<%@ Page Title="" Language="C#" MasterPageFile="~/administrative/AdminMasterPage.master" AutoEventWireup="true" CodeFile="admin_message_board.aspx.cs" Inherits="administrative_admin_message_board" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" type="text/css" href="../App_Themes/message_board.css" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cph_content" Runat="Server">
    <h2>Topics Management</h2>
    <br />
        <!--Bind data using ListView-->
            <asp:ListView ID="ltv_main" runat="server" OnItemCommand="subAdmin" DataKeyNames="id" ItemContainerID="ItemPlaceHolder">
                <LayoutTemplate>
                <div class="PrettyGrid">
                    <table cellpadding="0" cellspacing="0" width="500" >
                        <thead>
                            <tr>
                                <td style="width:100px"><asp:Label ID="lbl_id" runat="server" Text="Id" Font-Bold="true" /></td>
                                <td style="width:100px"><asp:Label ID="lbl_title" runat="server" Text="Title" Font-Bold="true" /></td>
                                <td style="width:100px"><asp:Label ID="lbl_category" runat="server" Text="Category" Font-Bold="true" /></td>
                                <td style="width:100px"><asp:Label ID="lbl_user" runat="server" Text="User" Font-Bold="true" /></td>
                                <td style="width:100px"><asp:Label ID="lbl_publish_date" runat="server" Text="Publish Date" Font-Bold="true" /></td>
                                <td style="width:100px"><asp:Label ID="lbl_option" runat="server" Text="Option" Font-Bold="true" /></td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:PlaceHolder runat="server" ID="ItemPlaceHolder"></asp:PlaceHolder>
                        </tbody>
                    </table>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="hdf_id" runat="server" Text='<%#Eval("id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="txt_title" runat="server" Text='<%#Bind("title") %>' />
                        </td>
                        <td>
                            <asp:Label ID="txt_forum_style" runat="server" Text='<%#Bind("forum_style") %>' />
                        </td>
                        <td>
                            <asp:Label ID="txt_fname" runat="server" Text='<%#Bind("FirstName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="txt_date" runat="server" Text='<%#Bind("Dates") %>' />
                        </td>
                        <td>
                            <asp:Button ID="btn_del" runat="server" Text="Delete" CommandName="del" CommandArgument = '<%#Eval("id") %>' OnClientClick="return confirm('Are you sure to delete?')" CausesValidation="false" /></td>
                        </td>
                    </tr>
                </ItemTemplate>
        </asp:ListView>
        <!--ListView Paging-->
        <asp:DataPager runat="server" PagedControlID="ltv_main" ID="ContactsDataPager" PageSize="5">
            <Fields>    
                <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowLastPageButton="true" 
                    FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous"/>
            </Fields>
        </asp:DataPager>
    <br />
    <br />
    <asp:Label ID="lbl_msg" runat="server" />

</asp:Content>


