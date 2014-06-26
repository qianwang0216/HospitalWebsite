<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="feedback.aspx.cs" Inherits="feedback" %>

<%-- For change the title of the page --%>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<%-- Reference of Captcha from google --%>
<%@ Register TagPrefix="recaptcha" Namespace="Recaptcha" Assembly="Recaptcha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cph_head" Runat="Server">
    <%-- Link of the feedback page CSS  --%>
    <link rel="stylesheet" href="../App_Themes/Theme/FeedbackStyleSheet.css" type="text/css" media="screen" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <div id="feedback_title">
        <div id="feedback_titleL">
            <%-- logo of the feedback page --%>
            <asp:Image ID="img_feedback" runat="server" ImageUrl="~/App_Themes/Theme/img/feedback.png" AlternateText="feedback logo" />
        </div>
        <div id="feedback_titleR">
            <h2>Feedback</h2>
        </div>
    </div>
    <%-- the message of success or faild when user sent the data --%>
    <div class="txtmsg">
        <asp:Label ID="lbl_txtMsg" runat="server"/>
    </div>

    <br /><br />

    <%-- Define the three navigation bar for complaints, commnets, and appreciations --%>
    <div id="header_view">
        <table>
            <tr>
                <th><asp:Button ID="btn_complains" runat="server" Text="Complaints" OnClick="btnComplains_Click" CssClass="btn_link" /></th>
                <th><asp:Button ID="btn_comments" runat="server" Text="Comments" OnClick="btnComments_Click" CssClass="btn_link" /></th>
                <th><asp:Button ID="btn_appreciations" runat="server" Text="Appreciations" OnClick="btnAppreciations_Click" CssClass="btn_link" /></th>
            </tr>
        </table>
    </div>

    <div id="content_view">
        <%-- Define the MultiView Control to access each style of feedback --%>
        <div id="sideLeft">
            <asp:MultiView ID="MultiView" runat="server">
                             <%------------------------------- Complaints Section---------------------------------%>
                <asp:View ID="View1" runat="server"><%-- This is the first view of the page for complaints-%>
                    <%-- send the value of complaint when user use this Multiview part to admin page in order to allocate the data --%>
                    <asp:HiddenField ID="hdfView1_section" runat="server" Value="complaint"  />
                    <%-- Define the page and requirements --%>
                    <asp:Label ID="lblView1_title" runat="server" Text="<h1>Your Complaints<h1>" />
                    <asp:Label ID="lblview1_explain"  runat="server" Text="<h5>Please fill out all the required fields(<span style='color:red;'>*</span>)</h5>" />
                    
                    <%-- Create the full name text box which is not required --%>
                    <h5>Full Name:
                    <asp:TextBox ID="txtView1_fname" runat="server" Width="208px" /></h5>
                    <br /><br />
                    
                    <%-- Create the email textbox with validation and required field --%>
                    <h5>Email<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView1_email" runat="server" Width="230px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_email_view1" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Static" ControlToValidate ="txtView1_email" SetFocusOnError="true" ValidationGroup="view1" />
                    <asp:RegularExpressionValidator ID="rev_email_view1" runat="server" Text="<span style='color:red;'>* Invalid Email</span>" 
                        ControlToValidate="txtView1_email" Display="Dynamic" ValidationGroup="view1"
                        ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$" />
                    <br /><br />

                    <%-- Create the department textbox with validation and required field --%>
                    <h5>Related to<span style='color:red;'>*</span>:
                    <asp:DropDownList ID="ddlView1_rdepartment" runat="server" Width="200px">
                        <asp:ListItem Text="Select the related department" />
                        <asp:ListItem Value="Doctors" Text="Doctors" />
                        <asp:ListItem Value="Nurses" Text="Nurses" />
                        <asp:ListItem Value="Management" Text="Management" />
                        <asp:ListItem Value="Information Desk" Text="Information Desk" />
                        <asp:ListItem Value="Resturants" Text="Resturants" />
                        <asp:ListItem Value="Website" Text="Website" />
                        <asp:ListItem Value="Others" Text="Others" />
                    </asp:DropDownList></h5>
                    <asp:CompareValidator ID="cmv_ddlView1" runat="server" ControlToValidate="ddlView1_rdepartment" Text="<span style='color:red;'>* Required</span>" Operator="NotEqual"
                        ValueToCompare="Select the related department" SetFocusOnError="true" ValidationGroup="view1" />
                    <br /><br />

                    <%-- Create the subject of feedback textbox with validation and required field --%>
                    <h5>Subject<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView1_title" runat="server" Width="435px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_title_view1" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Static" ControlToValidate ="txtView1_title" SetFocusOnError="true" ValidationGroup="view1" />
                    <br /><br />

                    <%-- Create the explanation of feedback textbox with validation and required field --%>
                    <h5>Explain the issue(s)<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView1_content" rows="8" Width="435px" runat="server" TextMode="MultiLine" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_content_view1" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Static" ControlToValidate ="txtView1_content" SetFocusOnError="true" ValidationGroup="view1" />
                    <br /><br />

                    <%-- This is the code of captcha which exactly copy and paste from Google website --%>
                    <recaptcha:RecaptchaControl ID="recaptchaView1" runat="server" PublicKey="6LcsufASAAAAACB2TvJFuSlkbdD6LzNO_yeyuoy3" PrivateKey="6LcsufASAAAAAAyI1lWNyFtFPCFeAKqO5nk_4zGI"  Theme="clean" />
                    <br />
                    <asp:CustomValidator ID="cmv_recaptchaComp" runat="server" OnServerValidate ="recaptchaComp" ErrorMessage="<span style='color:red;'>*Please fill out the Recaptcha corectly</span>" ValidationGroup="view1" />
                    <br /><br />

                    <%-- Button of submit and clear the page --%>
                    <asp:Button ID="btnView1_submit" runat="server" Text="Send" CommandName="InsertComp" OnCommand="sendData" CssClass="btn_function" ValidationGroup="view1" />
                    <asp:Button ID="btnView1_reset" runat="server" Text="Reset" CommandName="Cancel" OnCommand="sendData" CssClass="btn_function" />
                    
                </asp:View>
                                     <%---------- Comments Section/ all defination of controls are as same as above-----------%>

                <asp:View ID="View2" runat="server">
                    <asp:HiddenField ID="hdfView2_section" runat="server" Value="comment"  />
                    <asp:Label ID="lblView2_title" runat="server" Text="<h1>Your Comments<h1>" />
                    <asp:Label ID="lblView2_explain"  runat="server" Text="<h5>Please fill out all the required fields(<span style='color:red;'>*</span>)</h5>" />
                    
                    <h5>Full Name:
                    <asp:TextBox ID="txtView2_fname" runat="server" Width="208px" /></h5>
                    <br /><br />
                    
                    <h5>Email<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView2_email" runat="server" Width="230px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_email_view2" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView2_email" SetFocusOnError="true" ValidationGroup="view2" />
                    <asp:RegularExpressionValidator ID="rev_email_view2" runat="server" Text="<span style='color:red;'>* Invalid Email</span>" 
                        ControlToValidate="txtView2_email" Display="Dynamic" ValidationGroup="view2"
                        ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$" />
                    <br /><br />

                    <h5>Related to<span style='color:red;'>*</span>:
                    <asp:DropDownList ID="ddlView2_rdepartment" runat="server"  Width="200px">
                        <asp:ListItem Text="Select the related department" />
                        <asp:ListItem Value="Doctors" Text="Doctors" />
                        <asp:ListItem Value="Nurses" Text="Nurses" />
                        <asp:ListItem Value="Management" Text="Management" />
                        <asp:ListItem Value="Information Desk" Text="Information Desk" />
                        <asp:ListItem Value="Resturants" Text="Resturants" />
                        <asp:ListItem Value="Website" Text="Website" />
                        <asp:ListItem Value="Others" Text="Others" />
                    </asp:DropDownList></h5>
                    <asp:CompareValidator ID="cmv_ddlView2" runat="server" ControlToValidate="ddlView2_rdepartment" Text="<span style='color:red;'>* Required</span>" Operator="NotEqual"
                        ValueToCompare="Select the related department" SetFocusOnError="true" ValidationGroup="view2" />
                    <br /><br />

                    <h5>Subject<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView2_title" runat="server" Width="435px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_title_view2" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView2_title" SetFocusOnError="true" ValidationGroup="view2" />
                    <br /><br />

                    <h5>Explain the comment(s)<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView2_content" rows="8" Width="435px" runat="server" TextMode="MultiLine" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_content_view2" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView2_content" SetFocusOnError="true" ValidationGroup="view2" />
                    <br /><br />

                    <recaptcha:RecaptchaControl ID="recaptchaView2" runat="server" PublicKey="6LcsufASAAAAACB2TvJFuSlkbdD6LzNO_yeyuoy3" PrivateKey="6LcsufASAAAAAAyI1lWNyFtFPCFeAKqO5nk_4zGI"  Theme="clean" />
                    <br />
                    <asp:CustomValidator ID="cmv_recaptchaComm" runat="server" OnServerValidate ="recaptchaComm" ErrorMessage="<span style='color:red;'>*Please fill out the Recaptcha corectly</span>" ValidationGroup="view2" />
                    <br /><br />
                    
                    <asp:Button ID="btnView2_submit" runat="server" Text="Send" CommandName="InsertComm" OnCommand="sendData" CssClass="btn_function" ValidationGroup="view2" />
                    <asp:Button ID="btnView2_reset" runat="server" Text="Reset" CommandName="Cancel" OnCommand="sendData" CssClass="btn_function" />
                   
                </asp:View>
                                    <%------------ Appreciation Section /all defination of controls are as same as above---------------%>
                <asp:View ID="View3" runat="server">
                   <asp:HiddenField ID="hdfView3_section" runat="server" Value="appreciation"  />
                   <asp:Label ID="lblView3_title" runat="server" Text="<h1>Your Appreciation<h1>" /> 
                   <asp:Label ID="lblView3_explain"  runat="server" Text="<h5>Please fill out all the required fields(<span style='color:red;'>*</span>)</h5>" />
                    
                    <h5>Full Name:
                    <asp:TextBox ID="txtView3_fname" runat="server" Width="208px" /></h5>
                    <br /><br />
                    
                    <h5>Email<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView3_email" runat="server" Width="230px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_email_view3" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView3_email" SetFocusOnError="true" ValidationGroup="view3" />
                    <asp:RegularExpressionValidator ID="rev_email_view3" runat="server" Text="<span style='color:red;'>* Invalid Email</span>" 
                        ControlToValidate="txtView3_email" Display="Dynamic" ValidationGroup="view3"
                        ValidationExpression="^[0-9a-zA-Z]+([0-9a-zA-Z]*[-._+])*[0-9a-zA-Z]+@[0-9a-zA-Z]+([-.][0-9a-zA-Z]+)*([0-9a-zA-Z]*[.])[a-zA-Z]{2,6}$" />
                    <br /><br />

                    <h5>Related to<span style='color:red;'>*</span>:
                    <asp:DropDownList ID="ddlView3_rdepartment" runat="server" Width="200px">
                        <asp:ListItem Text="Select the related department" />
                        <asp:ListItem Value="Doctors" Text="Doctors" />
                        <asp:ListItem Value="Nurses" Text="Nurses" />
                        <asp:ListItem Value="Management" Text="Management" />
                        <asp:ListItem Value="Information Desk" Text="Information Desk" />
                        <asp:ListItem Value="Resturants" Text="Resturants" />
                        <asp:ListItem Value="Website" Text="Website" />
                        <asp:ListItem Value="Others" Text="Others" />
                    </asp:DropDownList></h5>
                    <asp:CompareValidator ID="cmv_ddlView3" runat="server" ControlToValidate="ddlView3_rdepartment" Text="<span style='color:red;'>* Required</span>" Operator="NotEqual"
                        ValueToCompare="Select the related department" SetFocusOnError="true" ValidationGroup="view3" />
                    <br /><br />

                    <h5>Subject<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView3_title" runat="server" Width="435px" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_title_view3" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView3_title" SetFocusOnError="true" ValidationGroup="view3" />
                    <br /><br />

                    <h5>Explain the case<span style='color:red;'>*</span>:
                    <asp:TextBox ID="txtView3_content" rows="8" Width="435px" runat="server" TextMode="MultiLine" /></h5>
                    <asp:RequiredFieldValidator ID="rfv_content_view3" runat="server" Text="<span style='color:red;'>* Required</span>" 
                        Display="Dynamic" ControlToValidate ="txtView3_content" SetFocusOnError="true" ValidationGroup="view3" />
                    <br /><br />

                    <recaptcha:RecaptchaControl ID="recaptchaView3" runat="server" PublicKey="6LcsufASAAAAACB2TvJFuSlkbdD6LzNO_yeyuoy3" PrivateKey="6LcsufASAAAAAAyI1lWNyFtFPCFeAKqO5nk_4zGI"  Theme="clean" />
                    <br />
                    <asp:CustomValidator ID="cmv_recaptchaApp" runat="server" OnServerValidate ="recaptchaApp" ErrorMessage="<span style='color:red;'>*Please fill out the Recaptcha corectly</span>" ValidationGroup="view3" />
                    <br /><br />
                    
                    <asp:Button ID="btnView3_submit" runat="server" Text="Send" CommandName="InsertApp" OnCommand="sendData" CssClass="btn_function" ValidationGroup="view3" />
                    <asp:Button ID="btnView3_reset" runat="server" Text="Reset" CommandName="Cancel" OnCommand="sendData" CssClass="btn_function" />
                   
                </asp:View>             
            </asp:MultiView> <%-- Close the MultiView Contorol --%>
        </div>

        <%-- This is the section of explanation for the feedback page for users--%>
        <div id="sideRight">
            <br />
            <h4>Dear Sir or Madam:</h4>
            <br />
            <p>
            On behalf of our management team and entire staff, thank you for choosing Nipigon District Memorial Hospital.</p>
            <p>what you think about our services is important to us. By your feedback, you are helping us to understand what we do well, 
            and what we need to focus on improving.</p>
            <p>We appreciate your time and valuable feedback in helping us make Nipigon 
            District Memorial Hospital better!
            </p>
            <p>Please pay attention that as a default you will send the comment. If you want to sent a complaint or appreciation, please change the navigation bar to the related page</p>
            <br />
            <h4>Sincerely;</h4>

        </div>
    </div>
</asp:Content>

