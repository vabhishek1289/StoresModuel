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
public class Add_item extends HttpServlet {

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
                String item_name = request.getParameter("item_name");
                String order_date = request.getParameter("order_date");
                String supplier_name = request.getParameter("supplier_name");
                String rate = request.getParameter("rate");
                String quantity = request.getParameter("quantity");
                String tax = request.getParameter("tax");
                //String total;
                String manufacturer_name = request.getParameter("manufacturer_name");
                String invoice_id = request.getParameter("invoice_id");
                String item_description = request.getParameter("item_description");
                String alloted_to = request.getParameter("alloted_to");
                String placed_at = request.getParameter("placed_at");
                String incharge_name = request.getParameter("incharge_name");
                String remarks = request.getParameter("remarks");
                
                float rate_float = Float.parseFloat(rate);  
                float quantity_float = Float.parseFloat(quantity);  
                float tax_float = Float.parseFloat(tax);  
                float temp = (rate_float*quantity_float);
                float total = (temp + ((tax_float*temp)/100));
                
                String id = item_name+"_"+invoice_id;
                int yes_no=1;
                if(invoice_id == "")  yes_no=1;
                else                    yes_no=0;
                
                String q= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                PreparedStatement ps = connection.prepareStatement(q);
                ps.setString(1, alloted_to);
                ResultSet rs;
                rs = ps.executeQuery();
                if(rs.next() || alloted_to=="") {
                    String alloted_to_staff_id;
                    if(alloted_to == "")    alloted_to_staff_id="";
                    else                    alloted_to_staff_id = rs.getString(1);
                    
                    String q1= "SELECT `staff_id` FROM `staff` WHERE `staff_username`= ? ;";
                    ps = connection.prepareStatement(q);
                    ps.setString(1, incharge_name);
                    rs = ps.executeQuery();
                    if(rs.next()|| incharge_name=="") {
                        String incharge_name_staff_id;
                        if(alloted_to == "")    incharge_name_staff_id="";
                        else                    incharge_name_staff_id = rs.getString(1);
                        
                        String query = "INSERT INTO `item` "                                                
                             + "VALUES (? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? );";
                
                        ps = connection.prepareStatement(query);
                        ps.setString(1, id);                    //Completed.
                        ps.setString(2, item_name);
                        ps.setString(3, order_date);            //Not complete.
                        ps.setString(4, supplier_name);
                        ps.setFloat(5, rate_float);
                        ps.setFloat(6, quantity_float);
                        ps.setFloat(7, tax_float);
                        ps.setFloat(8, total);
                        ps.setInt(9, yes_no);                   //Completed.
                        ps.setString(10, manufacturer_name);
                        ps.setString(11, invoice_id);
                        ps.setString(12, item_description);
                        //ps.setString(13, alloted_to);
                        ps.setString(13, alloted_to_staff_id);
                        ps.setString(14, placed_at);            //Completed.(SELECT Rejected)
                        //ps.setString(15, incharge_name);
                        ps.setString(15, incharge_name_staff_id);
                        ps.setString(16, remarks);

                        int x = ps.executeUpdate();

                        if(x>0){
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Item Successfully Added!!');");
                            out.println("window.location='store/Home_store.jsp#item';");
                            out.println("</script>");
                            //out.println("<script>alert('Item Successfully Added!!');</script>");
                        }
                        else{
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert('Item could NOT be Added!!');");
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
