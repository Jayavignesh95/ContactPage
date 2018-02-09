<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact</title>
<link rel="stylesheet" type="text/css"
	href="/bootstrap/css/bootstrap4.min.css">
<link rel="stylesheet" type="text/css"
	href="/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="/style1.css">
<link rel="stylesheet" type="text/css"
	href="/font-awesome/css/font-awesome.min.css">

<script src="/js/jquery-3.2.1.min.js"></script>
<script src="/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" type="text/css" href="/datepicker/datepicker.css">
<script src="/datepicker/bootstrap-datepicker.js"></script>

<script type="text/javascript">
	var key = "${user}";
	console.log(key);
</script>

<script src="/js/ContactForm2.js"></script>
<script src="/js/fetch.js"></script>

</head>
<body>






	<div class="modal fade" id="contactModal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title" id="myModalLabel">New Contact</h3>
				</div>
				<div class="modal-body">
					<div class="modal fade model1" id="myModal">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Custom Email</h4>

								</div>
								<div class="modal-body">
									<input type="text" class="form-control customfeild"
										id="customlabelfeild" name="customlabelfeild"
										placeholder="Enter Custom label" />
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" id="myModalClose">Close</button>
									<button type="button" class="btn btn-primary"
										id="customlabelbutton">Add Label</button>
								</div>
							</div>
						</div>
					</div>


					<div class="modal fade model1" id="myModalMobile">
						<div class="modal-dialog modal-sm">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">Custom Mobile</h4>

								</div>
								<div class="modal-body">
									<input type="text" class="form-control customfeild"
										id="customMobilelabelfeild" name="customlabelfeild"
										placeholder="Enter Custom label" />
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										id="myModalMobileClose">Close</button>
									<button type="button" class="btn btn-primary"
										id="customMobilelabelbutton">Add Label</button>
								</div>
							</div>
						</div>
					</div>









					<div class="wrapper">


						<form id="reg-form" class="form-signin">
							<h2 class="form-signin-heading">Contact Details</h2>
							<label>${message}</label> <label>Name</label> <i
								class="fas fa-trash-alt"></i> <input type="text"
								class="form-control phonefield" id="FirstName" name="FirstName"
								placeholder="Contact Name" required="true" />
							<div id="all-email">
								<div class="input-row firstEmail" id="email-container1">
									<br> <label style="padding-right: 80%">Email ID</label>
									<div class="select-div">
										<select
											class="form-control form-select email-type email-type-reg"
											id="ContactEmailType1" name="ContactEmailType"
											required="true">
											<option>personal</option>
											<option>work</option>
											<option>other</option>
										</select> <span id="hidden"></span>
									</div>

									<div class="email-feild">

										<input type="email"
											class="phonefield email-address email-address-reg"
											id="ContactEmail1" name="ContactEmail"
											placeholder="Email Address" required="true"> 
											
									</div>
									<div class="buttonsFields"> 
									<i class="fa fa-plus-circle add-email" aria-hidden="true" id="tempBt"></i> 
											<i class="fa fa-minus-circle delete-email"></i>
											</div>
								</div>

							</div>
							<br>

							<div class="all-mobile_div">
								<div class="input-row" id="mpbileno-container1">
									<br> <label style="padding-right: 80%">Mobile</label>
									<div class="select-div">
										<select
											class="form-control form-select mobile-type mobile-type-reg"
											id="MobileNoType1">
											<option>home</option>
											<option>work</option>
											<option>other</option>
										</select> <span id="hidden"></span>

									</div>
									<input type="number" required="true"
										class="phonefield mobile-num mobile-num-reg"
										id="ContactMobileNo1" name="ContactMobileNo"
										pattern=".{10,10}" placeholder="Mobile Number"
										style="display: inline-block""> 
								<div class="MobilebuttonsFields"> 
									<i class="fa fa-plus-circle add-mobile" aria-hidden="true" ></i> 
											<i class="fa fa-minus-circle delete-mobile"></i>
											</div>
								</div>
							</div>
							<div class="website-div">

								<label>Website</label> <input type="text"
									class="form-control  webfield" id="website" name="website"
									placeholder="Website" required="true" />
							</div>
							<div class="input-row company-feild" id="mpbileno-container1">
								<label style="max-width: 0%">Company</label> <input type="text"
									class="form-control small-tfield" id="company" name="company"
									placeholder="Company " /> <input type="text"
									class="form-control small-tfield" id="work_title"
									name="work_title" placeholder="Title" required="true" /> <input
									type="hidden" id="userKey" value="${user}" />

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
		<p class="navbar-text">Signed in as ${user}</p>
		<button id="reg-btn2" class="btn btn-default navbar-btn">Add
			Contact</button>
		<a href="/app/logout" id="reg-btn" class="btn btn-default navbar-btn"
			role="button">Log out</a>



	</div>
	</nav>

	<div class="contactContainer">
		<p>Contact List</p>
		<div id="contactlist" style="overflow-y: scroll; height:600px;" ></div>
	</div>
	<div>
		<p style="text-align: center;" id="Err_Message"></p>
	</div>
	<div class="ContactProfile up_profile">
		<div class="wrapper">
			<form id="update-form" class="form-signin">
				<h2 class="form-signin-heading">Contact Details</h2>
				<label>${message}</label> <label>Name</label> <input type="text"
					class="form-control phonefield" id="UP_FirstName" name="FirstName"
					placeholder="Contact Name" />
				<div id="all-email" class="update-email-div">
					<div class="input-row" id="up_email-container1">
						<br> <label style="padding-right: 80%">Email ID</label>
						<div class="select-div">
							<select class="form-control form-select email-type "
								id="ContactEmailType0" name="ContactEmailType">
								<option>personal</option>
								<option>work</option>
								<option>other</option>
							</select> <span id="hidden"></span>
						</div>
						<input type="email" class="phonefield email-address"
							id="Update_ContactEmail0" name="ContactEmail"
							placeholder="Email Address" style="display: inline-block"">
						<i class="fa fa-plus-circle add-email" aria-hidden="true"></i>


					</div>
				</div>
				<br>


				<div class="input-row" id="up_mobileno-container1">
					<br> <label style="padding-right: 80%">Mobile</label>
					<div class="select-div">
						<select class="form-control form-select mobile-type"
							id="Update_MobileNoType0">
							<option>home</option>
							<option>work</option>
							<option>other</option>
						</select> <span id="hidden"></span>

					</div>
					<input type="number" class="phonefield mobile-num"
						id="Update_ContactMobileNo0" name="ContactMobileNo"
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
				<input type="hidden" id="UP_userKey1" value="${user}" />
				<div>
					<button class="btn btn-md btn-primary btn-block" id="UpdateContact"
						type="submit">Save</button>
					<button class="btn btn-md btn-danger btn-block " id="delete">Delete</button>
				</div>
			</form>

		</div>



	</div>


<div id="exTab2" class="container">	
<ul class="nav nav-tabs">
			<li class="active">
        <a  href="#createEvents" data-toggle="tab">Create Events</a>
			</li>
			<li><a href="#viewEvents" data-toggle="tab">View events</a>
			</li>
			
		</ul>

			<div class="tab-content ">
			  <div class="tab-pane active" id="createEvents">
          <h3>Create</h3>
             <label> Name</label>
                 <input type="text" id="eventName"> </input>
                 <br>
               <label>Date</label>
               <input type="text"  id="eventDate">
               <br>
               <label>Enter Duration</label>
                   <select id="event_duration">
                      <option value='30'>30</option>
                      <option value='60'>60</option>
                      <option value='120'>120</option>
                      </select>
               <select id="available_slots"> </select>
               
               <input type="button"  id="create_Event" value="Create"></button>
                                  
          
				</div>
				<div class="tab-pane" id="viewEvents">
          <h3>View</h3>
				</div>
       	</div>
  </div>

<hr></hr>


</body>


</html>