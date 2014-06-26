<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>


<asp:Content ID="Content5" ContentPlaceHolderID="cph_section" Runat="Server">
    <asp:Login ID="lgn_main" runat="server" DisplayRememberMe="false" ValidatorTextStyle-ForeColor="Red" DestinationPageUrl="~/index.aspx" />
    <br />
    <asp:Label ID="lbl_notuser" runat="server" Text="Not a user? Sign up now!" />
    <br />
    <br />
    <asp:CreateUserWizard ID="cuw_main" runat="server" OnCreatedUser="cuw_main_CreatedUser" NavigationButtonStyle-CssClass="centeralign" ContinueDestinationPageUrl="~/index.aspx">
        <WizardSteps>
            <asp:WizardStep>
                
                <table border="0" style="font-size: 100%; font-family: Verdana" id="TABLE1" >
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_firstName" runat="server" AssociatedControlID="txt_firstName" Text="First Name: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_firstName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_firstName" runat="server" ControlToValidate="txt_firstName" Text="*" Display="Dynamic" CssClass="validatefail" />
                        </td>
                    </tr>
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_lastName" runat="server" AssociatedControlID="txt_lastName" Text="Last Name: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_lastName" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_lastName" runat="server" ControlToValidate="txt_LastName" Text="*" Display="Dynamic" CssClass="validatefail" />
                        </td>
                    </tr>
                    <tr>
                        <td class="alignright">
                            <asp:Label ID="lbl_phone" runat="server" AssociatedControlID="txt_phone" Text="Phone: " /> 
                        </td>
                        <td>
                            <asp:TextBox ID="txt_phone" runat="server" />
                            <asp:RequiredFieldValidator ID="rfv_phone" runat="server" ControlToValidate="txt_phone" Text="*" Display="Dynamic" CssClass="validatefail" />
                            <br /><asp:RegularExpressionValidator ID="rev_phone" runat="server" ControlToValidate="txt_phone" Text="Invalid phone number" Display="Dynamic" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" CssClass="validatefail" />
                        </td>
                    </tr>
                </table>
            </asp:WizardStep>
            <asp:CreateUserWizardStep Title="">
                <CustomNavigationTemplate>
                  <table>
                      <tr>
                        <td>
                          <asp:Button ID="StepPreviousButton" runat="server" 
                                         CommandName="MovePrevious" Text="Previous" CausesValidation="false" />
                          <asp:Button ID="StepNextButton" runat="server" 
                                         CommandName="MoveNext" Text="Create User"
                                         ValidationGroup="CreateUserWizard1" />
                        </td>
                      </tr>
                  </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
