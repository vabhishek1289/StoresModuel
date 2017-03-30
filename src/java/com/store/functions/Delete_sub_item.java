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

/**
 *
 * @author Abhi
 */
public class Delete_sub_item extends HttpServlet {

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
                String delete_item_sub_name = request.getParameter("delete_item_sub_name");
                String delete_sub_invoice_id = request.getParameter("delete_sub_invoice_id");
                
                    String q1= "SELECT * FROM `subitem` WHERE `subitem_name`= ? AND `subitem_invoice_id` = ?;";
                    PreparedStatement ps1 = connection.prepareStatement(q1);
                    ps1.setString(1, delete_item_sub_name);
                    ps1.setString(2, delete_sub_invoice_id);
                    ResultSet rs1;
                    rs1 = ps1.executeQuery();
                    if(rs1.next()){
                        String result_subitem_id = rs1.getString(1);
                        String result_subitem_name = rs1.getString(2);
                        String result_item_id_subitem = rs1.getString(3);
                        String result_subitem_update_date = rs1.getString(4);
                        String result_subitem_manufacturer_name = rs1.getString(5);
                        String result_subitem_invoice_id = rs1.getString(6);
                        String result_subitem_description = rs1.getString(7);
                        String result_subitem_alloted_to = rs1.getString(8);
                        String result_subitem_placed_at = rs1.getString(9);
                        String result_subitem_incharge_id = rs1.getString(10);
                        String result_subitem_remarks = rs1.getString(11);

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
                        result_subitem_remarks;
                        String q2 = "INSERT INTO `delete_logs` values ( ? , ? , ? )";
                        PreparedStatement ps2 = connection.prepareStatement(q2);
                        ps2.setString(1, delete_logs_timestamp_sub_item);                    
                        ps2.setString(2, delete_logs_id_sub_item);
                        ps2.setString(3, delete_logs_description_sub_item); 
                        int x1 = ps2.executeUpdate();
                            if(x1>0){

                                String q3 = "DELETE FROM `subitem` WHERE `subitem_name`= ? AND `subitem_invoice_id` = ?;";
                                PreparedStatement ps3 = connection.prepareStatement(q3);
                                ps3.setString(1, delete_item_sub_name);
                                ps3.setString(2, delete_sub_invoice_id);
                                if(ps3.executeUpdate() == 1){
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Subitem Successfully Deleted!!');");
                                out.println("window.location='store/Home_store.jsp#item';");
                                out.println("</script>");
                            }
                            else{
                                out.println("<script type=\"text/javascript\">");
                                out.println("alert('Subitem not exists/ cold not be deleted!!');");
                                out.println("window.location='store/Home_store.jsp#item';");
                                out.println("</script>");
                            }
                        }
                    }
                    else{
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Subitem not found!!');");
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
