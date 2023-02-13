<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/admin/main.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/do.js"></script>
<script type="text/javascript" src="resources/js/do_jQuery.js"></script>
<script type="text/javascript">
<!--$(function(){
	$.getJSON("admin.getCategory",function(p_c){
		nums = 0;
		$.each(p_c.productCategory,function(i,p_c){ 
			let div = $("<div class = \"append_Category\"></div>").text(p_c.category_name);
			$(".append_Categories").append(div);
			nums = p_c.category_code;
			console.log(i + '번째 ' +nums);
		}); 
			$(".append_Category").append(" <img class=\"delete_category\" src =\"resources/img/recycle_bin.png\" width = \"20\" height = \"20\"  >");
			
			// num = p_c.productCategory[0].category_code;
			// console.log(num);
		$(".delete_category").click(function(){
			alert(nums);
			//alert(p_c.productCategory[0].category_code);    
			
			 //alert(num);
			 
			 //alert("${p_c}");
			 //alert(p_c);
			// alert("p_c");
			 
			//location.href = "admin.delCategory?c_n="+nums;
			
		}); 
	});
}); -->
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
					<li>고객센터</li>
				</ul>
			</div>
			<!-- 제목영역 -->
			<div class="admin_top_wrap">
				<span>관리자 페이지</span>

			</div>
			<!-- 콘텐츠영역 -->
			<div class="admin_wrap">
				<!-- 네비영역 -->
				<div class="admin_navi_wrap">
					<ul>
						<li><a class="admin_list_01" href="productRegistration.go">상품
								등록</a></li>
						<li><a class="admin_list_06" href="categoryRegistration.go">카테고리
								등록</a></li>
						<li><a class="admin_list_02" href="productList.go">상품 목록</a>
						</li>
						<li><a class="admin_list_03" href="companyRegistration.go">업체
								등록</a></li>
						<lI><a class="admin_list_04" href="companyList.go">업체 목록</a>
						</li>
						<li><a class="admin_list_05" href="memberList.go">회원 관리</a></li>
					</ul>
					<!--  페이지 영역 -->
				</div>
				<div class="admin_content_wrap">
					<div class="admin_content_subject">
						<span>카테고리 등록</span>
					</div>
					<input type="button" value="등록하기" onclick="openChild();">
					<div class="append_Categories"></div>
						<c:forEach var="c_n" items="${p_c }">
							<b>${c_n.category_name }</b>
								<img src = resources/img/recycle_bin.png width = 20 height = 20 onclick="delCategory(${c_n.category_code});">
							<br>
						</c:forEach>
				</div>
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
						<li>고객센터</li>
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