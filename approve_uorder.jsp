<%-- 
    Document   : user_signin
    Created on : 8 Jan, 2021, 12:44:12 PM
    Author     : JAVA-JP
--%>



<%@page import="Action.Mail"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String oid = request.getParameter("oid");

    System.out.println("Check Orded ID : " + oid);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement sto = con.createStatement();
    try {
        int i = sto.executeUpdate("UPDATE user_ordrs SET status='Approved' WHERE id='" + oid + "' ");
        if (i != 0) {
            ResultSet rs = st.executeQuery("SELECT * FROM user_ordrs where id='" + oid + "' ");
            if (rs.next()) {
                String mail = rs.getString("umail");
                String company_name = rs.getString("company_name");
                String msggg = "Your Oxygen Cylinder Order is Approved By " + company_name;
                Mail ma = new Mail();
                ma.secretMail(msggg, "Order_Approved", mail);
                String msg = "Order Approved" + msggg;
                System.out.println("success");

                response.sendRedirect("View_userorders.jsp?Order_Approved");
            } else {
                response.sendRedirect("View_userorders.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>