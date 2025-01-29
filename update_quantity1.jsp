<%-- 
    Document   : set_attribute
    Created on : Sep 29, 2020, 2:15:45 PM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String sid = request.getParameter("sid");
    String qn = request.getParameter("qn");
    String quantity = request.getParameter("quantity");
    
    int qn1 = Integer.parseInt(qn);
    int quantity1 = Integer.parseInt(quantity);
    int amtt = quantity1 + qn1;

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("UPDATE oxygen_stock SET quantity='"+ amtt +"' WHERE cid='" + sid + "' ");
        System.out.println("Test print Supplier Id ==" + sid);
        if (i != 0) {
            System.out.println("success");
            response.sendRedirect("Add_stock.jsp?Quantity_updated");
        } else {
            System.out.println("failed");
            response.sendRedirect("Add_stock.jsp?Failed");

        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
