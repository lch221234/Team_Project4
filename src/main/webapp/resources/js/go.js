// 회원가입 페이지
function goJoin() {
	location.href = "member.join.go";
}

//function logout() {
//	
//	location.href = "member.logout";
//}

//로그아웃
function logout() {
	var ok = confirm("정말 로그아웃 하시겠습니까?");
	if (ok) {
		location.href = "member.logout";
	}
}

//관리자페이지 이동 현재 안됨
function goAdmin() {
	location.href = "admin.go";
}





