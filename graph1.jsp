<%-- 
    Document   : index
    Created on : 4 May, 2021, 11:39:03 AM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Online Oxygen Management System</title>
        <!--meta tags -->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="keywords" content="Cargoes Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
              Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <!--//meta tags ends here-->
        <!--booststrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
        <!--//booststrap end-->
        <!-- font-awesome icons -->
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <!-- //font-awesome icons -->
        <!--stylesheets-->
        <link href="css/style.css" rel='stylesheet' type='text/css' media="all">
        <!--//stylesheets-->
        <link href="//fonts.googleapis.com/css?family=Fira+Sans:400,500,600,700" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:400,600" rel="stylesheet">
    </head>
    <body>
        <div class="main-top" id="home">
            <!-- header -->
            <header>
                <div class="container-fluid">
                    <div class="header d-md-flex justify-content-between py-3 pl-2">
                        <!-- logo -->
                        <div id="logo">
                            <h1>
                                <a>Oxygen</a>
                            </h1>
                        </div>
                        <!-- //logo -->
                        <!-- nav -->
                        <div class="nav_main">
                            <nav>
                                <label for="drop" class="toggle">Menu</label>
                                <input type="checkbox" id="drop" />
                                <ul class="menu">
                                     <li>
                                        <a href="Hospital_Home.jsp" class="nav-style">Home</a>
                                    </li>
                                    <li>
                                        <a href="View_oxygens1.jsp" class="active nav-style">View Oxygen Cylinders</a>
                                    </li>
                                    <li>
                                        <a href="hospital_orders.jsp" class="nav-style">Your Orders</a>
                                    </li>
                                    <li>
                                        <a href="graph1.jsp" class="active nav-style">Graph</a>
                                    </li>
                                    <li>
                                        <a href="index.jsp" class="nav-style" style="color: red">Logout</a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                        <!-- //nav -->
                    </div>
                </div>
            </header>
            <!-- //header -->
            <!-- banner -->
            <div class="main-banner">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="style-banner ">
                                <br><br><br>
                                <h4 class="mb-2">Online Oxygen Management System</h4>
                            </div>
                        </div>
                        <div class="col-lg-6 left-banner">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //banner -->
        <div class="using-border py-3">
            <div class="inner_breadcrumb  ml-4">
                <ul class="short_ls">
                    <li>
                        <a href="Hospital_Home.jsp">Home</a>
                        <span>/ /</span>
                    </li>
                    <li>Graph</li>
                </ul>
            </div>
        </div>
        <!-- //short-->
        <!--contact -->
        <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
                <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Graph</h3>
                <div class="row">
                    <div class="col-lg-12">
                        <%
                            Gson gsonObj = new Gson();
                            Map<Object, Object> map = null;
                            List<Map<Object, Object>> list = new ArrayList<Map<Object, Object>>();
                            String dataPoints = null;

                            try {

                                Connection connection = SQLconnection.getconnection();
                                Statement statement = connection.createStatement();
                                String xVal, yVal;

                                ResultSet resultSet = statement.executeQuery("SELECT company_name,quantity FROM oxygen_stock");

                                while (resultSet.next()) {
                                    xVal = (resultSet.getString("company_name")+":");
                                    yVal = resultSet.getString("quantity");
                                    map = new HashMap<Object, Object>();
                                    map.put("label", xVal);
                                    map.put("y", yVal);
                                    list.add(map);
                                    dataPoints = gsonObj.toJson(list);
                                }
                                System.out.println(dataPoints);
                            } catch (SQLException e) {
                                System.out.println(e);
                                out.println("<div  style='width: 50%; margin-left: auto; margin-right: auto; margin-top: 200px;'>Could not connect to the database. Please check if you have mySQL Connector installed on the machine - if not, try installing the same.</div>");
                                dataPoints = null;
                            }
                        %>
                        <script type="text/javascript">
                            window.onload = function () {


                                var chart = new CanvasJS.Chart("chartContainer", {
                                    animationEnabled: true,

                                    title: {
                                        text: "Available Quantity"
                                    },
                                    data: [{
                                            type: "pie",
                                            radius: "200%",
                                            showInLegend: true,
                                            legendText: "{label}",
                                            toolTipContent: "{label}: <strong>{y}</strong>",
                                            indexLabel: "{label} {y}",
                                            dataPoints: <%out.print(dataPoints);%>
                                        }]
                                });

                                chart.render();

                            }
                        </script>
                        <div  id="chartContainer" style="height: 500px; width: 100%; margin-right: 150px"></div>
                    </div>
                </div>
            </div>
        </section>
        <!-- footer -->
        <footer class="py-lg-4 py-3">
            <div class="bottom-footer text-center">
                <p>
                    © 2021
                </p>
            </div>
        </footer>
        
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                            $(document).ready(function () {
                                // navigation click actions 
                                $('.scroll-link').on('click', function (event) {
                                    event.preventDefault();
                                    var sectionID = $(this).attr("data-id");
                                    scrollToID('#' + sectionID, 750);
                                });
                                // scroll to top action
                                $('.scroll-top').on('click', function (event) {
                                    event.preventDefault();
                                    $('html, body').animate({scrollTop: 0}, 'slow');
                                });
                                // mobile nav toggle
                                $('#nav-toggle').on('click', function (event) {
                                    event.preventDefault();
                                    $('#main-nav').toggleClass("open");
                                });
                            });
                            // scroll function
                            function scrollToID(id, speed) {
                                var offSet = 0;
                                var targetOffset = $(id).offset().top - offSet;
                                var mainNav = $('#main-nav');
                                $('html,body').animate({scrollTop: targetOffset}, speed);
                                if (mainNav.hasClass("open")) {
                                    mainNav.css("height", "1px").removeClass("in").addClass("collapse");
                                    mainNav.removeClass("open");
                                }
                            }
                            if (typeof console === "undefined") {
                                console = {
                                    log: function () { }
                                };
                            }
        </script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </body>
</html>
