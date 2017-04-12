<%-- 
    Document   : ajaxMonthlyStatus
    Created on : 12 Apr, 2017, 3:46:57 PM
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
            String q1 = "SELECT count(*), round(sum(`item_total`),2), round(avg(`item_tax`),2), month(curdate()), year(curdate()) FROM `item` WHERE month(`item_order_date`) < month(curdate())";
            PreparedStatement ps1 = connection.prepareStatement(q1);
            ResultSet rs1;
            float item_total;
            int item_total_items;
            float item_tax;
            String date;
            rs1 = ps1.executeQuery();
            if (rs1.next()) {
                 item_total_items = rs1.getInt(1);
                 item_total = rs1.getFloat(2);
                 item_tax = rs1.getFloat(3);
                 String month = rs1.getString(4);
                 String year = rs1.getString(5);
                 
                 date = "01-"+month+"-"+year; 
                 %>
<div class="col-sm-2"></div>
        <div class="col-sm-7" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%">
            
            <div class="modal-header" style="text-align: center; font-style: bold; font-size: 27px;">
                    <div class="modal-title"> Monthly Status
                    </div>
                </div>
            <br><br>
            <div class="col-sm-12">
            <label class="col-sm-6 control-label"> Total items: </label>
            <div class="col-sm-6"> <%= item_total_items %> Nos.  </div></div><br><br>
            <div class="col-sm-12">
            <label class="col-sm-6 control-label"> Total Cost: </label>
            <div class="col-sm-6"> &#x20B9; <%= item_total %> </div></div><br><br>
            <div class="col-sm-12">
            <label class="col-sm-6 control-label"> Average Tax-stats: </label>
            <div class="col-sm-6"> <%= item_tax %>% </div></div><br><br>
            <div class="col-sm-12">
            <label class="col-sm-6 control-label"> Status Till: </label>
            <div class="col-sm-6"> <%= date %> </div></div><br><br>
            <br><button type="button" onclick="home_sidenav()" class="btn btn-primary" style="float: right; margin-right: 2.5%; font-size: 1em"><span class="glyphicon glyphicon-ok"></span> OK</button><br><br><br>
        </div>



<%
             }
%>