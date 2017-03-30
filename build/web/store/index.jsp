 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/bootstrap.css">
  <title>Store</title>
  <script src="js/bootstrap_jquery.js"></script>
  <script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
        $("#popUpWindow").modal('show');
    });
</script>


</head>

<style type="text/css">
	
	#page-top{
		background-image: url("images/login_background.jpg") ;
	    background-repeat: no-repeat;
    	background-position: right top;
    	background-attachment: fixed;
    	background-size: 100% 110%;
	}

	.main_login_box {
	  position: absolute;

	  margin-left: 10%;
	  margin-top: 25%;
	  width: 70%;
	  height: 834%;
	  padding: 20px;
	  background: #fff;
	  border-radius: 5px;
	  overflow: hidden;
	}
	.main_login_box:hover > .login_orange_box{
	  width: 2rem;
	}
	.login.focused > .login_orange_box{
	  width: 2rem;
	}
	.main_login_box:hover > .login_orange_box > .text{
	  font-size: 1rem;
	  transform: rotate(-90deg);
	}
	.login.focused > .login_orange_box > .text{
	  font-size: 1rem;
	  transform: rotate(-90deg);
	}
	
	.login_orange_box {
	  position: absolute;
	  left: 0;
	  top: 0;
	  z-index: 1;
	  width: 100%;
	  height: 100%;
	  background: orange;
	  transition: width 0.5s ease-in-out;
	}
	.login_orange_box > .text {
	  display: block;
	  width: 100%;
	  height: 100%;
	  font-size: 5rem;
	  text-align: center;
	  line-height: 25rem;
	  color: #fff;
	  transition: all 0.5s ease-in-out;
	}

	.login-form {
	  margin: 0 0 0 2rem;
	  padding: 0.5rem;
	}

	.login-input {
	  display: block;
	  width: 100%;
	  font-size: 1.8rem;
	  padding: 0.5rem 1rem;
	  box-shadow: 5px 5px 5px orange;
	  border-color: #ccc;
	  border-width: 0 0 2px 0;
	  border-radius: 10px;
	}
	.login-input:focus {
	  background-color: rgba(255,153,0,0.9);
	  color: white;
	  box-shadow: 5px 5px 5px #888;		
	}

	.login-btn{
		width:50px;
		height:50px;
		float :right;
		margin-top: -3%;
		margin-right: 5%;
		border-radius: 50%;
		opacity: 0.9;
	}

	.login-btn:hover{
		width:60px;
		height:60px;
		transition: all 0.2s ease-in-out;
	}  


</style>

<body id="page-top">

    <div class="modal fade" id="popUpWindow" data-backdrop="static" data-keyboard="false">	
    	<div class="modal-dialog">
	  			<div class="modal-body">
					<div class="main_login_box">
					<div class="login_orange_box"><span class="text">LOGIN</span></div>
					<form action="../Login_store" method="POST" enctype="multipart/form-data" class="login-form"><br>
					<input type="text" name="username_" placeholder="Username" class="login-input"/><br>
					<input type="password" name="password_" placeholder="Password" class="login-input"/>
					<br><br><span style="padding:3%"><a href="#forgotpwd">Forgot Password</a></span><input type="image" onclick="login-btn()" class= "login-btn" src="images/icons/unnamed.jpg" alt="Submit">
  					</form>
					</div>
				</div>
		</div>
	</div>
    </body>
</html>