$(document).ready(function() {
	fetch();
	alert("Hey");
	setTimeout(function() {
		$("#contact0").trigger('click');
	}, 1000);
});

$(document).on('click', "#delete", function() {
	if ($("#UP_FirstName").val() === " ") {
		console.log("Delet Button Triggered");
		var deleteKey = {};
		deleteKey.contactName = $("#UP_FirstName").val();
		deleteKey.userKey = $("#userKey1").val();
		console.log(deleteKey);
		var DeleteJson = JSON.stringify(deleteKey);
		console.log(DeleteJson);
		$.ajax({
			url : '/app/DeleteContact',
			data : DeleteJson,
			contentType : "application/json",
			dataType : 'json',
			success : function(data) {
				alert("SUCCESS FULLY Deleted");
			},
			error : function() {
				alert("SuccessFully Deleted");
			},

			type : 'POST'
		});
	} else {
		alert("Enter the valid contact Name");
	}
});

$(document).on('click', ".contactsli", function() {
	i = 0;
	$('.AddedEmails').remove();
	var id = $(this).attr("id");
	var new_li = $("#" + id);
	var new_ts = [ "0" ].data;
	console.log(new_li["0"].data.contact_name);
	$("#Update_ContactEmail1").val("");
	$("#UP_FirstName").val(new_li["0"].data.contact_name);
	$("#UP_website").val(new_li["0"].data.website);
	$("#UP_company").val(new_li["0"].data.company);
	$("#UP_work_title").val(new_li["0"].data.title);
	console.log(new_li["0"].data.eMailString);
	console.log(new_li["0"].data.eMailString[0]);

	var parsedJson = $.parseJSON(new_li["0"].data.eMailString);
    var customLabelCount = Object.keys(parsedJson).length-3;
 
	console.log("Personal Email Count " + parsedJson.personal.length);
	console.log("Work Email Count " + parsedJson.work.length);

	console.log("JSON  Email Count "+Object.keys(parsedJson).length) ;
	var emaillength = parsedJson.personal.length + parsedJson.work.length +customLabelCount ;
	console.log("Email Count" + emaillength);
	for (var i1 = 0; i1 < emaillength - 1; i1++) {
		console.log(i1);
		addEmail(i1);

	}
	var l = 0;
	var te1 = 0;
	console.log(parsedJson);
	for ( var key in parsedJson) {
		console.log("")
		console.log("ALL Key: " + key);
		console.log("Value: " + parsedJson[key]);
		var te = parsedJson[key];
		console.log(te);
		var arrayLength = te.length;
		console.log("arrayLenth"+arrayLength);
		for (var i = 0; i < arrayLength; i++)
		{
			  if(key == 'personal' || key == 'work' || key == 'other')
			  {
				$("#Update_ContactEmail" + te1).val(te[i]);
				console.log("ALL predefined Key: " + key);
				  te1++;

			  }
		  else
			  {
			  
			  console.log("Non defined");
		$("#Update_ContactEmail" + te1).val(parsedJson[key]);
		$("#ContactEmailType"+te1).append('<option>'+key+'</option>');
		  te1++;

			  }

		}
	
	
		}
});

function fetch() {
	var json, i = 0;
	var Jsonwriter = "";
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
				$(".up_profile").hide();
				$("#Err_Message").css("text-algin", "center");
				$("#Err_Message").html("No records found. Add Contacts");

			} else {
				$.each(jsonData, function(name, value) {
					var li = document.createElement("li");
					li.innerText = jsonData[i].contact_name;
					li.data = jsonData[i];
					li.className = 'list-group-item contactsli';
					li.id = "contact" + i;
					console.log(li.id);
					ul.appendChild(li);
					console.log(jsonData[i].contact_name);
					console.log(li.data);
					i++;
				});
				$("#contactlist").append(ul);
				$(".up_profile").show();
				setTimeout(function() {
					$("#contact0").trigger('click');
				}, 10);

			}
			console.log(ul);

		},
		error : function() {
			alert('Error loading PatientID');
		}
	});
}




function InitialFormLoad() {

	console.log("Triggering Form on Load");
	i = 0;
	$('.AddedEmails').remove();
	var id = contact0;
	var new_li = $("#" + id);
	var new_ts = [ "0" ].data;
	console.log(new_li["0"].data.contact_name);
	$("#Update_ContactEmail1").val("");
	$("#UP_FirstName").val(new_li["0"].data.contact_name);
	$("#UP_website").val(new_li["0"].data.website);
	$("#UP_company").val(new_li["0"].data.company);
	$("#UP_work_title").val(new_li["0"].data.title);
	console.log(new_li["0"].data.eMailString);
	console.log(new_li["0"].data.eMailString[0]);
	var parsedJson = $.parseJSON(new_li["0"].data.eMailString);
	console.log("Totoal Keys Length"+parsedJson.length);
	console.log("Personal Email Count " + parsedJson.personal.length);
	console.log("Work Email Count " + parsedJson.work.length);
	var emaillength = parsedJson.personal.length + parsedJson.work.length;
	console.log("Email Count" + emaillength);
	for (var i1 = 0; i1 < emaillength - 1; i1++)
	{
		console.log(i1);
		addEmail(i1);
	}
	var l = 0;
	var te1 = 0;

	for ( var key in parsedJson)
	{
		console.log("Key: " + key);
		console.log("Value: " + parsedJson[key]);
		var te = parsedJson[key];
		console.log(te);
		var arrayLength = te.length;
		for (var i = 0; i < arrayLength; i++)
		{
			te1 += i;
			$("#Update_ContactEmail" + te1).val(te[i]);
			$("#ContactEmailType"+te1).append('<option>'+key+'</option>');
			console.log(te1);
		}
		te1++;
	}	}