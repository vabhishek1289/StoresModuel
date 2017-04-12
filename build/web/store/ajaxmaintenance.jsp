<%-- 
    Document   : ajaxmaintenance
    Created on : 7 Apr, 2017, 2:06:57 PM
    Author     : Abhi
--%>

<script src="js/home.js"></script> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "com.store.utility.SQLConnection" %>
<%@page import = "java.io.IOException" %>
<%@page import = "java.io.PrintWriter" %>
<%@page import = "java.sql.Connection" %>
<%@page import = "java.sql.PreparedStatement" %>
<%@page import = "java.sql.ResultSet" %>
<%@page import = "javax.servlet.ServletException" %>
<%@page import = "javax.servlet.annotation.WebServlet" %>
<%@page import = "javax.servlet.http.HttpServlet" %>
<%@page import = "javax.servlet.http.HttpServletRequest" %>
<%@page import = "javax.servlet.http.HttpServletResponse" %>
<%@page import = "javax.servlet.http.HttpSession" %>

<%
    Connection connection = SQLConnection.createConnection();
    String q1 = request.getParameter("q1");
    String q2 = request.getParameter("q2");
    String q3 = request.getParameter("q3");
    String q4 = request.getParameter("q4");
    
    String query = "UPDATE `item` SET `maintenance_date` = q3 , `item_remarks` = q4 WHERE `item_name` = q1 AND `item_invoice_id` = q2 ";
                        PreparedStatement ps2 = connection.prepareStatement(query);
                        int x = ps2.executeUpdate();
                        if(x>0){
                            %>
                            <%
                        }
                        else{
                            %>                               
                            <%
                        }



                    String query2 = "UPDATE `subitem` SET `maintenance_date` = q3 , `item_remarks` = q4 WHERE `subitem_name` = q1 AND `subitem_invoice_id` = q2 ";
                    PreparedStatement ps3 = connection.prepareStatement(query2);
                    int x1 = ps3.executeUpdate();
                        if(x1>0){
                            %>
                            <%
                        }
                        else{
                            %>
                            <%
                        }
 
%>
