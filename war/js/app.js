$(document).ready(function() {
	console.log("Hello");
   
   
   	$('#reg-form').on('submit', rgvalidate);
   	$('#login-form').on('submit', lgvalidate);


});
function isValidEmailAddress(address) {
	console.log("Validating email "+address);
	return !!address.match(/.+@.+/);
}

function rgvalidate() {
	console.log("Validate FIred");
	var result;
    var email = document.getElementById("rguser").value;
  var password = document.getElementById("rgpassword").value;
	console.log(email);
	var emailRegex = '^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$';
	if (email == "" || password == "") {
		if (isValidEmailAddress(email)) {
			$("#err").html('Sorry ! Please enter the valid email');
			$("#err").addClass("alert alert-danger");
		}		console.log("empty form recieved");
		$("#result").html('Sorry ! Please enter the valid details');
		$("#result").addClass("alert alert-danger");
		result = false;

	} else {
		if(password.length < 6)
		 {
		 $("#result").html('Sorry ! Password must be 6 character long');
			$("#result").addClass("alert alert-danger");
			result =false;
		 }
		else
			{
			result = true;
			}
	
	}
	return result;

}

function lgvalidate() {
	console.log("Validate FIred");
	var result;
    var email = document.getElementById("lguser").value;
  var password = document.getElementById("lgpassword").value;
	console.log(email);
	var emailRegex = '^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$';
	if (email == "" || password == "") {
		if (isValidEmailAddress(email)) {
			$("#result").html('Sorry ! Please enter the valid email');
			$("#result").addClass("alert alert-danger");
		}
		 console.log("empty form recieved");
		$("#result").html('Sorry ! Please enter the valid details');
		$("#result").addClass("alert alert-danger");
	      e.preventDefault();

		result = false;

	} else {
		result = true;
	}
	return result;

}
