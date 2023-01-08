<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link rel="stylesheet" href="resources/css/main.css">
</head>
<body>
	<div class="wrapper"><!-- 화면 전체 div -->
		<div class="wrap"><!-- 화면  -->
			<div class="top_gnb_area"><!-- 상단 네비 -->
				<h1>로그인, 회원가입, 고객센터</h1>
			</div>
			<div class="top_area"><!-- 상단 구역 -->
				<div class="logo_area"><!-- 로고 -->
					<h1>로고 넣을곳</h1>
				</div>
				<div class="search_area"><!-- 검색창 -->
					<h1>검색창</h1>
				</div>
				<div class="login_area"><!-- 로그인 구역 -->
					<div class="login_button">
						<button onclick="location.href='login'">로그인</button>
					</div>
					<span><button onclick="location.href='join'">회원가입</button></span><!-- <a href="/member/join"> 오류나서 교체 -->
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="navi_bar_area"><!--  메뉴네비 -->
				<h1>메뉴 ex) 옷, 바지, 남성, 여성, 할인상품</h1>
			</div>
			<div class="content_area"><!-- 메인제품 구역 -->
				<h1>쇼핑몰 메인 옷 평점 순으로 나열</h1>
			</div>
			<div class="bottom_area"><!-- 하단 구역 -->
			<h1>이용안내, 이용약관, 개인정보처리방침, 회사주소</h1>
			</div>
		</div>
	</div>
</body>
</html>