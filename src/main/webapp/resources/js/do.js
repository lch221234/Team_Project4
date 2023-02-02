function eyeImgLogin() {
	let x = document.getElementById("pw_input");
	let eye = document.getElementById("login_eye_img");
	if (x.type === "password") {
		x.type = "text";
		eye.src = "resources/img/eye-open.png";
	} else {
		x.type = "password";
		eye.src = "resources/img/eye-close.png"
	}
}

function eyeImgJoinPw() {
	let x = document.getElementById("pw_input");
	let eye = document.getElementById("pw_eye_img");
	if (x.type === "password") {
		x.type = "text";
		eye.src = "resources/img/eye-open.png";
	} else {
		x.type = "password";
		eye.src = "resources/img/eye-close.png"
	}
}

function eyeImgJoinPwCk() {
	let x = document.getElementById("pwck_input");
	let eye = document.getElementById("pwck_eye_img");
	if (x.type === "password") {
		x.type = "text";
		eye.src = "resources/img/eye-open.png";
	} else {
		x.type = "password";
		eye.src = "resources/img/eye-close.png"
	}
}

function idChk() {
	let x = document.getElementsByName("idDuplication")[0];
	if (x.value === "idUnCheck") {
		x.value = "idCheck";
	}
}

function loginck() {
	let idBox = document.login_form.id_input;
	let pwBox = document.login_form.pw_input;
	if(isEmpty(idBox)){
		alert("아이디 미입력");
		idBox.value="";
		idBox.focus();
		return false;
	}else if (isEmpty(pwBox)) {
		alert("비밀번호 미입력");
		pwBox.value="";
		pwBox.focus();
		return false;
	}
		return true;
}


//안되서 위에꺼로 작성
//function loginck() {
//$(".login_button").click(function() {
//	let m_id = $(".id_input").val();
//	let m_pw = $(".pw_input").val();
//	if (m_id == "") {
//		alert("아이디 미입력");
//		m_id.value = "";
//		m_id.focus();
//		return false;
//	}else if (m_pw == "") {
//		alert("비밀번호 미입력");
//		m_pw.value = "";
//		m_pw.focus();
//		return false;
//	}
//	return true;
//});
//}


