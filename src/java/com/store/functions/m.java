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
public class m extends HttpServlet {

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
                String q1 = request.getParameter("q1");
                String q2 = request.getParameter("q2");
                //String q3 = request.getParameter("q3");
                String q4 = request.getParameter("q4");
                
                String query = "UPDATE `item` SET `maintenance_date` = curdate() , `item_remarks` = ? WHERE `item_name` = ? AND `item_invoice_id` = ? ";
                        PreparedStatement ps2 = connection.prepareStatement(query);
                        //ps2.setString(1, q3);
                        ps2.setString(1, q4);
                        ps2.setString(2, q1);
                        ps2.setString(3, q2);
                        int x = ps2.executeUpdate();
                        if(x>0){
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Entry Noted!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                        }
                        else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Item / Invoice-ID not exists!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                        }



                    String query2 = "UPDATE `subitem` SET `maintenance_date` = ? , `item_remarks` = ? WHERE `subitem_name` = ? AND `subitem_invoice_id` = ? ";
                    PreparedStatement ps3 = connection.prepareStatement(query2);
                        ps3.setString(1, q3);
                        ps3.setString(2, q4);
                        ps3.setString(3, q1);
                        ps3.setString(4, q2);
                    int x1 = ps3.executeUpdate();
                        if(x1>0){
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Entry Noted!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                        }
                        else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Subitem / Invoice-ID not exists!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                        }
            }
            catch (Exception e) {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('"+e+"');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
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
