<%-- 
    Document   : ajaxPageUpdateDatasubitem
    Created on : 2 Apr, 2017, 5:02:50 AM
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
    String subitem_name = request.getParameter("subitem_id");
    String q1= "SELECT `subitem_name` FROM `subitem` WHERE `subitem_name` = ?;";
    PreparedStatement ps1 = connection.prepareStatement(q1);
    ps1.setString(1, subitem_name);
    ResultSet rs1;
    rs1 = ps1.executeQuery();
    if(rs1.next()){
            
        String q2 = "SELECT * FROM `subitem` WHERE `subitem_name` = ?;";
        PreparedStatement ps2 = connection.prepareStatement(q2);
        ps2.setString(1, subitem_name);
        ResultSet rs2;
        rs2 = ps2.executeQuery();
        if(rs2.next()){
            String item_id = rs2.getString(3);
            String subitem_update_date = rs2.getString(4);
            String subitem_manufacturer_name = rs2.getString(5);
            String subitem_invoice_id = rs2.getString(6);
            String subitem_description = rs2.getString(7);
            String subitem_alloted_to = rs2.getString(8);
            String subitem_placed_at = rs2.getString(9);
            String subitem_incharge_id = rs2.getString(10);
            String subitem_remarks = rs2.getString(11);
            
            String q3 = "SELECT `item_name` FROM `item` WHERE `item_id` = ?;";
            PreparedStatement ps3 = connection.prepareStatement(q3);
            ps3.setString(1, item_id);
            ResultSet rs3;
            rs3 = ps3.executeQuery();
            
            if(rs3.next()){
                String item_name = rs3.getString(1);
                
                String q4 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                PreparedStatement ps4 = connection.prepareStatement(q4);
                ps4.setString(1, subitem_alloted_to);
                ResultSet rs4;
                rs4 = ps4.executeQuery();
                
                if(rs4.next()){
                    String subitem_alloted_to_name = rs4.getString(1);
                    
                    String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps5 = connection.prepareStatement(q5);
                    ps5.setString(1, subitem_incharge_id);
                    ResultSet rs5;
                    rs5 = ps5.executeQuery();
                    
                    if(rs5.next()){
                        String subitem_incharge_id_name = rs5.getString(1);
                        
                        
%>

<div class="form-group" style="display: block;" id="update_sub-item_field1" >
    <label for="update_sub-item_name" class="col-sm-4 control-label">
        <span style="color:red">*</span> Item Name</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_sub_item_name" name="update_sub_item_name" required name="update_sub_item_name" value="<%= item_name %>" disabled placeholder="Item Name" />
    </div>
</div>

<div class="form-group " style="display: block;" id="update_sub-item_field3" >
    <label for="update_sub-item_manufacturer_name" class="col-sm-4 control-label">
        <span style="color:red">*</span> Manufacturer Name</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_sub-item_manufacturer_name" name="update_sub-item_manufacturer_name" disabled value="<%= subitem_manufacturer_name %>" placeholder="Manufacturer Name" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_sub-item_field4" >
    <label for="update_sub-item_invoice_id" class="col-sm-4 control-label">
        <span style="color:red">*</span> Invoice-id</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_sub-item_invoice_id" name="update_sub-item_invoice_id" value="<%= subitem_invoice_id %>" disabled placeholder="Invoice-id" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_sub-item_field5" >
    <label for="update_sub-item_description" class="col-sm-4 control-label">
        Sub-Item Description</label>
    <div class="col-sm-8">
        <textarea class="form-control" rows="5" id="update_sub-item_description" name="update_sub-item_description" name="update_sub-item_description" maxlength="100" style="resize: block; max-height: 75px;"><%= subitem_description %></textarea>
    </div>
</div>
<div class="form-group " style="display: block;" id="update_sub-item_field6" >
    <label for="update_sub-item_alloted_to" class="col-sm-4 control-label">
        <span style="color:red">*</span> Alloted To</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" required id="update_sub-item_alloted_to" name="update_sub-item_alloted_to" name="update_sub-item_alloted_to" value="<%= subitem_alloted_to_name %>" placeholder="Alloted To" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_sub-item_field7" >
    <label for="update_sub-item_placed-at" class="col-sm-4 control-label">
        <span style="color:red">*</span> Position/Placed At</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" required id="update_sub-item_placed-at" name="update_sub-item_placed-at" name="update_sub-item_placed-at" value="<%= subitem_placed_at %>" placeholder="Placed At" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_sub-item_field8" >
    <label for="update_sub-item_incharge_name" class="col-sm-4 control-label">
        <span style="color:red">*</span> Incharge Name</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" required id="update_sub-item_incharge_name" name="update_sub-item_incharge_name" name="update_sub-item_incharge_name" value="<%= subitem_incharge_id_name %>" placeholder="Incharge Name" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_sub-item_field9" >
    <label for="update_sub-item_remarks" class="col-sm-4 control-label">
        Remarks(If any)</label>
    <div class="col-sm-8">
        <textarea class="form-control" rows="5" id="update_sub-item_remarks" name="update_sub-item_remarks" name="update_sub-item_remarks" maxlength="100" style="resize: block; max-height: 75px;"><%= subitem_remarks %></textarea>
    </div>
</div>

<%    
                }
            }
        }
    }
}
%>