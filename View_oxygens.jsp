<%-- 
    Document   : index
    Created on : 4 May, 2021, 11:39:03 AM
    Author     : JAVA-JP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
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
                                        <a href="User_Home.jsp" class="nav-style">Home</a>
                                    </li>
                                    <li>
                                        <a href="View_oxygens.jsp" class="active nav-style">View Oxygen Cylinders</a>
                                    </li>
                                    <li>
                                        <a href="user_orders.jsp" class="nav-style">Your Orders</a>
                                    </li>
                                    <li>
                                        <a href="graph.jsp" class="nav-style">Graph</a>
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
                        <a href="User_Home.jsp">Home</a>
                        <span>/ /</span>
                    </li>
                    <li>View Oxygen Cylinders</li>
                </ul>
            </div>
        </div>
        <!-- //short-->
        <!--contact -->
        <section class="blog py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container py-lg-5 py-md-5 py-sm-4 py-3">
                <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">View Oxygen Cylinders</h3>
                <div class="row">
                    <%
                        Connection con = SQLconnection.getconnection();
                        Statement st = con.createStatement();
                        Statement st1 = con.createStatement();
                        try {
                            ResultSet rs = st.executeQuery("SELECT * FROM oxygen_stock ");
                            while (rs.next()) {

                    %>
                    <div class="col-lg-4 col-md-6 my-3">
                        <div class="blog-wthree-grids">
                            <img src="Getimage?id=<%=rs.getString("id")%>" alt="cylinder image" width="250" height="180">
                            <h4 class="mt-lg-5 mt-3">
                                <a href="OC_details.jsp?id=<%=rs.getString("id")%>"><%=rs.getString("company_name")%></a>
                            </h4>
                            <h5 class="mt-lg-5 mt-3">Available Quantity : <%=rs.getString("Quantity")%></h5>
                            <div class="row  mt-md-4 mt-3">
                                <div class="col-lg-12 col-12 outs_more-buttn">
                                    <a href="OC_details.jsp?id=<%=rs.getString("id")%>">More Details</a>&nbsp;&nbsp;&nbsp;
                                    <a href="message.jsp?cid=<%=rs.getString("cid")%>" style="background-color: red">Contact</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%                                        }

                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    %>
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
    </body>
</html>
