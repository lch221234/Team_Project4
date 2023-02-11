// 회원가입 페이지
function goJoin() {
	location.href = "member.join.go";
}

// 로그아웃
function logout() {
	var ok = confirm("정말 로그아웃 하시겠습니까?");
	if (ok) {
		location.href = "member.logout";
	}
}

// 관리자페이지 이동
function goAdmin() {
	location.href = "admin.go";
}

// 회원정보수정
function memberInfo() {
	location.href = "member.info.go";
}

// 탈퇴
function del() {
	if (confirm("정말 탈퇴 하시겠습니까?")) {
		location.href = "member.delete";
	}
}

// 팝업창 열기
let openwin;
function openChild(){
	window.name = "parentForm"
	openwin = window.open("admin/child","childForm","width=800, height=600, resizable = no, scrollbars = no");
}

// 팝업창 닫기
function closeChild() {
	window.close();
}

// 팝업창에서 등록하고 머무르기
function regCategory() {
	location.href = "child";
}

// 카테고리 삭제하기
function delCategory(no) {
	location.href = "admin.delCategory?category_code="+no;
}

// 상품 등록하기
function regProduct() {
	location.href = "product.reg";
}

// 상품 수정
function productInfo(){
	location.href = "product.Information";
}

// 상품 수정 나가기
function productOut(){
	location.href="productList.go";
}

//등록 버튼
//function companyReg() {
//	location.href = "companyEnroll.do"

//}

//취소 버튼
//function companyCancle() {
//		location.href = "companyList.go"
//}


/* page */

//상품 page
function productPageChange(page){
	location.href = "product.page.change?p=" + page;
}

// 상품 정보 page
function productInfoPageChange(page){
	location.href = "productInfoPage.change?p="+page;
}

//회원목록 page
function MemberPageChange(page){
	location.href = "member.page.change?p=" + page;
}

/* voc */

//voc 수정
function vocMsgUpdate(no, txt) {
	txt = prompt("문의글 수정하실 내용을 적어주세요", txt);
	if (txt != null && txt.length > 0 && txt.length < 500) {
		location.href = "voc.update?v_no=" + no + "&v_txt=" + txt;
	}
}

//voc 삭제
function vocMsgDelete(no) {
	if (confirm("문의글을 삭제하시겠습니까?")) {
		location.href = "voc.delete?v_no=" + no;
	}
}

//page
function vocPageChange(page) {
	location.href = "voc.page.change?p=" + page;
}


//댓글 수정
function vocReplyUpdate(no, txt) {
	txt = prompt("댓글 수정하실 내용을 적어주세요", txt);
	if (txt != null && txt.length > 0 && txt.length < 500) {
		location.href = "voc.reply.update?vr_no=" + no + "&vr_txt=" + txt;
	}
}

//댓글 삭제
function vocReplyDelete(no) {
	if(confirm("댓글을 삭제하시겠습니까?")) {
	location.href = "voc.reply.delete?vr_no=" + no;
	}
}

