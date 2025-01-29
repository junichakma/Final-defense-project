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
    <%
        if (request.getParameter("Order_Approved") != null) {
    %>
    <script>alert('Order Approved Successfully');</script>
    <%            }
    %>
    <style>

        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 18px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td{
            border: 2px solid black;
            align:"left";  cellpadding:"0"; cellspacing:"2";
            padding: 15px;
        }

        #customers th {
            border: 2px solid black;
            padding: 15px; 
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #1DA1F2;
            text-transform: uppercase;
        }
    </style>
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
                                        <a href="Supplier_Home.jsp" class="nav-style">Home</a>
                                    </li>
                                    <li>
                                        <a href="Add_stock.jsp" class="nav-style">Add Stock</a>
                                    </li>
                                    <li>
                                        <a href="View_userorders.jsp" class="active nav-style">View User Orders</a>
                                    </li>
                                    <li>
                                        <a href="View_hospitalorders.jsp" class="nav-style">View Hospital Orders</a>
                                    </li>
                                    <li>
                                        <a href="View_message.jsp" class="nav-style" style="color: black">Messages</a>
                                    </li>
                                    <li>
                                        <a href="index.jsp" class="nav-style" style="color: black">Logout</a>
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
                        <a href="Supplier_Home.jsp">Home</a>
                        <span>/ /</span>
                    </li>
                    <li>View User Orders</li>
                </ul>
            </div>
        </div>
        <!-- //short-->
        <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
                <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">View User Orders</h3>
                <div class="row">
                    <div class="col-lg-12">
                        <table id="customers" style="margin-right: 300px">
                            <thead>
                                <tr>
                                    <th>User Name</th>
                                    <th>Ordered Quantity</th>
                                    <th>Total Amount</th>
                                    <th>Ordered Time</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <%
                                String id = (String) session.getAttribute("sid");
                                String name = (String) session.getAttribute("sname");
                                String email = (String) session.getAttribute("smail");
                                Connection con = SQLconnection.getconnection();
                                Statement st = con.createStatement();
                                try {
                                    ResultSet rs = st.executeQuery("SELECT * FROM user_ordrs WHERE cid ='"+ id +"' ");

                                    while (rs.next()) {
                            %>
                            <tr>
                                <td><%=rs.getString("uname")%></td>
                                <td><%=rs.getString("quantity")%></td>
                                <td><%=rs.getString("total_price")%></td>
                                <td><%=rs.getString("time")%></td>
                                <td><%=rs.getString("status")%></td>
                                <td><a href="approve_uorder.jsp?oid=<%=rs.getString("id")%>" class="btn btn-success btn-lg">Approve</a></td>
                            </tr>
                            <%                                        }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                        </table>
                        <br><br>
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
    </body>
</html>
