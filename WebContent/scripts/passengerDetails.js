$(document).ready(function(){
/*	$(document).on("submit", "#passengersForm", function(){
		var passengerJSON = {};
		for (var int = 1; int <= $("#pax").val(); int++) {
			passengerJSON[int - 1] = [];
			passengerJSON[int - 1]["prefix"] = $("#prefix" + int).val();
			passengerJSON[int - 1]["firstName"] = $("#firstName" + int).val();
			passengerJSON[int - 1]["middleName"] = $("#middleName" + int).val();
			passengerJSON[int - 1]["lastName"] = $("#lastName" + int).val();
			passengerJSON[int - 1]["birthDay"] = $("#birthDay" + int).val();
		}
		alert(JSON.stringify(passengerJSON))
		return false;
	});*/
});

(function ($) {
    $.fn.serializeFormJSON = function () {

        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
        	o[this.name] = this.value || '';
            if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
})(jQuery);