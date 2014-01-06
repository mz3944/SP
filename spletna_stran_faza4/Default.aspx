<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Vis Vires</title>
    <meta charset="UTF-8">
    <meta name="application-name" content="Vis Vires" />
    <meta name="author" content="Matej Zrimsek" />
    <meta name="keywords" content="Webbrowser game, Vis Vires, Strategy" />
    <link rel="stylesheet" type="text/css" href="css/master.css" />
    <script type="text/javascript" src="js/change.js">
    </script>
</head>
<body>
    <div id="outer">
    </div>
    <div id="page-container">
        <img title="tower-whole" id="tower-whole" src="images/tower_whole.png" alt="tower" />
        <a id="music" target="_blank" href="music.html">
            <img title="play music" src="images/lyre.png" alt="play music" /></a>
        <header id="header">
            <h1><a href="home.html">
                <img title="logo" src="images/logo.png" alt="Vis Vires" /></a></h1>
        </header>

        <nav id="navigation">
            <ul>
                <li id="home"><a href="home.html">Home</a>
                </li>
                <li id="help"><a href="help.html">Help</a>
                    <ul>
                        <li id="rules"><a href="rules.html">Rules</a>
                            <li id="guide"><a href="guide.html">Guide</a>
                                <li id="support"><a href="support.html">Support</a>
                    </ul>
                </li>
                <li id="gallery"><a href="gallery.html">Gallery</a>
                </li>
                <li id="account"><a href="account.html">Account</a>
                </li>
                <li id="about"><a href="about.html">About</a>
                </li>
            </ul>
        </nav>

        <main id="enter-container">
            <div id="enter-container-top"></div>
            <div id="enter-container-middle1">
                <div id="enter-container-content">
                    <h2>Register</h2>
                        <form id="form1" runat="server">
                            <table style="/*width: 90%;*/" align="center">
                                <tr style="height:80px">
                                    <td class="style1" colspan="3" align="center">
                                        <asp:Label ID="lblmsg" 
                                               Text="Please fill the form:"
                                               Font-Size="12pt" 
                                               Font-Bold="true"
                                               runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3"  style="width:140px">
                                        Name:
                                    </td>
                                    <td class="style2">
                                        <asp:TextBox ID="TextBox1" runat="server" style="width:130px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                               runat="server" ControlToValidate ="TextBox1" ForeColor="Red"
                                               ErrorMessage="You need to enter your name!">
                                        </asp:RequiredFieldValidator>
                                        <br/>
                                        <asp:CustomValidator id="CustomValidator1"
                                           ControlToValidate="TextBox1"
                                           Display="Static"
                                           ErrorMessage="Not a valid name!"
                                           ForeColor="red"
                                           Font-Names="verdana" 
                                           Font-Size="10pt"
                                           OnServerValidate="NameValidation"
                                           runat="server"/>
                                        <!--<asp:RegularExpressionValidator ID="regExTextBox1" runat="server" 
                                           ControlToValidate="TextBox1"
                                           ErrorMessage="Length of name must be between 3-30!"
                                           ForeColor="Red"
                                           ValidationExpression="^[\s\S]{3,30}$" />
                                        <br/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                           ControlToValidate="TextBox1" ErrorMessage="Only alphabets are allowed!"
                                           ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"  > </asp:RegularExpressionValidator> -->                                      
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Surname:
                                    </td>
                                    <td class="style2">
                                        <asp:TextBox ID="TextBox2" runat="server" style="width:130px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" 
                                               runat="server" ControlToValidate ="TextBox2" ForeColor="Red"
                                               ErrorMessage="You need to enter your surname!">
                                        </asp:RequiredFieldValidator>
                                        <br/>
                                        <asp:CustomValidator id="CustomValidator2"
                                           ControlToValidate="TextBox2"
                                           Display="Static"
                                           ErrorMessage="Not a valid name!"
                                           ForeColor="red"
                                           Font-Names="verdana" 
                                           Font-Size="10pt"
                                           OnServerValidate="SurnameValidation"
                                           runat="server"/>
                                        <!-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                           ControlToValidate="TextBox2"
                                           ErrorMessage="Length of surname must be between 3-30!"
                                           ForeColor="Red"
                                           ValidationExpression="^[\s\S]{3,30}$" />
                                        <br/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                           ControlToValidate="TextBox2" ErrorMessage="Only alphabets are allowed!"
                                           ForeColor="Red" ValidationExpression="^[a-zA-Z ]+$"  > </asp:RegularExpressionValidator> -->
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                    Email:</td>
                                    <td class="style2">
                                    <asp:TextBox ID="txtemail" runat="server" style="width:130px">
                                    </asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                                               runat="server" ControlToValidate ="txtemail" ForeColor="Red"
                                               ErrorMessage="You need to enter your email!">
                                        </asp:RequiredFieldValidator>
                                        <br/>
                                        <asp:RegularExpressionValidator ID="remail" 
                                              runat="server" 
                                              ControlToValidate="txtemail" ErrorMessage="Not a valid email!" ForeColor="Red"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </asp:RegularExpressionValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Username:
                                    </td>
                                    <td class="style2">
                                        <asp:TextBox ID="TextBox3" runat="server" style="width:130px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" 
                                               runat="server" ControlToValidate ="TextBox3" ForeColor="Red"
                                               ErrorMessage="You need to enter username!">
                                        </asp:RequiredFieldValidator>
                                        <br/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                                           ControlToValidate="TextBox3"
                                           ErrorMessage="Length of username must be between 3-30!"
                                           ForeColor="Red"
                                           ValidationExpression="^[\s\S]{3,30}$" />
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Password:
                                    </td>
                                    <td class="style2">
                                        <asp:TextBox ID="TextBox4" TextMode="password" runat="server" style="width:130px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" 
                                               runat="server" ControlToValidate ="TextBox4" ForeColor="Red"
                                               ErrorMessage="You need to enter password!">
                                        </asp:RequiredFieldValidator>
                                        <br/>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" 
                                           ControlToValidate="TextBox4"
                                           ErrorMessage="Length of password must be between 8-30!"
                                           ForeColor="Red"
                                           ValidationExpression="^[\s\S]{8,30}$" />
                                        <br/>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Confirm password:
                                    </td>
                                    <td class="style2">
                                        <asp:TextBox ID="TextBox5" TextMode="password" runat="server" style="width:130px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" 
                                               runat="server" ControlToValidate ="TextBox5" ForeColor="Red"
                                               ErrorMessage="You need to reenter password!">
                                        </asp:RequiredFieldValidator>
                                        <br/>
                                        <asp:CompareValidator ID="CompareValidator1" runat="server" 
                                            ControlToValidate="TextBox5"
                                            ControlToCompare="TextBox4"
                                            ForeColor="Red"
                                            ErrorMessage="Password must be the same as above!" 
                                            ToolTip="Reenter password." />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Which browser are you currently using?
                                    </td>
                                    <td class="style2">
                                        <asp:DropDownList ID="ddlcandidate" runat="server" style="width:135px">
                                        <asp:ListItem>Please select one</asp:ListItem>
                                        <asp:ListItem>Mozilla Firefox</asp:ListItem>
                                        <asp:ListItem>Google Chrome</asp:ListItem>
                                        <asp:ListItem>Internet Explorer</asp:ListItem>
                                        <asp:ListItem>Safari</asp:ListItem>
                                        <asp:ListItem>Opera</asp:ListItem>
                                        <asp:ListItem>Other</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:RequiredFieldValidator ID="rfvcandidate" 
                                               runat="server" ControlToValidate ="ddlcandidate" ForeColor="Red"
                                               ErrorMessage="You need to select a browser!" 
                                               InitialValue="Please select one">
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3">
                                        Telephone:
                                    </td>
                                    <td class="style2">
                                        <asp:TextBox ID="TextBox6" runat="server" style="width:130px" ></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator10" runat="server" 
                                           ControlToValidate="TextBox6"
                                           ErrorMessage="Wrong format for telephone number!"
                                           ForeColor="Red"
                                           ValidationExpression="^[0-9-+ ]+$" />
                                    </td>
                                </tr>
                                <tr style="height:80px">
                                    <td class="style3" align="center" colspan="3">
                                        <asp:Button ID="btnsubmit" runat="server" onclick="btnsubmit_Click" 
                                        style="text-align: center; width:100px" Text="Submit" />
                                    </td>
                                </tr>
                            </table>
                            <asp:ValidationSummary ID="ValidationSummary1" 
                                  runat="server" 
                                  DisplayMode ="BulletList" 
                                  ShowSummary ="true"
                                  HeaderText="Errors:" />
                        </form>
                </div>
            </div>
            <div id="enter-container-bottom"></div>
        </main>

        <footer id="footer">
            <div id="footer-top"></div>
            <div id="footer-middle">
                <div id="footer-content">
                    &#169; 2013 - 2014 &#167;
                    <a href="rules.html">Terms of service</a>
                    &#167;
                    <a href="support.html">Contact</a>
                </div>
            </div>
            <div id="footer-bottom"></div>
        </footer>

    </div>
    <div id="footer2">
    </div>
</body>

</html>
<%--  --%>
