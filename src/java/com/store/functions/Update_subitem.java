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
public class Update_subitem extends HttpServlet {

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
            try{
                String subitem_name = request.getParameter("update_sub-item_sub-name");
                String subitem_description = request.getParameter("update_sub-item_description");
                String alloted_to_name = request.getParameter("update_sub-item_alloted_to");
                String placed_at = request.getParameter("update_sub-item_placed-at");
                String incharge_name = request.getParameter("update_sub-item_incharge_name");
                String remarks = request.getParameter("update_sub-item_remarks");
                
                String q1= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                PreparedStatement ps = connection.prepareStatement(q1);
                ps.setString(1, alloted_to_name);
                
                ResultSet rs1 = ps.executeQuery();
                if(rs1.next()) {
                    String update_alloted_to_staff_id = rs1.getString(1);
                    
                    String q2= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                    PreparedStatement ps2 = connection.prepareStatement(q2);
                    ps2.setString(1, incharge_name);
                    ResultSet rs2 = ps2.executeQuery();
                    if(rs2.next()) {
                        String update_incharge_name_staff_id = rs2.getString(1);
                        
                        String q3 = "UPDATE `subitem` "                                                
                                             + "SET `subitem_description` = ? , `subitem_alloted_to` = ? , `subitem_placed_at` = ? , `subitem_incharge_id` = ? , `subitem_remarks` = ? WHERE `subitem_name` = ? ;";
                                        PreparedStatement ps3 = connection.prepareStatement(q3);
                                        ps3.setString(1, subitem_description);  
                                        ps3.setString(2, update_alloted_to_staff_id);
                                        ps3.setString(3, placed_at);            
                                        ps3.setString(4, update_incharge_name_staff_id);
                                        ps3.setString(5, remarks);
                                        ps3.setString(6, subitem_name);
                                        int x = ps3.executeUpdate();
                                        if(x>0){
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('Sub-Item Successfully Updated!!');");
                                            out.println("window.location='store/Home_store.jsp#item';");
                                            out.println("</script>");
                                        }
                                        else{
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('Sub-Item could NOT be Updated!!');");
                                            out.println("window.location='store/Home_store.jsp#item';");
                                            out.println("</script>");
                                        }
                    }
                    else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Incharge Name is NOT valid!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                    }
                }
                else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Alloted_to name is NOT valid!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                }
                
            } catch (Exception e) {
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
