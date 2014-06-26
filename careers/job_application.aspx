<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="job_application.aspx.cs" Inherits="job_application" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <h2>Online Application</h2>
    <br />
    <!--The Panel Control-->
    <div id="pnl">
    <asp:Panel ID="pnl_form1" runat="server" GroupingText="Apply for a job opportunity">
        <br />
        <!--Validation Control-->
        <table border="0">
        <tr>
            <td><asp:Label ID="lbl_fname" runat="server" Text="Firstname: " AssociatedControlID="txt_fname" /></td>
            <td><asp:TextBox ID="txt_fname" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" Text="*Required" ControlToValidate="txt_fname" Display="Static" SetFocusOnError="true" ErrorMessage="Please complete first name" ValidationGroup="Group1" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_lname" runat="server" Text="Lastname: " AssociatedControlID="txt_lname" /></td>
            <td><asp:TextBox ID="txt_lname" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_lname" runat="server" Text="*Required" ControlToValidate="txt_lname" Display="Static" SetFocusOnError="true" ErrorMessage="Please complete last name" ValidationGroup="Group1" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_email" runat="server" Text="Email: " AssociatedControlID="txt_email" /></td>
            <td><asp:TextBox ID="txt_email" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_email" runat="server" Text="*Required" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please complete email" ValidationGroup="Group1" />
                <asp:RegularExpressionValidator ID="rev_email" runat="server" Text="Invalid email" ControlToValidate="txt_email" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" ErrorMessage="Please input a valid email" ValidationGroup="Group1" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_phone" runat="server" Text="Phone number: " AssociatedControlID="txt_phone" /></td>
            <td><asp:TextBox ID="txt_phone" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_phone" runat="server" Text="*Required" ControlToValidate="txt_phone" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please complete phone number" ValidationGroup="Group1" />
                <asp:RegularExpressionValidator ID="rev_phone" runat="server" Text="Invalid phone number" ControlToValidate="txt_phone" Display="Dynamic" SetFocusOnError="true" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ErrorMessage="Please input a valid phone number" ValidationGroup="Group1" />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_city" runat="server" Text="City: " AssociatedControlID="txt_city" /></td>
            <td><asp:TextBox ID="txt_city" runat="server" />
                <asp:RequiredFieldValidator ID="rfv_city" runat="server" Text="*Required" ControlToValidate="txt_city" Display="Dynamic" SetFocusOnError="true" ErrorMessage="Please complete city" ValidationGroup="Group1" />
            </td>
        </tr>
            <!--Job type-->
        <tr>
            <td><asp:Label ID="lbl_job_type" runat="server" Text="Job Title: " /></td>
            <td><asp:DropDownList ID="ddl_job_type" runat="server" RepeatDirection="Horizontal" ValidationGroup="Group1" AutoPostBack="true" /></td>
        </tr>
        <tr>
            <td><asp:Label ID="lbl_upload_resume" runat="server" Text="Resume: " /></td>
            <td><asp:FileUpload ID="file_upload_resume" runat="server" /></td>
        </tr>
        </table>
        <br />
        
        <!--The CheckBoxList Control-->
        <asp:Label ID="cbl_type" runat="server" Text="How did you find us ?" />
        <div id="cbl_divbox">
            <asp:RadioButtonList ID="rbl_1" runat="server" RepeatDirection="Horizontal" ValidationGroup="Group1">
                <asp:ListItem Value="Social Media" />
                <asp:ListItem Value="Internet" />
                <asp:ListItem Value="Website" />
                <asp:ListItem Value="Advertising" />
                <asp:ListItem Value="Others" />
            </asp:RadioButtonList>
        </div>
        <br />
        <!--The RadioButtonList Control-->
        <asp:Label ID="update_information" runat="server" Text="Do you want to receive the recent information about our hospital?" />
        <div id="rbl_divbox">
            <asp:RadioButtonList ID="rbl" runat="server" RepeatDirection="Horizontal" ValidationGroup="Group1">
                <asp:ListItem Value="Yes"></asp:ListItem>
                <asp:ListItem Value="No"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <br />
        <!-- The Output -->
        <asp:Button ID="btn_submit" runat="server" Text="Submit" OnClick="subSubmit" ValidationGroup="Group1" />
        <asp:Button ID="btn_clear" runat="server" Text="Clear" OnClick="subClear" />
        <br /><br />
        <div id="txt_output">
            <asp:Label ID="output" runat="server" />
        </div>
        <br />
        <asp:ValidationSummary ID="vds_main" runat="server" HeaderText="Errors: " ShowMessageBox="true" ShowSummary="false" ValidationGroup="Group1" /> 
        <br />
    </asp:Panel>
    </div>    
</asp:Content>
