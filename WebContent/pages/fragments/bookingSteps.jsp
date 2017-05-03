<%@ taglib prefix="s" uri="/struts-tags" %>
<div id="bookingSteps">
	<div class="step">
		<span>Search Flight</span>
		<s:if test="%{#session.step >= 1}">
			<a href="dashboard"><button <s:if test="%{#session.step == 1}">disabled</s:if>> 1</button></a>
		</s:if>
	</div>
	<div class="step">
		<span>Select Flights</span>
		<s:if test="%{#session.step >= 2}">
			<a href="select-flight"><button <s:if test="%{#session.step == 2}">disabled</s:if>> 2 </button></a>
		</s:if>
		<s:else>
			<button class="disabled">= 2 </button>
		</s:else>
	</div>
	<div class="step">
		<span>Passenger Details</span>
		<s:if test="%{#session.step >= 3}">
			<a href="passenger-details"><button <s:if test="%{#session.step == 3}">disabled</s:if>> 3 </button></a>
		</s:if>
		<s:else>
			<button class="disabled"> 3 </button>
		</s:else>
	</div>
	<div class="step">
		<span>Select Seat</span>
		<s:if test="%{#session.step >= 4}">
			<a href="select-seat"><button <s:if test="%{#session.step == 4}">disabled</s:if>> 4 </button></a>
		</s:if>
		<s:else>
			<button class="disabled"> 4 </button>
		</s:else>
	</div>
	<div class="step">
		<span>Add-ons</span>
		<s:if test="%{#session.step >= 5}">
			<a href="#"><button <s:if test="%{#session.step == 5}">disabled</s:if>> 5 </button></a>
		</s:if>
		<s:else>
			<button class="disabled"> 5 </button>
		</s:else>
	</div>
</div>