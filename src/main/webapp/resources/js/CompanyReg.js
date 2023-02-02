function CompanyCheck() {
	let nameBox = document.enrollForm.company_name;
	let countryBox = document.enrollForm.country_id;
	let introduceBox = document.enrollForm.company_introduce;
	
	if(isEmpty(nameBox)){
		alert("업체이름 미입력")
		nameBox.value = "";
		nameBox.focus();
		return false;
	}else if (isEmpty(countryBox)) {
		alert("국내 or 국외 선택해주세요")
		countryBox.focus();
		return false;
	}else if(isEmpty(introduceBox)){
		alert("업체 소개를 써주세요")
		introduceBox.value = "";
		introduceBox.focus();
		return false;
	}
	return true;
}//방법이 되서 밑에꺼 주석 위애꺼로 진행
//안되서 밑에꺼로 작성

//업체 등록 유효성 체크 
//function CompanyCheck() {
//	$(".btn_enroll_btn").click(function() {
//		let c_name = $(".company_name").val();
//		let c_introduce = $(".company_introduce").val();
//		if (c_name =="") {
//			alert("업체 이름 미입력");
//			c_name.value = "";
//			c_name.focus();
//			return false;
//		}else if (enrollForm.country_id.value=="none") {
//			alert("국내 or 국외 선택해주세요");
//			return false;
//		}else if (c_introduce =="") {
//			alert("업체 소개 미입력");
//			c_introduce.value = "";
//			c_introduce.focus();
//		}
//		return true;
//	});
//}
//
//$(function(){
//	CompanyCheck();
//});