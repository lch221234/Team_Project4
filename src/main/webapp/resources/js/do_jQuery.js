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

function doubleChkId() {
	$(".doubleChk").click(function(){
		let m_id = $(".id_input").val();
		$.getJSON("member.idChk?m_id="+m_id, function(memberJSON){
			if (m_id == "") {
				alert("ID를 입력해주세요")
				$(".id_input_box").css("border","2px solid red");
			} else if (memberJSON.member[0] != null){
				$(".id_input_box").css("border","2px solid red");
				alert("이미 사용된 ID입니다");
			} else if (m_id.length < 6) {
				alert("6~20자 영문 소문자+숫자");
				$(".id_input_box").css("border","2px solid red");
			} else {
				alert("사용가능한 ID입니다");  
				$(".id_input_box").css("border","2px solid #1266FF");
				$(".id_chk2").attr("value","idCheck2")
			}
		});
	});
}

function AddCategory(){
	$(".rcBtn").click(function(){
		let category_name = $(".category_name").val();
		let div = $("<div></div>").text(category_name);
		$(".categoryBox").append(div);
	});
}

$(function(){
	searchAddress();
	doubleChkId();
//	AddCategory();
});