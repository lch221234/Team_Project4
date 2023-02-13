<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<!-- 커서 스타일 추가 - 성신 (스타일은 span만 가능, div는 불가) - 확인하면 지우기(거슬리는 빨간줄 나옴) -->
	<div> 
	<input type="button" value="나가기" onclick="productOut();"> 
	<c:if test="${curPage2 != 1 }">
		<div>
			<span onclick="productInfoPageChange(${curPage2 - 1 });" style="cursor: pointer;">&lt;</span>
		</div>
	</c:if>
	<c:if test="${curPage2 != allProductCount }">
		<div>
			<span onclick="productInfoPageChange(${curPage2 + 1 });" style="cursor: pointer;">&gt;</span>
		</div>
	</c:if>
	<form action="product.Infosearch" method="POST">
		<div>
			<input name="productSearch" autocomplete="off">
			<button>찾기</button>
		</div>
	</form>
	<form class="infoForm">
		<table>
			<tr>
				<th><input id="allCheck" type="checkBox" name="allCheck"></th>
				<th>이름</th>
				<th>카테고리 코드</th>
				<th>가격</th>
				<th>수량</th>
				<th>이미지</th>
			</tr>
			<c:forEach var="pss" items="${productssss }">
				<tr>
					<td><input name="RowCheck" type="checkBox"
						value="${pss.product_number }"></td>
					<td><input autocomplete="off" name="product_name"
						value="${pss.product_name }"></td>
					<td><input autocomplete="off" name="category_code" readonly="readonly"
						value="${pss.category_code }"></td>
					<td><input autocomplete="off" name="product_price"
						value="${pss.product_price }"></td>
					<td><input autocomplete="off" name="product_stock"
						value="${pss.product_stock }"></td>
					<td><img src="data:image/jpeg;base64,${pss.product_img_base64}"
						style="width: 150px; height: 150px;"><br>
					<!-- <input name="product_img" type="file"></td> -->
				</tr>
			</c:forEach>
		</table>
		<button class="modifyProduct" onclick="modifyProduct();">수정</button>
		<button class="deleteProduct" onclick="deleteProduct();">선택삭제</button> 
	</form>
	</div>
</body>
</html>