 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.css">
  <title>Store</title>
  <script src="js/bootstrap_jquery.js"></script>
  <script src="js/bootstrap.min.js"></script>

 <script src="js/home.js"></script> 

</head>

<style type="text/css">

body {
    overflow-x: hidden;
}

#mainNav{
    background-color: rgb(100,100,100);
}

li {
    border-right: 1px solid #bbb;
}

li:hover{
    background-color: rgb(200,200,200);
}

.nav.navbar-nav.navbar-right li a{
    color: white;
}

.nav.navbar-nav.navbar-right li a:hover{
    color: black;
}

.navbar-brand.page-scroll{
    border-right: 1px solid #bbb;
    border-left: 1px solid #bbb;
    background-color: rgb(0, 179, 0);
    color: white;
}

.navbar-brand.page-scroll:hover{
    background-color: rgb(0, 153, 0);
    color: white;
}


































#wrapper {
    padding-left: 0;
    transition: all 0.5s ease;
}

#sidebar-wrapper {
    position: fixed;
    height: 100%;
    margin-left: -250px;
    overflow-y: auto;
    background: #04B173;
    transition: all 0.5s ease;
}

#page-content-wrapper {
    width: 100%;
    position: relative;
    padding: 15px;
}

#wrapper.pushpin_action #page-content-wrapper {
    position: absolute;
    margin-right: -250px;
}

.side-nav {
    position: absolute;
    top: 0;
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
}

.side-nav li {
    text-indent: 30%;
    line-height: 300%;
}

.side-nav li a {
    display: block;
    text-decoration: none;
    color: black;
}

.side-nav li a:hover {
    text-decoration: none;
    color: #fff;
    background: rgba(255,255,255,0.2);
}


@media(min-width:768px) {
    #wrapper {
        padding-left: 250px;
    }

    #wrapper.pushpin_action {
        padding-left: 0;
    }

    #sidebar-wrapper {
        width: 250px;
    }

    #wrapper.pushpin_action #sidebar-wrapper {
        width: 0;
    }

    #page-content-wrapper {
        padding: 20px;
        position: relative;
    }

    #wrapper.pushpin_action #page-content-wrapper {
        position: relative;
        margin-right: 0;
    }
}
























.m{
    border:0px;
    z-index: 1;
}

#menu-toggle{
    position: fixed;
    background-color:#04B173;
    color: white;
    width: 45px;
    height: 50px;
    margin-top: 0%;
    margin-left: 0%;
}

.glyphicon.glyphicon-home{
    display: none;
}

#menu-toggle:hover{
    background-color:rgb(200,200,200);
    color: #04B173;
}

.m{
    width: 45px;
    height: 50px;   
}

.nav.navbar-nav.navbar-left{
    margin-top: 2%;
}



















.table_box{
    border-collapse: separate;
    width:30vw;
    height: 37vw;
}


.table_box li{
    list-style: none;
    border: 0px;
}
.table_box a{
    padding: 22%;
    text-decoration: none;
    color:  white;
    background-color:  rgb(150,150,150);
    border: 5px solid rgb(200,200,200);
}


.table_box a:hover, .table_box a:focus{
    background-color:  rgb(100,100,100);
}

.table_box li:hover{
    background-color:white;
}







































#add_item_text{
    font-size: 250%;
    font-weight: 500;
    color: rgb(0, 179, 143);
}

#add_item > div:first-of-type :hover{
    background-color: rgb(245,245,245);
    border-radius: 8%;
}

.cart_class{
    max-width: 25%;
    display:inline-block;
    margin: 2%;
}

.cart_class:first-of-type{
    margin-left: -2%;
}























































@media(max-width:479px) {
.table_box{
    border-collapse: separate;
    width:65vw;
    height: 90vw;
}

.glyphicon.glyphicon-pushpin{
    display: none;
}

.glyphicon.glyphicon-home{
    display: block;
}

.m{
    border: 0px;
    width: 45px;
    height: 45px;   
}

#menu-toggle{
    position: fixed;
    background-color:#04B173;
    color: white;
    width: 45px;
    height: 45px;
    margin-top: 0%;
    margin-left: 0%;
}

}











































@media(max-width:767px) {
.table_box{
    border-collapse: separate;
    width:65vw;
    height: 90vw;
}

.glyphicon.glyphicon-pushpin{
    display: none;
}

.glyphicon.glyphicon-home{
    display: block;
}

.m{
    border: 0px;
    width: 45px;
    height: 45x;   
}

#menu-toggle{
    position: fixed;
    background-color:#04B173;
    color: white;
    width: 45px;
    height: 45px;
    margin-top: 0%;
    margin-left: 0%;
}

#add_item_text{
    font-size: 100%;
}

}






</style>

<body id="page-top">
<!-- navbar top -->

<div class="big-wrapper">
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
        
        <div class="container-fluid">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> <span class="glyphicon glyphicon-align-justify"></span><i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">StoreIcon</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a class="page-scroll" href="#signin">Sign-IN</a>
                        
                    </li>
                    <li>
                        <a class="page-scroll" href="#signup">Sign-UP</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#XY1">XY1</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="index.html">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->

                </div>
    <!-- /.container-fluid -->  
    </nav>
    <!-- end navbar top -->


<br>
<div id="wrapper">
        <!-- Sidebar -->
        <div id="sidebar-wrapper" id="sidebar-wrapper">
            <ul class="side-nav">
                <li>
                    <a href="#">Hidden</a>
                </li>

                <li>
                    <a href="#1" id="home_sidenav" onclick="home_sidenav()">Home</a>
                </li>
                <li>
                    <a href="#box1" id="box_id1" onclick="box_hide1()" style="display: none;">Item</a>
                </li>
                <li>
                    <a href="#box2" id="box_id2" onclick="box_hide2()" style="display: none;">Search</a>
                </li>
                <li>
                    <a href="#box3" id="box_id3" onclick="box_hide3()" style="display: none;">Box3</a>
                </li>
                <li>
                    <a href="#box4" id="box_id4" onclick="box_hide4()" style="display: none;">Box4</a>
                </li>
                <li>
                    <a href="#box5" id="box_id5" onclick="box_hide5()" style="display: none;">Box5</a>
                </li>
                <li>
                    <a href="#box6" id="box_id6" onclick="box_hide6()" style="display: none;">Box6</a>
                </li>
                <li>
                    <a href="#2">Shortcuts</a>
                </li>
                <li>
                    <a href="#3">Overview</a>
                </li>
                <li>
                    <a href="#4">Events</a>
                </li>
                <li>
                    <a href="#5">About</a>
                </li>
                <li>
                    <a href="#6">Services</a>
                </li>
                <li>
                    <a href="#7">Contact</a>
                </li>
                
                
            </ul>
        </div>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content Main content here-->
        <br>
        <div id="page-content-wrapper">
            <div class="container-fluid">
            <ul class="nav navbar-nav navbar-left">
                    <li class="m">
                        <a href="#side_menu" id="menu-toggle"><span class="glyphicon glyphicon-pushpin"></span><span class="glyphicon glyphicon-home" onclick="home_sidenav()"></span></a>
                    </li>
                </ul>

            <div class="row" id="home_box_content">
                    <div class="col-sm-5" >
              

                <nav class="icon_box">
                    <ul class="ul_box">
                        <table class="table_box">
                            <tr>
                                <td>
                                    <li><a href="#item" onclick="box_hide1()">Item</a></li>
                                </td>
                                <td>
                                    <li><a href="#box2" onclick="box_hide2()">Sear</a></li>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <li><a href="#box3" onclick="box_hide3()">Box3</a></li>
                                </td>
                                <td>
                                    <li><a href="#box4" onclick="box_hide4()">Box4</a></li>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <li><a href="#box5" onclick="box_hide5()">Box5</a></li>
                                </td>
                                <td>
                                    <li><a href="#box6" onclick="box_hide6()">Box6</a></li>
                                </td>
                            </tr>
                        </table>
                    </ul>
                </nav>

            </div>
            <div class="col-sm-6" >
                        <h1>Welcome...</h1>

<h3>Lorem ipsum dolor sit amet Riopsh</h3>

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec nisl odio. Mauris vehicula at nunc id posuere. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec nisl odio. Mauris vehicula at nunc id posuere. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
<br><br><br>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec nisl odio. Mauris vehicula at nunc id posuere. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur nec nisl odio. Mauris vehicula at nunc id posuere.
<br><br><br><br><br><br><br><br><br><br><br>&copy All rights reserved.<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            </div>
        </div>




<div id="box_detail1" style="display: none;">
    <div class="cart_class" id="add_item" ><div style="margin-top: 30%;"><input type="image" src="images/icons/cart(1).png" width="100%" height="100%" alt="Add Item" data-toggle="modal" data-target="#add_item_popupmenu"></div><div id="add_item_text" style="text-align: center;">Add</div></div>

    <div id="update_item" class="cart_class"><div style="margin-top: 30%;"><input type="image" src="images/icons/cart(2).png" width="100%" height="100%" alt="Update Item" data-toggle="modal" data-target="#update_item_popupmenu"></div><div id="add_item_text" style="text-align: center;">Update</div></div>

    <div id="delete_item" class="cart_class"><div style="margin-top: 30%;"><input type="image" src="images/icons/cart(3).png" width="100%" height="100%" alt="Delete Item" data-toggle="modal" data-target="#delete_item_popupmenu"></div><div id="add_item_text" style="text-align: center;">Delete</div></div>

    <div id="add_item" class="cart_class"><div style="margin-top: 30%;"><input type="image" src="images/icons/receipt.png" width="100%" height="100%" alt="Scan Bills" data-toggle="modal" data-target="#scan_bills_popupmenu"></div><div id="add_item_text" style="text-align: center;">Scan Bills</div></div>

    <div id="add_item" class="cart_class"><div style="margin-top: 30%;"><input type="image" src="images/icons/pdf.png" width="100%" height="100%" alt="Add Item" data-toggle="modal" data-target="#pdf_bills_popupmenu"></div><div id="add_item_text" style="text-align: center;">.pdf bill</div></div>    
    
































<!-- ADD ITEM POPUP MENU -->
    <div class="modal fade" id="add_item_popupmenu">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="text-align: center; font-style: bold; font-size: 27px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="modal-title"><span class="glyphicon glyphicon-file"></span>Add Item</span>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#add_item_pane" data-toggle="tab">Add Item</a></li>
                            <li><a href="#add_sub-item_pane" data-toggle="tab">Add Sub-Item</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="add_item_pane">
                                <form role="form" action="../Add_item" onmouseover="validate_add_item_form()" class="form-horizontal">
                                <!--<div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <select class="form-control">
                                                    <option>Mr.</option>
                                                    <option>Ms.</option>
                                                    <option>Mrs.</option>
                                                </select>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="Name" />
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                                <div class="form-group">
                                    <label for="item_name" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Item Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="item_name" name="item_name" placeholder="Item Name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="order_date" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Order Date</label>
                                    <div class="col-sm-9">
                                        <input type="date" class="form-control" id="order_date" name="order_date" placeholder="01-01-2017" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="supplier_name" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Supplier Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="supplier_name" name="supplier_name" placeholder="Supplier Name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-3">
                                                
                                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                    <div class="input-group-addon"><span style="color:red">*</span>Rate</div>
                                                                                                <input type="text" class="form-control" id="rate" name="rate" placeholder="0.00">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                
                                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                    <div class="input-group-addon"><span style="color:red">*</span>Qnty</div>
                                                                                                <input type="text" class="form-control" id="quantity" name="quantity" placeholder="0">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                
                                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                    <div class="input-group-addon"><span style="color:red">*</span>Tax(%)</div>
                                                                                                <input type="text" class="form-control" id="tax" name="tax" placeholder="0.00%">
                                                </div>
                                            </div>
                                            <div class="col-md-3">
                                                
                                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                    <div class="input-group-addon">Total</div>
                                                    <input type="text" class="form-control" id="total" placeholder="0.00">
                                                </div>
                                            </div>
                                        </div>
                                    </div>    
                                </div>
                                <div class="form-group">
                                    <label for="y/n" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Subitems </label>
                                    <div class="col-sm-9">
                                        <div class="row">
                                            <div class="radio col-md-2" onclick="show_more()">
                                              <label><input type="radio" name="r" id="r1" value="1">Yes</label>
                                            </div>
                                            <div class="radio col-md-2" onclick="show_more()">
                                              <label><input type="radio" name="r" id="r2" value="0">No</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_1" style="display: none;">
                                    <label for="manufacturer_name" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Manufacturer Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="manufacturer_name" name="manufacturer_name" placeholder="Manufacturer Name" />
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_2" style="display: none;">
                                    <label for="invoice_id" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Invoice-id</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="invoice_id" name="invoice_id" placeholder="Invoice-id" />
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_3" style="display: none;">
                                    <label for="item_description" class="col-sm-4 control-label">
                                        Item Description</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="5" id="item_description" name="item_description" maxlength="100" style="resize: none; max-height: 75px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_4" style="display: none;">
                                    <label for="alloted_to" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Alloted To</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="alloted_to" name="alloted_to" placeholder="Alloted To" />
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_5" style="display: none;">
                                    <label for="placed-at" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Position/Placed At</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="placed_at" name="placed_at" placeholder="Placed At" />
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_6" style="display: none;">
                                    <label for="incharge_name" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Incharge Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="incharge_name" name="incharge_name" placeholder="Incharge Name" />
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_7" style="display: none;">
                                    <label for="remarks" class="col-sm-4 control-label">
                                        Remarks(If any)</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="5" id="remarks" name="remarks" maxlength="100" style="resize: none; max-height: 75px;"></textarea>
                                    </div>
                                </div>




                                <div class="form-group " id="subitem_1" style="display: none;">
                                    
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-md-3"></div>
                                            <div class="col-md-5">
                                                
                                                <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                                                    <div class="input-group-addon"><span style="color:red">*</span>How many Subitems</div>
                                                    <input type="number" class="form-control" id="no_subitem" placeholder="0" onblur="subitem_form()">
                                                </div>
                                            </div>  
                                        </div>
                                    </div>
                                <hr>
                                </div>
                               <div class="modal-footer">
                                    <button type="submit" id="compose_item" name="compose_item" class="btn btn-primary pull-right" disabled style="cursor: not-allowed;"><span class="glyphicon glyphicon-ok-circle"></span> Add-Item</button>
                                    </form>
                                    <button type="submit"  class="btn btn-danger pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> Cancel</button>

                                </div>
                                
                            </div>




                            <div class="tab-pane" id="add_sub-item_pane">
                                <form role="form" action="../Add_sub_item" onmouseover="validate_add_sub_item_form()" class="form-horizontal">
                                <!--<div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">
                                        Name</label>
                                    <div class="col-sm-10">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <select class="form-control">
                                                    <option>Mr.</option>
                                                    <option>Ms.</option>
                                                    <option>Mrs.</option>
                                                </select>
                                            </div>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" placeholder="Name" />
                                            </div>
                                        </div>
                                    </div>
                                </div>-->
                                <div class="form-group">
                                    <label for="sub-item_name" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Item Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sub_item_name" name="sub_item_name" placeholder="Item Name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="sub-item_sub-name" class="col-sm-4 control-label">
                                        <span style="color:red">*</span>Sub-Item Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sub_item_sub_name" name="sub_item_sub_name" placeholder="Item Name" />
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="sub-item_manufacturer_name" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Manufacturer Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sub_item_manufacturer_name" name="sub_item_manufacturer_name"  placeholder="Manufacturer Name" />
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="sub-item_invoice_id" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Invoice-id</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sub_item_invoice_id" name="sub_item_invoice_id" placeholder="Invoice-id" />
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="sub-item_description" class="col-sm-4 control-label">
                                        Sub-Item Description</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="5" id="sub_item_description" name="sub_item_description" maxlength="100" style="resize: none; max-height: 75px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="sub-item_alloted_to" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Alloted To</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sub_item_alloted_to" name="sub_item_alloted_to" placeholder="Alloted To" />
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="sub-item_placed-at" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Position/Placed At</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sub_item_placed_at" name="sub_item_placed_at" placeholder="Placed At" />
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="sub-item_incharge_name" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Incharge Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" id="sub_item_incharge_name" name="sub_item_incharge_name" placeholder="Incharge Name" />
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="sub-item_remarks" class="col-sm-4 control-label">
                                        Remarks(If any)</label>
                                    <div class="col-sm-8">
                                        <textarea class="form-control" rows="5" id="sub_item_remarks" name="sub_item_remarks" maxlength="100" style="resize: none; max-height: 75px;"></textarea>
                                    </div>
                                </div>
                                    <div class="modal-footer">
                                    <button type="submit" id="compose_sub_item" name="compose_sub_item" class="btn btn-primary pull-right"  disabled style="cursor: not-allowed;"><span class="glyphicon glyphicon-ok-circle"></span> Add-SubItem</button>
                                    </form>
                                    <button type="submit"  class="btn btn-danger pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> Cancel</button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 
                </div>
            </div>
        </div>
      </div>
</div>





































<!-- UPDATE ITEM POPUP MENU -->
    <div class="modal fade" id="update_item_popupmenu">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="text-align: center; font-style: bold; font-size: 27px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="modal-title"><span class="glyphicon glyphicon-file"></span>Update Item</span>
                </div>
            </div>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#update_item_pane" data-toggle="tab">Update Item</a></li>
                            <li><a href="#update_sub-item_pane" data-toggle="tab">Update Sub-Item</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content" onmouseover="validate_update_item_form()">
                            <div class="tab-pane active" id="update_item_pane">
                                <form role="form" action="../Update_item" class="form-horizontal" >
                                
                                <div class="form-group" id="update_field1">
                                    <label for="update_item_name" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Item Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="update_item_name" name="update_item_name" placeholder="Item Name" onblur="updateItemFunction()"/>
                                    </div>
                                </div>
                                <div id="item_update_show_more" ></div>
                                
                                    <div class="modal-footer">
                                    <button type="submit" id="update_compose_item" name="update_compose_item" class="btn btn-primary pull-right" ><span class="glyphicon glyphicon-ok-circle"></span> Update-Item</button>
                                    </form>
                                    <button type="submit"  class="btn btn-danger pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> Cancel</button>

                                </div>
                            </div> 





                            <div class="tab-pane" id="update_sub-item_pane">
                                <form role="form" class="form-horizontal" action="../Update_subitem"> 
                                
                                <div class="form-group" id="update_sub-item_field2" >
                                    <label for="update_sub-item_sub-name" class="col-sm-4 control-label">
                                        <span style="color:red">*</span>Sub-Item Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" required id="update_sub-item_sub-name" name="update_sub-item_sub-name" onblur="updateSubItemFunction()" placeholder="Sub-Item Name" />
                                    </div>
                                </div>
                                
                                    <div id="subitem_update_show_more" ></div>
                                    
                                    <div class="modal-footer">
                                    <button type="submit" id="compose_sub_item" name="compose_sub_item" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-ok-circle"></span> Update-SubItem</button>
                                    </form>
                                    <button type="submit"  class="btn btn-danger pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>





































<!-- DELETE ITEM POPUP MENU -->
<div class="modal fade" id="delete_item_popupmenu">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="text-align: center; font-style: bold; font-size: 27px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="modal-title"><span class="glyphicon glyphicon-file"></span>Delete Item</span>
                    </div>
                </div>
                <div class="modal-body">
                    <div class="row">
                    <div class="col-md-12" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#delete_item_pane" data-toggle="tab">Delete Item</a></li>
                            <li><a href="#delete_sub-item_pane" data-toggle="tab">Delete Sub-Item</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="delete_item_pane">
                                <form role="form" action="../Delete_item" class="form-horizontal">
                                <div class="form-group">
                                    <label for="delete_item_name" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Item Name</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="delete_item_name" name="delete_item_name" placeholder="Item Name" />
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_2">
                                    <label for="invoice_id" class="col-sm-3 control-label"> Invoice-id</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="delete_invoice_id" name="delete_invoice_id" placeholder="Invoice-id" />
                                    </div>
                                </div>
                                <div style="color: red">**Note: <br> &nbsp;&nbsp;Deleting item will delete all corresponding subitems also.<br> &nbsp;&nbsp;Ignore Invoice-ID if item contains subitems also.</div>
                                <div class="modal-footer">
                                    <button type="submit" id="delete_item" name="delete_item" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-ok-circle"></span> Delete-Item</button>
                                    </form>
                                    <button type="submit"  class="btn btn-danger pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> Cancel</button>

                                </div>
                            </div>




                            <div class="tab-pane" id="delete_sub-item_pane">
                                <form role="form" action="../Delete_sub_item" class="form-horizontal">
                                <div class="form-group">
                                    <label for="delete-item_sub-name" class="col-sm-4 control-label">
                                        <span style="color:red">*</span>Sub-Item Name</label>
                                    <div class="col-sm-8">
                                        <input type="text" required class="form-control" id="delete_item_sub_name" name="delete_item_sub_name" placeholder="Sub-Item Name" />
                                    </div>
                                </div>
                                <div class="form-group " id="item_only_2">
                                    <label for="invoice_id" class="col-sm-4 control-label">
                                        <span style="color:red">*</span> Invoice-id</label>
                                    <div class="col-sm-8">
                                        <input type="text" required class="form-control" id="delete_sub_invoice_id" name="delete_sub_invoice_id" placeholder="Invoice-id" />
                                    </div>
                                </div>
                                    <div class="modal-footer">
                                    <button type="submit" id="delete_sub_item" name="delete_sub_item" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-ok-circle"></span> Delete-SubItem</button>
                                    </form>
                                    <button type="submit"  class="btn btn-danger pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> Cancel</button>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 
                </div>
            </div>
        </div>
      </div>
</div>













































<!-- SCAN BILLS POPUP MENU -->
<div class="modal fade" id="scan_bills_popupmenu">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="text-align: center; font-style: bold; font-size: 27px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="modal-title"><span class="glyphicon glyphicon-file"></span>Scan Bills</span>
                    </div>
                </div>
                <div class="modal-body">
                    
                                <form role="form" action="../scan_bills" onmouseover="validate_scan_bills_form()" class="form-horizontal">
                                <div class="form-group">
                                    <label for="bill_name" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Bill Head</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="bill_name" name="bill_name" placeholder="Bill name" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="date_of_bill_scan" class="col-sm-3 control-label">
                                         Date of Scan</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="date_of_bill_scan" name="date_of_bill_scan" placeholder="14-03-17" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="from_bill" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Bill From</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="from_bill" name="from_bill" placeholder="Bill From" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="to_bill" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Bill To</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="to_bill" name="to_bill" placeholder="Bill To" />
                                    </div>
                                </div>
                                <div class="form-group " >
                                    <label for="scan_browse" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Select Image</label>
                                    <div class="col-sm-9">
                                        <label class="btn btn-default btn-file col-sm-12" style="background-color: white;">
                                            Choose Scanned Image<input type="file" id="image_name" name="image_name" hidden>
                                        </label>
                                    </div>
                                </div>
                                <input type="text" id="year_bill_scan_folder" hidden>
                                <input type="text" id="month_bill_scan_folder" hidden>
                                <!--<input type="text" id="day_bill_scan_folder" hidden> -->
                                 <div class="form-group " >
                                    <label for="scan_bill_description" class="col-sm-3 control-label">
                                        Bill Description</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" rows="5" id="scan_bill_description" name="scan_bill_description" maxlength="100" style="resize: none; max-height: 75px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="scanned_by" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Scanned By</label>
                                    <div class="col-sm-9">
                                        <input type="text" required class="form-control" id="scanned_by" name="scanned_by" placeholder="Scanned By" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" disabled id="submit_scan_item" name="submit_scan_item" class="btn btn-primary pull-right" style="cursor: not-allowed;"><span class="glyphicon glyphicon-ok-circle"></span> Submit</button>
                                    </form>
                                    <button type="submit"  class="btn btn-danger pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 
                </div>



























<!-- PDF BILLS POPUP MENU -->
<div class="modal fade" id="pdf_bills_popupmenu">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="text-align: center; font-style: bold; font-size: 27px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <div class="modal-title"><span class="glyphicon glyphicon-file"></span>Add .pdf Bills</span>
                    </div>
                </div>
                <div class="modal-body">
                    
                                <form role="form" class="form-horizontal">
                                <div class="form-group">
                                    <label for="date_of_pdfbill_scan" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Date of Scan</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="date_of_pdfbill_scan" placeholder="14-03-17" />
                                    </div>
                                </div>
                                
                                <div class="form-group " >
                                    <label for="pdfscan_browse" class="col-sm-3 control-label">
                                        Select .pdf</label>
                                    <div class="col-sm-9">
                                        <label class="btn btn-default btn-file col-sm-12" style="background-color: white;">
                                            Choose .pdf<input type="file" hidden>
                                        </label>
                                    </div>
                                </div>
                                 <div class="form-group " >
                                    <label for="scan_pdfbill_description" class="col-sm-3 control-label">
                                        Bill Description</label>
                                    <div class="col-sm-9">
                                        <textarea class="form-control" rows="5" id="scan_pdfbill_description" maxlength="100" style="resize: none; max-height: 75px;"></textarea>
                                    </div>
                                </div>
                                <div class="form-group ">
                                    <label for="pdf_scanned_by" class="col-sm-3 control-label">
                                        <span style="color:red">*</span> Scanned By</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="pdf_scanned_by" placeholder="Scanned By" />
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" id="submit_scan_item" name="submit_scan_item" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-ok-circle"></span> Submit</button>
                                    </form>
                                    <button type="submit"  class="btn btn-danger pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove-circle"></span> Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 








































































<!-- Search -->
<div id="box_detail2" style="display: none; padding-left: 2%; margin-right: 2%;" >
    
    <div class="col-sm-12" style="border: 2px solid grey; border-color: rgb(240,240,240); border-radius: 1.5%; display: inline-block">
        
    <table class="table">
        <thead>
          <tr>
            <th>Item/Subitem Name</th>
            <th>Invoice-ID</th>
            <th>Date</th>
            <th>Alloted-To</th>
            <th>Staff Incharge</th>
            <th>Maintenance Date</th>
            <th>Position/Placed At</th>
            <th></th>

          </tr>
        </thead>
        <tbody>
          <tr>
            <td><input type="text" class="form-control" id="item_input" name="item_input" placeholder="Item/Subitem" onkeydown="validate_search()"/></td>
            <td><input type="text" class="form-control" id="invoice_input" name="invoice_input" placeholder="Invoice-ID" onkeydown="validate_search()" /></td>
            <td><input type="date" class="form-control" id="date_input" name="date_input" placeholder="xx/xx/xxxx" onkeydown="validate_search()" /></td>
            <td><input type="text" class="form-control" id="alloted_input" name="alloted_input" placeholder="Alloted-To" onkeydown="validate_search()" /></td>
            <td><input type="text" class="form-control" id="incharge_input" name="incharge_input" placeholder="Incharge" onkeydown="validate_search()" /></td>
            <td><input type="date" class="form-control" id="maintenance_input" name="maintenance_input" placeholder="xx/xx/xxxx" onkeydown="validate_search()" /></td>
            <td><input type="text" class="form-control" id="position_input" name="position_input" placeholder="Placed-At" onkeydown="validate_search()" /></td>

          </tr>           
        </tbody>
    </table>
    </div><br><br><br><br><br><br>
    <button type="button" id="search" class="btn btn-primary" style="float: right; margin-right: 50%; font-size: 2em"><span class="glyphicon glyphicon-search"></span> Search</button>
    <br><br><br><br>
    <div id="all_search_populate">
        
    </div>
    
    <!-- <div id="item_search_populate">
        
    </div>
    
    <div id="invoice_search_populate">
        
    </div>
    
    <div id="date_search_populate">
        
    </div>
    
    <div id="alloted_to_search_populate">
        
    </div>
    
    <div id="incharge_search_populate">
        
    </div>
    
    <div id="maintenance_date_search_populate">
        
    </div>
    
    <div id="position_search_populate">
    
</div> -->


</div>



<div id="box_detail3" style="display: none;">
    Box3
</div>
<div id="box_detail4" style="display: none;">
    Box4
</div>
<div id="box_detail5" style="display: none;">
    Box5
</div>
<div id="box_detail6" style="display: none;">
    Box6
</div>

            </div>
        </div>
        <!-- /#page-content-wrapper -->


</div>
  <!-- /#wrapper -->

</div>
  <!-- /#big-wrapper -->


















    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function() {
        //e.preventDefault();
        $("#wrapper").toggleClass("pushpin_action");
    });
    
    $("#update_item_name").blur(function () {
        x = $(this).val();
        $.post("ajaxPageUpdateData.jsp", {item_id: x}, function(result) {
            $("#item_update_show_more").html(result);
        });
    });
    
    $("#update_sub-item_sub-name").blur(function () {
        x = $(this).val();
        $.post("ajaxPageUpdateDatasubitem.jsp", {subitem_id: x}, function(result) {
            $("#subitem_update_show_more").html(result);
        });
    });
    
     $("#box_detail2").ready(function () {
        x = "overall_search";
        y = "overall_search";
        $.post("ajaxPageSearch.jsp", {query_on: x, type: y}, function(result) {
            $("#all_search_populate").html(result);
        });
    });
    
    $("#search").click(function () {
        item_input = $("#item_input").val();
        invoice_input = $("#invoice_input").val();
        date_input = $("#date_input").val();
        alloted_input = $("#alloted_input").val();
        incharge_input = $("#incharge_input").val();
        maintenance_input = $("#maintenance_input").val();
        position_input = $("#position_input").val();
        x = "";
        if(item_input != ""){
            x = item_input;
            y = "item_subitem";
        }else if(invoice_input != ""){
            x = invoice_input;
            y = "invoice";
        }else if(date_input != ""){
            x = date_input;
            y = "date";
        }else if(alloted_input != ""){
            x = alloted_input;
            y = "alloted";
        }else if(incharge_input != ""){
            x = incharge_input;
            y = "incharge";
        }else if(maintenance_input != ""){
            x = maintenance_input;
            y = "maintenance_date";
        }else if(position_input != ""){
            x = position_input;
            y = "position";
        }
        else{
            x = "overall_search";
            y = "overall_search";
        }
        $.post("ajaxPageSearch.jsp", {query_on: x, type: y}, function(result) {
        $("#all_search_populate").html(result);//$("#position_search_populate").html(result);
        });

        
        
    });
    
    </script>



</body>
</html>