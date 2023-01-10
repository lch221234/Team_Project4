// 유효성검사 추가

// <input> 넣었을때
//	아무것도 안썼으면 true, 뭐라도 썼으면 false
function isEmpty(input) {
	return (!input.value);
}

// <input> 글자수를 넣었을때
// 그 글자수보다 적으면 true, 그 글자수 이상이면 false
function lessThan(input, len) {
	return (input.value.length < len);
}

// <input> 넣었을때
// 한글/특수문자가 적혀있으면 true, 없으면 false
function containsJSC(input) {
	var ok = "1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM@._";
	var iv = input.value;
	for (var i = 0; i < iv.length; i++) {
		if (ok.indexOf(iv[i]) == -1) {
			return true;
		}
	}
	return false;
}

// <input> x 2 넣었을때
// 내용이 다르면 true, 같으면 false
function notEquals(input1, input2) {
	return (input1.value != input2.value);
}

// <input>, 문자열세트 넣었을때
// 없으면 true, 있으면 false
function notContains(input, okSet) {
	var iv = input.value;
	for (var i = 0; i < okSet.length; i++) {
		if (iv.indexOf(okSet[i]) != -1) {
			return false;
		}
	}
	return true;
}

// <input> 넣었을때
// 숫자아닌거 있으면 true, 숫자만 있으면 false
function isNotNumber(input) {
	return isNaN(input.value);
}

// <input>, 확장자 넣었을 때
// 그거 아니면 true, 그거면 false
function isNotType(input, type) {
	type = "." + type;
	return (input.value.indexOf(type) == -1);
}
