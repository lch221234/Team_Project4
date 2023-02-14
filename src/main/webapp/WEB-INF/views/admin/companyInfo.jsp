<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 수정 페이지</title>
<link rel="stylesheet" href="resources/css/admin/companyUpdate.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/do_jQuery.js"></script>
<script type="text/javascript" src="resources/js/UserInfoChk.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
<script type="text/javascript" src="resources/js/CompanyReg.js"></script>
<script type="text/javascript">
$(function() {
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i = 0; i < chk_listArr.length; i++) {
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if ($("input[name='RowCheck']:checked").length == rowCnt) {
			$("input[name='allCheck']")[0].checked = true;
		} else {
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});
function deleteCompany(){
	var companyArr = new Array();
	var list = $("input[name='RowCheck']");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			companyArr.push(list[i].value);
			//alert(list[i].value);
		}
	}
	if (companyArr.length == 0 ) {
		alert ('선택된 상품이 없습니다');
		return false;
	} else {
		var chk = confirm("정말 삭제하시겠습니까?");
	}
}
function modifyCompany(){
	var companyArr = new Array();
	var list = $("input[name='RowCheck']");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			companyArr.push(list[i].value);
			//alert(list[i].value);
		}
	}
	if (companyArr.length == 0) {
		alert('선택된 상품이 없습니다');
		return false;
	} else {
		var chk = confirm("정말 수정하시겠습니까?");
	}
}
$(function(){
	$(".modifyCompany").click(function(){
		$(".infoForm").attr("action","company.update");
	});
	$(".deleteCompany").click(function(){
		$(".infoForm").attr("action","company.delete");
	});
});
</script>
</head>
<body>

	<!-- 코드 줄이는 방법 찾아서 적용 (1.31)찬호-->
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>업체 수정</span>
		</div>

		<!-- 업체수정 목록 - 성신 -->

		<div>
			<input type="button" class="out_btn" value="나가기"
				onclick="companyOut();">
			<c:if test="${curPage6  != 1 }">
				<div>
					<span onclick="companyInfoPageChange(${curPage6 - 1 });"
						style="cursor: pointer;">&lt; Prev</span>
				</div>
			</c:if>
			<c:if test="${curPage6 != allPageCount }">
				<div>
					<span onclick="companyInfoPageChange(${curPage6 + 1 });"
						style="cursor: pointer;">Next &gt;</span>
				</div>
			</c:if>
			<form action="company.Infosearch" method="POST">
				<div>
					<input name="companyInfoSearch" class="companyInfoSearch"
						autocomplete="off">
					<button class="search_btn">검색</button>
				</div>

			</form>

			<!-- 넘버 이름 국가 소개 -->
			<form class="infoForm">
				<table class="company_table">
					<tr>
						<th><input id="allCheck" type="checkBox" name="allCheck"></th>
						<th>업체명</th>
						<th>국가</th>
						<th>업체소개</th>
					</tr>
					<c:forEach var="ci" items="${companyInfos }">
						<tr>

							<td><input name="RowCheck" type="checkBox"
								value="${ci.company_number }"></td>
							<td><input autocomplete="off" name="company_name"
								class="company_name" value="${ci.company_name }"></td>
							<td><input autocomplete="off" name="country_id"
								class="country_id" value="${ci.country_id }"></td>
							<td><input autocomplete="off" name="company_introduce"
								class="company_introduce" value="${ci.company_introduce }"></td>
						</tr>
					</c:forEach>
				</table>
				<button class="modifyCompany" onclick="modifyCompany();">수정</button>
				<button class="deleteCompany" onclick="deleteCompany();">선택삭제</button>
			</form>
		</div>
	</div>

	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>