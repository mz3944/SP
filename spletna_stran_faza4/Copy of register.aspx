<%@ Page Language="C#" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<script runat="server">

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            lblmsg.Text = "Thank You";
        }
        else
        {
            lblmsg.Text = "Fill up all the fields";
        }
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Vis Vires</title>
    <meta charset="UTF-8">
	<meta name="application-name" content="Vis Vires" />
    <meta name="author" content="Matej Zrimsek" />
    <meta name="keywords" content="Webbrowser game, Vis Vires, Strategy" />
    <link rel="stylesheet" type="text/css" href="css/master.css" />
	<script type = "text/javascript"  src = "js/change.js" >
    </script>
</head>
<body>
    <div id="outer">
    </div>
    <div id="page-container">
        <img title="tower-whole" id="tower-whole" src="images/tower_whole.png" alt="tower" />
		<a id="music" target="_blank" href="music.html"><img title="play music" src="images/lyre.png" alt="play music" /></a>
        <header id="header">
            <h1><a href="home.html"><img title="logo" src="images/logo.png" alt="Vis Vires" /></a></h1> 
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
                        <table style="width: 66%;">
                        <tr>
                        <td class="style1" colspan="3" align="center">
                        <asp:Label ID="lblmsg" 
                                   Text="President Election Form : Choose your president" 
                                   runat="server" />
                        </td>
                        </tr>
                        <tr>
                        <td class="style3">
                        Candidate:
                        </td>
                        <td class="style2">
                        <asp:DropDownList ID="ddlcandidate" runat="server" style="width:239px">
                        <asp:ListItem>Please Choose a Candidate</asp:ListItem>
                        <asp:ListItem>M H Kabir</asp:ListItem>
                        <asp:ListItem>Steve Taylor</asp:ListItem>
                        <asp:ListItem>John Abraham</asp:ListItem>
                        <asp:ListItem>Venus Williams</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvcandidate" 
                               runat="server" ControlToValidate ="ddlcandidate"
                               ErrorMessage="Please choose a candidate" 
                               InitialValue="Please choose a candidate">
                        </asp:RequiredFieldValidator>
                        </td>
                        </tr>
                        <tr>
                        <td class="style3">
                        House:</td>
                        <td class="style2">
                        <asp:RadioButtonList ID="rblhouse" 
                              runat="server" 
                              RepeatLayout="Flow">
                        <asp:ListItem>Red</asp:ListItem>
                        <asp:ListItem>Blue</asp:ListItem>
                        <asp:ListItem>Yellow</asp:ListItem>
                        <asp:ListItem>Green</asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
                        <td>
                        <asp:RequiredFieldValidator ID="rfvhouse" 
                               runat="server" 
                               ControlToValidate="rblhouse" 
                               ErrorMessage="Enter your house name">
                        </asp:RequiredFieldValidator>
                        <br />
                        </td>
                        </tr>
                        <tr>
                        <td class="style3">
                        Class:</td>
                        <td class="style2">
                        <asp:TextBox ID="txtclass" runat="server"></asp:TextBox>
                        </td>
                        <td>
                        <asp:RangeValidator ID="rvclass" 
                               runat="server" ControlToValidate="txtclass" 
                               ErrorMessage="Enter your class (6 - 12)" MaximumValue="12" 
                               MinimumValue="6" Type="Integer">
                        </asp:RangeValidator>
                        </td>
                        </tr>
                        <tr>
                        <td class="style3">
                        Email:</td>
                        <td class="style2">
                        <asp:TextBox ID="txtemail" runat="server" style="width:250px">
                        </asp:TextBox>
                        </td>
                        <td>
                        <asp:RegularExpressionValidator ID="remail" 
                              runat="server" 
                              ControlToValidate="txtemail" ErrorMessage="Enter your email" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                        </asp:RegularExpressionValidator>
                        </td>
                        </tr>
                        <tr>
                        <td class="style3" align="center" colspan="3">
                        <asp:Button ID="btnsubmit" runat="server" onclick="btnsubmit_Click" 
                        style="text-align: center; width:140px" Text="Submit" />
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
