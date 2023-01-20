/* 회원가입 유효성검사를 회원정보 수정에 똑같이 입히면 됩니다 굳이 따로 안만들어도 됩니다  info.jsp form name을 join_form으로 수정*/
function userInfoChk(){
	let idBox = document.join_form.id_input;
	let pwBox = document.join_form.pw_input;
	let pwChkBox= document.join_form.pwck_input;
	let nameBox = document.join_form.user_input;
	let addr1Box = document.join_form.address_input1;
	let addr2Box = document.join_form.address_input2;
	let addr3Box = document.join_form.address_input3;
	let sexBox = document.join_form.gender_radio;
	
	
/*	if (isEmpty(idBox) || atLeastLetter(idBox, 6)) {
		alert("아이디");
		idBox.value="";
		idBox.focus();
		return false;
		
	} else if (isEmpty(pwBox) || atLeastLetter(pwBox,8) || notEquals(pwBox,pwChkBox)  
			|| containsAnother(pwBox)) {
		alert('비밀번호');
		pwBox.value="";
		pwChkBox.value="";
		pwBox.focus();
		return false;
		
	} else */ if (isEmpty(nameBox)) {
		alert("이름");
		nameBox.value="";
		nameBox.focus();
		return false;
		
	} else if (isEmpty(addr1Box) || isEmpty(addr2Box)) {
		alert("우편번호");
		addr1Box.value="";
		addr2Box.value="";
		addr1Box.focus();
		return false;
		
	} else if (isEmpty(addr3Box)){
		alert("상세주소")
		addr3Box.value="";
		addr3Box.focus();
		return false;
		
	} else if (isEmpty(sexBox)) {
		alert('성별');
		return false;
	}
	return true;
}