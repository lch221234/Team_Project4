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

//관리자페이지 이동
function goAdmin() {
	location.href = "admin.go";
}

// 회원정보수정
function memberInfo(){
	location.href="member.info.go";
}

// 탈퇴
function bye() {
	if (confirm("탈퇴하시겠습니까?")) {
		location.href = "memeber.bye";
	}
}

