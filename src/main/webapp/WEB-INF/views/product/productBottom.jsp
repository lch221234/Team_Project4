<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하의</title>
<link rel="stylesheet" href="resources/css/product.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/goProduct.js"></script>
<script type="text/javascript">
	function productBuy() {
		var productArr = new Array();
		var list = $("input[name='product_price']");
		for (var i = 0; i < list.length; i++) {
			if (list[i].checked) {
				productArr.push(list[i].value);
			}
		}
		if (productArr.length == 0) {
			alert('선택된 상품이 없습니다');
			return false;
		} else {
			var chk = confirm("정말 구매하시겠습니까?");
		}
	}
</script>
<!-- bxslider로 상품 가져오기 (02.13)-장창호 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
	<script>
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 250
					|| document.documentElement.scrollTop > 250) {
				document.getElementById("navi_scorll_area").style.top = "0";
			} else {
				document.getElementById("navi_scorll_area").style.top = "-70px";
			}
		}
	</script>
	<%@include file="../includes/product/header.jsp"%>
	<div class="navi_bar_area">
		<!--  메뉴네비 -->
		<ul class="menulist">
			<li><a href="productAll.go">전체상품</a></li>
			<li><a href="productTop.go">상의</a></li>
			<li><a href="productBottom.go">하의</a></li>
			<li><a href="productShoes.go">신발</a></li>
			<li><a href="productHeadwear.go">모자</a></li>
			<li><a href="productAccessory.go">악세서리</a></li>
		</ul>
	</div>
	<form action="productBottom.Buy">
		<div class="content_area">
			<!-- 메인제품 구역 -->
			<div class="flex-container space-between"
				style="display: flex; justify-content: space-between; flex-wrap: wrap;">
				<c:forEach var="g_b" items="${getBottom }">
					<div>
						<img src="data:image/jpeg;base64,${g_b.product_img_base64}"
							style="width: 230px; height: 230px;"><br>
						${g_b.product_name } <input name="product_price"
							value="${g_b.product_price }" type="checkbox">
						<div>
							<input readonly="readonly" value="${g_b.product_price }"
								style="border: none; outline: none;">
						</div>
					</div>
					<br>
				</c:forEach>
				<div>
					<input name="getId" type="hidden"
						value="${sessionScope.loginMember.m_id }"> <input
						name="have_money" type="hidden"
						value="${sessionScope.loginMember.m_money }"> <input
						name="have_point" type="hidden"
						value="${sessionScope.loginMember.m_point }">
				</div>
			</div>
		</div>
		<c:if test="${sessionScope.loginMember != null }">
			<button onclick="productBuy();" class="buy_btn">BUY NOW</button>
		</c:if>
	</form>
	<div class="navi_scorll_area" id="navi_scorll_area">
		<!--  메뉴네비 -->
		<a href="productAll.go">전체상품</a> <a href="productTop.go">상의</a> <a
			href="productBottom.go">하의</a> <a href="productShoes.go">신발</a> <a
			href="productHeadwear.go">모자</a> <a href="productAccessory.go">악세서리</a>
	</div>
	<%@include file="../includes/product/footer.jsp"%>
</body>
</html>