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
    String cid = request.getParameter("cid");
    String msg = request.getParameter("msg");

    
    System.out.println("Company ID ==" + cid);

    String uid = (String) session.getAttribute("hid");
    String uname = (String) session.getAttribute("hname");
    String umail = (String) session.getAttribute("hmail");

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
        ResultSet rs = st1.executeQuery("SELECT * FROM oxygen_stock WHERE cid = '" + cid + "' ");

        if (rs.next()) {

            String company_name = rs.getString("company_name");
            System.out.println("Test print Supplier company_name ==" + company_name);
            String sql = "INSERT INTO message(uname, uid, umail, company_name, cid, msg, time) values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, uname);
            statement.setString(2, uid);
            statement.setString(3, umail);
            statement.setString(4, company_name);
            statement.setString(5, cid);
            statement.setString(6, msg);
            statement.setString(7, time);
            int row = statement.executeUpdate();
            if (row > 0) {
                System.out.println("success");
                response.sendRedirect("View_oxygens1.jsp?Message_sent");
            } else {
                System.out.println("failed");
                response.sendRedirect("View_oxygens1.jsp?Failed");

            }
        } else {
            System.out.println("failed");
            response.sendRedirect("View_oxygens1.jsp?Failed");

        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
