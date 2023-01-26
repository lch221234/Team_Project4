<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
</head>
<body>
	<div class="wrapper">
		<!-- 화면 전체 div -->
		<div class="wrap">
			<!-- 화면  -->
			<div class="top_gnb_area">
				<!-- 상단 네비 -->
				<ul class="list">
					<c:choose>
						<c:when test="${sessionScope.loginMember != null}">
							<c:if test="${sessionScope.loginMember.m_grade == 'admin' }">
								<li onclick="goAdmin();">관리자 페이지</li>
							</c:if>
							<li><a id="gnb_logout_button" onclick="logout();">로그아웃</a></li>
							<li>마이룸</li>
							<li>장바구니</li>
						</c:when>
						<c:otherwise>
							<li><a href="/main/login">로그인</a></li>
							<li><a href="/main/join">회원가입</a></li>
						</c:otherwise>
					</c:choose>
					<li>고객센터</li>
				</ul>
			</div>
			<div class="top_area">
				<!-- 상단 구역 -->
				<div class="logo_area">
					<!-- 로고 -->
					<a href="/main"><img src="resources/img/Logo.png"></a>
				</div>
				<div class="search_area">
					<!-- 검색창 -->
					<h1>검색창</h1>
				</div>

				<div class="login_area">
					<!-- 로그인 구역 -->
					<!-- jstl 코드 간편하게 수정 (when, otherwise) 사용하기위해 choose사용 ※ 주석 jstl안에 넣으니 오류나서 밖으로 뺐습니다--성현  (1.12)-->
					<!-- loginMember는 memberDAO에서 로그인 부분 req.getsession.setAttribute에 담은 loginMember입니다 -->
					<!-- c:when이 if 라고 생각하면 이해가 쉽습니다 -->
					<!-- c:otherwise가 else 라고 생각하면 이해가 쉽습니다 -->
					<c:choose>
						<c:when test="${sessionScope.loginMember != null}">

							<div class="login_success_area">
								<span class="login_grade">회원 :
									${sessionScope.loginMember.m_name}</span> <span class="login_grade">등급
									: ${sessionScope.loginMember.m_grade}</span> <span class="logout"
									onclick="logout();">로그아웃</span> <span class="updateMember"
									onclick="memberInfo();">회원정보</span>
							</div>
							<!-- class명 login_grade 추가 (1/16) 찬호-->
						</c:when>

						<c:otherwise>
							<div class="login_button">
								<button onclick="location.href='login'">로그인</button>
							</div>
							<span><button onclick="location.href='join'">회원가입</button></span>
							<!-- <a href="/member/join"> 오류나서 교체 -->
						</c:otherwise>
					</c:choose>

				</div>
				<div class="clearfix"></div>
			</div>
			<div class="navi_bar_area">
				<!--  메뉴네비 -->
				<h1>메뉴 ex) 옷, 바지, 남성, 여성, 할인상품</h1>
			</div>
			<div class="content_area">
				<!-- 메인제품 구역 -->
				<h1>쇼핑몰 메인 옷 평점 순으로 나열</h1>
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
						점심시간 전화상담가능 · 주말&공휴일 휴무 · 배송문의 2시 이후<br>
						<br> COPYRIGHT(C) <strong>https://github.com/lch221234/Team_Project4</strong>
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