<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>