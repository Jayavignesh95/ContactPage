var select_source;
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
		ele.find(".add-email").hide();
		ele.attr('id', newID)
		$(this).closest('.input-row').after(ele);
		$("#" + IDforEmail).val("");
		if (i == 2) {
			console.log("Second Added");
			$("#" + IDforEmailType).val("Work");
		}
		

		event.preventDefault();

	})
	var k = 1;
	$(".add-mobile").on('click', function() {
		var ele = $(this).closest('.input-row').clone(true);
		k++;
		console.log(ele);
		var newID = 'mobilediv' + k;
		var IDforEmail = 'ContactMobileNo' + k;
		var IDforEmailType = 'ContactMobileNoType' +k;
		ele.find(".phonefield").attr('id', IDforEmail);
		ele.find(".form-select").attr('id', IDforEmailType);
		ele.attr('id', newID)
		ele.find(".add-email").hide();
		$(this).closest('.input-row').after(ele);
		$("#" + IDforEmail).val("");

		
		if (k == 2) {
			console.log(k);
			console.log("Second Added");
			$("#" + IDforEmailType).val("Work");
		}
		if (k == 3 || k > 3) {
			console.log("Third Added");
			$("#" + IDforEmailType).val("other");
			$("#" + IDforEmailType).hide();
			var otherfeild = document.createElement("input");
			console.log(otherfeild);
			otherfeild.setAttribute("id", "Other_email_label");
			otherfeild.setAttribute("class", "labelfeild");
			otherfeild.setAttribute("type", "input");
			otherfeild.setAttribute("placeholder", "Custom Label");
			ele.find("#hidden").append(otherfeild);
			$("#" + IDforEmailType).add(otherfeild);
			console.log(otherfeild);

		}

		
		
		event.preventDefault();

	})

$("#customlabelbutton").click(function()
{
	var customlabelvalue = document.getElementById("customlabelfeild").value;
	 $('#all-email').find('select').append('<option  >'+customlabelvalue+'</option>');
	 $("#"+select_source).val(customlabelvalue);
     $('#myModal').modal('hide');
     $("#customlabelfeild").val("");
     $("#contactModal").modal('show');


});
	
	
	$("#update-form").submit(function(){
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
		var emailCount = emailTypes.length
		for (var i = 0; i < emailCount; i++) {
			if(emailAddress[i].value == "")
				{
				  emailFlag =false;
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
				var new_pair ={};
				resultJSON.email[emailTypes[i].value] = emailAddress[i].value;
				break;
			}
		}
		resultJSON.mobile = {
			"home" : [],
			"work" : [],
			"other" : []
		};
		var mobileCount = mobileType.length
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
		
		$.ajax({
			url : '/appv1/update',
			data : JSON.stringify(resultJSON),
			contentType : "application/json",
			dataType : 'json',
			success : function(data) {
				alert("200");
			},
			error : function() {
				alert("500");
			},
			
			type : 'POST'
		});

		//event.preventDefault();

	});

})

$(function() {

$(".form-select").on("change", function () {
	console.log("Clicked Select")
      $modal = $('#myModal');
      if($(this).val() === 'Other'){
        $modal.modal('show');
       select_source = $(this).attr('id');
    }
 });

});

var myModalClose = function(){
	$('#myModal').modal('hide');
}



$(document).ready(function(){
	
	$( "#reg-btn2" ).click(function() {
		console.log("Clicked ADD contact");

	    $modal = $('#contactModal');
	        $modal.modal('show');
	});	
	
	
});


$(function() {


		$("#myModalClose").click(function (){
				console.log("Triggering Inner Modal");
				$('#myModal').modal('hide');
	
		})

	});

