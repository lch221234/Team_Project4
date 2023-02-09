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
		$("form").attr("action","product.update");
	});
	$(".deleteProduct").click(function(){
		$("form").attr("action","product.delete");
	});
});
</script>
</head>
<body>
	<form>
	<input type="button" value="나가기" onclick="productOut();">
		<table>
			<tr>
				<th><input id="allCheck" type="checkBox" name="allCheck"></th>
				<th>이름</th>
				<th>카테고리 코드</th>
				<th>가격</th>
				<th>수량</th>
				<th>이미지</th>
			</tr>
			<c:forEach var="ps" items="${productsss }">
				<tr>
					<td><input name="RowCheck" type="checkBox"
						value="${ps.product_number }"></td>
					<td><input autocomplete="off" name="product_name"
						value="${ps.product_name }"></td>
					<td><input autocomplete="off" name="category_code" readonly="readonly"
						value="${ps.category_code }"></td>
					<td><input autocomplete="off" name="product_price"
						value="${ps.product_price }"></td>
					<td><input autocomplete="off" name="product_stock"
						value="${ps.product_stock }"></td>
					<td><img src="resources/img/product/${ps.product_img }"
						style="width: 150px; height: 150px;"><br>
					<!-- <input name="product_img" type="file"></td> -->
				</tr>
			</c:forEach>
		</table>
		<button class="modifyProduct" onclick="modifyProduct();">수정</button>
		<button class="deleteProduct" onclick="deleteProduct();">선택삭제</button> 
	</form>
</body>
</html>