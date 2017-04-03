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
public class Update_item extends HttpServlet {

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
                String update_item_name = request.getParameter("update_item_name");
                String update_rate = request.getParameter("update_rate");
                String update_quantity = request.getParameter("update_quantity");
                String update_tax = request.getParameter("update_tax");
                //String total;
                String update_item_description = request.getParameter("update_item_description");
                String update_alloted_to = request.getParameter("update_alloted_to");
                String update_placed_at = request.getParameter("update_placed_at");
                String update_incharge_name = request.getParameter("update_incharge_name");
                String update_remarks = request.getParameter("update_remarks");
                
                float rate_float = Float.parseFloat(update_rate);  
                float quantity_float = Float.parseFloat(update_quantity);  
                float tax_float = Float.parseFloat(update_tax);  
                float temp = (rate_float*quantity_float);
                float total = (temp + ((tax_float*temp)/100));
                
                String query= "SELECT `item_yorn` FROM `item` WHERE `item_name`= ? ;";
                PreparedStatement ps = connection.prepareStatement(query);
                ps.setString(1, update_item_name);
                ResultSet rs;
                rs = ps.executeQuery();
                if(rs.next()){
                    int item_yorn = rs.getInt(1);
                
                if(item_yorn == 0){     //subitems not exists
                String q= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                ps = connection.prepareStatement(q);
                ps.setString(1, update_alloted_to);
                
                rs = ps.executeQuery();
                if(rs.next()) {
                    String update_alloted_to_staff_id;
                    if(update_alloted_to == "")    update_alloted_to_staff_id="";
                    else                    update_alloted_to_staff_id = rs.getString(1);
                    
                    String q1= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                    ps = connection.prepareStatement(q1);
                    ps.setString(1, update_incharge_name);
                    rs = ps.executeQuery();
                    if(rs.next()) {
                        String update_incharge_name_staff_id;
                        if(update_incharge_name == "")    update_incharge_name_staff_id="";
                        else                    update_incharge_name_staff_id = rs.getString(1);
                        
                        
                                        String q2 = "UPDATE `item` "                                                
                                             + "SET `item_rate` = ? , `item_quantity` = ? , `item_tax` = ? , `item_total` = ? , `item_description` = ? , `item_alloted_to` = ? , `item_placed_at` = ? , `item_incharge_id` = ? , `item_remarks` = ? WHERE `item_name` = ? ;";
                                        PreparedStatement ps2 = connection.prepareStatement(q2);
                                        ps2 = connection.prepareStatement(q2);
                                        ps2.setFloat(1, rate_float);                    //Completed.
                                        ps2.setFloat(2, quantity_float);
                                        ps2.setFloat(3, tax_float);            //Not complete.
                                        ps2.setFloat(4, total);
                                        ps2.setString(5, update_item_description);
                                        //ps.setString(13, alloted_to);
                                        ps2.setString(6, update_alloted_to_staff_id);
                                        ps2.setString(7, update_placed_at);            //Completed.(SELECT Rejected)
                                        //ps.setString(15, incharge_name);
                                        ps2.setString(8, update_incharge_name_staff_id);
                                        ps2.setString(9, update_remarks);
                                        ps2.setString(10, update_item_name);

                                        int x = ps2.executeUpdate();

                                        if(x>0){
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('Item Successfully Updated!!');");
                                            out.println("window.location='store/Home_store.jsp#item';");
                                            out.println("</script>");
                                            //out.println("<script>alert('Item Successfully Added!!');</script>");
                                        }
                                        else{
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('Item could NOT be Updated!!');");
                                            out.println("window.location='store/Home_store.jsp#item';");
                                            out.println("</script>");
                                            //out.println("<script>alert('Item could NOT be Added!!');</script>");
                                        }
                                        //response.sendRedirect("store/Home_store.jsp#item");
                        
                        
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
                else if(item_yorn == 1){
                                                //subitems exists
                                                
                                            String q3 = "UPDATE `item` "                                                
                                                 + "SET `item_rate` = ? , `item_quantity` = ? , `item_tax` = ? , `item_total` = ? WHERE `item_name` = ? ;";
                                            PreparedStatement ps3 = connection.prepareStatement(q3);
                                            ps3 = connection.prepareStatement(q3);
                                            ps3.setFloat(1, rate_float);                    //Completed.
                                            ps3.setFloat(2, quantity_float);
                                            ps3.setFloat(3, tax_float);            //Not complete.
                                            ps3.setFloat(4, total);
                                            ps3.setString(5, update_item_name);

                                            int x = ps3.executeUpdate();

                                            if(x>0){
                                                out.println("<script type=\"text/javascript\">");
                                                out.println("alert('Item Successfully Updated!!');");
                                                out.println("window.location='store/Home_store.jsp#item';");
                                                out.println("</script>");
                                                //out.println("<script>alert('Item Successfully Added!!');</script>");
                                            }
                                            else{
                                                out.println("<script type=\"text/javascript\">");
                                                out.println("alert('Item could NOT be Updated!!');");
                                                out.println("window.location='store/Home_store.jsp#item';");
                                                out.println("</script>");
                                                //out.println("<script>alert('Item could NOT be Added!!');</script>");
                                            }
                                            //response.sendRedirect("store/Home_store.jsp#item");
                        }
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
