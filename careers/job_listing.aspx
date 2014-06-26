<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="job_listing.aspx.cs" Inherits="job_listing" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <div>
        <asp:Panel ID="pnl_careers_list" runat="server" GroupingText="Careers List">
            <div>
                <a href="job_application.aspx">Apply Now !</a>
            </div>
            <br />
            <!--Display the job list-->
            <div id ="gridview_div" style="overflow:scroll;width:780px;border:1; height:500px">  
                <asp:GridView ID="grv_main" runat="server" AutoGenerateColumns="False" CellPadding="4">
                    <RowStyle Font-Size="12px" Height="17px" ForeColor="#333333" BackColor="White" BorderWidth="1" BorderStyle="Solid" BorderColor="Gray"/>
                    <HeaderStyle  Font-Size="12px"  Height="20px" ForeColor="White" BackColor="#787878" BorderWidth="1" BorderStyle="Solid" BorderColor="Gray" HorizontalAlign="Center"/>
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="true" ItemStyle-Width="500px" ItemStyle-Wrap="false" InsertVisible="False" SortExpression="Id" Visible="false" /> 
                        <asp:BoundField DataField="job_title" HeaderText="Title" SortExpression="job_title" />
                        <asp:BoundField DataField="job_type" HeaderText="Type" SortExpression="job_type">
                            <HeaderStyle Wrap= "False " /> 
                            <ItemStyle HorizontalAlign= "Center" /> 
                        </asp:BoundField>
                        <asp:BoundField DataField="job_description" HeaderText="Description" SortExpression="job_description" />
                        <asp:BoundField DataField="requirements" HeaderText="Requirements/Skills" SortExpression="requirements" />             
                        <asp:BoundField DataField="publish_date" HeaderText="Publish Date" SortExpression="publish_date" />
                    </Columns>
                </asp:GridView> 
            </div>  
        </asp:Panel>
    </div>

   
</asp:Content>

 