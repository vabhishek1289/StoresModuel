/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.store.functions;

import com.store.utility.SQLConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Abhi
 */
public class scan_bills extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            Connection connection = SQLConnection.createConnection();
            try {
                String bill_name = request.getParameter("bill_name");
                String date_of_bill_scan = request.getParameter("date_of_bill_scan");
                String from_bill = request.getParameter("from_bill");
                String to_bill = request.getParameter("to_bill");
                String image_name = request.getParameter("image_name");
                String scan_bill_description = request.getParameter("scan_bill_description");
                String scanned_by = request.getParameter("scanned_by");
                
                String q= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                PreparedStatement ps = connection.prepareStatement(q);
                ps.setString(1, scanned_by);
                ResultSet rs;
                rs = ps.executeQuery();
                if(rs.next()){
                    String scanned_by_staff_id = rs.getString(1);
                    String q2 = "INSERT INTO `bill` VALUES ( ? , ? , ? , ? , ? , ? , ? );";
                    ps = connection.prepareStatement(q2);
                    ps.setString(1, bill_name);
                    ps.setString(2, date_of_bill_scan);
                    ps.setString(3, from_bill);
                    ps.setString(4, to_bill);
                    ps.setString(5, image_name);
                    ps.setString(6, scan_bill_description);
                    ps.setString(7, scanned_by_staff_id);
                    int x = ps.executeUpdate();
                    if(x>0){
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Bill successfully Scanned!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                            //out.println("<script>alert('Item Successfully Added!!');</script>");
                        }
                    else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Bill could NOT be Added!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                            //out.println("<script>alert('Item could NOT be Added!!');</script>");
                        }
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Scanned-By name is not valid!!!!');");
                    out.println("window.location='store/Home_store.jsp#item';");
                    out.println("</script>");//Scanned By name is not valid!!
                }
            }catch (Exception e) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('"+e+"');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                //out.println("<h1>This is an error\n"+e+"</h1>");
                //response.sendRedirect("bookshelf/login.html");
            }
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
