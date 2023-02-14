<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
<link rel="stylesheet"
	href="resources/css/admin/productRegistration.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/do_jQuery.js"></script>
<script type="text/javascript" src="resources/js/UserInfoChk.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
<script type="text/javascript">
	$(()=>{
		$('.product_img').on('change',function(){
			ext = $(this).val().split('.').pop().toLowerCase();
			if($.inArray(ext,['gif','png','jpg','jpeg']) == -1){ 
				alert("?");
			} else{ 
				f = $('.product_img').prop("files")[0];
				fURL = window.URL.createObjectURL(f); 
				console.log(fURL);
				$('.product_imgBox img').attr('src', fURL);
				$('.product_imgBox').slideDown(); 		  
			}
		});
	});
</script>
</head>
<body>
	<!-- 코드 줄이는 방법 찾아서 적용 (1.31)찬호-->
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 등록</span>
		</div>
		<div>
			<form action="product.reg" enctype="multipart/form-data"
				name="product_regForm" method="post" onsubmit="productRegCheck();">
				<div>
					<input class="category_code" name="p_c_c" autocomplete="off"
						autofocus="autofocus" placeholder="카테고리 코드" maxlength="1">
				</div>
				<div>
					<input class="product_name" name="p_n" autocomplete="off"
						placeholder="상품 이름">
				</div>
				<div>
					<input class="product_price" name="p_p" autocomplete="off"
						placeholder="상품 가격">
				</div>
				<div>
					<input class="company_number" name="c_n" autocomplete="off"
						placeholder="회사 넘버">
				</div>
				<div>
					<input class="product_stock" name="p_s" autocomplete="off"
						placeholder="상품 재고">
				</div>
				<div class=product_imgBox>
					<img src="resources/img/empty.png"
						style="width: 150px; height: 150px;"> <input
						class="product_img" name="p_i" type="file">
				</div>
				<button class='reg_btn'>등록하기</button>
			</form>
		</div>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>