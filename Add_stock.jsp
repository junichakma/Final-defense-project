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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    </head>
    <%
        if (request.getParameter("Success") != null) {
    %>
    <script>alert('Prodect Added Successfully');</script>
    <%            }
    %>
    <script>
        var loadFile = function (event) {
            var reader = new FileReader();
            reader.onload = function () {
                var output = document.getElementById('output');
                output.src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        };
    </script>
    <style>
        #customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        #customers td, #customers th {
            border: 1px solid white;
            padding: 15px;
        }


        #customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #007bff;
            color: white;
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
                                        <a href="Add_stock.jsp" class="active nav-style">Add Stock</a>
                                    </li>
                                    <li>
                                        <a href="View_userorders.jsp" class="nav-style">View User Orders</a>
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
                    <li>Add Stock</li>
                </ul>
            </div>
        </div>
        <!-- //short-->
        <!--contact -->
        <%
            String id = (String) session.getAttribute("sid");
            String name = (String) session.getAttribute("sname");
            String email = (String) session.getAttribute("smail");
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            try {
                ResultSet rs = st1.executeQuery("SELECT * FROM oxygen_stock WHERE cid = '" + id + "' ");

                if (rs.next()) {

        %>

        <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
                <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Oxygen Cylinder Details</h3>
                <table id="customers" style="margin-right: 300px">
                    <thead>
                        <tr>
                            <th>Parameters</th>
                            <th>Details</th>
                        </tr>
                    </thead>

                    <tr>
                        <td><b>Image</b></td>
                        <td><img src="Getimage?id=<%=rs.getString("id")%>" width="300" height="250"></td>
                    </tr>
                    <tr>
                        <td><b>Water Capacity</b></td>
                        <td><%=rs.getString("water_cc")%>Litres</td>
                    </tr>
                    <tr>
                        <td><b>Working Pressure</b></td>
                        <td><%=rs.getString("working_pressure")%> Bar</td>
                    </tr>
                    <tr>
                        <td><b>Oxygen Purity</b></td>
                        <td><%=rs.getString("oxygen_purity")%>%</td>
                    </tr>
                    <tr>
                        <td><b>Gas Name</b></td>
                        <td><%=rs.getString("gas_name")%></td>
                    </tr>
                    <tr>
                        <td><b>Material</b></td>
                        <td><%=rs.getString("material")%></td>
                    </tr>
                    <tr>
                        <td><b>Country Of Origin</b></td>
                        <td><%=rs.getString("country_origin")%></td>
                    </tr>
                    <tr>
                        <td><b>Cylinder Height</b></td>
                        <td><%=rs.getString("cylinder_height")%></td>
                    </tr>
                    <tr>
                        <td><b>Gas Type</b></td>
                        <td><%=rs.getString("gas_type")%></td>
                    </tr>
                    <tr>
                        <td><b>Price (Per/Cylinder)</b></td>
                        <td>RS.<%=rs.getString("Price")%></td>
                    </tr>
                    <tr>
                        <td><b>Available Quantity</b></td>
                        <td><%=rs.getInt("quantity")%></td>
                    </tr>
                    <tr>
                        <td><b>Update Quantity</b></td>
                        <td><a href="update_quantity.jsp?sid=<%=rs.getString("id")%>&qn=<%=rs.getString("quantity")%>" class="btn btn-success btn-lg">Update</a></td>
                    </tr>
                </table>
            </div>
        </section>
        <%        } else {
        %>
        <section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
            <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
                <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">Add Stock</h3>
                <form action="add_stock" method="post" enctype="multipart/form-data">
                    <div class="row">
                        <div class="form-group contact-forms col-lg-6">
                            <label>Water Capacity (Litres) :</label>
                            <input type="text" class="form-control" name="water_cc" placeholder="Enter Water Capacity" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Working Pressure :</label>
                            <input type="text" class="form-control" name="working_pressure" placeholder="Enter Working Pressure" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Oxygen Purity (%) :</label>
                            <input type="text" class="form-control" name="oxygen_purity" placeholder="Enter Oxygen Purity" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Name Of Gas :</label>
                            <input type="text" class="form-control" name="gas_name" placeholder="Enter Gas Name" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Material :</label>
                            <input type="text" class="form-control" name="material" placeholder="Enter Material Name" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Country Of Origin :</label>
                            <input type="text" class="form-control" name="country_origin" placeholder="Enter Country Of Origin" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Cylinder Height :</label>
                            <input type="text" class="form-control" name="cylinder_height" placeholder="Enter Cylinder Height" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Gas Type :</label>
                            <input type="text" class="form-control" name="gas_type" placeholder="Enter Gas Type" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Cylinder Image :</label>
                            <input type="file" class="form-control" name="photo" accept="image/x-png,image/gif,image/jpeg" onchange="loadFile(event)" required="required" />
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Preview Image :</label>
                            <img id="output" src="#" width="130" height="100">
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Oxygen Cylinder Quantity :</label>
                            <input type="number" class="form-control" min='0' name="quantity" placeholder="Enter Quantity" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-6">
                            <label>Price (Per cylinder):</label>
                            <input type="number" class="form-control" min='0' name="price" placeholder="Enter Price" required=""><br>
                        </div>
                        <div class="form-group contact-forms col-lg-12">
                            <br><center><button type="submit" class="btn sent-butnn">Submit</button></center>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <%                                        }

            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
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
