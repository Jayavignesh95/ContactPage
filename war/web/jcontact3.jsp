<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact</title>
	
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/style1.css">
	<link rel="stylesheet" type="text/css" href="/font-awesome/css/font-awesome.min.css">

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.js"></script>
	
<link rel="stylesheet" type="text/css" href="/style1.css">
<script type="text/javascript">
var key = "${user}";
</script>

<script
	src="/js/ContactForm2.js"></script>
<script
	src="/js/fetch.js"></script>

</head>
<body>
  
  
  
  
  
  
  <div class="modal fade" id="contactModal">
<div class="modal-dialog modal-lg"  >
    <div class="modal-content" >
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title" id="myModalLabel">New Contact</h4>
      </div>
      <div class="modal-body">
		<div class="modal fade model1" id="myModal">
			<div class="modal-dialog modal-sm"  >
			    <div class="modal-content" >
			      <div class="modal-header">
			        <button type="button" class="close"  aria-hidden="true">×</button>
			        <h4 class="modal-title" id="myModalLabel">Custom Label</h4>
			      </div>
			      <div class="modal-body">
			      <input type="text"
							class="form-control customfeild" id="customlabelfeild" name="customlabelfeild"
							placeholder="Enter Custom label" />
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default"  id="myModalClose">Close</button>
			        <button type="button" class="btn btn-primary" id="customlabelbutton">Save changes</button>
			      </div>
			    </div>
			  </div>
			  </div>
  
		      
      
      <div class="wrapper">
	  
	
		<form id="reg-form" class="form-signin">
			<h2 class="form-signin-heading">Contact Details</h2>
			<label>${message}</label> <label>Name</label> <input type="text"
				class="form-control phonefield" id="FirstName" name="FirstName"
				placeholder="Contact Name" required="true" />
				<div id="all-email">
							<div class="input-row" id="email-container1">
				<br> <label style="padding-right: 80%">Email ID</label>
				<div class="select-div">
					<select class="form-control form-select email-type" id="ContactEmailType1" name="ContactEmailType" required="true">
						<option>Personal</option>
						<option>Work</option>
						<option >Other</option>
					</select>
					
				<span id="hidden"></span>
				</div>
				<input type="email" class="phonefield email-address" id="ContactEmail1"
					name="ContactEmail" placeholder="Email Address"
					style="display: inline-block" required="true" >
				<i class="fa fa-plus-circle add-email" aria-hidden="true"></i>
				

			</div>
</div>
			<br>


			<div class="input-row" id="mpbileno-container1">
				<br> <label style="padding-right:80%">Mobile</label>
				<div class="select-div">
					<select class="form-control form-select mobile-type" id="MobileNoType1" >
						<option>Home</option>
						<option>Work</option>
						<option>Other</option>
					</select>
				<span id="hidden"></span>

				</div>
				<input type="number"  required="true" class="phonefield mobile-num" id="ContactMobileNo1"
					name="ContactMobileNo" pattern=".{10,10}" placeholder="Mobile Number"
					style="display: inline-block"">
							<i class="fa fa-plus-circle add-mobile" aria-hidden="true"></i>
			
			</div>
			<div class ="website-div">
			
				<label>Website</label> 
				<input type="text"
				class="form-control  webfield" id="website" name="website"
				placeholder="Website" required="true" />
			</div>
			<div class="input-row company-feild" id="mpbileno-container1">  
				<label style="max-width:0%">Company</label> 
				<input type="text"
				class="form-control small-tfield" id="company" name="company"
				placeholder="Company " /> <input type="text"
				class="form-control small-tfield" id="work_title" name="work_title"
				placeholder="Title" required="true"  />
				<input type="hidden" id="userKey" value="${user}"/>
				
			</div>	
			
			<button class="btn btn-lg btn-primary btn-block" id="sub"
				type="submit">Save</button>			
		</form>
	</div>

      
         </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
		      <button  id="reg-btn2" class="btn btn-default navbar-btn" >Add Contact</button>
		      <a href="/app/logout" id="reg-btn" class="btn btn-default navbar-btn" role="button">Log out</a>
				    


  </div>
</nav>
  
  	<div class="contactContainer">
		<p>Contact List</p>
		<div id="contactlist"></div>
	</div>
  	<div class="ContactProfile" >
		<div class="wrapper">
			<form id="update-form" class="form-signin">
				<h2 class="form-signin-heading">Contact Details</h2>
				<label>${message}</label> <label>Name</label> <input type="text"
					class="form-control phonefield" id="UP_FirstName" name="FirstName"
					placeholder="Contact Name" />
				<div id="all-email">
					<div class="input-row firstEmail" id="up_email-container1">
						<br> <label style="padding-right: 80%">Email ID</label>
						<div class="select-div">
							<select class="form-control form-select email-type "
								id="ContactEmailType1" name="ContactEmailType">
								<option>Personal</option>
								<option>Work</option>
								<option>Other</option>
							</select> <span id="hidden"></span>
						</div>
						<input type="email" class="phonefield email-address"
							id="ContactEmail1" name="ContactEmail"
							placeholder="Email Address" style="display: inline-block"">
						<i class="fa fa-plus-circle add-email" aria-hidden="true"></i>


					</div>
				</div>
				<br>


				<div class="input-row" id="mpbileno-container1">
					<br> <label style="padding-right: 80%">Mobile</label>
					<div class="select-div">
						<select class="form-control form-select mobile-type"
							id="MobileNoType1">
							<option>Home</option>
							<option>Work</option>
							<option>Other</option>
						</select> <span id="hidden"></span>

					</div>
					<input type="number" class="phonefield mobile-num"
						id="ContactMobileNo1" name="ContactMobileNo"
						placeholder="Mobile Number" style="display: inline-block"">
					<i class="fa fa-plus-circle add-mobile" aria-hidden="true"></i>

				</div>
				<div class="website-div">

					<label>Website</label> <input type="text"
						class="form-control  webfield" id="UP_website" name="website"
						placeholder="Website" />
				</div>
				<div class="input-row company-feild" id="mpbileno-container1">
					<label style="max-width: 0%">Company</label> <input type="text"
						class="form-control small-tfield" id="UP_company" name="company"
						placeholder="Company " /> <input type="text"
						class="form-control small-tfield" id="UP_work_title"
						name="work_title" placeholder="Title" />

				</div>

				<button class="btn btn-md btn-primary btn-block" id="sub"
					type="submit">Save</button>
					
			</form>
		</div>



	</div>
  

	
</body>


</html>