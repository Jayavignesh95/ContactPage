var select_source;
var i = 0;
var selected_cname;
function addEmail(count) {
	console.log("Excuting ADD EMAIL  " + count);
	var i = count;
	$("#Update_ContactEmail0").val("");
	var ele = $("#up_email-container1").clone(true);
	console.log($("#all-email"));
	console.log(ele);
	var newID = 'emaildiv' + i;
	var IDforEmail = 'Update_ContactEmail' + i;
	var IDforEmailType = 'ContactEmailType' + i;
	console.log(IDforEmailType);
	ele.attr('class', "AddedEmails");
	ele.find(".phonefield").attr('id', IDforEmail);
	ele.find(".form-select").attr('id', IDforEmailType);
	ele.find(".add-email").hide();
	console.log(ele.find(".delete-email"));
	ele.find(".delete-email").show();
	ele.attr('id', newID);
	$("#up_email-container1").after(ele);
	$("#" + IDforEmail).val("");
	if (i == 2) {
		console.log("Second Added");
		$("#" + IDforEmailType).val("Work");
}
}

function addMobile(count) {
	var i = count;
	$("#Update_ContactMobileNo0").val("");
	var ele = $("#up_mobileno-container1").clone(true);
	console.log($("#all-mobile"));
	console.log(ele);
	var newID = 'emaildiv' + i;
	var IDforMobile = 'Update_ContactMobileNo' + i;
	var IDforMobileType = 'Update_MobileNoType' + i;
	console.log(IDforMobileType);
	ele.attr('class', "AddedMobiles");
	ele.find(".phonefield").attr('id', IDforMobile);
	ele.find(".form-select").attr('id', IDforMobileType);
	ele.find(".add-mobile").hide();
	ele.attr('id', newID);
	$("#up_mobileno-container1").after(ele);
	$("#" + IDforMobile).val("");
	if (i == 2) {
		console.log("Second Added");
		$("#" + IDforMobileType).val("Work");

	}
}




$(function() {
	var i = 1;
	var t1Email = 0;
	$(".add-email").on('click', function() {

		if ($("#ContactEmail" + i).val() == "") {
			alert("Please enter the Email Address");
		} else {
			var ele = $(this).closest('.input-row').clone(true);
			i++;
			console.log(i);
			var newID = 'emaildiv' + i;
			var IDforEmail = 'ContactEmail' + i;
			var IDforEmailType = 'ContactEmailType' + i;
			ele.find(".phonefield").attr('id', IDforEmail);
			ele.find(".form-select").attr('id', IDforEmailType);
			ele.attr('id', newID);
			ele.find('.add-email').hide();
			ele.find('.delete-email').show();
			console.log($(".firstEmail").last());
			$(".firstEmail").last().after(ele); 
			$("#" + IDforEmail).val("");
			$(this).closest('.add-email').hide();
		}
event.preventDefault();
	});

	$(".delete-email").on('click', function() {
		if ($('.email-address-reg').length > 1) {
			$(this).closest('.input-row').remove();
			$(".firstEmail").last().find(".add-email").show();
			console.log($('.email-address-reg').length);
		} else {
			alert("It's A primanry Email address");
		}
		i--;
		console.log(i);
		event.preventDefault();
	});

	var k = 1;
	$(".add-mobile").on('click', function() {
		if ($("#ContactMobileNo" + k).val() == "") {
			alert("Please enter the Mobile Number");
		} 
		else 
		{
			var ele = $(this).closest('.input-row').clone(true);
			k++;
			console.log(ele);
			var newID = 'mobilediv' + k;
			var IDforMobile = 'ContactMobileNo' + k;
			var IDforMobileType = 'ContactMobileNoType' + k;
			ele.find(".phonefield").attr('id', IDforMobile);
			ele.find(".form-select").attr('id', IDforMobileType);
			ele.attr('id', newID);
			ele.find(".add-mobile").hide();
			ele.find('.delete-mobile').show();
			$(this).closest('.input-row').after(ele);
			$(this).closest('.add-mobile').hide();
			$("#" + IDforMobile).val("");
		}
				event.preventDefault();
				$(".delete-mobile").on('click', function() {
				$(this).closest('.input-row').prev().find(".add-mobile").show();
				$(this).closest('.input-row').remove();
				k--;
				event.preventDefault();
		});

	});

	$("#customlabelbutton").click(
			function() {
				var customlabelvalue = document.getElementById("customlabelfeild").value;
				$('#all-email').find('select').append(
						'<option  >' + customlabelvalue + '</option>');
				$("#" + select_source).val(customlabelvalue);
				$('#myModal').modal('hide');
				$("#customlabelfeild").val("");
				$("#contactModal").modal('show');
			});

	$("#customMobilelabelbutton").click(
			function() {
				var customlabelvalue = document
						.getElementById("customMobilelabelfeild").value;
				$('.all-mobile_div').find('select').append(
						'<option  >' + customlabelvalue + '</option>');
				$("#" + select_source).val(customlabelvalue);
				$('#myModalMobile').modal('hide');
				$("#customMobilelabelfeild").val("");
				$("#contactModal").modal('show');
			});

	$("#reg-form")
			.submit(
					function() {
						var emailFlag = true;
						var mobileFlag = true;
						event.preventDefault();
						var emailTypes = document
								.getElementsByClassName("email-type-reg");
						var emailAddress = document
								.getElementsByClassName("email-address-reg");
						var mobileType = document
								.getElementsByClassName("mobile-type-reg");
						var mobileNum = document
								.getElementsByClassName("mobile-num-reg");

						var resultJSON = {};
						resultJSON.contact_name = $("#FirstName").val();
						resultJSON.email = {
							"personal" : [],
							"work" : [],
							"other" : []
						};
						var emailCount = emailTypes.length;
						for (var i = 0; i < emailCount; i++) {
							switch (emailTypes[i].value) {
							case "personal":
								if (emailAddress[i].value != "")
								{
									resultJSON.email.personal.push(emailAddress[i].value);
								}
								break;
							case "work":
								if (emailAddress[i].value != "") {
									resultJSON.email.work.push(emailAddress[i].value);
								}
								break;
							case "other":
								if (emailAddress[i].value != "") {
									resultJSON.email.other.push(emailAddress[i].value);
								}
								break;
							default:
								var new_pair = {};
								if (emailAddress[i].value != "") {
									resultJSON.email[emailTypes[i].value] = emailAddress[i].value;
								}
								break;
							}
						}
						resultJSON.mobile = {
							"home" : [],
							"work" : [],
							"other" : []
						};
						var mobileCount = mobileType.length;
						for (var i = 0; i < mobileCount; i++) {
							switch (mobileType[i].value) {
							case "home":
								if (mobileNum[i].value) {
									resultJSON.mobile.home
											.push(mobileNum[i].value);
								}
								break;
							case "work":
								if (mobileNum[i].value) {
									resultJSON.mobile.work
											.push(mobileNum[i].value);
								}
								break;
							case "other":
								if (mobileNum[i].value) {
									resultJSON.mobile.other
											.push(mobileNum[i].value);
								}
								break;
							default:
								var new_pair = {};
								if (mobileNum[i].value != "") {
									resultJSON.mobile[mobileType[i].value] = mobileNum[i].value;
								}

								break;
							}
						}
						resultJSON.website = $("#website").val();
						resultJSON.company = $("#company").val();
						resultJSON.title = $("#work_title").val();
						resultJSON.userKey = $("#userKey").val();
						console.log(resultJSON);
						
						$.ajax({
							url : '/app/create2',
							data : JSON.stringify(resultJSON),
							contentType : "application/json",
							dataType : 'json',
							success : function(data) {
								$("#reg-form").find('input').each(function() {
									$(this).val('');
								});
								$("input[type=text]").val("");
								$('#contactlist').html("");
								fetch();
							},
							error : function() {
								alert("500");
							},

							type : 'POST'
						});
						$('#contactModal').modal('hide');
						console.log("Appending new list");
					});

});

$(function() {
	$(".email-type").on("change", function() {
		console.log("Clicked Select");
		$modal = $('#myModal');
		if ($(this).val() === 'other') {
			$modal.modal('show');
			select_source = $(this).attr('id');
		}
	});

});

$(function() {
	$(".mobile-type").on("change", function() {
		console.log("Clicked Select");
		$modal = $('#myModalMobile');
		if ($(this).val() === 'other') {
			$modal.modal('show');
			select_source = $(this).attr('id');
		}
	});
});

var myModalClose = function() {
	$('#myModal').modal('hide');
};

var myModalMobileClose = function() {
	$('#myModalMobile').modal('hide');
}

$(document).ready(function() {
	$("#reg-btn2").click(function() {
		console.log("Clicked ADD contact");
		$modal = $('#contactModal');
		$modal.modal('show');
		$(".email-address-reg").click(function(){
			$(".add-email").hide();
			$(this).closest(".input-row").find(".add-email").show();
			});
		$(".mobile-num-reg").click(function(){
			$(".add-mobile").hide();
			$(this).closest(".input-row").find(".add-mobile").show();
			
			
			
		});
	});
});

$(function() {
	$("#myModalClose").click(function() {
		console.log("Triggering Inner Modal");
		$('#myModal').modal('hide');
	});
});

$(function() {
	$("#myModalMobileClose").click(function() {
		console.log("Triggering Inner Modal");
		$('#myModalMobile').modal('hide');
	});
});


// For testing HashMap to JSON
$("#reg-form").submit(function() {
	var emailFlag = true;
	var mobileFlag = true;
	event.preventDefault();
	var emailTypes = document.getElementsByClassName("email-type");
	var emailAddress = document.getElementsByClassName("email-address");
	var mobileType = document.getElementsByClassName("mobile-type");
	var mobileNum = document.getElementsByClassName("mobile-num");
	var resultJSON = {};
	resultJSON.contact_name = $("#FirstName").val();
	resultJSON.email = {
		"personal" : [],
		"work" : [],
		"other" : []
	};
	var emailCount = emailTypes.length;
	for (var i = 0; i < emailCount; i++) {
		if (emailAddress[i].value == "") {
			emailFlag = false;
		}
		switch (emailTypes[i].value) {
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
			var new_pair = {};
			resultJSON.email[emailTypes[i].value] = emailAddress[i].value;
			break;
		}
	}
	resultJSON.mobile = {
		"home" : [],
		"work" : [],
		"other" : []
	};
	var mobileCount = mobileType.length;
	for (var i = 0; i < mobileCount; i++) {
		switch (mobileType[i].value) {
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
	resultJSON.website = $("#website").val();
	resultJSON.company = $("#company").val();
	resultJSON.title = $("#work_title").val();
	resultJSON.userKey = $("#userKey").val();
	console.log(resultJSON);
	console.log("Adding Contact Triggered")
	$.ajax({
		url : '/app/create2',
		data : JSON.stringify(resultJSON),
		contentType : "application/json",
		dataType : 'json',
		success : function(data) {
			$('#contactlist').html("");
			$("input[type=text]").val("");
			fetch();
		},
		error : function() {
			alert("500");
		},
		type : 'POST'
	});
	$('#contactModal').modal('hide');
	console.log("Appending new list");
});

$('#Up_FirstName').on('input', function(e) {
});
$(document).on('click', "#UpdateContact", function() {
	event.preventDefault();
	var emailFlag = true;
	var mobileFlag = true;
	event.preventDefault();
	var emailTypes = document.getElementsByClassName("email-type");
	var emailAddress = document.getElementsByClassName("email-address");
	var mobileType = document.getElementsByClassName("mobile-type");
	var mobileNum = document.getElementsByClassName("mobile-num");
	var resultJSON = {};
	resultJSON.contact_name = $("#UP_FirstName").val();
	resultJSON.email = {
		"personal" : [],
		"work" : [],
		"other" : []
	};
	var emailCount = emailTypes.length;
	for (var i = 0; i < emailCount; i++) {
		switch (emailTypes[i].value) {
		case "personal":
			if (emailAddress[i].value != "") {
				resultJSON.email.personal.push(emailAddress[i].value);
			}
			break;
		case "work":
			if (emailAddress[i].value != "") {
				resultJSON.email.work.push(emailAddress[i].value);
			}
			break;
		case "other":
			if (emailAddress[i].value != "") {
				resultJSON.email.other.push(emailAddress[i].value);
			}
			break;
		default:
			var new_pair = {};
			if (emailAddress[i].value != "") {
				resultJSON.email[emailTypes[i].value] = emailAddress[i].value;
			}
			break;
		}
	}
	resultJSON.mobile = {
		"home" : [],
		"work" : [],
		"other" : []
	};
	var mobileCount = mobileType.length;
	for (var i = 0; i < mobileCount; i++) {
		switch (mobileType[i].value) {
		case "home":
			if (mobileNum[i].value) {
				resultJSON.mobile.home.push(mobileNum[i].value);
			}
			break;
		case "work":
			if (mobileNum[i].value) {
				resultJSON.mobile.work.push(mobileNum[i].value);
			}
			break;
		case "other":
			if (mobileNum[i].value) {
				resultJSON.mobile.other.push(mobileNum[i].value);
			}
			break;
		default:
			var new_pair = {};
			if (mobileNum[i].value != "") {
				resultJSON.mobile[mobileType[i].value] = mobileNum[i].value;
			}

			break;
		}
	}
	resultJSON.website = $("#UP_website").val();
	resultJSON.company = $("#UP_company").val();
	resultJSON.title = $("#UP_work_title").val();
	resultJSON.userKey = key;
	console.log(resultJSON);
	$.ajax({
		url : '/app/update',
		data : JSON.stringify(resultJSON),
		contentType : "application/json",
		dataType : 'json',
		success : function(data) {
			$('#contactlist').html("");
			fetch();
		},
		error : function() {
			alert("500");
		},
		type : 'POST'
	});
	$("input[type=text]").val("");
});


$(document).ready(function() {
	console.log($('.email-address-reg').length);
	$(".add-email").hide();
	$(".delete-email").hide();
	$('.email-address-reg').keyup(function(e) {
		var ele = $(this).closest('.input-row');
		if ($(this).val().length != 0) {
			$('.add-email').attr('disabled', false);
			console.log($('.email-address-reg').length);
			ele.find(".add-email").show();
			ele.find(".delete-email").show();
		} else {
			ele.find(".add-email").hide();
		}
		//$("#all-email .add-email").hide();
		//$(this).parent().next().show();
	})
});
$(document).ready(function() {
	$(".add-mobile").hide();
	$(".delete-mobile").hide();
	$('.mobile-num-reg').keyup(function(e) {
		var ele = $(this).closest('.input-row');
		ele.find(".add-mobile").hide();
		console.log(ele);
		if ($(this).val().length != 0) {
			$('.add-mobile').attr('disabled', false);
			ele.find(".add-mobile").show();
			ele.find(".delete-mobile").show();

		} else {
			ele.find(".add-mobile").hide();
		}
	})
});




/***************************** Event Functions *****************************************************/


$(document).ready(function () {

	 $('#eventDate').datepicker({ autoclose: true, language: 'es' });
	 $('#eventDate').datepicker('update', new Date());
		displaySlots();
      displaySlots();
      
	$("#create_Event").click(function(){
		
		// Generating JSON for event Handler
		var Create_EventJSON = {};
		Create_EventJSON.eventName = $("#eventName").val();
		Create_EventJSON.eventDate = $("#eventDate").val();
		Create_EventJSON.eventDuration = $("#event_duration").val();
		console.log(Create_EventJSON);

		
	});
	$("#eventDate").blur(function(){
		//alert("HEy");
		//ON selecting the date this function with wake up on blur
		
	});

});


function displaySlots()
{
	console.log("slots");
	var data = {
		    'foo': 'bar',
		    'foo2': 'baz'
		};

var s = $('#available_slots');
for(var val in data) {
   s.append('<option value=' + key + '>' + val + '</option>');

}
s.appendTo('createEvents');
}



