<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login App</title>
<script src="/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap4.min.css">
<script src="/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="/style1.css">
<link rel="stylesheet" type="text/css" href="/style.css">
<script type="text/javascript" src="/js/app.js"></script>
	
<script type="text/javascript">

$(document).ready(function() {
//alert("Hello");
  $('#reg-form').hide();
  $('#lgn-btn').hide();
    
	$('#reg-btn').click(function() {
		$('#login-form').hide();
		$('#reg-form').show();
		  $('#lgn-btn').show();
		  $('#reg-btn').hide();

		
	});
	$('#lgn-btn').click(function() {
		$('#reg-form').hide();
		$('#login-form').show();
		$('#reg-btn').show();
		  $('#lgn-btn').hide();

		});

});


</script>
</head>
<body>
 <div class="register-btn "  style="margin-top:5px">
    <button id="reg-btn" class ="reg btn btn-xs btn-primary" style="margin-left:80%"> REGISTER</button>
  </div>
 <div class="register-btn "  style="margin-top:5px">
    <button id="lgn-btn" class ="reg btn btn-xs btn-primary" style="margin-left:80%"> LOGIN</button>
  </div>
  
  <div id="result"> <p>${message}</p>
  </div>
  <div class="wrapper">
  		
    <form id="login-form" class="form-signin" action="/app/login" method = "POST">       
      <h2 class="form-signin-heading"> Login</h2>
      <input type="email" class="form-control" id="lguser" name="user" onsubmit="return lgvalidate()" placeholder="Email Address" required  /><br>
      <input type="password" class="form-control" id="lgpassword" name="password" placeholder="Password" required=""/>  <br>    
      <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>   
      <a href="/forgtpassword.jsp"> <p>Forget Password</p>  </a>
    </form>
  </div>


<div class="wrapper">
    <form id="reg-form" class="form-signin"  action="/app/register" method="post" >       
      <h2 class="form-signin-heading"> Register</h2>
          <label>${message}</label>
      <input type="email" class="form-control" id="rguser" name="user" placeholder="Email Address"  reuiqred="" /><br>
      <input type="password" class="form-control" id="rgpassword" name="password" placeholder="Password" required=""/>  <br>  
            <button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>   
    	<a href="/forgtpassword.jsp"><p>Forget Password</p></a>
    </form>
  </div>


</body>
</html>