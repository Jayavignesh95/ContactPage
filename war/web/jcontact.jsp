<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact</title>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
<link rel="stylesheet" type="text/css" href="/style1.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="/js/ContactForm.js"></script>
</head>
<script type="text/javascript">
</script>
<body>
<div class="modal fade" id="myModal">
<div class="modal-dialog modal-sm"  >
    <div class="modal-content" >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel">Custom Label</h4>
      </div>
      <div class="modal-body">
      <input type="text"
				class="form-control customfeild" id="customlabelfeild" name="customlabelfeild"
				placeholder="Enter Custom label" />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="customlabelbutton">Save changes</button>
      </div>
    </div>
  </div>
  </div>
  <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Contact List</a>
    </div>
    <p class="navbar-text">Signed in as ${user} </p> 
      <a href="/app/logout" id="reg-btn" class="btn btn-default navbar-btn" role="button">Log out</a>
    


  </div>
</nav>
  
  

	<div class="wrapper">
	  
	
		<form id="reg-form" class="form-signin">
			<h2 class="form-signin-heading">Contact Details</h2>
			<label>${message}</label> <label>Name</label> <input type="text"
				class="form-control phonefield" id="FirstName" name="FirstName"
				placeholder="Contact Name" />
				<div id="all-email">
							<div class="input-row" id="email-container1">
				<br> <label style="padding-right: 80%">Email ID</label>
				<div class="select-div">
					<select class="form-control form-select email-type" id="ContactEmailType1" name="ContactEmailType" >
						<option>Personal</option>
						<option>Work</option>
						<option >Other</option>
					</select>
					
				<span id="hidden"></span>
				</div>
				<input type="email" class="phonefield email-address" id="ContactEmail1"
					name="ContactEmail" placeholder="Email Address"
					style="display: inline-block"">
				<i class="fa fa-plus-circle add-email" aria-hidden="true"></i>
				

			</div>
</div>
			<br>


			<div class="input-row" id="mpbileno-container1">
				<br> <label style="padding-right:80%">Mobile</label>
				<div class="select-div">
					<select class="form-control form-select mobile-type" id="MobileNoType1">
						<option>Home</option>
						<option>Work</option>
						<option>Other</option>
					</select>
				<span id="hidden"></span>

				</div>
				<input type="number" class="phonefield mobile-num" id="ContactMobileNo1"
					name="ContactMobileNo" placeholder="Mobile Number"
					style="display: inline-block"">
							<i class="fa fa-plus-circle add-mobile" aria-hidden="true"></i>
			
			</div>
			<div class ="website-div">
			
				<label>Website</label> 
				<input type="text"
				class="form-control  webfield" id="website" name="website"
				placeholder="Website" />
			</div>
			<div class="input-row company-feild" id="mpbileno-container1">  
				<label style="max-width:0%">Company</label> 
				<input type="text"
				class="form-control small-tfield" id="company" name="company"
				placeholder="Company " /> <input type="text"
				class="form-control small-tfield" id="work_title" name="work_title"
				placeholder="Title" />
				<input type="hidden" id="userKey" value="${user}"/>
				
			</div>	
			
			<button class="btn btn-lg btn-primary btn-block" id="sub"
				type="submit">Save</button>			
		</form>
	</div>


</body>


</html>