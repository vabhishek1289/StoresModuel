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
    String item_name = request.getParameter("item_id");
    String q1= "SELECT `item_name` FROM `item` WHERE `item_name` = ?;";
    PreparedStatement ps1 = connection.prepareStatement(q1);
    ps1.setString(1, item_name);
    ResultSet rs1;
    rs1 = ps1.executeQuery();
    if(rs1.next()){
            
        String q2 = "SELECT `item_yorn` FROM `item` WHERE `item_name` = ?;";
        PreparedStatement ps2 = connection.prepareStatement(q2);
        ps2.setString(1, item_name);
        ResultSet rs2;
        rs2 = ps2.executeQuery();
        if(rs2.next()){
            
            if(rs2.getInt(1) == 0){
                
                String q3 = "SELECT * FROM `item` WHERE `item_name` = ?;";
                PreparedStatement ps3 = connection.prepareStatement(q3);
                ps3.setString(1, item_name);
                ResultSet rs3;
                rs3 = ps3.executeQuery();
                if(rs3.next()){
                    String order_date = rs3.getString(3);
                    String supplier_name = rs3.getString(4);
                    float item_rate = rs3.getFloat(5);
                    float item_quantity = rs3.getFloat(6);
                    float item_tax = rs3.getFloat(7);
                    float item_total = rs3.getFloat(8);
                    String item_manufacture_name = rs3.getString(10);
                    String item_invoice_id = rs3.getString(11);
                    String item_description = rs3.getString(12);
                    String item_alloted_to_id = rs3.getString(13);
                    String item_placed_at = rs3.getString(14);
                    String item_incharge_id = rs3.getString(15);
                    String item_remarks = rs3.getString(16);
                    String item_alloted_to_name = "";
                    String item_incharge_name = "";
                    
                    String q4 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps4 = connection.prepareStatement(q4);
                    ps4.setString(1, item_alloted_to_id);
                    ResultSet rs4;
                    rs4 = ps4.executeQuery();
                    if(rs4.next()){
                        item_alloted_to_name = rs4.getString(1);
                    }
                    String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps5 = connection.prepareStatement(q5);
                    ps5.setString(1, item_incharge_id);
                    ResultSet rs5;
                    rs5 = ps5.executeQuery();
                    if(rs5.next()){
                        item_incharge_name = rs5.getString(1);
                    }

%>
<div class="form-group" id="update_field2" style="display: block;">
    <label for="update_order_date" class="col-sm-3 control-label">
        <span style="color:red">*</span> Order Date</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="update_order_date" value="<%= order_date %>" disabled placeholder="01-01-2017" />
    </div>
</div>
<div class="form-group" id="update_field3" style="display: block;">
    <label for="update_supplier_name" class="col-sm-3 control-label">
        <span style="color:red">*</span> Supplier Name</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="update_supplier_name" value="<%= supplier_name %>" disabled placeholder="Supplier Name" />
    </div>
</div>
<div class="form-group" style="display: block;" id="update_field4" >
    <div class="col-sm-12">
        <div class="row">
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Rate</div>
                    <input type="text" required class="form-control" id="update_rate" required name="update_rate" value="<%= item_rate %>" placeholder="0.00">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Qnty</div>
                    <input type="text" required class="form-control" id="update_quantity" required name="update_quantity" value="<%= item_quantity %>" placeholder="0">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Tax(%)</div>
                    <input type="text"required class="form-control" id="update_tax" required name="update_tax" value="<%= item_tax %>" placeholder="0.00%">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon">Total</div>
                    <input type="text" required class="form-control" id="update_total" value="<%= item_total %>" placeholder="0.00">
                </div>
            </div>
        </div>
    </div>    
</div>
<div class="form-group " style="display: block;" id="update_field5" >
    <label for="update_manufacturer_name" class="col-sm-4 control-label">
        <span style="color:red">*</span> Manufacturer Name</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_manufacturer_name" value="<%= item_manufacture_name %>" disabled placeholder="Manufacturer Name" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field6" >
    <label for="update_invoice_id" class="col-sm-4 control-label">
        <span style="color:red">*</span> Invoice-id</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_invoice_id" value="<%= item_invoice_id %>" disabled placeholder="Invoice-id" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field7" >
    <label for="update_item_description" class="col-sm-4 control-label">
        Item Description</label>
    <div class="col-sm-8">
        <textarea class="form-control" rows="5" id="update_item_description" name="update_item_description" maxlength="100" style="resize: none; max-height: 75px;" ><%= item_description %></textarea>
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field8" >
    <label for="update_alloted_to" class="col-sm-4 control-label">
        <span style="color:red">*</span> Alloted To</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_alloted_to" required name="update_alloted_to" value="<%= item_alloted_to_name %>" placeholder="Alloted To" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field9" >
    <label for="update_placed-at" class="col-sm-4 control-label">
        <span style="color:red">*</span> Position/Placed At</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_placed_at" required name="update_placed_at" value="<%= item_placed_at %>" placeholder="Placed At" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field10" >
    <label for="update_incharge_name" class="col-sm-4 control-label">
        <span style="color:red">*</span> Incharge Name</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_incharge_name" required name="update_incharge_name" value="<%= item_incharge_name %>" placeholder="Incharge Name" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field11" >
    <label for="update_remarks" class="col-sm-4 control-label">
        Remarks(If any)</label>
    <div class="col-sm-8">
        <textarea class="form-control" rows="5" id="update_remarks" name="update_remarks" maxlength="100" style="resize: none; max-height: 75px;" ><%= item_remarks %></textarea>
    </div>
</div>

<% 
                }    
            }
else if(rs2.getInt(1) == 1){
                String q9 = "SELECT * FROM `item` WHERE `item_name` = ?;";
                PreparedStatement ps9 = connection.prepareStatement(q9);
                ps9.setString(1, item_name);
                ResultSet rs9;
                rs9 = ps9.executeQuery();
                if(rs9.next()){
                    String order_date = rs9.getString(3);
                    String supplier_name = rs9.getString(4);
                    float item_rate = rs9.getFloat(5);
                    float item_quantity = rs9.getFloat(6);
                    float item_tax = rs9.getFloat(7);
                    float item_total = rs9.getFloat(8);
                    
%>


<div class="form-group" id="update_field2" style="display: block;">
    <label for="update_order_date" class="col-sm-3 control-label">
        <span style="color:red">*</span> Order Date</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="update_order_date" value="<%= order_date %>" disabled placeholder="01-01-2017" />
    </div>
</div>
<div class="form-group" id="update_field3" style="display: block;">
    <label for="update_supplier_name" class="col-sm-3 control-label">
        <span style="color:red">*</span> Supplier Name</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="update_supplier_name" value="<%= supplier_name %>" disabled placeholder="Supplier Name" />
    </div>
</div>
<div class="form-group" style="display: block;" id="update_field4" >
    <div class="col-sm-12">
        <div class="row">
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Rate</div>
                    <input type="text" class="form-control" id="update_rate" required name="update_rate"  value="<%= item_rate %>" placeholder="0.00">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Qnty</div>
                    <input type="text" class="form-control" id="update_quantity" required name="update_quantity" value="<%= item_quantity %>" placeholder="0">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Tax(%)</div>
                    <input type="text" class="form-control" id="update_tax" required name="update_tax" value="<%= item_tax %>" placeholder="0.00%">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon">Total</div>
                    <input type="text" class="form-control" id="update_total" value="<%= item_total %>" placeholder="0.00">
                </div>
            </div>
        </div>
    </div>    
</div>
<div class="form-group " id="update_subitem_1" style="display: block;">
                                    
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-5">
                                                
                                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                    <div class="input-group-addon"><span style="color:red">*</span>How many Subitems</div>
                                                    <input type="number" class="form-control" id="update_no_subitem" placeholder="0" onblur="subitem_form()">
                                                </div>
                                            </div>  
                                        </div>
                                    </div>
                                <hr>
                                </div>                    
<%
                }
            }    
        }
    }
%>

