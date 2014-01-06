<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home_diplomacy.aspx.cs" Inherits="spletna_stran_faza4.home_dip" %>

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
	<script type ="text/javascript"  src ="js/make.js" ></script>

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <!--<script src="js/jquery-1.4.4.min.js" type="text/javascript"></script>-->
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        function drawChart() {





            var hf = document.getElementById("jason");
            var hfcharttype = document.getElementById("charttype");
            var response = $.parseJSON(hf.value);

            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Player name');
            data.addColumn('number', 'Scores');

            for (var i = 0; i < response.Table1.length; i++) {


                var row = new Array();
                row[0] = response.Table1[i].username;
                row[1] = parseInt(response.Table1[i].assetsSum);
                data.addRow(row);




            }


            var chart;
            if (hfcharttype.value == "1") {
                chart = new google.visualization.BarChart(document.getElementById('chart_div'));
            }
            else if (hfcharttype.value == "2") {
                chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
            }

            else if (hfcharttype.value == "3") {
                chart = new google.visualization.LineChart(document.getElementById('chart_div'));
            }

            else if (hfcharttype.value == "4") {
                chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            }


            chart.draw(data, {
                width: 600, height: 440, title: 'Top 100 players ranking',
                hAxis: { title: 'Player name', titleTextStyle: { color: 'red' } }
            });
        }
    </script>

    <script type="text/javascript">
        $(document).ready(drawChart);

    </script>
</head>

<body class="home diplomacy">
    <div id="outer">
    </div>
    <div id="page-container">
        <img title="tower top" id="tower-top" src="images/tower_top.png" alt="game navigation tower top" />
        <img title="tower bottom" id="tower-bottom" src="images/tower_bottom.png" alt="game navigation tower bottom" />
		<a id="music" target="_blank" href="music.html"><img title="play music" src="images/lyre.png" alt="play music" /></a>
        <header id="header">
            <h1><a href="home_buildings.html"><img title="logo" src="images/logo.png" alt="Vis Vires website logo" /></a></h1>
        </header>

        <nav id="navigation">
            <ul>
                <li id="home"><a href="home_buildings.html">Home</a>
                </li>
                <li id="help"><a href="help.html">Help</a>
                    <ul>
                        <li id="rules"><a href="rules.html">Rules</a></li>
                            <li id="guide"><a href="guide.html">Guide</a></li>
                                <li id="support"><a href="support.html">Support</a></li>
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

        <main id="game-container">
            <div id="info-bar">
                <div id="info-bar-top"></div>
                <div id="info-bar-middle">
                    <div id="info-bar-content">
                        <ul>
                            <li>100</li>
                            <li>100</li>
                            <li>100</li>
                            <li>100</li>
                            <li>100</li>
                        </ul>
                    </div>
                </div>
                <div id="info-bar-bottom"></div>
            </div>

            <nav id="game-navigation">
                <div id="game-navigation-top"></div>
                <div id="game-navigation-left"></div>
                <div id="game-navigation-content">
                    <ul>
                        <li id="map"><a href="home_map.html">Map</a>
                        </li>
                        <li id="economy"><a href="home_economy.html">Economy</a>
                        </li>
                        <li id="buildings"><a href="home_buildings.html">Buildings</a>
                        </li>
                        <li id="technology"><a href="home_technology.html">Technology</a>
                        </li>
                        <li id="army"><a href="home_army.html">Army</a>
                        </li>
                        <li id="market"><a href="home_market.aspx">Market</a>
                        </li>
                        <li id="diplomacy"><a href="home_diplomacy.aspx">Diplomacy</a>
                        </li>
                    </ul>
                </div>
                <div id="game-navigation-right"></div>
                <div id="game-navigation-bottom"></div>

                <div id="logout">
                    <ul>
                        <li id="gates"><a href="home.html">Gates</a>
                        </li>
                    </ul>
                </div>
            </nav>

            <div id="game-area">
                <div id="game-area-top"></div>
                <div id="game-area-middle">
                    <div id="game-area-content">
                        <h2>Diplomacy</h2>
                        <form id="form1" runat="server">
    
                            <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
    
                            <script type="text/javascript">
                                //<![CDATA[


                                if (typeof (Sys) != "undefined") {
                                    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
                                }
                                function EndRequestHandler(sender, args) {

                                    drawChart();


                                }



                                //]]>
                            </script>

    
                            <asp:UpdatePanel ID="updatepanel"  runat="server"><ContentTemplate>
                            <table >
                            <tr>
                            <td>Chart type</td><td><asp:DropDownList ID="charttypeddl" AutoPostBack="true" runat="server" 
                                    onselectedindexchanged="charttypeddl_SelectedIndexChanged">
                                <asp:ListItem Selected="True" Value="1">Column Chart</asp:ListItem>
                                <asp:ListItem Value="2">Pie Chart</asp:ListItem>
                                <asp:ListItem Value="3">Bar Chart</asp:ListItem>
                                    <asp:ListItem Value="4">Line Chart</asp:ListItem>
                                </asp:DropDownList> </td>
                            </tr>
                            </table>
                            <asp:HiddenField ID="jason" runat="server" />
                            <asp:HiddenField ID="charttype" Value="1" runat="server" />
                            <div id="chart_div">

                            </div>
    
                                </ContentTemplate></asp:UpdatePanel>
                        </form>                       
                    </div>
                </div>
                <div id="game-area-bottom"></div>
            </div>
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
