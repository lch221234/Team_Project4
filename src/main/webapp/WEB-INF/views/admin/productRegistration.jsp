<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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
						<li >
                            <a class="admin_list_06" href="categoryRegistration.go">카테고리 등록</a>
                        </li>
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
						<span>상품 등록</span>
					</div>
					<div>
						<form action="product.reg">
							<input class="category_code" name="p_c_c"> 카테고리 코드
							<input class="product_name" name="p_n"> 이름
							<input class="product_price" name="p_p"> 가격
							<input class="product_stock" name="p_s"> 재고
							<button>가입하기</button>
						</form>
					</div>
					
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
						(주) H2mall 대표이사 : Team4조 <br> 사업자등록번호 : 210-81-65986 <br>
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