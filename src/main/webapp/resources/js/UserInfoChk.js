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
	
	let idChk = $(".id_chk").val();
	let idChk2 = $(".id_chk2").val();
	let pwBox1 = $(".pw_input").val(); // pwBox, pwBox1 둘 다 필요합니다
	let pwChkBox1 = $(".pwck_input").val();
//  아이디 유효성 검사 추가 -- 성현(1.25)
//  6~20자 영문 소문자+숫자 	대문자, 한글, 특수문자 x
	let idBox1 = $(".id_input").val().trim();
	let idRegExp = /^[a-z0-9]{6,20}$/;
	
//  비밀번호 유효성 검사 변경 -- 성현(1.24)
//  8~20자의 영문 대소문자+숫자+특수문자 
	let passRegExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/; 
	
	if (false === idRegExp.test(idBox1)) {
		alert("6~20자 영문 소문자+숫자");
		idBox.value="";
		idBox.focus();
		return false;
		
	} else if (false === passRegExp.test(pwBox1) || pwBox1 != pwChkBox1 ) {
		alert('8~20자의 영문 대소문자+숫자+특수문자');
		pwBox.value="";
		pwChkBox.value="";
		pwBox.focus();
		return false;
		
	} else if (isEmpty(nameBox)) {
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
// id 중복체크 안하면 회원가입 안되게 -- 성현
	} else if (idChk != "idCheck") { 
		alert("ID 중복체크");
		return false;
// jquery로 사용가능한 id일때만 회원가입 될수있게 -- 성현
	} else if (idChk2 != "idCheck2") {
		alert("동작");
		return false;
	}
	return true;
}