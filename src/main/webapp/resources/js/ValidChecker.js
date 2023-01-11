// HongValidChecker.js
// 함수명 다르게 해도 상관은 없으나, 기억 잘하셔야!!
// 잘못됐을 때 true(뭐가 문제가 되면 true, 정상적이면 false)
////////////////////////////////////////////////////

// <input>을 쓸때
//		아무것도 안썼으면 true, 뭐라도 썼으면 false
function isEmpty(input){
	return (!input.value);
}

// <input>에 내용을 넣었을 때 
// 한글 or 특수문자가 적혀있다면 true, 없다면 false
function containsAnother(input) {
	let pass = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ@_.!#$%^&*()";
	let iv = input.value;
	for(let i =0; i < iv.length; i++){
		if (pass.indexOf(iv[i]) == -1) { // pass의 내용 중에 내가 쓴 내용이 없으면
			return true;
		}
	}
	return false;
}

// <input>, 글자수 넣었을 때
// 그 글자수보다 적으면 true, 그 글자수 이상이면 false
function atLeastLetter(input, len){
	return(input.value.length < len);
}

// <input> x 2 넣었을 때 (pw, pwChk)
// 내용이 서로 다르면 true, 같으면 false
function notEquals(input1, input2){
	return(input1.value != input2.value);
}

// <input>, 문자열 세트 넣었을 때
// 없으면 true, 있으면 false (입력한 pw에 지정한 문자열이 없는 경우)

function notContain(input, passSet){
	let iv = input.value;
	for(let i=0; i<passSet.length; i++){
		if(iv.indexOf(passSet[i]) != -1);
		return false;
	}
	return true;
}

// <input> 넣었을 때 
//		숫자 아닌거 있으면 true, 숫자만 있으면 false
function isNotNumber(input){
	return isNaN(input.value);
}

// <input>에 확장자 넣었을 때
// 확장자 명이 아니면 true, 확장자 명이면 false
function isNotType(input, type){
	// .jpg, .gif, .png, ...
	type = "." + type;
	return (input.value.indexOf(type) == -1);
}








