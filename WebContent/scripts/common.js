/**
 * 
 */
$(document).ready(function(){
	//Nano scroller
	$(".nano").nanoScroller({
		flash: true,
		preventPageScrolling: true
	});
	//
	$(".date-picker").datepicker({
        changeMonth: true,
        changeYear: true,
        minDate: 0,
        dateFormat: "mm/dd/yy"
	});
	$("#loginSubmitButton").on("click", function(){
		var username = $("#username").val();
		var password = $("#password").val();
		var message;
		$.ajax({
			url : 'LoginActionJson',
			type : 'POST',
			data : {
			"username" : username,
			"password" : password
			},
			traditional: true,
			async : false,
			cache : false,
			success : function(data) {
				message = JSON.stringify(data).replace(/[^a-z0-9\s]/gi, '');
				
			},
			error : function(data) {
				alert("Error");
			}
		});
		if (message == "error"){
			validateUserInput(username,password);
			return false;
		}
		//
		
		
		
	})
	function validateUserInput(username,password){
		if(username== "" || password==""){
			
			var fieldCounter=0;
			var field= "";
			var uname="";
			var pword="";
			if (username== ""){
				$("#username").parent().addClass("has-error");
				$("#username").parent().addClass("has-feedback");
				uname="username";
				fieldCounter++;
			}
			if (password== ""){
				$("#password").parent().addClass("has-error");
				$("#password").parent().addClass("has-feedback");
				pword="password";
				fieldCounter++;
			}
			if(fieldCounter>1){
				field="or ";
			}
			errorMessage1="The "+uname+" "+field;
			errorMessage2=errorMessage1+""+pword+" must not be blank.";
			$("p#wrongInfo").text(errorMessage2);
		}else {
			$("#password").val("");
			$("p#wrongInfo").text("Username and password do not match. Please try again.");
		}
		
	}
});