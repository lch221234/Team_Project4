<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<div>
						<ul class="bxslider5">
							<li><img id="p41" src="resources/img/팀원소개.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/이찬호.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/장창호.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/홍성신.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/홍성현.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/팀원소개.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/이찬호.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/장창호.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/홍성신.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
							<li><img id="p41" src="resources/img/홍성현.png"
								style="cursor: pointer; width: 150x; height: 150px;"></li>
						</ul>
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
									: ${sessionScope.loginMember.m_grade}</span> <span class="login_grade">보유금액
									: ${sessionScope.loginMember.m_money}</span> <span class="login_grade">보유포인트
									: ${sessionScope.loginMember.m_point}</span> <span class="logout"
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
</body>
</html>