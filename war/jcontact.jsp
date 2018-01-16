<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Contact</title>
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
	src=""></script>
</head>
<script type="text/javascript">
	$(function() {
		var i = 1;
		$(".add-email").on('click', function() {
			var ele = $(this).closest('.input-row').clone(true);
			i++;
						console.log(ele);
			var newID = 'emaildiv' + i;
			var IDforEmail = 'ContactEmail' + i;
			var IDforEmailType = 'ContactEmailType' + i;
			ele.find(".phonefield").attr('id', IDforEmail);
			ele.find(".form-select").attr('id', IDforEmailType);
			ele.attr('id', newID)
			$(this).closest('.input-row').after(ele);
			$("#"+IDforEmail).val("");
			if(i==2)
			{
				console.log("Second Added");
				$("#"+IDforEmailType).val("Work");
			}
			if(i==3)
				{
				console.log("Second Added");
				$("#"+IDforEmailType).val("other");
				$("#"+IDforEmailType).hide();
				var otherfeild = document.createElement("input");
				console.log(otherfeild);
				otherfeild.setAttribute("id", "Div1");
				otherfeild.setAttribute("class","labelfeild");	
				otherfeild.setAttribute("type","input");
				ele.find("#hidden").append(otherfeild);

				//this.(otherfeild);
				//$('#hidden').append(otherfeild);

					
				$("#"+IDforEmailType).add(otherfeild);
				console.log(otherfeild);
                
				}
			
			event.preventDefault();

		})
		 var j=1;
		$(".add-mobile").on('click', function() {
			var ele = $(this).closest('.input-row').clone(true);
			j++;
			console.log(ele);
			var newID = 'mobilediv' + j;
			var IDforEmail = 'ContactMobileNo' + j;
			var IDforEmailType = 'ContactMobileNoType' + i;
			ele.find(".phonefield").attr('id', IDforEmail);
			ele.find(".form-select").attr('id', IDforEmailType);
			ele.attr('id', newID)
			$(this).closest('.input-row').after(ele);
			$("#"+IDforEmail).val("");
			event.preventDefault();

		})

		 var j=1;
		$(".add-address").on('click', function() {
			var ele = $(this).closest('.input-row').clone(true);
			j++;
			console.log(ele);
			var newID = 'mobilediv' + j;
			var IDforAddress = 'address' + j;
			var IDforAddressType = 'addressType1' + i;
			ele.find(".phonefield").attr('id', IDforAddress);
			ele.find(".form-select").attr('id', IDforAddressType);
			ele.attr('id', newID)
			$(this).closest('.input-row').after(ele);
			event.preventDefault();

		})

        		

		$("#sub").click(function() {
			// var formData = $("#reg-form").serialize();
			 //console.log("Test"+formData);
			/* var countries = [];
			var values = [];
			var i=1;

			$.each($(".input-row"), function(){ 
			    countries.push($("#ContactEmailType"+ i +"").val());
			    
			    values.push($("#ContactEmail"+ i +"").val());
			    console.log();
			    i++;
			});
			console.log(values);
			console.log(countries);
			*/
			
			 /* var jsonForm={};
			 var contactEmail={};
			$("input", $("#reg-form")).each(function(index){
			   jsonForm[$(this).attr("id")] = this.value;
			 }) */
			 
		/* $("input", $("#all-email")).each(function(index){
			   contactEmail[] = this.value;
			 }) */
			 
			var emailTypes= document.getElementsByClassName("email-type");
			var emailAddress = document.getElementsByClassName("email-address");
			var mobileType= document.getElementsByClassName("mobile-type");
			var mobileNum = document.getElementsByClassName("mobile-num");
			var addressType = document.getElementsByClassName("address-type");

			var contactAddress = document.getElementsByClassName("address");
			
			var resultJSON = {};
			resultJSON.contact_name = $("#FirstName").val();
			resultJSON.email={"personal":[],"work":[],"other":[]};
			var emailCount = emailTypes.length
			for(var i=0;i<emailCount;i++){
				switch(emailTypes[i].value){
					case "Personal":
						resultJSON.email.personal.push(emailAddress[i].value);
						break;
					case "Work":
						resultJSON.email.work.push(emailAddress[i].value);
						break;
					case "Other":
						resultJSON.email.other.push(emailAddress[i].value);
						break;
					default:
						break;
				}
			}
			resultJSON.mobile={"home":[],"work":[],"other":[]};
			var mobileCount = mobileType.length
			for(var i=0;i<mobileCount;i++){
				switch(mobileType[i].value){
					case "Home":
						resultJSON.mobile.home.push(mobileNum[i].value);
						break;
					case "Work":
						resultJSON.mobile.work.push(mobileNum[i].value);
						break;
					case "Other":
						resultJSON.mobile.other.push(mobileNum[i].value);
						break;
					default:
						break;
				}
			}
			
			resultJSON.address={"home":[],"work":[],"other":[]};
			var addressCount = addressType.length
			for(var i=0;i<addressCount;i++){
				switch(addressType[i].value){
					case "Home":
						resultJSON.address.home.push(contactAddress[i].value);
						break;
					case "Work":
						resultJSON.address.work.push(contactAddress[i].value);
						break;
					case "Other":
						resultJSON.address.other.push(contactAddress[i].value);
						break;
					default:
						break;
				}
			}
			resultJSON.website =$("#website").val();
			resultJSON.company = $("#company").val();
			resultJSON.title = $("#work_title").val();
			//var resJSON = JSON.stringify(resultJSON);
				// data: "{\"data\":"+JSON.stringify(resultJSON)+"}"
			console.log(resultJSON);
			$.ajax({
				   url: '/app/create',
				   data: JSON.stringify(resultJSON) ,
			       contentType: "application/json",
				   error: function() {
					   alert("500");
				   },
				   dataType: 'jsonp',
				   success: function(data) {
					   alert("200");
				   },
				   type: 'POST'
				});

			event.preventDefault();

		});

	})
</script>
<body>
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
					<select class="form-control form-select email-type" id="ContactEmailType1" name="ContactEmailType">
						<option>Personal</option>
						<option>Work</option>
						<option>Other</option>
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
					
				</div>
				<input type="number" class="phonefield mobile-num" id="ContactMobileNo1"
					name="ContactMobileNo" placeholder="Mobile Number"
					style="display: inline-block"">
							<i class="fa fa-plus-circle add-mobile" aria-hidden="true"></i>
			
			</div>
			<br>
			
						<div class="input-row" id="address-container1">
				<br> <label style="padding-right:80%">Address</label>
				<div class="select-div">
					<select class="form-control form-select address-type" id="addressType1">
						<option>Home</option>
						<option>Work</option>
						<option>Other</option>
					</select>

				</div>
				<input type="text" class="phonefield address" id="address1"
					name="AddressFeild" placeholder="Contact Address"
					style="display: inline-block"">
							<i class="fa fa-plus-circle add-address" aria-hidden="true"></i>
			
			</div>
			<br>
			
				<label style="margin-left:-15%">Website</label> <input type="text"
				class="form-control phonefield" id="website" name="website"
				placeholder="Website" />
			<br>
			
			
				<label style="max-width:0%">Company</label> 
				<input type="text"
				class="form-control small-tfield" id="company" name="company"
				placeholder="Company " /> <input type="text"
				class="form-control small-tfield" id="work_title" name="work_title"
				placeholder="Title" />
				
				
			
			<button class="btn btn-lg btn-primary btn-block" id="sub"
				type="submit">ADD CONTACT</button>
			
		</form>
	</div>
</body>

</html>