<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정/삭제 페이지</title>
<link rel="stylesheet" href="resources/css/admin/productInfo.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/do_jQuery.js"></script>
<script type="text/javascript" src="resources/js/UserInfoChk.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
<script type="text/javascript">
$(function(){
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
function deleteProduct(){
	var productArr = new Array();
	var list = $("input[name='RowCheck']");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			productArr.push(list[i].value);
			//alert(list[i].value);
		}
	}
	if (productArr.length == 0) {
		alert('선택된 상품이 없습니다');
		return false;
	} else {
		var chk = confirm("정말 삭제하시겠습니까?");
	}
}
function modifyProduct(){
	var productArr = new Array();
	var list = $("input[name='RowCheck']");
	for (var i = 0; i < list.length; i++) {
		if (list[i].checked) {
			productArr.push(list[i].value);
			//alert(list[i].value);
		}
	}
	if (productArr.length == 0) {
		alert('선택된 상품이 없습니다');
		return false;
	} else {
		var chk = confirm("정말 수정하시겠습니까?");
	}
}
$(function(){
	$(".modifyProduct").click(function(){
		$(".infoForm").attr("action","product.update");
	});
	$(".deleteProduct").click(function(){
		$(".infoForm").attr("action","product.delete");
	});
});
</script>
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<!-- gnb영역 -->
			<div class="top_gnb_area">
				<ul class="list">
					<li><a href="/main">메인 페이지</a></li>
					<li><a onclick="logout();">로그아웃</a></li>
					<li><a href="voc.go">고객센터</a></li>
				</ul>
			</div>
			<!-- 제목영역 -->
			<div class="admin_top_wrap">
				<span>수정 페이지</span>

			</div>
			<!-- 커서 스타일 추가 - 성신 (스타일은 span만 가능, div는 불가) - 확인하면 지우기(거슬리는 빨간줄 나옴) -->
			<div>
				<input type="button" value="나가기" onclick="productOut();"
					class="out_btn">
				<c:if test="${curPage2 != 1 }">
					<div>
						<span onclick="productInfoPageChange(${curPage2 - 1 });"
							style="cursor: pointer;">&lt; Prev</span>
					</div>
				</c:if>
				<c:if test="${curPage2 != allProductCount }">
					<div>
						<span onclick="productInfoPageChange(${curPage2 + 1 });"
							style="cursor: pointer;">Next &gt;</span>
					</div>
				</c:if>
				<form action="product.Infosearch" method="POST">
					<div>
						<input name="productSearch" class="productSearch"
							autocomplete="off">
						<button class="search_btn">검색</button>
					</div>
				</form>
				<form class="infoForm">
					<table class="product_table">
						<tr>
							<th><input id="allCheck" type="checkBox" name="allCheck"></th>
							<th>이름</th>
							<th>카테고리 코드</th>
							<th>가격</th>
							<th>회사 코드</th>
							<th>수량</th>
							<th>이미지</th>
						</tr>
						<c:forEach var="pss" items="${productssss }">
							<tr>
								<td><input name="RowCheck" type="checkBox" class="RowCheck"
									value="${pss.product_number }"></td>
								<td><input autocomplete="off" name="product_name"
									class="product_name" value="${pss.product_name }"></td>
								<td><input autocomplete="off" name="category_code"
									class="category_code" readonly="readonly"
									value="${pss.category_code }"></td>
								<td><input autocomplete="off" name="product_price"
									class="product_price" value="${pss.product_price }"></td>
								<td><input autocomplete="off" name="company_number"
									class="company_number" value="${pss.company_number }"></td>
								<td><input autocomplete="off" name="product_stock"
									class="product_stock" value="${pss.product_stock }"></td>
								<td><img
									src="data:image/jpeg;base64,${pss.product_img_base64}"
									style="width: 150px; height: 150px;"><br> <!-- <input name="product_img" type="file"></td> -->
							</tr>
						</c:forEach>
					</table>
					<button class="modifyProduct" onclick="modifyProduct();">수정</button>
					<button class="deleteProduct" onclick="deleteProduct();">선택삭제</button>
				</form>
				<div class="clearfix"></div>
			</div>
			<!-- 하단 영역 -->
			<div class="bottom_nav">
				<div class="bottom_nav_container">
					<ul>
						<li>회사소개</li>
						<span class="line">|</span>
						<li>이용약관</li>
						<span class="line">|</span>
						<li><a href="voc.go">고객센터</a></li>
						<span class="line">|</span>
						<li>광고문의</li>
						<span class="line">|</span>
						<li>채용정보</li>
						<span class="line">|</span>
					</ul>
				</div>
			</div>
			<!-- class="bottom_nav" -->

			<div class="bottom">
				<div class="bottom_container">

					<div class="bottom_left">
						<img src="resources/img/Logo.png">
					</div>
					<div class="bottom_right">
						(주) T1mall 대표이사 : Team1조 <br> 사업자등록번호 : 210-81-65986 <br>
						대표전화 : 1644-7583(발신자 부담전화) <br> 평일 AM 09:30 ~ PM 17:00<br>
						점심시간 전화상담가능 · 주말&공휴일 휴무 · 배송문의 2시 이후<br> <br>
						COPYRIGHT(C) <strong>https://github.com/lch221234/Team_Project4</strong>
						ALL RIGHTS RESERVED.
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- class="bottom" -->
		</div>
	</div>
</body>
</html>