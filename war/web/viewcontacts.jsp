<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap4.min.css">
<link rel="stylesheet" type="text/css" href="/style1.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.min.css">
<script src="/js/jquery-3.2.1.min.js"></script>

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/contact.css">
<link rel="stylesheet" type="text/css" href="/contact.css">
<script src="/js/update.js"></script>


<script type="text/javascript">
	var json, i = 0;
	var Jsonwriter = "";
	var key = "${user}";
	var ul = document.createElement("ul");
	ul.className = 'list-group';

	$.ajax({
		type : 'get',
		url : '/app/getContacts',
		data : {
			user : key
		},
		contentType : 'application/json; charset=utf-8',
		dataType : 'json',
		success : function(jsonData) {
                
			if (jsonData.length === 0) {
				alert("No contacts found")
			}
			else
				{
			$.each(jsonData, function(name, value) {
				var li = document.createElement("li");
				li.innerText = jsonData[i].contact_name;
				li.className = 'list-group-item contactsli';
				ul.appendChild(li);
				console.log(jsonData[i].contact_name);
				i++;
			});
			$("#contactlist").append(ul);
				}
			console.log(jsonData);
			
		},
		error : function() {
			alert('Error loading PatientID');
		}
	});
</script>


</head>
<body>

	<div class="contactContainer">
		<p>Contact List</p>
		<div id="contactlist"></div>
	</div>
	<div class="ContactProfile">
		<div class="wrapper">
			<form id="update-form" class="form-signin">
				<h2 class="form-signin-heading">Contact Details</h2>
				<label>${message}</label> <label>Name</label> <input type="text"
					class="form-control phonefield" id="FirstName" name="FirstName"
					placeholder="Contact Name" />
				<div id="all-email">
					<div class="input-row" id="email-container1">
						<br> <label style="padding-right: 80%">Email ID</label>
						<div class="select-div">
							<select class="form-control form-select email-type"
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
						class="form-control  webfield" id="website" name="website"
						placeholder="Website" />
				</div>
				<div class="input-row company-feild" id="mpbileno-container1">
					<label style="max-width: 0%">Company</label> <input type="text"
						class="form-control small-tfield" id="company" name="company"
						placeholder="Company " /> <input type="text"
						class="form-control small-tfield" id="work_title"
						name="work_title" placeholder="Title" />

				</div>

				<button class="btn btn-lg btn-primary btn-block" id="sub"
					type="submit">Save</button>
			</form>
		</div>



	</div>
</body>
</html>