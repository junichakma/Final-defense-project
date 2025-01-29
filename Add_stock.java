/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Action;

import DBconnection.SQLconnection;
import com.oreilly.servlet.MultipartRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author nadanapathy
 */
@WebServlet("/add_stock")
@MultipartConfig(maxFileSize = 16177215)
public class Add_stock extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String water_cc = request.getParameter("water_cc");
        String working_pressure = request.getParameter("working_pressure");
        String oxygen_purity = request.getParameter("oxygen_purity");
        String gas_name = request.getParameter("gas_name");
        String material = request.getParameter("material");
        String country_origin = request.getParameter("country_origin");
        String cylinder_height = request.getParameter("cylinder_height");
        String gas_type = request.getParameter("gas_type");
        String qn = request.getParameter("quantity");
        String price = request.getParameter("price");
        int quantity = Integer.parseInt(qn);
        InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            inputStream = filePart.getInputStream();
        }

        HttpSession user = request.getSession(true);
        String company_name = user.getAttribute("sname").toString();
        String cid = user.getAttribute("sid").toString();
        String cmail = user.getAttribute("smail").toString();
        Connection conn = SQLconnection.getconnection();

        try {
            Statement st = conn.createStatement();
            Statement st1 = conn.createStatement();
            String sql = "INSERT INTO oxygen_stock(water_cc, working_pressure, oxygen_purity, gas_name, material, country_origin, cylinder_height, gas_type, company_name, cid, quantity, price, photo) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, water_cc);
            statement.setString(2, working_pressure);
            statement.setString(3, oxygen_purity);
            statement.setString(4, gas_name);
            statement.setString(5, material);
            statement.setString(6, country_origin);
            statement.setString(7, cylinder_height);
            statement.setString(8, gas_type);
            statement.setString(9, company_name);
            statement.setString(10, cid);
            statement.setInt(11, quantity);
            statement.setString(12, price);

            if (inputStream != null) {
                statement.setBlob(13, inputStream);
            }
            int row = statement.executeUpdate();
            if (row > 0) {
                response.sendRedirect("Add_stock.jsp?Success");
            } else {
                response.sendRedirect("Add_stock.jsp?Upload_failed");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (Exception e) {
            out.println(e);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
