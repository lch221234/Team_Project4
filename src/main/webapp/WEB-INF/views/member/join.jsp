<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="resources/css/member/join.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/do.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
<script type="text/javascript" src="resources/js/UserInfoChk.js"></script>
<script type="text/javascript" src="resources/js/eyeimg.js"></script>
</head>
<body>
	<div class="wrapper">
		<form action="member.SuccessJoin" method="post" name="join_form" onsubmit="return userInfoChk();" >
			<div class="wrap">
				<div class="subjecet">
					<span>회원가입</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input class="id_input" name="id_input" autofocus="autofocus"
							autocomplete="off" placeholder="아이디" maxlength="50">
						<!-- 추가(shin) -->
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" name="pw_input" id="pw_input" type="password"
							autocomplete="off" placeholder="비밀번호" maxlength="20">
						<img alt="눈 닫음" src="resources/img/eye-close.png" class="pw_eye_img" name="pw_eye_img" id= "pw_eye_img" onclick="eyeImgJoinPw();">
						<!-- 추가(shin) -->
						<!-- img 추가 및 설정 (1/13) 찬호 -->
					</div>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input" name="pwck_input" id = "pwck_input" type="password"
							autocomplete="off" placeholder="비밀번호 확인" maxlength="20">
							<img alt="눈 닫음" src="resources/img/eye-close.png" class="pwck_eye_img" name="pwck_eye_img" id= "pwck_eye_img" onclick="eyeImgJoinPwCk();">
						<!-- 추가(shin) -->
						<!-- img 추가 및 설정 (1/13) 찬호 -->
					</div>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="user_input" autocomplete="off"
							placeholder="이름" maxlength="8">
						<!-- 추가(shin) -->
						<!-- placeholder는 삭제해도 무방 -->
					</div>
				</div>
				<div class="address_wrap">
					<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<div class="address_input_1_box">
							<input class="address_input_1" name="address_input1"
								readonly="readonly" placeholder="우편번호">
							<!-- readonly="readonly" 추가 (1/10) 찬호-->
						</div>
						<div class="address_button">
							<span>주소 찾기</span>
							<!-- 다음주소가능하게 변경 (01/10) -->
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="address_input_2_wrap">
						<div class="address_input_2_box">
							<input class="address_input_2" name="address_input2"
								readonly="readonly" placeholder="도로명">
							<!-- readonly="readonly" 추가 (1/10) 찬호-->
						</div>
					</div>
					<div class="address_input_3_wrap">
						<div class="address_input_3_box">
							<input class="address_input_3" name="address_input3" placeholder="상세주소" autocomplete="off">
							<!-- autocomplete 추가 1.11 성현 -->
						</div>
					</div>
				</div>
				<div class="gender_wrap">
					<div class="gender_name">성별</div>
					<div class="gender_radio_box">
						<!-- &nbsp; 띄어쓰기 -->
						<input name="gender_radio" type="radio" value="남자">&nbsp;&nbsp;남성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="gender_radio" type="radio" value="여자">&nbsp;&nbsp;여성
					</div>
				</div>
				<!-- rank 필요없어서 삭제
					이유 매퍼에서 적용하면됨 (01/10)찬호 -->
				<div class="join_button_wrap">
					<button class="join_button">가입하기</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>