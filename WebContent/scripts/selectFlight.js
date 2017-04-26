var selectedDate = new Date();
var start = new Date();
$(document).ready(function() {
	selectedDate = new Date($("#dateSelected").text());
	//selectedDate = new Date("Mon Nov 07 2016");
	initDate();
	displayDates();
	displayFlights();
	$(document).on("click", ".flight-date", function() {
		removeActive();
		$(this).parent().addClass("active");
		selectedDate = new Date($(this).text());
		displayFlights();
	});
	$(document).on("click", "#nextDate", function() {
		start.setDate(start.getDate() + 1)
		displayDates();
	});
	$(document).on("click", "#previousDate", function() {
		start.setDate(start.getDate() - 1)
		displayDates();
	});
	$(document).on("click", "#flightsTbl tbody tr", function() {
		var isDisabled = $(this).find('input[type=radio]').prop('disabled');
		if (!isDisabled) {
			$(this).find('input[type=radio]').prop('checked', true);
			$("#departure").text(selectedDate.getFullYear(selectedDate)  + "-" + ("0" + (selectedDate.getMonth(selectedDate) + 1)).toString().slice(-2) + "-" + selectedDate.getDate(selectedDate) + " | " + $(this).find('.flightDepartureTime').text());
			$("#arrival").text(selectedDate.getFullYear(selectedDate)  + "-" + ("0" + (selectedDate.getMonth(selectedDate) + 1)).toString().slice(-2) + "-" + selectedDate.getDate(selectedDate) + " | " + $(this).find('.flightArrivalTime').text());
			$(this).find('.flightPrice').text();
		}
	});
});

function displayFlights() {
	$.ajax({
		url : 'select-flight-snippet',
		type : 'POST',
		data : {
			departureDate : (selectedDate.getMonth(selectedDate) + 1) + "/" + selectedDate.getDate(selectedDate) + "/" + selectedDate.getFullYear(selectedDate)
		},
		async : false,
		cache : false,
		dataType : 'html',
		success : function(data) {
			$('#flights').empty();
			$('#flights').append(data);
		},
		error : function(data) {
			console.log(data);
		}
	});
}

function removeActive() {
	$(".flight-date").parent().removeClass("active");
}

function initDate() {
	var dateDiff = (selectedDate - new Date(new Date().toDateString())) / 1000 / 60 / 60 / 24;

	if (dateDiff > 2) {
		start.setDate(selectedDate.getDate() - 2)
	}
}

function displayDates() {
	var next = 5;
	var startDateLoop = new Date(start.toDateString());
	var firstDate = startDateLoop;
	var lastDate = new Date();
	lastDate = new Date(lastDate.setDate(firstDate.getDate()) + 1);
	console.log("first: " + firstDate.toString());
	console.log("last: " + lastDate.toString());
	var classActive;
	if (start.toDateString() == new Date().toDateString()) {
		$("#previousDate").addClass("hidden");
	} else {
		$("#previousDate").removeClass("hidden");
	}
	
	$("#dateTabs").empty();
	for (var count = 0; count < next; count++) {
		if (startDateLoop.toDateString() == selectedDate.toDateString()) {
			classActive = "class='active'";
		} else {
			classActive = "";
		}
		$("#dateTabs").append( "<li " + classActive + "><a class='flight-date'>" + startDateLoop.toDateString() + "</a></li>");
		// add one day per loop
		startDateLoop = new Date(startDateLoop.setDate(startDateLoop.getDate() + 1));
	}
}