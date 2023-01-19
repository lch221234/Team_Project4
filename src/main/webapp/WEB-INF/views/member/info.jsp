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
			<div class="wrap">
	<form action="member.update" method="post" enctype="multipart/form-data"
		onsubmit="return memberUpdateCheck();" name="memberUpdateForm">
				<div class="subjecet">
					<span>회원정보</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input value="${sessionScope.loginMember.id_input }" class="id_input" name="id_input" autofocus="autofocus"
							autocomplete="off" placeholder="아이디" maxlength="50">
						
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" name="pw_input" id="pw_input" type="password"
							value="${sessionScope.loginMember.pw_input } autocomplete="off" placeholder="비밀번호" maxlength="20">
						<img alt="눈 닫음" src="resources/img/eye-close.png" class="pw_eye_img" name="pw_eye_img" id= "pw_eye_img" onclick="eyeImgJoinPw();">
						
						
					</div>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input" name="pwck_input" id = "pwck_input" type="password"
							value="${sessionScope.loginMember.pwck_input } autocomplete="off" placeholder="비밀번호 확인" maxlength="20">
							<img alt="눈 닫음" src="resources/img/eye-close.png" class="pwck_eye_img" name="pwck_eye_img" id= "pwck_eye_img" onclick="eyeImgJoinPwCk();">
						
						
					</div>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="user_input" autocomplete="off"
							value="${sessionScope.loginMember.user_input } placeholder="이름" maxlength="8">
						
						
					</div>
				</div>
				<div class="address_wrap">
					<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<div class="address_input_1_box">
							<input class="address_input_1" name="address_input1"
								value="${addr[2] } readonly="readonly" placeholder="우편번호">
						
						</div>
						<div class="address_button">
							<span>주소 찾기</span>
							
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="address_input_2_wrap">
						<div class="address_input_2_box">
							<input class="address_input_2" name="address_input2"
								value="${addr[0] } readonly="readonly" placeholder="도로명">
							<input class="address_input_3" name="address_input3"
								value="${addr[1] }" maxlength="50" placeholder="상세주소"
								autocomplete="off">
							
						</div>
					</div>
					<div class="address_input_3_wrap">
						<div class="address_input_3_box">
							<input class="address_input_3" name="address_input3" placeholder="상세주소" autocomplete="off">
							
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
				
				<div class="update_button_wrap">
					<button class="update_button">수정</button>
				</div>
		</form>
				<div class="delete_button_wrap">
					<button class="delete_button" onclick="bye();">탈퇴</button>
				</div>
			</div>
	</div>
</body>
</html>