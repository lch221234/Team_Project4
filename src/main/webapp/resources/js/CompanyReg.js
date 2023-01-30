function CompanyChk() {
	let nameBox = document.enrollForm.companyName
	let nationIdBox = document.enrollForm.nationId
	let companyIntroBox = document.enrollForm.companyIntro
	
	if(isEmpty(nameBox)){
		alert("업체이름 미입력")
		nameBox.value = "";
		nameBox.focus();
		return false;
	}else if (isEmpty(nationIdBox)) {
		alert("국내 or 국외 선택해주세요")
		nationIdBox.focus();
	}else if(isEmpty(companyIntroBox)){
		alert("업체 소개를 써주세요")
		companyIntroBox.value = "";
		companyIntroBox.focus();
	}
	return true;
}