<%@ taglib prefix="s" uri="/struts-tags"%>
<div>
	<s:if test="%{flights.size > 0}">
		<form action="select-flight-submit" method="POST">
			<table id=flightsTbl>
				<thead>
					<tr>
						<th></th>
						<th>Departure</th>
						<th>Arrival</th>
						<th>Price</th>
						<th>Seats Left</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<s:iterator var="flight" value="flights">
						<tr>
							<td>
								<s:if test="%{#flight.seatingCapacity-#flight.numberOfOccupiedSeats > 0 && #flight.flightStatus != 'Cancelled'}">
									<input type="radio" name="flightId" value="${flight.flightId}"> Flight ${flight.flightId}
								</s:if>
								<s:else>
									<input type="radio" name="flightId" value="${flight.flightId}" disabled> Flight ${flight.flightId}
								</s:else>
							</td>
							<td class="flightDepartureTime">${flight.departureTime}</td>
							<td class="flightArrivalTime">${flight.arrivalTime}</td>
							<td class="flightPrice">${sessionScope.ticket.flight.route.price}</td>
							<td>${flight.seatingCapacity-flight.numberOfOccupiedSeats}</td>
							<td>
								<s:if test="%{#flight.seatingCapacity-#flight.numberOfOccupiedSeats > 0}">
									${flight.flightStatus}
								</s:if>
								<s:else>
									Full
								</s:else>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			<input type="submit">
		</form>
	</s:if>
	<s:else>
		No flight in this date
	</s:else>
</div>