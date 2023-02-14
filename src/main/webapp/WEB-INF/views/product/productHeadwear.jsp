<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모자</title>
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript">
$(function(){
	alert('headwear');
});
</script>
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
	<div class="content_area">
		<!-- 모자제품 구역 -->
		<div class="flex-container space-between"
			style="display: flex; justify-content: space-between; flex-wrap: wrap;">
			<c:forEach var="g_c" items="${getCap }">
				<div>
				<a href="productHeadwear.view">
					<img src="data:image/jpeg;base64,${g_c.product_img_base64}"
						style="width: 230px; height: 230px;"></a><br>
					${g_c.product_name }<br> ${g_c.product_price }
				</div>
				<br>
			</c:forEach>
		</div>
	</div>
	<div class="navi_scorll_area" id="navi_scorll_area">
		<!--  메뉴네비 -->
		<a href="productAll.go">전체상품</a> <a href="productTop.go">상의</a> <a
			href="productBottom.go">하의</a> <a href="productShoes.go">신발</a> <a
			href="productHeadwear.go">모자</a> <a href="productAccessory.go">악세서리</a>
	</div>
	<%@include file="../includes/product/footer.jsp"%>
</body>
</html>