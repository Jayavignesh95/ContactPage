<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/style.css">

</head>
<body>
<div class="register-btn "  style="margin-top:5px">
    <a href="/app/logout"><button id="reg-btn" class ="reg btn btn-xs btn-primary" style="margin-left:80%"> LOGOUT</button></a>
  </div>
  <h1>Welcome  </h1>  
    ${user}
  </body>
</html>