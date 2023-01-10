// 회원가입 유효성검사 추가

function joinCheck() {
	var idInput = document.id_input;
	var pwInput = document.pw_input;
	var pwckInput = document.pwck_input;
	var nameInput = document.user_input;
	var addr1Input = document.address_input_1;
	var addr2Input = document.address_input_2;
	var addr3Input = document.address_input_3;
	
	if (isEmpty(idInput)) {
		alert("ID를 정확히 입력해주세요");
		idInput.value = "";
		idInput.focus();
		return false;
	} else if (isEmpty(pwInput) || notEquals(pwInput, pwckInput)
			|| notContains(pwInput, "1234567890")) {
		alert("PW를 정확히 입력해주세요");
		pwInput.value = "";
		pwckInput.value = "";
		pwInput.focus();
		return false;
	} else if (isEmpty(nameInput)) {
		alert("이름을 정확히 입력해주세요");
		nameInput.value = "";
		nameInput.focus();
		return false;
	} else if (isEmpty(addr1Input) || isEmpty(addr2Input)
			|| isEmpty(addr3Input)) {
		alert("주소를 정확히 입력해주세요");
		addr1Input.value = "";
		addr2Input.value = "";
		addr3Input.value = "";
		addr3Input.focus();
		return false;
	} 
	return true;
}

function updateMemberCheck() {
	
}