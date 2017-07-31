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
public class Add_sub_item extends HttpServlet {

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
                String sub_item_name = request.getParameter("sub_item_name");
                String sub_item_sub_name = request.getParameter("sub_item_sub_name");
                String sub_item_manufacturer_name = request.getParameter("sub_item_manufacturer_name");
                String sub_item_invoice_id = request.getParameter("sub_item_invoice_id");
                String sub_item_description = request.getParameter("sub_item_description");
                String sub_item_alloted_to = request.getParameter("sub_item_alloted_to");
                String sub_item_placed_at = request.getParameter("sub_item_placed_at");
                String sub_item_incharge_name = request.getParameter("sub_item_incharge_name");
                String sub_item_remarks = request.getParameter("sub_item_remarks");
                    
                String sub_item_id = sub_item_sub_name+"_"+sub_item_invoice_id;
                
                String q= "SELECT `item_id`,`item_yorn` FROM `item` WHERE `item_name`= ? ;";
                PreparedStatement ps = connection.prepareStatement(q);
                ps.setString(1, sub_item_name);
                ResultSet rs;
                rs = ps.executeQuery();
                if(rs.next()){
                    String sub_item_name_item_id = rs.getString(1);
                    int item_yes_no = rs.getInt(2);
                    
                    if(item_yes_no == 1){
                        String q1= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                        ps = connection.prepareStatement(q1);
                        ps.setString(1, sub_item_alloted_to);
                        rs = ps.executeQuery();
                        if(rs.next()){
                            String sub_item_alloted_to_staff_id = rs.getString(1);
                            
                            String q2= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                            ps = connection.prepareStatement(q2);
                            ps.setString(1, sub_item_incharge_name);
                            rs = ps.executeQuery();
                            if(rs.next()){
                                
                                String sub_item_incharge_name_staff_id = rs.getString(1);
                                
                                String q3= "SELECT `item_order_date` FROM `item` WHERE `item_id`= ? ;";
                                ps = connection.prepareStatement(q3);
                                ps.setString(1, sub_item_name_item_id);
                                rs = ps.executeQuery();
                                
                                if(rs.next()){
                                
                                String sub_item_order_date = rs.getString(1);
                                
                                //String sub_item_incharge_name_staff_id = rs.getString(1);
                                
                                String query = "INSERT INTO `subitem` "                                                
                                             + "VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , curdate());";
                
                                ps = connection.prepareStatement(query);
                                ps.setString(1, sub_item_id); 
                                ps.setString(2, sub_item_sub_name);
                                ps.setString(3, sub_item_name_item_id);
                                ps.setString(4, sub_item_order_date);
                                ps.setString(5, sub_item_manufacturer_name);
                                ps.setString(6, sub_item_invoice_id);
                                ps.setString(7, sub_item_description);
                                ps.setString(8, sub_item_alloted_to_staff_id);
                                ps.setString(9, sub_item_placed_at);
                                ps.setString(10, sub_item_incharge_name_staff_id);
                                ps.setString(11, sub_item_remarks);
                                
                                int x = ps.executeUpdate();

                                if(x>0){
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('Subitem Successfully Added!!');");
                                    out.println("window.location='store/Home_store.jsp#item';");
                                    out.println("</script>");
                                    //out.println("<script>alert('Item Successfully Added!!');</script>");
                                }
                                else{
                                    out.println("<script type=\"text/javascript\">");
                                    out.println("alert('Subitem could NOT be Added!!');");
                                    out.println("window.location='store/Home_store.jsp#item';");
                                    out.println("</script>");
                                    //out.println("<script>alert('Item could NOT be Added!!');</script>");
                                }

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
                
                    }
                    else{
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Subitems does not exist corresponding to item_name!!');");
                        out.println("window.location='store/Home_store.jsp#item';");
                        out.println("</script>");
                    }
                    
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Item_name NOT Valid!!');");
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
