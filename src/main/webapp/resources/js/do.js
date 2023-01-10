//$(()=>{
//	searchAddress();
//});

function searchAddress() {
	$(".address_button").click(function(){
		new daum.Postcode({
			oncomplete : function(data) {
				$(".address_input_1").val(data.zonecode);
				$(".address_input_2").val(data.roadAddress);
			}
		}).open();
	});
}



$(function(){
	searchAddress();
});