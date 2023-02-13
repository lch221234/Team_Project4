<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신발</title>
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
					<li><a href="voc.go">고객센터</a></li>
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
					<div class="search_wrap">
						<form id="searchForm" action="/search" method="get">
							<div class="search_input">
								<select name="type">
									<option value="P">상품이름</option>
									<option value="C">업체</option>
								</select> <input type="text" name="keyword">
								<button class='btn search_btn'>검 색</button>
							</div>
						</form>
					</div>
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
									onclick="logout();" style="cursor: pointer;">로그아웃</span> <span
									class="updateMember" onclick="memberInfo();"
									style="cursor: pointer;">회원정보</span>
							</div>
							<!-- class명 login_grade 추가 (1/16) 찬호-->
							<!-- 로그아웃, 회원정보 커서 포인터로 추가(2/1) shin -->
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
				<!-- 신발제품 구역 -->
				<h1><a href="productShoes.view">상품 사진</a></h1>
				<div class="flex-container space-between" style="display: flex; justify-content: space-between; flex-wrap: wrap;"  >
						<c:forEach var="g_s" items="${getShoes }">
							<div><img src="data:image/jpeg;base64,${g_s.product_img_base64}"
						style="width: 230px; height: 230px;"><br>
						${g_s.product_name }<br>
						${g_s.product_price }
						</div><br>
						</c:forEach>
				</div>
			</div>
			<!-- 하단 영역 -->
			<div class="bottom_nav">
				<div class="bottom_nav_container">
					<ul>
						<li>회사소개</li>
						<span class="line">|</span>
						<li>이용약관</li>
						<span class="line">|</span>
						<li><a href="voc.go">고객센터</a></li>
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