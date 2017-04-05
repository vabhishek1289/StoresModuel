<%-- 
    Document   : ajaxPageSearch
    Created on : 5 Apr, 2017, 3:47:53 AM
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
    String query_on = request.getParameter("query_on");
    String type = request.getParameter("type");
    if (query_on.equals("overall_search") && type.equals("overall_search")) {
%>
<span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Items-</span>
<table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
    <thead>
        <tr>
            <th>Item</th>
            <th>Iv-ID</th>
            <th>Date</th>
            <th>Supplier</th>
            <th>Manuf.</th>
            <th>Rate*Qnty.%Tax=Total </th>
            <th>Alloted</th>
            <th>Incharge</th>
            <th>Position</th>
            <th>Description</th>
            <th>Remarks</th>
            <th></th>
        </tr>    
        <%
            String q1 = "SELECT * FROM `item`";
            PreparedStatement ps1 = connection.prepareStatement(q1);
            //ps1.setString(1, item_name);
            ResultSet rs1;
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                String item_name = rs1.getString(2);
                String item_order_date = rs1.getString(3);
                String item_supplier_name = rs1.getString(4);
                float item_rate = rs1.getFloat(5);
                int item_quantity = rs1.getInt(6);
                float item_tax = rs1.getFloat(7);
                float item_total = rs1.getFloat(8);
                String item_manufacture_name = rs1.getString(10);
                String item_invoice_id = rs1.getString(11);
                String item_description = rs1.getString(12);
                String item_alloted_to = rs1.getString(13);
                String item_placed_at = rs1.getString(14);
                String item_incharge_id = rs1.getString(15);
                String item_remarks = rs1.getString(16);

                String total_field = "((" + String.valueOf(item_rate) + ")*(" + String.valueOf(item_quantity) + "))%(" + String.valueOf(item_tax) + ") = " + String.valueOf(item_total);

                if (item_invoice_id.equals("")) {
                    item_invoice_id = "-";
                }
                if (item_manufacture_name.equals("")) {
                    item_manufacture_name = "-";
                }
                //if(item_alloted_to.equals(""))    item_alloted_to = "-";
                //if(item_incharge_id.equals(""))    item_incharge_id = "-";
                if (item_placed_at.equals("")) {
                    item_placed_at = "-";
                }
                if (item_description.equals("")) {
                    item_description = "-";
                }
                if (item_remarks.equals("")) {
                    item_remarks = "-";
                }
                String alloted_to_name = "";
                String incharge_name = "";
                if (!item_alloted_to.equals("")) {
                    String q2 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps2 = connection.prepareStatement(q2);
                    ps2.setString(1, item_alloted_to);
                    ResultSet rs2;
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        alloted_to_name = rs2.getString(1);
                    }
                } else {
                    alloted_to_name = "-";
                }

                if (!item_incharge_id.equals("")) {
                    String q3 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps3 = connection.prepareStatement(q3);
                    ps3.setString(1, item_incharge_id);
                    ResultSet rs3;
                    rs3 = ps3.executeQuery();
                    if (rs3.next()) {
                        incharge_name = rs3.getString(1);
                    }
                } else {
                    incharge_name = "-";
                }
        %>

        <tr>
            <td><%= item_name%></td>
            <td><%= item_invoice_id%></td>
            <td><%= item_order_date%></td>
            <td><%= item_supplier_name%></td>
            <td><%= item_manufacture_name%></td>
            <td><%= total_field%></td>
            <td><%= alloted_to_name%></td>
            <td><%= incharge_name%></td>
            <td><%= item_placed_at%></td>
            <td><%= item_description%></td>
            <td><%= item_remarks%></td>
        </tr>


        <%
            }
        %>                  
        </tbody>
</table><br>
<span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
<table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
    <thead>
        <tr>
            <th>Item</th>
            <th>Subitem</th>
            <th>Date</th>
            <th>Iv-ID</th>
            <th>Manuf.</th>
            <th>Alloted</th>
            <th>Incharge</th>
            <th>Position</th>
            <th>Description</th>
            <th>Remarks</th>
        </tr>    
        <%
            String q4 = "SELECT * FROM `subitem`";
            PreparedStatement ps4 = connection.prepareStatement(q4);
            //ps1.setString(1, item_name);
            ResultSet rs4;
            rs4 = ps4.executeQuery();
            while (rs4.next()) {
                String subitem_name = rs4.getString(2);
                String item_id = rs4.getString(3);
                String subitem_date = rs4.getString(4);
                String subitem_manuf = rs4.getString(5);
                String subitem_invoice_id = rs4.getString(6);
                String subitem_description = rs4.getString(7);
                String subitem_alloted_to = rs4.getString(8);
                String subitem_placed_at = rs4.getString(9);
                String subitem_incharge = rs4.getString(10);
                String subitem_remarks = rs4.getString(11);

                String item_name = item_id.substring(0, item_id.length() - 1);

                if (subitem_description.equals("")) {
                    subitem_description = "-";
                }
                if (subitem_remarks.equals("")) {
                    subitem_remarks = "-";
                }

                String alloted_to_name = "";
                String incharge_name = "";
                if (!subitem_alloted_to.equals("")) {
                    String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps5 = connection.prepareStatement(q5);
                    ps5.setString(1, subitem_alloted_to);
                    ResultSet rs5;
                    rs5 = ps5.executeQuery();
                    if (rs5.next()) {
                        alloted_to_name = rs5.getString(1);
                    }
                } else {
                    alloted_to_name = "-";
                }

                if (!subitem_incharge.equals("")) {
                    String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps6 = connection.prepareStatement(q6);
                    ps6.setString(1, subitem_incharge);
                    ResultSet rs6;
                    rs6 = ps6.executeQuery();
                    if (rs6.next()) {
                        incharge_name = rs6.getString(1);
                    }
                } else {
                    incharge_name = "-";
                }
        %>    
        <tr>
            <td><%= item_name%></td>
            <td><%= subitem_name%></td>
            <td><%= subitem_date%></td>
            <td><%= subitem_invoice_id%></td>
            <td><%= subitem_manuf%></td>
            <td><%= alloted_to_name%></td>
            <td><%= incharge_name%></td>
            <td><%= subitem_placed_at%></td>
            <td><%= subitem_description%></td>
            <td><%= subitem_remarks%></td>
        </tr>

        <%
            }
        } else {
            if (type.equals("item_subitem")) {
                String item = query_on;
                String subitem = query_on + "_";

                String q1 = "SELECT * FROM `item` WHERE `item_name` = ?";
                PreparedStatement ps1 = connection.prepareStatement(q1);
                ps1.setString(1, item);
                ResultSet rs1;
                rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    rs1.previous();
        %>
        </tbody>
</table><br>
<span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Items-</span>
<table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
    <thead>
        <tr>
            <th>Item</th>
            <th>Iv-ID</th>
            <th>Date</th>
            <th>Supplier</th>
            <th>Manuf.</th>
            <th>Rate*Qnty.%Tax=Total </th>
            <th>Alloted</th>
            <th>Incharge</th>
            <th>Position</th>
            <th>Description</th>
            <th>Remarks</th>
            <th></th>
        </tr>
        <%
            while (rs1.next()) {
                String item_name = rs1.getString(2);
                String item_order_date = rs1.getString(3);
                String item_supplier_name = rs1.getString(4);
                float item_rate = rs1.getFloat(5);
                int item_quantity = rs1.getInt(6);
                float item_tax = rs1.getFloat(7);
                float item_total = rs1.getFloat(8);
                String item_manufacture_name = rs1.getString(10);
                String item_invoice_id = rs1.getString(11);
                String item_description = rs1.getString(12);
                String item_alloted_to = rs1.getString(13);
                String item_placed_at = rs1.getString(14);
                String item_incharge_id = rs1.getString(15);
                String item_remarks = rs1.getString(16);

                String total_field = "((" + String.valueOf(item_rate) + ")*(" + String.valueOf(item_quantity) + "))%(" + String.valueOf(item_tax) + ") = " + String.valueOf(item_total);

                if (item_invoice_id.equals("")) {
                    item_invoice_id = "-";
                }
                if (item_manufacture_name.equals("")) {
                    item_manufacture_name = "-";
                }
                //if(item_alloted_to.equals(""))    item_alloted_to = "-";
                //if(item_incharge_id.equals(""))    item_incharge_id = "-";
                if (item_placed_at.equals("")) {
                    item_placed_at = "-";
                }
                if (item_description.equals("")) {
                    item_description = "-";
                }
                if (item_remarks.equals("")) {
                    item_remarks = "-";
                }
                String alloted_to_name = "";
                String incharge_name = "";
                if (!item_alloted_to.equals("")) {
                    String q2 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps2 = connection.prepareStatement(q2);
                    ps2.setString(1, item_alloted_to);
                    ResultSet rs2;
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        alloted_to_name = rs2.getString(1);
                    }
                } else {
                    alloted_to_name = "-";
                }

                if (!item_incharge_id.equals("")) {
                    String q3 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps3 = connection.prepareStatement(q3);
                    ps3.setString(1, item_incharge_id);
                    ResultSet rs3;
                    rs3 = ps3.executeQuery();
                    if (rs3.next()) {
                        incharge_name = rs3.getString(1);
                    }
                } else {
                    incharge_name = "-";
                }
        %>
        <tr>
            <td><%= item_name%></td>
            <td><%= item_invoice_id%></td>
            <td><%= item_order_date%></td>
            <td><%= item_supplier_name%></td>
            <td><%= item_manufacture_name%></td>
            <td><%= total_field%></td>
            <td><%= alloted_to_name%></td>
            <td><%= incharge_name%></td>
            <td><%= item_placed_at%></td>
            <td><%= item_description%></td>
            <td><%= item_remarks%></td>
        </tr>
        <%
                }
            }
            int flag = 0;
            String q4 = "SELECT * FROM `subitem` WHERE `subitem_name` = ?";
            PreparedStatement ps4 = connection.prepareStatement(q4);
            ps4.setString(1, item);
            ResultSet rs4;
            rs4 = ps4.executeQuery();
            if (rs4.next()) {
                flag = 1;
        %>
        </tbody>
</table><br>
<span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
<table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
    <thead>
        <tr>
            <th>Item</th>
            <th>Subitem</th>
            <th>Date</th>
            <th>Iv-ID</th>
            <th>Manuf.</th>
            <th>Alloted</th>
            <th>Incharge</th>
            <th>Position</th>
            <th>Description</th>
            <th>Remarks</th>
        </tr>    
        <%
            rs4.previous();
            while (rs4.next()) {
                String subitem_name = rs4.getString(2);
                String item_id = rs4.getString(3);
                String subitem_date = rs4.getString(4);
                String subitem_manuf = rs4.getString(5);
                String subitem_invoice_id = rs4.getString(6);
                String subitem_description = rs4.getString(7);
                String subitem_alloted_to = rs4.getString(8);
                String subitem_placed_at = rs4.getString(9);
                String subitem_incharge = rs4.getString(10);
                String subitem_remarks = rs4.getString(11);

                String item_name = item_id.substring(0, item_id.length() - 1);

                if (subitem_description.equals("")) {
                    subitem_description = "-";
                }
                if (subitem_remarks.equals("")) {
                    subitem_remarks = "-";
                }

                String alloted_to_name = "";
                String incharge_name = "";
                if (!subitem_alloted_to.equals("")) {
                    String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps5 = connection.prepareStatement(q5);
                    ps5.setString(1, subitem_alloted_to);
                    ResultSet rs5;
                    rs5 = ps5.executeQuery();
                    if (rs5.next()) {
                        alloted_to_name = rs5.getString(1);
                    }
                } else {
                    alloted_to_name = "-";
                }

                if (!subitem_incharge.equals("")) {
                    String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps6 = connection.prepareStatement(q6);
                    ps6.setString(1, subitem_incharge);
                    ResultSet rs6;
                    rs6 = ps6.executeQuery();
                    if (rs6.next()) {
                        incharge_name = rs6.getString(1);
                    }
                } else {
                    incharge_name = "-";
                }
        %>    
        <tr>
            <td><%= item_name%></td>
            <td><%= subitem_name%></td>
            <td><%= subitem_date%></td>
            <td><%= subitem_invoice_id%></td>
            <td><%= subitem_manuf%></td>
            <td><%= alloted_to_name%></td>
            <td><%= incharge_name%></td>
            <td><%= subitem_placed_at%></td>
            <td><%= subitem_description%></td>
            <td><%= subitem_remarks%></td>
        </tr>

        <%
                }
            }

            String qq = "SELECT * FROM `subitem` WHERE `item_id` = ?";
            ps4 = connection.prepareStatement(qq);
            ps4.setString(1, subitem);
            //ResultSet rs4;
            rs4 = ps4.executeQuery();
            if (flag == 1) {
                while (rs4.next()) {
                    String subitem_name = rs4.getString(2);
                    String item_id = rs4.getString(3);
                    String subitem_date = rs4.getString(4);
                    String subitem_manuf = rs4.getString(5);
                    String subitem_invoice_id = rs4.getString(6);
                    String subitem_description = rs4.getString(7);
                    String subitem_alloted_to = rs4.getString(8);
                    String subitem_placed_at = rs4.getString(9);
                    String subitem_incharge = rs4.getString(10);
                    String subitem_remarks = rs4.getString(11);

                    String item_name = item_id.substring(0, item_id.length() - 1);

                    if (subitem_description.equals("")) {
                        subitem_description = "-";
                    }
                    if (subitem_remarks.equals("")) {
                        subitem_remarks = "-";
                    }

                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!subitem_alloted_to.equals("")) {
                        String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps5 = connection.prepareStatement(q5);
                        ps5.setString(1, subitem_alloted_to);
                        ResultSet rs5;
                        rs5 = ps5.executeQuery();
                        if (rs5.next()) {
                            alloted_to_name = rs5.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!subitem_incharge.equals("")) {
                        String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps6 = connection.prepareStatement(q6);
                        ps6.setString(1, subitem_incharge);
                        ResultSet rs6;
                        rs6 = ps6.executeQuery();
                        if (rs6.next()) {
                            incharge_name = rs6.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
        %>    
        <tr>
            <td><%= item_name%></td>
            <td><%= subitem_name%></td>
            <td><%= subitem_date%></td>
            <td><%= subitem_invoice_id%></td>
            <td><%= subitem_manuf%></td>
            <td><%= alloted_to_name%></td>
            <td><%= incharge_name%></td>
            <td><%= subitem_placed_at%></td>
            <td><%= subitem_description%></td>
            <td><%= subitem_remarks%></td>
        </tr>

        <%
            }
        } else if (flag == 0) {
            if (rs4.next()) {
        %>
        </tbody>
</table><br>
<span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
<table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
    <thead>
        <tr>
            <th>Item</th>
            <th>Subitem</th>
            <th>Date</th>
            <th>Iv-ID</th>
            <th>Manuf.</th>
            <th>Alloted</th>
            <th>Incharge</th>
            <th>Position</th>
            <th>Description</th>
            <th>Remarks</th>
        </tr>
        <%
            rs4.previous();
            while (rs4.next()) {
                String subitem_name = rs4.getString(2);
                String item_id = rs4.getString(3);
                String subitem_date = rs4.getString(4);
                String subitem_manuf = rs4.getString(5);
                String subitem_invoice_id = rs4.getString(6);
                String subitem_description = rs4.getString(7);
                String subitem_alloted_to = rs4.getString(8);
                String subitem_placed_at = rs4.getString(9);
                String subitem_incharge = rs4.getString(10);
                String subitem_remarks = rs4.getString(11);

                String item_name = item_id.substring(0, item_id.length() - 1);

                if (subitem_description.equals("")) {
                    subitem_description = "-";
                }
                if (subitem_remarks.equals("")) {
                    subitem_remarks = "-";
                }

                String alloted_to_name = "";
                String incharge_name = "";
                if (!subitem_alloted_to.equals("")) {
                    String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps5 = connection.prepareStatement(q5);
                    ps5.setString(1, subitem_alloted_to);
                    ResultSet rs5;
                    rs5 = ps5.executeQuery();
                    if (rs5.next()) {
                        alloted_to_name = rs5.getString(1);
                    }
                } else {
                    alloted_to_name = "-";
                }

                if (!subitem_incharge.equals("")) {
                    String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps6 = connection.prepareStatement(q6);
                    ps6.setString(1, subitem_incharge);
                    ResultSet rs6;
                    rs6 = ps6.executeQuery();
                    if (rs6.next()) {
                        incharge_name = rs6.getString(1);
                    }
                } else {
                    incharge_name = "-";
                }
        %>    
        <tr>
            <td><%= item_name%></td>
            <td><%= subitem_name%></td>
            <td><%= subitem_date%></td>
            <td><%= subitem_invoice_id%></td>
            <td><%= subitem_manuf%></td>
            <td><%= alloted_to_name%></td>
            <td><%= incharge_name%></td>
            <td><%= subitem_placed_at%></td>
            <td><%= subitem_description%></td>
            <td><%= subitem_remarks%></td>
        </tr>

        <%
                    }
                }
            }
        %>
        </tbody>
</table><br>
<%
    }
    if (type.equals("invoice")) {
        String invoice = query_on;

        String q1 = "SELECT * FROM `item` WHERE `item_invoice_id` = ?";
        PreparedStatement ps1 = connection.prepareStatement(q1);
        ps1.setString(1, invoice);
        ResultSet rs1;
        rs1 = ps1.executeQuery();
        if (rs1.next()) {
            rs1.previous();
%>
<span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Items-</span>
<table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
    <thead>
        <tr>
            <th>Item</th>
            <th>Iv-ID</th>
            <th>Date</th>
            <th>Supplier</th>
            <th>Manuf.</th>
            <th>Rate*Qnty.%Tax=Total </th>
            <th>Alloted</th>
            <th>Incharge</th>
            <th>Position</th>
            <th>Description</th>
            <th>Remarks</th>
            <th></th>
        </tr>  
        <%
            while (rs1.next()) {
                String item_name = rs1.getString(2);
                String item_order_date = rs1.getString(3);
                String item_supplier_name = rs1.getString(4);
                float item_rate = rs1.getFloat(5);
                int item_quantity = rs1.getInt(6);
                float item_tax = rs1.getFloat(7);
                float item_total = rs1.getFloat(8);
                String item_manufacture_name = rs1.getString(10);
                String item_invoice_id = rs1.getString(11);
                String item_description = rs1.getString(12);
                String item_alloted_to = rs1.getString(13);
                String item_placed_at = rs1.getString(14);
                String item_incharge_id = rs1.getString(15);
                String item_remarks = rs1.getString(16);

                String total_field = "((" + String.valueOf(item_rate) + ")*(" + String.valueOf(item_quantity) + "))%(" + String.valueOf(item_tax) + ") = " + String.valueOf(item_total);

                if (item_invoice_id.equals("")) {
                    item_invoice_id = "-";
                }
                if (item_manufacture_name.equals("")) {
                    item_manufacture_name = "-";
                }
                //if(item_alloted_to.equals(""))    item_alloted_to = "-";
                //if(item_incharge_id.equals(""))    item_incharge_id = "-";
                if (item_placed_at.equals("")) {
                    item_placed_at = "-";
                }
                if (item_description.equals("")) {
                    item_description = "-";
                }
                if (item_remarks.equals("")) {
                    item_remarks = "-";
                }
                String alloted_to_name = "";
                String incharge_name = "";
                if (!item_alloted_to.equals("")) {
                    String q2 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps2 = connection.prepareStatement(q2);
                    ps2.setString(1, item_alloted_to);
                    ResultSet rs2;
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        alloted_to_name = rs2.getString(1);
                    }
                } else {
                    alloted_to_name = "-";
                }

                if (!item_incharge_id.equals("")) {
                    String q3 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps3 = connection.prepareStatement(q3);
                    ps3.setString(1, item_incharge_id);
                    ResultSet rs3;
                    rs3 = ps3.executeQuery();
                    if (rs3.next()) {
                        incharge_name = rs3.getString(1);
                    }
                } else {
                    incharge_name = "-";
                }
        %>

        <tr>
            <td><%= item_name%></td>
            <td><%= item_invoice_id%></td>
            <td><%= item_order_date%></td>
            <td><%= item_supplier_name%></td>
            <td><%= item_manufacture_name%></td>
            <td><%= total_field%></td>
            <td><%= alloted_to_name%></td>
            <td><%= incharge_name%></td>
            <td><%= item_placed_at%></td>
            <td><%= item_description%></td>
            <td><%= item_remarks%></td>
        </tr>


        <%
                }
            }

            String q4 = "SELECT * FROM `subitem` WHERE `subitem_invoice_id` = ?";
            PreparedStatement ps4 = connection.prepareStatement(q4);
            ps4.setString(1, invoice);
            ResultSet rs4;
            rs4 = ps4.executeQuery();
            if (rs4.next()) {
        %>
        </tbody>
</table>
<span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
<table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
    <thead>
        <tr>
            <th>Item</th>
            <th>Subitem</th>
            <th>Date</th>
            <th>Iv-ID</th>
            <th>Manuf.</th>
            <th>Alloted</th>
            <th>Incharge</th>
            <th>Position</th>
            <th>Description</th>
            <th>Remarks</th>
        </tr>
        <%
            rs4.previous();
            while (rs4.next()) {
                String subitem_name = rs4.getString(2);
                String item_id = rs4.getString(3);
                String subitem_date = rs4.getString(4);
                String subitem_manuf = rs4.getString(5);
                String subitem_invoice_id = rs4.getString(6);
                String subitem_description = rs4.getString(7);
                String subitem_alloted_to = rs4.getString(8);
                String subitem_placed_at = rs4.getString(9);
                String subitem_incharge = rs4.getString(10);
                String subitem_remarks = rs4.getString(11);

                String item_name = item_id.substring(0, item_id.length() - 1);

                if (subitem_description.equals("")) {
                    subitem_description = "-";
                }
                if (subitem_remarks.equals("")) {
                    subitem_remarks = "-";
                }

                String alloted_to_name = "";
                String incharge_name = "";
                if (!subitem_alloted_to.equals("")) {
                    String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps5 = connection.prepareStatement(q5);
                    ps5.setString(1, subitem_alloted_to);
                    ResultSet rs5;
                    rs5 = ps5.executeQuery();
                    if (rs5.next()) {
                        alloted_to_name = rs5.getString(1);
                    }
                } else {
                    alloted_to_name = "-";
                }

                if (!subitem_incharge.equals("")) {
                    String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                    PreparedStatement ps6 = connection.prepareStatement(q6);
                    ps6.setString(1, subitem_incharge);
                    ResultSet rs6;
                    rs6 = ps6.executeQuery();
                    if (rs6.next()) {
                        incharge_name = rs6.getString(1);
                    }
                } else {
                    incharge_name = "-";
                }
        %>    
        <tr>
            <td><%= item_name%></td>
            <td><%= subitem_name%></td>
            <td><%= subitem_date%></td>
            <td><%= subitem_invoice_id%></td>
            <td><%= subitem_manuf%></td>
            <td><%= alloted_to_name%></td>
            <td><%= incharge_name%></td>
            <td><%= subitem_placed_at%></td>
            <td><%= subitem_description%></td>
            <td><%= subitem_remarks%></td>
        </tr>

        <%
                    }
                }

            }

            if (type.equals("date")) {
                String date = query_on;

                String q1 = "SELECT * FROM `item` WHERE `item_order_date` = ?";
                PreparedStatement ps1 = connection.prepareStatement(q1);
                ps1.setString(1, date);
                ResultSet rs1;
                rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    rs1.previous();
        %>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Items-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Iv-ID</th>
                <th>Date</th>
                <th>Supplier</th>
                <th>Manuf.</th>
                <th>Rate*Qnty.%Tax=Total </th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
                <th></th>
            </tr>  
            <%
                while (rs1.next()) {
                    String item_name = rs1.getString(2);
                    String item_order_date = rs1.getString(3);
                    String item_supplier_name = rs1.getString(4);
                    float item_rate = rs1.getFloat(5);
                    int item_quantity = rs1.getInt(6);
                    float item_tax = rs1.getFloat(7);
                    float item_total = rs1.getFloat(8);
                    String item_manufacture_name = rs1.getString(10);
                    String item_invoice_id = rs1.getString(11);
                    String item_description = rs1.getString(12);
                    String item_alloted_to = rs1.getString(13);
                    String item_placed_at = rs1.getString(14);
                    String item_incharge_id = rs1.getString(15);
                    String item_remarks = rs1.getString(16);

                    String total_field = "((" + String.valueOf(item_rate) + ")*(" + String.valueOf(item_quantity) + "))%(" + String.valueOf(item_tax) + ") = " + String.valueOf(item_total);

                    if (item_invoice_id.equals("")) {
                        item_invoice_id = "-";
                    }
                    if (item_manufacture_name.equals("")) {
                        item_manufacture_name = "-";
                    }
                    //if(item_alloted_to.equals(""))    item_alloted_to = "-";
                    //if(item_incharge_id.equals(""))    item_incharge_id = "-";
                    if (item_placed_at.equals("")) {
                        item_placed_at = "-";
                    }
                    if (item_description.equals("")) {
                        item_description = "-";
                    }
                    if (item_remarks.equals("")) {
                        item_remarks = "-";
                    }
                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!item_alloted_to.equals("")) {
                        String q2 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps2 = connection.prepareStatement(q2);
                        ps2.setString(1, item_alloted_to);
                        ResultSet rs2;
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            alloted_to_name = rs2.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!item_incharge_id.equals("")) {
                        String q3 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps3 = connection.prepareStatement(q3);
                        ps3.setString(1, item_incharge_id);
                        ResultSet rs3;
                        rs3 = ps3.executeQuery();
                        if (rs3.next()) {
                            incharge_name = rs3.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>

            <tr>
                <td><%= item_name%></td>
                <td><%= item_invoice_id%></td>
                <td><%= item_order_date%></td>
                <td><%= item_supplier_name%></td>
                <td><%= item_manufacture_name%></td>
                <td><%= total_field%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= item_placed_at%></td>
                <td><%= item_description%></td>
                <td><%= item_remarks%></td>
            </tr>


            <%
                    }
                }

                String q4 = "SELECT * FROM `subitem` WHERE `subitem_update_date` = ?";
                PreparedStatement ps4 = connection.prepareStatement(q4);
                ps4.setString(1, date);
                ResultSet rs4;
                rs4 = ps4.executeQuery();
                if (rs4.next()) {
            %>
            </tbody>
    </table>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Subitem</th>
                <th>Date</th>
                <th>Iv-ID</th>
                <th>Manuf.</th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
            </tr>
            <%
                rs4.previous();
                while (rs4.next()) {
                    String subitem_name = rs4.getString(2);
                    String item_id = rs4.getString(3);
                    String subitem_date = rs4.getString(4);
                    String subitem_manuf = rs4.getString(5);
                    String subitem_invoice_id = rs4.getString(6);
                    String subitem_description = rs4.getString(7);
                    String subitem_alloted_to = rs4.getString(8);
                    String subitem_placed_at = rs4.getString(9);
                    String subitem_incharge = rs4.getString(10);
                    String subitem_remarks = rs4.getString(11);

                    String item_name = item_id.substring(0, item_id.length() - 1);

                    if (subitem_description.equals("")) {
                        subitem_description = "-";
                    }
                    if (subitem_remarks.equals("")) {
                        subitem_remarks = "-";
                    }

                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!subitem_alloted_to.equals("")) {
                        String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps5 = connection.prepareStatement(q5);
                        ps5.setString(1, subitem_alloted_to);
                        ResultSet rs5;
                        rs5 = ps5.executeQuery();
                        if (rs5.next()) {
                            alloted_to_name = rs5.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!subitem_incharge.equals("")) {
                        String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps6 = connection.prepareStatement(q6);
                        ps6.setString(1, subitem_incharge);
                        ResultSet rs6;
                        rs6 = ps6.executeQuery();
                        if (rs6.next()) {
                            incharge_name = rs6.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>    
            <tr>
                <td><%= item_name%></td>
                <td><%= subitem_name%></td>
                <td><%= subitem_date%></td>
                <td><%= subitem_invoice_id%></td>
                <td><%= subitem_manuf%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= subitem_placed_at%></td>
                <td><%= subitem_description%></td>
                <td><%= subitem_remarks%></td>
            </tr>

            <%
                            }
                        }

                    }


if (type.equals("position")) {
                String position = query_on;

                String q1 = "SELECT * FROM `item` WHERE `item_placed_at` = ?";
                PreparedStatement ps1 = connection.prepareStatement(q1);
                ps1.setString(1, position);
                ResultSet rs1;
                rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    rs1.previous();
        %>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Items-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Iv-ID</th>
                <th>Date</th>
                <th>Supplier</th>
                <th>Manuf.</th>
                <th>Rate*Qnty.%Tax=Total </th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
                <th></th>
            </tr>  
            <%
                while (rs1.next()) {
                    String item_name = rs1.getString(2);
                    String item_order_date = rs1.getString(3);
                    String item_supplier_name = rs1.getString(4);
                    float item_rate = rs1.getFloat(5);
                    int item_quantity = rs1.getInt(6);
                    float item_tax = rs1.getFloat(7);
                    float item_total = rs1.getFloat(8);
                    String item_manufacture_name = rs1.getString(10);
                    String item_invoice_id = rs1.getString(11);
                    String item_description = rs1.getString(12);
                    String item_alloted_to = rs1.getString(13);
                    String item_placed_at = rs1.getString(14);
                    String item_incharge_id = rs1.getString(15);
                    String item_remarks = rs1.getString(16);

                    String total_field = "((" + String.valueOf(item_rate) + ")*(" + String.valueOf(item_quantity) + "))%(" + String.valueOf(item_tax) + ") = " + String.valueOf(item_total);

                    if (item_invoice_id.equals("")) {
                        item_invoice_id = "-";
                    }
                    if (item_manufacture_name.equals("")) {
                        item_manufacture_name = "-";
                    }
                    //if(item_alloted_to.equals(""))    item_alloted_to = "-";
                    //if(item_incharge_id.equals(""))    item_incharge_id = "-";
                    if (item_placed_at.equals("")) {
                        item_placed_at = "-";
                    }
                    if (item_description.equals("")) {
                        item_description = "-";
                    }
                    if (item_remarks.equals("")) {
                        item_remarks = "-";
                    }
                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!item_alloted_to.equals("")) {
                        String q2 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps2 = connection.prepareStatement(q2);
                        ps2.setString(1, item_alloted_to);
                        ResultSet rs2;
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            alloted_to_name = rs2.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!item_incharge_id.equals("")) {
                        String q3 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps3 = connection.prepareStatement(q3);
                        ps3.setString(1, item_incharge_id);
                        ResultSet rs3;
                        rs3 = ps3.executeQuery();
                        if (rs3.next()) {
                            incharge_name = rs3.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>

            <tr>
                <td><%= item_name%></td>
                <td><%= item_invoice_id%></td>
                <td><%= item_order_date%></td>
                <td><%= item_supplier_name%></td>
                <td><%= item_manufacture_name%></td>
                <td><%= total_field%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= item_placed_at%></td>
                <td><%= item_description%></td>
                <td><%= item_remarks%></td>
            </tr>


            <%
                    }
                }

                String q4 = "SELECT * FROM `subitem` WHERE `subitem_placed_at` = ?";
                PreparedStatement ps4 = connection.prepareStatement(q4);
                ps4.setString(1, position);
                ResultSet rs4;
                rs4 = ps4.executeQuery();
                if (rs4.next()) {
            %>
            </tbody>
    </table>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Subitem</th>
                <th>Date</th>
                <th>Iv-ID</th>
                <th>Manuf.</th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
            </tr>
            <%
                rs4.previous();
                while (rs4.next()) {
                    String subitem_name = rs4.getString(2);
                    String item_id = rs4.getString(3);
                    String subitem_date = rs4.getString(4);
                    String subitem_manuf = rs4.getString(5);
                    String subitem_invoice_id = rs4.getString(6);
                    String subitem_description = rs4.getString(7);
                    String subitem_alloted_to = rs4.getString(8);
                    String subitem_placed_at = rs4.getString(9);
                    String subitem_incharge = rs4.getString(10);
                    String subitem_remarks = rs4.getString(11);

                    String item_name = item_id.substring(0, item_id.length() - 1);

                    if (subitem_description.equals("")) {
                        subitem_description = "-";
                    }
                    if (subitem_remarks.equals("")) {
                        subitem_remarks = "-";
                    }

                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!subitem_alloted_to.equals("")) {
                        String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps5 = connection.prepareStatement(q5);
                        ps5.setString(1, subitem_alloted_to);
                        ResultSet rs5;
                        rs5 = ps5.executeQuery();
                        if (rs5.next()) {
                            alloted_to_name = rs5.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!subitem_incharge.equals("")) {
                        String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps6 = connection.prepareStatement(q6);
                        ps6.setString(1, subitem_incharge);
                        ResultSet rs6;
                        rs6 = ps6.executeQuery();
                        if (rs6.next()) {
                            incharge_name = rs6.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>    
            <tr>
                <td><%= item_name%></td>
                <td><%= subitem_name%></td>
                <td><%= subitem_date%></td>
                <td><%= subitem_invoice_id%></td>
                <td><%= subitem_manuf%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= subitem_placed_at%></td>
                <td><%= subitem_description%></td>
                <td><%= subitem_remarks%></td>
            </tr>

            <%
                            }
                        }

                    }

if (type.equals("alloted")) {
                String alloted = query_on;
                String alloted_id = "";
                String qq = "SELECT `staff_id` FROM `staff` WHERE `staff_username` = ?;";
                PreparedStatement ps3 = connection.prepareStatement(qq);
                ps3.setString(1, alloted);
                ResultSet rs3;
                rs3 = ps3.executeQuery();
                if (rs3.next()) {
                    alloted_id = rs3.getString(1);
                }

                String q1 = "SELECT * FROM `item` WHERE `item_alloted_to` = ?";
                PreparedStatement ps1 = connection.prepareStatement(q1);
                ps1.setString(1, alloted_id);
                ResultSet rs1;
                rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    rs1.previous();
        %>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Items-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Iv-ID</th>
                <th>Date</th>
                <th>Supplier</th>
                <th>Manuf.</th>
                <th>Rate*Qnty.%Tax=Total </th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
                <th></th>
            </tr>  
            <%
                while (rs1.next()) {
                    String item_name = rs1.getString(2);
                    String item_order_date = rs1.getString(3);
                    String item_supplier_name = rs1.getString(4);
                    float item_rate = rs1.getFloat(5);
                    int item_quantity = rs1.getInt(6);
                    float item_tax = rs1.getFloat(7);
                    float item_total = rs1.getFloat(8);
                    String item_manufacture_name = rs1.getString(10);
                    String item_invoice_id = rs1.getString(11);
                    String item_description = rs1.getString(12);
                    String item_alloted_to = rs1.getString(13);
                    String item_placed_at = rs1.getString(14);
                    String item_incharge_id = rs1.getString(15);
                    String item_remarks = rs1.getString(16);

                    String total_field = "((" + String.valueOf(item_rate) + ")*(" + String.valueOf(item_quantity) + "))%(" + String.valueOf(item_tax) + ") = " + String.valueOf(item_total);

                    if (item_invoice_id.equals("")) {
                        item_invoice_id = "-";
                    }
                    if (item_manufacture_name.equals("")) {
                        item_manufacture_name = "-";
                    }
                    //if(item_alloted_to.equals(""))    item_alloted_to = "-";
                    //if(item_incharge_id.equals(""))    item_incharge_id = "-";
                    if (item_placed_at.equals("")) {
                        item_placed_at = "-";
                    }
                    if (item_description.equals("")) {
                        item_description = "-";
                    }
                    if (item_remarks.equals("")) {
                        item_remarks = "-";
                    }
                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!item_alloted_to.equals("")) {
                        String q2 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps2 = connection.prepareStatement(q2);
                        ps2.setString(1, item_alloted_to);
                        ResultSet rs2;
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            alloted_to_name = rs2.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!item_incharge_id.equals("")) {
                        String q3 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        ps3 = connection.prepareStatement(q3);
                        ps3.setString(1, item_incharge_id);
                        //ResultSet rs3;
                        rs3 = ps3.executeQuery();
                        if (rs3.next()) {
                            incharge_name = rs3.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>

            <tr>
                <td><%= item_name%></td>
                <td><%= item_invoice_id%></td>
                <td><%= item_order_date%></td>
                <td><%= item_supplier_name%></td>
                <td><%= item_manufacture_name%></td>
                <td><%= total_field%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= item_placed_at%></td>
                <td><%= item_description%></td>
                <td><%= item_remarks%></td>
            </tr>


            <%
                    }
                }

                String q4 = "SELECT * FROM `subitem` WHERE `subitem_alloted_to` = ?";
                PreparedStatement ps4 = connection.prepareStatement(q4);
                ps4.setString(1, alloted_id);
                ResultSet rs4;
                rs4 = ps4.executeQuery();
                if (rs4.next()) {
            %>
            </tbody>
    </table>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Subitem</th>
                <th>Date</th>
                <th>Iv-ID</th>
                <th>Manuf.</th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
            </tr>
            <%
                rs4.previous();
                while (rs4.next()) {
                    String subitem_name = rs4.getString(2);
                    String item_id = rs4.getString(3);
                    String subitem_date = rs4.getString(4);
                    String subitem_manuf = rs4.getString(5);
                    String subitem_invoice_id = rs4.getString(6);
                    String subitem_description = rs4.getString(7);
                    String subitem_alloted_to = rs4.getString(8);
                    String subitem_placed_at = rs4.getString(9);
                    String subitem_incharge = rs4.getString(10);
                    String subitem_remarks = rs4.getString(11);

                    String item_name = item_id.substring(0, item_id.length() - 1);

                    if (subitem_description.equals("")) {
                        subitem_description = "-";
                    }
                    if (subitem_remarks.equals("")) {
                        subitem_remarks = "-";
                    }

                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!subitem_alloted_to.equals("")) {
                        String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps5 = connection.prepareStatement(q5);
                        ps5.setString(1, subitem_alloted_to);
                        ResultSet rs5;
                        rs5 = ps5.executeQuery();
                        if (rs5.next()) {
                            alloted_to_name = rs5.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!subitem_incharge.equals("")) {
                        String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps6 = connection.prepareStatement(q6);
                        ps6.setString(1, subitem_incharge);
                        ResultSet rs6;
                        rs6 = ps6.executeQuery();
                        if (rs6.next()) {
                            incharge_name = rs6.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>    
            <tr>
                <td><%= item_name%></td>
                <td><%= subitem_name%></td>
                <td><%= subitem_date%></td>
                <td><%= subitem_invoice_id%></td>
                <td><%= subitem_manuf%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= subitem_placed_at%></td>
                <td><%= subitem_description%></td>
                <td><%= subitem_remarks%></td>
            </tr>

            <%
                            }
                        }

                    }

if (type.equals("incharge")) {
                String incharge = query_on;
                String incharge_id = "";
                String qq = "SELECT `staff_id` FROM `staff` WHERE `staff_username` = ?;";
                PreparedStatement ps3 = connection.prepareStatement(qq);
                ps3.setString(1, incharge);
                ResultSet rs3;
                rs3 = ps3.executeQuery();
                if (rs3.next()) {
                    incharge_id = rs3.getString(1);
                }

                String q1 = "SELECT * FROM `item` WHERE `item_incharge_id` = ?";
                PreparedStatement ps1 = connection.prepareStatement(q1);
                ps1.setString(1, incharge_id);
                ResultSet rs1;
                rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    rs1.previous();
        %>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Items-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Iv-ID</th>
                <th>Date</th>
                <th>Supplier</th>
                <th>Manuf.</th>
                <th>Rate*Qnty.%Tax=Total </th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
                <th></th>
            </tr>  
            <%
                while (rs1.next()) {
                    String item_name = rs1.getString(2);
                    String item_order_date = rs1.getString(3);
                    String item_supplier_name = rs1.getString(4);
                    float item_rate = rs1.getFloat(5);
                    int item_quantity = rs1.getInt(6);
                    float item_tax = rs1.getFloat(7);
                    float item_total = rs1.getFloat(8);
                    String item_manufacture_name = rs1.getString(10);
                    String item_invoice_id = rs1.getString(11);
                    String item_description = rs1.getString(12);
                    String item_alloted_to = rs1.getString(13);
                    String item_placed_at = rs1.getString(14);
                    String item_incharge_id = rs1.getString(15);
                    String item_remarks = rs1.getString(16);

                    String total_field = "((" + String.valueOf(item_rate) + ")*(" + String.valueOf(item_quantity) + "))%(" + String.valueOf(item_tax) + ") = " + String.valueOf(item_total);

                    if (item_invoice_id.equals("")) {
                        item_invoice_id = "-";
                    }
                    if (item_manufacture_name.equals("")) {
                        item_manufacture_name = "-";
                    }
                    //if(item_alloted_to.equals(""))    item_alloted_to = "-";
                    //if(item_incharge_id.equals(""))    item_incharge_id = "-";
                    if (item_placed_at.equals("")) {
                        item_placed_at = "-";
                    }
                    if (item_description.equals("")) {
                        item_description = "-";
                    }
                    if (item_remarks.equals("")) {
                        item_remarks = "-";
                    }
                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!item_alloted_to.equals("")) {
                        String q2 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps2 = connection.prepareStatement(q2);
                        ps2.setString(1, item_alloted_to);
                        ResultSet rs2;
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            alloted_to_name = rs2.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!item_incharge_id.equals("")) {
                        String q3 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        ps3 = connection.prepareStatement(q3);
                        ps3.setString(1, item_incharge_id);
                        //ResultSet rs3;
                        rs3 = ps3.executeQuery();
                        if (rs3.next()) {
                            incharge_name = rs3.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>

            <tr>
                <td><%= item_name%></td>
                <td><%= item_invoice_id%></td>
                <td><%= item_order_date%></td>
                <td><%= item_supplier_name%></td>
                <td><%= item_manufacture_name%></td>
                <td><%= total_field%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= item_placed_at%></td>
                <td><%= item_description%></td>
                <td><%= item_remarks%></td>
            </tr>


            <%
                    }
                }

                String q4 = "SELECT * FROM `subitem` WHERE `subitem_incharge_id` = ?";
                PreparedStatement ps4 = connection.prepareStatement(q4);
                ps4.setString(1, incharge_id);
                ResultSet rs4;
                rs4 = ps4.executeQuery();
                if (rs4.next()) {
            %>
            </tbody>
    </table>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Subitem</th>
                <th>Date</th>
                <th>Iv-ID</th>
                <th>Manuf.</th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
            </tr>
            <%
                rs4.previous();
                while (rs4.next()) {
                    String subitem_name = rs4.getString(2);
                    String item_id = rs4.getString(3);
                    String subitem_date = rs4.getString(4);
                    String subitem_manuf = rs4.getString(5);
                    String subitem_invoice_id = rs4.getString(6);
                    String subitem_description = rs4.getString(7);
                    String subitem_alloted_to = rs4.getString(8);
                    String subitem_placed_at = rs4.getString(9);
                    String subitem_incharge = rs4.getString(10);
                    String subitem_remarks = rs4.getString(11);

                    String item_name = item_id.substring(0, item_id.length() - 1);

                    if (subitem_description.equals("")) {
                        subitem_description = "-";
                    }
                    if (subitem_remarks.equals("")) {
                        subitem_remarks = "-";
                    }

                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!subitem_alloted_to.equals("")) {
                        String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps5 = connection.prepareStatement(q5);
                        ps5.setString(1, subitem_alloted_to);
                        ResultSet rs5;
                        rs5 = ps5.executeQuery();
                        if (rs5.next()) {
                            alloted_to_name = rs5.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!subitem_incharge.equals("")) {
                        String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps6 = connection.prepareStatement(q6);
                        ps6.setString(1, subitem_incharge);
                        ResultSet rs6;
                        rs6 = ps6.executeQuery();
                        if (rs6.next()) {
                            incharge_name = rs6.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>    
            <tr>
                <td><%= item_name%></td>
                <td><%= subitem_name%></td>
                <td><%= subitem_date%></td>
                <td><%= subitem_invoice_id%></td>
                <td><%= subitem_manuf%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= subitem_placed_at%></td>
                <td><%= subitem_description%></td>
                <td><%= subitem_remarks%></td>
            </tr>

            <%
                            }
                        }

                    }

            if (type.equals("maintenance_date")) {
                String maintenance_date = query_on;

                String q1 = "SELECT * FROM `item` WHERE `maintenance_date` = ?";
                PreparedStatement ps1 = connection.prepareStatement(q1);
                ps1.setString(1, maintenance_date);
                ResultSet rs1;
                rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    rs1.previous();
        %>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Items-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Iv-ID</th>
                <th>Date</th>
                <th>Supplier</th>
                <th>Manuf.</th>
                <th>Rate*Qnty.%Tax=Total </th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
                <th></th>
            </tr>  
            <%
                while (rs1.next()) {
                    String item_name = rs1.getString(2);
                    String item_order_date = rs1.getString(3);
                    String item_supplier_name = rs1.getString(4);
                    float item_rate = rs1.getFloat(5);
                    int item_quantity = rs1.getInt(6);
                    float item_tax = rs1.getFloat(7);
                    float item_total = rs1.getFloat(8);
                    String item_manufacture_name = rs1.getString(10);
                    String item_invoice_id = rs1.getString(11);
                    String item_description = rs1.getString(12);
                    String item_alloted_to = rs1.getString(13);
                    String item_placed_at = rs1.getString(14);
                    String item_incharge_id = rs1.getString(15);
                    String item_remarks = rs1.getString(16);

                    String total_field = "((" + String.valueOf(item_rate) + ")*(" + String.valueOf(item_quantity) + "))%(" + String.valueOf(item_tax) + ") = " + String.valueOf(item_total);

                    if (item_invoice_id.equals("")) {
                        item_invoice_id = "-";
                    }
                    if (item_manufacture_name.equals("")) {
                        item_manufacture_name = "-";
                    }
                    //if(item_alloted_to.equals(""))    item_alloted_to = "-";
                    //if(item_incharge_id.equals(""))    item_incharge_id = "-";
                    if (item_placed_at.equals("")) {
                        item_placed_at = "-";
                    }
                    if (item_description.equals("")) {
                        item_description = "-";
                    }
                    if (item_remarks.equals("")) {
                        item_remarks = "-";
                    }
                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!item_alloted_to.equals("")) {
                        String q2 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps2 = connection.prepareStatement(q2);
                        ps2.setString(1, item_alloted_to);
                        ResultSet rs2;
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            alloted_to_name = rs2.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!item_incharge_id.equals("")) {
                        String q3 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps3 = connection.prepareStatement(q3);
                        ps3.setString(1, item_incharge_id);
                        ResultSet rs3;
                        rs3 = ps3.executeQuery();
                        if (rs3.next()) {
                            incharge_name = rs3.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>

            <tr>
                <td><%= item_name%></td>
                <td><%= item_invoice_id%></td>
                <td><%= item_order_date%></td>
                <td><%= item_supplier_name%></td>
                <td><%= item_manufacture_name%></td>
                <td><%= total_field%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= item_placed_at%></td>
                <td><%= item_description%></td>
                <td><%= item_remarks%></td>
            </tr>


            <%
                    }
                }

                String q4 = "SELECT * FROM `subitem` WHERE `maintenance_date` = ?";
                PreparedStatement ps4 = connection.prepareStatement(q4);
                ps4.setString(1, maintenance_date);
                ResultSet rs4;
                rs4 = ps4.executeQuery();
                if (rs4.next()) {
            %>
            </tbody>
    </table>
    <span style="font-size: 2em; font-style: bold; padding-left: 5%;"><span class="glyphicon glyphicon-tasks" style="font-size: 0.7em"></span> Subitems-</span>
    <table class="table" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%;">
        <thead>
            <tr>
                <th>Item</th>
                <th>Subitem</th>
                <th>Date</th>
                <th>Iv-ID</th>
                <th>Manuf.</th>
                <th>Alloted</th>
                <th>Incharge</th>
                <th>Position</th>
                <th>Description</th>
                <th>Remarks</th>
            </tr>
            <%
                rs4.previous();
                while (rs4.next()) {
                    String subitem_name = rs4.getString(2);
                    String item_id = rs4.getString(3);
                    String subitem_date = rs4.getString(4);
                    String subitem_manuf = rs4.getString(5);
                    String subitem_invoice_id = rs4.getString(6);
                    String subitem_description = rs4.getString(7);
                    String subitem_alloted_to = rs4.getString(8);
                    String subitem_placed_at = rs4.getString(9);
                    String subitem_incharge = rs4.getString(10);
                    String subitem_remarks = rs4.getString(11);

                    String item_name = item_id.substring(0, item_id.length() - 1);

                    if (subitem_description.equals("")) {
                        subitem_description = "-";
                    }
                    if (subitem_remarks.equals("")) {
                        subitem_remarks = "-";
                    }

                    String alloted_to_name = "";
                    String incharge_name = "";
                    if (!subitem_alloted_to.equals("")) {
                        String q5 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps5 = connection.prepareStatement(q5);
                        ps5.setString(1, subitem_alloted_to);
                        ResultSet rs5;
                        rs5 = ps5.executeQuery();
                        if (rs5.next()) {
                            alloted_to_name = rs5.getString(1);
                        }
                    } else {
                        alloted_to_name = "-";
                    }

                    if (!subitem_incharge.equals("")) {
                        String q6 = "SELECT `staff_username` FROM `staff` WHERE `staff_id` = ?;";
                        PreparedStatement ps6 = connection.prepareStatement(q6);
                        ps6.setString(1, subitem_incharge);
                        ResultSet rs6;
                        rs6 = ps6.executeQuery();
                        if (rs6.next()) {
                            incharge_name = rs6.getString(1);
                        }
                    } else {
                        incharge_name = "-";
                    }
            %>    
            <tr>
                <td><%= item_name%></td>
                <td><%= subitem_name%></td>
                <td><%= subitem_date%></td>
                <td><%= subitem_invoice_id%></td>
                <td><%= subitem_manuf%></td>
                <td><%= alloted_to_name%></td>
                <td><%= incharge_name%></td>
                <td><%= subitem_placed_at%></td>
                <td><%= subitem_description%></td>
                <td><%= subitem_remarks%></td>
            </tr>

            <%
                            }
                        }

                    }
                }
            %>



