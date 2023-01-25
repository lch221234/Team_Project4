function eyeImgLogin() {
	  let x = document.getElementById("pw_input");
	  let eye = document.getElementById("login_eye_img");
	  if (x.type === "password") {
	    x.type = "text";
	    eye.src ="resources/img/eye-open.png";
	  } else {
	    x.type = "password";
	    eye.src ="resources/img/eye-close.png"
	  }
	}

function eyeImgJoinPw() {
	  let x = document.getElementById("pw_input");
	  let eye = document.getElementById("pw_eye_img");
	  if (x.type === "password") {
	    x.type = "text";
	    eye.src ="resources/img/eye-open.png";
	  } else {
	    x.type = "password";
	    eye.src ="resources/img/eye-close.png"
	  }
	}

function eyeImgJoinPwCk() {
	  let x = document.getElementById("pwck_input");
	  let eye = document.getElementById("pwck_eye_img");
	  if (x.type === "password") {
	    x.type = "text";
	    eye.src ="resources/img/eye-open.png";
	  } else {
	    x.type = "password";
	    eye.src ="resources/img/eye-close.png"
	  }
	}

function idChk(){
	let x = document.getElementsByName("idDuplication")[0];
	if (x.value === "idUnCheck") {
		x.value = "idCheck";
	}
}