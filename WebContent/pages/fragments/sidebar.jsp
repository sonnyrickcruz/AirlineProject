<%@ taglib prefix="s" uri="/struts-tags" %>
<s:set var="originId" value="%{#session.ticket.flight.route.origin.airportId}"/>
<s:set var="originLocation" value="%{#session.ticket.flight.route.origin.location}"/>
<s:set var="originName" value="%{#session.ticket.flight.route.origin.name}"/>
<s:set var="destinationId" value="%{#session.ticket.flight.route.destination.airportId}"/>
<s:set var="destinationLocation" value="%{#session.ticket.flight.route.destination.location}"/>
<s:set var="destinationName" value="%{#session.ticket.flight.route.destination.name}"/>
<s:set var="departureDateSession" value="%{#session.ticket.flight.departureDate}"/>
<s:set var="departureTimeSession" value="%{#session.ticket.flight.departureTime}"/>
<s:set var="arrivalDateSession" value="%{#session.ticket.flight.arrivalDate}"/>
<s:set var="arrivalTimeSession" value="%{#session.ticket.flight.arrivalTime}"/>
<s:set var="paxSession" value="%{#session.ticket.flight.route.pax}"/>

<input type="hidden" id="originId" value="${originId}">
<input type="hidden" id="originLocation" value="${originLocation}">
<input type="hidden" id="originName" value="${originName}">
<input type="hidden" id="destinationId" value="${destinationId}">
<input type="hidden" id="destinationLocation" value="${destinationLocation}">
<input type="hidden" id="destinationName" value="${destinationName}">
<input type="hidden" id="pax" value="${paxSession}">
<input type="hidden" id="departureDate" value="${departureDateSession}">
<input type="hidden" id="departureTime" value="${departureTimeSession}">
<input type="hidden" id="arrivalDate" value="${arrivalDateSession}">
<input type="hidden" id="arrivalTime" value="${arrivalTimeSession}">
<div id="sidebar" class="nano">
	<div class="nano-content row">
		<div id="sidebarTitle">
			<h3><b>Booking Summary</b></h3>
		</div>
		<hr>
		<div id="sidebarContent">
			<div id="sidebarFlightDetails">
				<div class="sidebarHeader"><i class="fa fa-info" aria-hidden="true"></i> Flight Details</div>
				<div class="sidebarContent">
					<i class="fa fa-plane" aria-hidden="true"></i> <b>Origin:</b> 
					<span id="originString">${originId} - ${originLocation}, ${originName}</span>
					<br/>	
					<i class="fa fa-plane fa-rotate-90" aria-hidden="true"></i> <b>Destination:</b>
					<span id="destinationString">${destinationId} - ${destinationLocation}, ${destinationName}</span>
					<br/>
					<div id="departureDetails">
						<i class="fa fa-arrow-up fa-rotate-45" aria-hidden="true"></i> <b>Departure:</b>
						<span id="departure">${departureDateSession} | ${departureTimeSession}</span>
					</div>
					<div id="arrivalDetails">
						<i class="fa fa-arrow-right fa-rotate-45" aria-hidden="true"></i> <b>Arrival:</b>
						<span id="arrival">${arrivalDateSession} | ${arrivalTimeSession}</span>
					</div>
				</div>
			</div>
<!-- 			<div id="sidebarPassengerInfo">
				<div class="sidebarHeader"><i class="fa fa-user" aria-hidden="true"></i> Passenger Info</div>
				<div class="sidebarContent">
					
				</div>
			</div> -->
		</div>
	</div>
</div>