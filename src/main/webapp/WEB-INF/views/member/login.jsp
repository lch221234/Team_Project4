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
<script type="text/javascript" src="resources/js/eyeimg.js"></script>
</head>
<body>
	<div class="wrapper">

		<div class="wrap">
		<!-- form 추가한부분 -->
			<form action="member.SuccessLogin" method="post" name="login_form">
				<div class="logo_wrap">
					<span>쇼핑몰</span>
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
						<input class="pw_iput" name="pw_input" id="pw_input" type="password"
							autocomplete="off" placeholder="비밀번호">
							<img alt="눈 닫음" src="resources/img/eye-close.png" class="login_eye_img" name="login_eye_img" id= "login_eye_img" onclick="eyeImgLogin();">
						<!-- 추가(shin) -->
					</div>
					<!-- 추가 로그인시 id 비밀번호 안맞을경우 뜨는거 (1/12) 찬호 
					<c:if test="${result == 0 }">
						<div class="login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
					</c:if>-->
					<div class="login_button_wrap">
						<!-- 카카오 네이버 로그인 추가예정 -->
						<button class="login_button">로그인</button>
					</div>
				</div>


			</form>
		</div>

	</div>


	<script>
		/* 로그인 버튼 클릭 메서드 */
		$(".login_button").click(function() {

			alert("로그인 버튼 작동");

		});
	</script>
</body>
</html>
