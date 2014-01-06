<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="spletna_stran_faza4.home" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title>Vis Vires</title>
    <meta charset="UTF-8">
	<meta name="application-name" content="Vis Vires" />
    <meta name="author" content="Matej Zrimsek" />
    <meta name="keywords" content="Webbrowser game, Vis Vires, Strategy" />
    <link rel="stylesheet" type="text/css" href="css/master.css" />
	<script src="js/jquery-1.10.2.js"></script>
		<script src="js/loadxmldoc.js"> 
</script>
	<script type ="text/javascript"  src ="js/translate.js" ></script>
	<script type="text/javascript" src ="js/flag.js" ></script>
	
	
</head>

<body class="home">
    <div id="outer">
    </div>
    <div id="page-container">
		<div id="header-content">
			<img title="tower-whole" id="tower-whole" src="images/tower_whole.png" alt="tower" />
			<a id="music" target="_blank" href="music.html"><img title="play music" src="images/lyre.png" alt="play music" /></a>
			<button id="language"></button>
			<canvas id="flag" height="151";></canvas>
		</div>
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
                <div id="book">
                    <div id="new_user">
                        <h2>Vis Vires
						</h2>
                        <p id="welcome_text">Vis Vires, which in latin stands for "force, power, strength, might and influence", is a webbrowser based strategy game based on medieval times.</p>
                        <a class="enter_button" href="register.aspx"><h3>Register now for free!</h3></a>
                    </div>

                    <div id="old_user">
                        <h2 class="login">
							Login
						</h2>
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red" Visible="False"></asp:Label>
                        <form id="form1" runat="server">
                            <p>
                                <label id="username"><strong><strong>User name:</strong></strong>
                                    <br>
                                    <asp:TextBox name="username"  size="25" ID="TextBox1" runat="server"></asp:TextBox>
                                </label>
                            </p>
                            <p>
                                <label id="password"><strong>Password:</strong> 
                                    <br>
                                    <asp:TextBox name="password" size="25" ID="TextBox2" runat="server"></asp:TextBox>
                                </label>
                            </p>
                            <p>
                                <label id="remember">
                                    <input name="cookie" type="checkbox" value="true">Remember me
                                </label>
                            </p>
                            <a class="login_button" href="home_buildings.html">
                                <div class="login"><asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click1"></asp:Button></div>
                            </a>
                        </form>

                    </div>
                </div>
            </div>
            <div id="enter-container-bottom"></div>
        </main>

        <div id="news">
            <div id="news-top"></div>
            <div id="news-middle">
                <div id="news-content">
                    <h2 id="news-header">News</h2>
                    <div class="news-section">
                        <span class="news-pic"> </span>
                        <strong>Oct 3,2013 13:36</strong>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada, erat in venenatis luctus, sem leo imperdiet diam, ac laoreet justo dolor et sapien.
                        </p>
                    </div>
                    <div class="news-section">
                        <span class="news-pic"> </span>
                        <strong>Oct 2,2013 15:08</strong>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada, erat in venenatis luctus, sem leo imperdiet diam, ac laoreet justo dolor et sapien.
                        </p>
                    </div>
                </div>
            </div>
            <div id="news-bottom"></div>
        </div>

        <footer id="footer">
            <div id="footer-top"></div>
            <div id="footer-middle">
                <div id="footer-content">
                    &#169; 2013 - 2014 &#167;
                    <a href="rules.html" id="terms_link">Terms of service</a>
                    &#167;
                    <a href="support.html" id="contact_link">Contact</a>
                </div>
            </div>
            <div id="footer-bottom"></div>
        </footer>

    </div>
    <div id="footer2">
    </div>
</body>

</html>