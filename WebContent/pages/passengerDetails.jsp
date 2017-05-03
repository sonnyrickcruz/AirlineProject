<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div id="passengers">
	<input type="hidden" id="pax" value="${sessionScope.ticket.flight.route.pax}">
	<form id="passengersForm" action="">
		<s:iterator var="counter" begin="1" end="session.ticket.flight.route.pax" >
			<div>
				<div><h3>Passenger <s:property value="top" /></h3></div>
				<div>
					<div class="form-group">
				  		<label for="prefix${top}">Prefix:</label>
				  		<input type="text" class="form-control" id="prefix${top}" name="prefix${top}">
					</div>
					<div class="form-group">
				  		<label for="firstName${top}">First Name:</label>
				  		<input type="text" class="form-control" id="firstName${top}" name="firstName${top}">
					</div>
					<div class="form-group">
				  		<label for="middleName${top}">Middle Name:</label>
				  		<input type="text" class="form-control" id="middleName${top}" name="middleName${top}">
					</div>
					<div class="form-group">
				  		<label for="lastName${top}">Last Name:</label>
				  		<input type="text" class="form-control" id="lastName${top}" name="lastName${top}">
					</div>
					<div class="form-group">
						<label for="birthDate" class="control-label">Birth Date:</label>
						<div class="controls">
							<div class="input-group">
								<input id="birthDay${top}" type="text" class="date-picker form-control" name="birthDay${top}"/> 
								<label for="birthDay${top}" class="input-group-addon btn">
									<span class="glyphicon glyphicon-calendar"></span>
								</label>
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:iterator>
		<div class="form-group btn-div">
			<button type="submit" id="submitPassengerDetails" class="btn btn-default"> Submit </button>
		</div>
	</form>
</div>