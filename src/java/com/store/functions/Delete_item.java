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
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;


/**
 *
 * @author Abhi
 */
public class Delete_item extends HttpServlet {

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
                String delete_item_name = request.getParameter("delete_item_name");
                String delete_invoice_id = request.getParameter("delete_invoice_id");
                
                String q= "SELECT * FROM `item` WHERE `item_name`= ? AND `item_invoice_id` = ?;";
                PreparedStatement ps = connection.prepareStatement(q);
                ps.setString(1, delete_item_name);
                ps.setString(2, delete_invoice_id);
                ResultSet rs;
                rs = ps.executeQuery();
                if(rs.next()){
                    String result_item_id = rs.getString(1);
                    String result_item_name = rs.getString(2);
                    String result_item_order_date = rs.getString(3);
                    String result_item_supplier_name = rs.getString(4);
                    String result_item_rate = rs.getString(5);
                    String result_item_quantity = rs.getString(6);
                    String result_item_tax = rs.getString(7);
                    String result_item_total = rs.getString(8);
                    String result_item_yorn = rs.getString(9);
                    String result_item_manufacture_name = rs.getString(10);
                    String result_item_invoice_id = rs.getString(11);
                    String result_item_description = rs.getString(12);
                    String result_item_alloted_to = rs.getString(13);
                    String result_item_placed_at = rs.getString(14);
                    String result_item_incharge_id = rs.getString(15);
                    String result_item_remarks = rs.getString(16);
                    String result_item_maintenance_date = rs.getString(17);
                    
                    //Date date = new Date();
                    //SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy h:mm:ss a");
                    String delete_logs_timestamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
                    String delete_logs_id = "item_logs_" + result_item_id;
                    String delete_logs_description = result_item_id +" , "+
                            result_item_name +" , "+
                            result_item_order_date +" , "+
                            result_item_supplier_name +" , "+
                            result_item_rate +" , "+
                            result_item_quantity +" , "+
                            result_item_tax +" , "+
                            result_item_total +" , "+
                            result_item_yorn +" , "+
                            result_item_manufacture_name +" , "+
                            result_item_invoice_id +" , "+
                            result_item_description +" , "+
                            result_item_alloted_to +" , "+
                            result_item_placed_at +" , "+
                            result_item_incharge_id +" , "+
                            result_item_remarks +" , " +
                            result_item_maintenance_date;
                    String query_delete_logs = "INSERT INTO `delete_logs` values ( ? , ? , ? )";
                    PreparedStatement ps_del = connection.prepareStatement(query_delete_logs);
                    ps_del.setString(1, delete_logs_timestamp);                    
                    ps_del.setString(2, delete_logs_id);
                    ps_del.setString(3, delete_logs_description); 
                    int x1 = ps_del.executeUpdate();
                    if(x1>0){
                                        String q12= "DELETE FROM `item` WHERE `item_name`= ? AND `item_invoice_id` = ?;";
                                        PreparedStatement ps12 = connection.prepareStatement(q12);
                                        ps12.setString(1, delete_item_name);
                                        ps12.setString(2, delete_invoice_id);
                                        if(ps12.executeUpdate() == 1){
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('Item Successfully Deleted!!');");
                                            out.println("window.location='store/Home_store.jsp#item';");
                                            out.println("</script>");
                                        }
                                        else{
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('Item not exist/could not be Deleted!!');");
                                            out.println("window.location='store/Home_store.jsp#item';");
                                            out.println("</script>");
                                        }

                            }
                //}
                
                
                
                
                    String item_id_for_subitem = delete_item_name + "_";
                    String q2= "SELECT * FROM `subitem` WHERE `item_id`= ? ;";
                    PreparedStatement ps2 = connection.prepareStatement(q2);
                    ps2.setString(1, item_id_for_subitem);
                    ResultSet rs2;
                    rs2 = ps2.executeQuery();
                    while(rs2.next()){
                        String result_subitem_id = rs2.getString(1);
                        String result_subitem_name = rs2.getString(2);
                        String result_item_id_subitem = rs2.getString(3);
                        String result_subitem_update_date = rs2.getString(4);
                        String result_subitem_manufacturer_name = rs2.getString(5);
                        String result_subitem_invoice_id = rs2.getString(6);
                        String result_subitem_description = rs2.getString(7);
                        String result_subitem_alloted_to = rs2.getString(8);
                        String result_subitem_placed_at = rs2.getString(9);
                        String result_subitem_incharge_id = rs2.getString(10);
                        String result_subitem_remarks = rs2.getString(11);
                        String result_subitem_maintenance_date = rs2.getString(12);

                        String delete_logs_timestamp_sub_item = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new java.util.Date());
                        String delete_logs_id_sub_item = "sub_item_logs_" + result_subitem_id;
                        String delete_logs_description_sub_item = result_subitem_id +" , "+
                        result_subitem_name + " , " +
                        result_item_id_subitem + " , " +
                        result_subitem_update_date + " , " +
                        result_subitem_manufacturer_name + " , " +
                        result_subitem_invoice_id + " , " +
                        result_subitem_description + " , " +
                        result_subitem_alloted_to + " , " +
                        result_subitem_placed_at + " , " +
                        result_subitem_incharge_id + " , " +
                        result_subitem_remarks + " , " +
                        result_subitem_maintenance_date;
                        String q3 = "INSERT INTO `delete_logs` values ( ? , ? , ? )";
                        PreparedStatement ps3 = connection.prepareStatement(q3);
                        ps3.setString(1, delete_logs_timestamp_sub_item);                    
                        ps3.setString(2, delete_logs_id_sub_item);
                        ps3.setString(3, delete_logs_description_sub_item); 
                        int x3 = ps3.executeUpdate();
                        if(x3>0){

                            String delete_sub_items_too = delete_item_name+"_";
                            String q4 = "DELETE FROM `subitem` WHERE `item_id`= ?;";
                            PreparedStatement ps4 = connection.prepareStatement(q4);
                            ps4.setString(1, delete_sub_items_too);
                            if(ps4.executeUpdate() == 1){
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Item Successfully Deleted!!');");
                                out.println("window.location='store/Home_store.jsp#item';");
                                out.println("</script>");
                            }
                            else{
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Item not exist/could not be Deleted!!');");
                                out.println("window.location='store/Home_store.jsp#item';");
                                out.println("</script>");
                            }

                        }
                    }    
                }
                else{
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Item not Found!!');");
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
