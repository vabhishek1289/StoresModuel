<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="form-group" id="update_field2" style="display: block;">
    <label for="update_order_date" class="col-sm-3 control-label">
        <span style="color:red">*</span> Order Date</label>
    <div class="col-sm-9"><% String date = "THis is "; %>
        <input type="text" class="form-control" id="update_order_date" value="<%= date %>" disabled placeholder="01-01-2017" />
    </div>
</div>
<div class="form-group" id="update_field3" style="display: block;">
    <label for="update_supplier_name" class="col-sm-3 control-label">
        <span style="color:red">*</span> Supplier Name</label>
    <div class="col-sm-9">
        <input type="text" class="form-control" id="update_supplier_name" value="Dummy supplier" disabled placeholder="Supplier Name" />
    </div>
</div>
<div class="form-group" style="display: block;" id="update_field4" >
    <div class="col-sm-12">
        <div class="row">
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Rate</div>
                    <input type="text" class="form-control" id="update_rate" value="20.00" placeholder="0.00">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Qnty</div>
                    <input type="text" class="form-control" id="update_quantity" value="2" placeholder="0">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><span style="color:red">*</span>Tax(%)</div>
                    <input type="text" class="form-control" id="update_tax" value="5" placeholder="0.00%">
                </div>
            </div>
            <div class="col-md-3">

                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon">Total</div>
                    <input type="text" class="form-control" id="update_total" value="42.00" placeholder="0.00">
                </div>
            </div>
        </div>
    </div>    
</div>
<div class="form-group " style="display: block;" id="update_field5" >
    <label for="update_manufacturer_name" class="col-sm-4 control-label">
        <span style="color:red">*</span> Manufacturer Name</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_manufacturer_name" value="Dummy manufacturer" disabled placeholder="Manufacturer Name" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field6" >
    <label for="update_invoice_id" class="col-sm-4 control-label">
        <span style="color:red">*</span> Invoice-id</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_invoice_id" value="Dummy-ID" disabled placeholder="Invoice-id" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field7" >
    <label for="update_item_description" class="col-sm-4 control-label">
        Item Description</label>
    <div class="col-sm-8">
        <textarea class="form-control" rows="5" id="update_item_description" maxlength="100" style="resize: none; max-height: 75px;" >Name: Printer &#13;&#10;Brand: NanoTech &#13;&#10;Type: color/black</textarea>
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field8" >
    <label for="update_alloted_to" class="col-sm-4 control-label">
        <span style="color:red">*</span> Alloted To</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_alloted_to" value="Dummy-name" placeholder="Alloted To" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field9" >
    <label for="update_placed-at" class="col-sm-4 control-label">
        <span style="color:red">*</span> Position/Placed At</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_placed-at" value="Dummy-place" placeholder="Placed At" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field10" >
    <label for="update_incharge_name" class="col-sm-4 control-label">
        <span style="color:red">*</span> Incharge Name</label>
    <div class="col-sm-8">
        <input type="text" class="form-control" id="update_incharge_name" value="Dummy-name" placeholder="Incharge Name" />
    </div>
</div>
<div class="form-group " style="display: block;" id="update_field11" >
    <label for="update_remarks" class="col-sm-4 control-label">
        Remarks(If any)</label>
    <div class="col-sm-8">
        <textarea class="form-control" rows="5" id="update_remarks" maxlength="100" style="resize: none; max-height: 75px;" >Printer access is to the staff only.</textarea>
    </div>
</div>
