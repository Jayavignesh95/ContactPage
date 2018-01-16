<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login App</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/style.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
 <div class="register-btn "  style="margin-top:5px">
    <button id="reg-btn" class ="reg btn btn-xs btn-primary" style="margin-left:80%"> REGISTER</button>
  </div>
  
  <div class="err"> <p>${message}</p>
  </div>
  <div class="wrapper">
  		
    <form id="login-form" class="form-signin" action="/app/forgetPassword">       
      <h3 class="form-signin-heading"> Enter the Email Address</h3>
      <input type="text" class="form-control" name="user" placeholder="Email Address"  /><br>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Get Reset Link</button>   
      
    </form>
  </div>




</body>
</html>