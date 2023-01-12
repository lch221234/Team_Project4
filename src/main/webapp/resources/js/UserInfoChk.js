function userInfoChk(){
	let idBox = document.join_form.id_input;
	let pwBox = document.join_form.pw_input;
	let pwChkBox= document.join_form.pwck_input;
	let nameBox = document.join_form.user_input;
	let addr1Box = document.join_form.address_input1;
	let addr2Box = document.join_form.address_input2;
	let addr3Box = document.join_form.address_input3;
	let sexBox = document.join_form.gender_radio;
	
	/*	
	if (isEmpty(idBox) || atLeastLetter(idBox, 6)) {
		alert("아이디");
		idBox.value="";
		idBox.focus();
		return false;
		
	} else if (isEmpty(pwBox) || atLeastLetter(pwBox,8) || notEquals(pwBox,pwChkBox)  편의성을 위해 id와 비밀번호 막아뒀습니다(나중에 풀겁니다) --성현 
			|| containsAnother(pwBox)) {
		alert('비밀번호');
		pwBox.value="";
		pwChkBox.value="";
		pwBox.focus();
		return false;
		
	} else*/ if (isEmpty(nameBox)) {
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

//추가한 부분 로그인 유효성 검사
//function userloginChk(){
//	let idBox = document.login_form.id_input;
//	let pwBox = document.login_form.pw_input;
//	
//		
//	if (isEmpty(idBox) || atLeastLetter(idBox, 6)) {
//		alert("아이디");
//		idBox.value="";
//		idBox.focus();
//		return false;
//		
//	} else if (isEmpty(pwBox) || atLeastLetter(pwBox,8) || notEquals(pwBox,pwChkBox)  
//			|| containsAnother(pwBox)) {
//		alert('비밀번호');
//		pwBox.value="";
//		pwChkBox.value="";
//		pwBox.focus();
//		return false;
//		
//	} 
//	return true;
//}