// 회원가입 페이지
function goJoin() {
	location.href = "member.join.go";
}


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
function del() {
	if (confirm("정말 탈퇴 하시겠습니까?")) {
		location.href="member.delete";
	}
}

// 팝업창 열기
let openwin;
function openChild(){
	window.name = "parentForm"
	openwin = window.open("admin/child","childForm","width=800, height=600, resizable = no, scrollbars = no");
}

//function regCategory(){
//	location.href = "category.registration";
//	
//}

function regCategory() {
	location.href = "child";
}

function regProduct() {
	location.href = "product.reg";
}