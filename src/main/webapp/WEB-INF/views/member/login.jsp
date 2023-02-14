<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="resources/css/member/login.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/do.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
<script type="text/javascript" src="resources/js/UserInfoChk.js"></script>
<script type="text/javascript" src="resources/js/do_jQuery.js"></script>
</head>
<body>
	<div class="wrapper">

		<div class="wrap">
			<!-- form 추가한부분 -->
			<form action="member.SuccessLogin" method="post" name="login_form"
				onsubmit="return loginck();">
				<div class="logo_wrap">
					<span>T1몰</span>
				</div>
				<div class="login_wrap">
					<div class="id_wrap">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="id_input" autofocus="autofocus"
							autocomplete="off" placeholder="아이디">
						<!-- 추가(shin) -->
					</div>
					<div class="pw_wrap">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_iput" name="pw_input" id="pw_input"
							type="password" autocomplete="off" placeholder="비밀번호"> <img
							alt="눈 닫음" src="resources/img/eye-close.png"
							class="login_eye_img" name="login_eye_img" id="login_eye_img"
							onclick="eyeImgLogin();">
						<!-- 추가(shin) -->
						<!-- img 추가 및 설정 (1/13) 찬호 -->
					</div>
					<c:if test="${result != '1' }">
						<div class="login_warn">${result }</div>
					</c:if>
					<!-- 찬호님 코드 수정 (01/16) 장창호 -->
					<!-- 기존에 찬호님 주석에 오류가 나서 지워뒀습니다. -->


					<div class="login_button_wrap">
						<!-- 카카오 네이버 로그인 추가예정 -->
						<button class="login_button">로그인</button>
					</div>
				</div>


			</form>
		</div>

	</div>



</body>
</html>
