<%-- 
    Document   : set_attribute
    Created on : Sep 29, 2020, 2:15:45 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    String qn = request.getParameter("qn");
    String quantity = request.getParameter("quantity");
    String tprice = request.getParameter("tprice");

    int qn1 = Integer.parseInt(qn);
    int quantity1 = Integer.parseInt(quantity);
    int amtt = qn1 - quantity1;
    System.out.println("Test quantity ==" + amtt);

    String uid = (String) session.getAttribute("uid");
    String uname = (String) session.getAttribute("uname");
    String umail = (String) session.getAttribute("umail");

    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();
    String time = dateFormat.format(date);
    System.out.println("Date and Time : " + time);

    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();
    st1 = conn.createStatement();

    try {
        System.out.println("Test print Supplier Id ==" + id);
        ResultSet rs = st1.executeQuery("SELECT * FROM oxygen_stock WHERE id = '" + id + "' ");

        if (rs.next()) {

            String company_name = rs.getString("company_name");
            String cid = rs.getString("cid");
            System.out.println("Test print Supplier company_name ==" + company_name);
            String sql = "INSERT INTO user_ordrs(uname, uid, umail, company_name, cid, quantity, total_price, time) values (?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, uname);
            statement.setString(2, uid);
            statement.setString(3, umail);
            statement.setString(4, company_name);
            statement.setString(5, cid);
            statement.setString(6, quantity);
            statement.setString(7, tprice);
            statement.setString(8, time);
            int row = statement.executeUpdate();
            if (row > 0) {
                int i = sto.executeUpdate("UPDATE oxygen_stock SET quantity='" + amtt + "' WHERE id='" + id + "' ");
                System.out.println("success");
                response.sendRedirect("View_oxygens.jsp?Ordered_sent");
            } else {
                System.out.println("failed");
                response.sendRedirect("View_oxygens.jsp?Failed");

            }
        } else {
            System.out.println("failed");
            response.sendRedirect("View_oxygens.jsp?Failed");

        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
