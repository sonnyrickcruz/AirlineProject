$(document).ready(function(){
	$(document).on("submit", "#passengersForm", function(){
		var passenger;
		var passengers = [];
		for (var int = 1; int <= $("#pax").val(); int++) {
			passenger = {
				prefix: $("#prefix" + int).val(),
				firstName: $("#firstName" + int).val(),
				middleName: $("#middleName" + int).val(),
				lastName: $("#lastName" + int).val(),
				birthDay: $("#birthDay" + int).val()
			}
			passengers.push(passenger)
		}
		alert(JSON.stringify(passengers));
		submitAction = passengers;
		return false;
	});
});

function submitAction(passengers) {
	$.ajax({
		url : "passenger-details-submit",
		type : "POST",
		dataType : "json",
		async : false,
		cache : true,
		data : {
			message: passengers
		},
		success : function(data) {
			if (data.length > 0) {
				response(data);
				console.log(data);
			} else {
				response([ "No Results Found" ]);
			}
		}
	});
}