/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function box_hide1(){
    document.getElementById('home_box_content').style.display='none';
    document.getElementById('box_id1').style.display='none';
    document.getElementById('box_id2').style.display='block';
    document.getElementById('box_id3').style.display='block';
    document.getElementById('box_id4').style.display='block';
    document.getElementById('box_id5').style.display='block';
    document.getElementById('box_id6').style.display='block';
    document.getElementById('box_detail1').style.display='block';
    document.getElementById('box_detail2').style.display='none';
    document.getElementById('box_detail3').style.display='none';
    document.getElementById('box_detail4').style.display='none';
    document.getElementById('box_detail5').style.display='none';
    document.getElementById('box_detail6').style.display='none';
}
function box_hide2(){
    document.getElementById('home_box_content').style.display='none';
    document.getElementById('box_id2').style.display='none';
    document.getElementById('box_id1').style.display='block';
    document.getElementById('box_id3').style.display='block';
    document.getElementById('box_id4').style.display='block';
    document.getElementById('box_id5').style.display='block';
    document.getElementById('box_id6').style.display='block';
    document.getElementById('box_detail2').style.display='block';
    document.getElementById('box_detail1').style.display='none';
    document.getElementById('box_detail3').style.display='none';
    document.getElementById('box_detail4').style.display='none';
    document.getElementById('box_detail5').style.display='none';
    document.getElementById('box_detail6').style.display='none';
}
function box_hide3(){
    document.getElementById('home_box_content').style.display='none';
    document.getElementById('box_id3').style.display='none';
    document.getElementById('box_id2').style.display='block';
    document.getElementById('box_id1').style.display='block';
    document.getElementById('box_id4').style.display='block';
    document.getElementById('box_id5').style.display='block';
    document.getElementById('box_id6').style.display='block';
    document.getElementById('box_detail3').style.display='block';
    document.getElementById('box_detail2').style.display='none';
    document.getElementById('box_detail1').style.display='none';
    document.getElementById('box_detail4').style.display='none';
    document.getElementById('box_detail5').style.display='none';
    document.getElementById('box_detail6').style.display='none';
}
function box_hide4(){
    document.getElementById('home_box_content').style.display='none';
    document.getElementById('box_id4').style.display='none';
    document.getElementById('box_id2').style.display='block';
    document.getElementById('box_id3').style.display='block';
    document.getElementById('box_id1').style.display='block';
    document.getElementById('box_id5').style.display='block';
    document.getElementById('box_id6').style.display='block';
    document.getElementById('box_detail4').style.display='block';
    document.getElementById('box_detail2').style.display='none';
    document.getElementById('box_detail3').style.display='none';
    document.getElementById('box_detail1').style.display='none';
    document.getElementById('box_detail5').style.display='none';
    document.getElementById('box_detail6').style.display='none';
}
function box_hide5(){
    document.getElementById('home_box_content').style.display='none';
    document.getElementById('box_id5').style.display='none';
    document.getElementById('box_id2').style.display='block';
    document.getElementById('box_id3').style.display='block';
    document.getElementById('box_id4').style.display='block';
    document.getElementById('box_id1').style.display='block';
    document.getElementById('box_id6').style.display='block';
    document.getElementById('box_detail5').style.display='block';
    document.getElementById('box_detail2').style.display='none';
    document.getElementById('box_detail3').style.display='none';
    document.getElementById('box_detail4').style.display='none';
    document.getElementById('box_detail1').style.display='none';
    document.getElementById('box_detail6').style.display='none';
}
function box_hide6(){
    document.getElementById('home_box_content').style.display='none';
    document.getElementById('box_id6').style.display='none';
    document.getElementById('box_id2').style.display='block';
    document.getElementById('box_id3').style.display='block';
    document.getElementById('box_id4').style.display='block';
    document.getElementById('box_id5').style.display='block';
    document.getElementById('box_id1').style.display='block';
    document.getElementById('box_detail6').style.display='block';
    document.getElementById('box_detail2').style.display='none';
    document.getElementById('box_detail3').style.display='none';
    document.getElementById('box_detail4').style.display='none';
    document.getElementById('box_detail5').style.display='none';
    document.getElementById('box_detail1').style.display='none';
}
function home_sidenav(){
    document.getElementById('home_box_content').style.display='block';
    document.getElementById('box_id1').style.display='none';
    document.getElementById('box_id2').style.display='none';
    document.getElementById('box_id3').style.display='none';
    document.getElementById('box_id4').style.display='none';
    document.getElementById('box_id5').style.display='none';
    document.getElementById('box_id6').style.display='none';
    document.getElementById('box_detail1').style.display='none';
    document.getElementById('box_detail2').style.display='none';
    document.getElementById('box_detail3').style.display='none';
    document.getElementById('box_detail4').style.display='none';
    document.getElementById('box_detail5').style.display='none';
    document.getElementById('box_detail6').style.display='none';
}

function show_more(){
    if(document.getElementById("r1").checked == true){
        document.getElementById("item_only_1").style.display='none';
        document.getElementById("item_only_2").style.display='none';
        document.getElementById("item_only_3").style.display='none';
        document.getElementById("item_only_4").style.display='none';
        document.getElementById("item_only_5").style.display='none';
        document.getElementById("item_only_6").style.display='none';
        document.getElementById("item_only_7").style.display='none';
        document.getElementById("subitem_1").style.display='block';
    }
    else if(document.getElementById("r2").checked == true){
        document.getElementById("item_only_1").style.display='block';
        document.getElementById("item_only_2").style.display='block';
        document.getElementById("item_only_3").style.display='block';
        document.getElementById("item_only_4").style.display='block';
        document.getElementById("item_only_5").style.display='block';
        document.getElementById("item_only_6").style.display='block';
        document.getElementById("item_only_7").style.display='block';
        document.getElementById("subitem_1").style.display='none';
    }
}

function updateItemFunction(){
        /*if(document.getElementById("update_item_name").value != ""){
            document.getElementById("update_field2").style.display='block';
            document.getElementById("update_field3").style.display='block';
            document.getElementById("update_field4").style.display='block';
            document.getElementById("update_field5").style.display='block';
            document.getElementById("update_field6").style.display='block';
            document.getElementById("update_field7").style.display='block';
            document.getElementById("update_field8").style.display='block';
            document.getElementById("update_field9").style.display='block';
            document.getElementById("update_field10").style.display='block';
            document.getElementById("update_field11").style.display='block';
        }

        else{
            document.getElementById("update_field2").style.display='none';
            document.getElementById("update_field3").style.display='none';
            document.getElementById("update_field4").style.display='none';
            document.getElementById("update_field5").style.display='none';
            document.getElementById("update_field6").style.display='none';
            document.getElementById("update_field7").style.display='none';
            document.getElementById("update_field8").style.display='none';
            document.getElementById("update_field9").style.display='none';
            document.getElementById("update_field10").style.display='none';
            document.getElementById("update_field11").style.display='none';
        }*/
}

function updateSubItemFunction(){
        /*if(document.getElementById("update_sub-item_sub-name").value != ""){
            document.getElementById("update_sub-item_field1").style.display='block';
            document.getElementById("update_sub-item_field3").style.display='block';
            document.getElementById("update_sub-item_field4").style.display='block';
            document.getElementById("update_sub-item_field5").style.display='block';
            document.getElementById("update_sub-item_field6").style.display='block';
            document.getElementById("update_sub-item_field7").style.display='block';
            document.getElementById("update_sub-item_field8").style.display='block';
            document.getElementById("update_sub-item_field9").style.display='block';
        }

        else{
            document.getElementById("update_sub-item_field1").style.display='none';
            document.getElementById("update_sub-item_field3").style.display='none';
            document.getElementById("update_sub-item_field4").style.display='none';
            document.getElementById("update_sub-item_field5").style.display='none';
            document.getElementById("update_sub-item_field6").style.display='none';
            document.getElementById("update_sub-item_field7").style.display='none';
            document.getElementById("update_sub-item_field8").style.display='none';
            document.getElementById("update_sub-item_field9").style.display='none';
                    
        }*/
}
function validate_add_item_form() {   

    var flag=0;
    var radio_check=0;
    var button = document.getElementById('compose_item');

    if((document.getElementById('item_name').value!="") &&
       (document.getElementById('order_date').value!="") &&
       (document.getElementById('supplier_name').value!="") &&
       (document.getElementById('rate').value!="") &&
       (document.getElementById('quantity').value!="") &&
       (document.getElementById('tax').value!="")){
            if(document.getElementById("r1").checked == true){  flag = 1;   radio_check = 1; }


            else if(document.getElementById("r2").checked == true){
                radio_check = 0;
                button.disabled = true;
                button.style.cursor = "not-allowed";
                if( (document.getElementById('manufacturer_name').value!="") &&
                (document.getElementById('invoice_id').value!="") &&
                (document.getElementById('alloted_to').value!="") &&
                (document.getElementById('placed_at').value!="") &&
                (document.getElementById('incharge_name').value!="")  ){
                flag = 1;
                radio_check = 2;
                }
                else{ flag = 0; radio_check = 0; }
            
            }
        }
    
    if(flag==1 && (radio_check == 1 || radio_check == 2)) {
        button.disabled = false;
        button.style.cursor = "initial";
    }
}

function validate_add_sub_item_form(){

    var flag=0;
    var button = document.getElementById('compose_sub_item');
    
    if((document.getElementById('sub_item_name').value!="") &&
       (document.getElementById('sub_item_sub_name').value!="") &&
       (document.getElementById('sub_item_manufacturer_name').value!="") &&
       (document.getElementById('sub_item_invoice_id').value!="") &&
       (document.getElementById('sub_item_alloted_to').value!="") &&
       (document.getElementById('sub_item_placed_at').value!="") &&
       (document.getElementById('sub_item_incharge_name').value!="") ){

            flag=1;
    }
    else    flag=0;

    if(flag==1) {
        button.disabled = false;
        button.style.cursor = "initial";
    }
    else if(flag==0){
        button.disabled = true;
        button.style.cursor = "not-allowed";    
    }
}

function validate_scan_bills_form(){
    var date = new Date();
    var str = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear() + " " +  date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
    document.getElementById('date_of_bill_scan').value = str;
    document.getElementById('year_bill_scan_folder').value = date.getFullYear();
    document.getElementById('month_bill_scan_folder').value = date.getMonth() + 1;
    var button = document.getElementById('submit_scan_item');
    if((document.getElementById('bill_name').value != "") &&
        (document.getElementById('date_of_bill_scan').value != "") &&
        (document.getElementById('from_bill').value != "") &&
        (document.getElementById('to_bill').value != "") &&
        (document.getElementById('image_name').value != "") &&
        (document.getElementById('scanned_by').value != "")){
            button.disabled = false;
            button.style.cursor = "initial";
    }    
}

function validate_maintenance(){
    var date = new Date();
    var str = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear() + " " +  date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
    document.getElementById('date_maintenance').value = str;
    }


function validate_search(){
        var item_input = document.getElementById('item_input').value;
        var invoice_input = document.getElementById('invoice_input').value;
        var date_input = document.getElementById('date_input').value;
        var alloted_input = document.getElementById('alloted_input').value;
        var incharge_input = document.getElementById('incharge_input').value;
        var maintenance_input = document.getElementById('maintenance_input').value;
        var position_input = document.getElementById('position_input').value;
        
        if(item_input != ""){
            document.getElementById('invoice_input').value = "";
            document.getElementById('date_input').value = "";
            document.getElementById('alloted_input').value = "";
            document.getElementById('incharge_input').value = "";
            document.getElementById('maintenance_input').value = "";
            document.getElementById('position_input').value = "";       
        }
        if(invoice_input != ""){
            document.getElementById('item_input').value = "";
            document.getElementById('date_input').value = "";
            document.getElementById('alloted_input').value = "";
            document.getElementById('incharge_input').value = "";
            document.getElementById('maintenance_input').value = "";
            document.getElementById('position_input').value = "";       
        }
        if(alloted_input != ""){
            document.getElementById('item_input').value = "";
            document.getElementById('date_input').value = "";
            document.getElementById('invoice_input').value = "";
            document.getElementById('incharge_input').value = "";
            document.getElementById('maintenance_input').value = "";
            document.getElementById('position_input').value = "";       
        }
        if(date_input != ""){
            document.getElementById('item_input').value = "";
            document.getElementById('incharge_input').value = "";
            document.getElementById('invoice_input').value = "";
            document.getElementById('alloted_input').value = "";
            document.getElementById('maintenance_input').value = "";
            document.getElementById('position_input').value = "";       
        }
        if(incharge_input != ""){
            document.getElementById('item_input').value = "";
            document.getElementById('date_input').value = "";
            document.getElementById('invoice_input').value = "";
            document.getElementById('alloted_input').value = "";
            document.getElementById('maintenance_input').value = "";
            document.getElementById('position_input').value = "";       
        }
        if(maintenance_input != ""){
            document.getElementById('item_input').value = "";
            document.getElementById('date_input').value = "";
            document.getElementById('invoice_input').value = "";
            document.getElementById('alloted_input').value = "";
            document.getElementById('incharge_input').value = "";
            document.getElementById('position_input').value = "";       
        }
        if(position_input != ""){
            document.getElementById('item_input').value = "";
            document.getElementById('date_input').value = "";
            document.getElementById('invoice_input').value = "";
            document.getElementById('alloted_input').value = "";
            document.getElementById('incharge_input').value = "";
            document.getElementById('maintenance_input').value = "";       
        }
}