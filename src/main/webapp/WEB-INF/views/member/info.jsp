<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/member/info.css">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/do.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
<script type="text/javascript" src="resources/js/UserInfoChk.js"></script>
<script type="text/javascript" src="resources/js/do_jQuery.js"></script>
</head>
<body>
	<div class="wrapper">
		<form action="member.update" method="post" name="join_form"
			onsubmit="return userInfoChk();">
			<!-- onsubmit 수정했습니다 1.20-- 성현 -->
			<div class="wrap">
				<div class="subjecet">
					<span>회원정보</span>
				</div>
				<div class="id_wrap">
					<div class="id_name">아이디</div>
					<div class="id_input_box">
						<input value="${sessionScope.loginMember.m_id }" class="id_input"
							name="id_input" readonly="readonly" placeholder="아이디"
							maxlength="50">
						<!-- id는 수정x --성현 -->
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">비밀번호</div>
					<div class="pw_input_box">
						<input class="pw_input" autocomplete="off" name="pw_input"
							id="pw_input" type="password"
							value="${sessionScope.loginMember.m_pw }" placeholder="비밀번호"
							maxlength="20"> <img alt="눈 닫음"
							src="resources/img/eye-close.png" class="pw_eye_img"
							name="pw_eye_img" id="pw_eye_img" onclick="eyeImgJoinPw();">
					</div>
				</div>
				<div class="pwck_wrap">
					<div class="pwck_name">비밀번호 확인</div>
					<div class="pwck_input_box">
						<input class="pwck_input" autocomplete="off" name="pwck_input"
							id="pwck_input" type="password"
							value="${sessionScope.loginMember.m_pw }" placeholder="비밀번호 확인"
							maxlength="20"> <img alt="눈 닫음"
							src="resources/img/eye-close.png" class="pwck_eye_img"
							name="pwck_eye_img" id="pwck_eye_img" onclick="eyeImgJoinPwCk();">
					</div>
				</div>
				<div class="user_wrap">
					<div class="user_name">이름</div>
					<div class="user_input_box">
						<input class="user_input" name="user_input" autocomplete="off"
							value="${sessionScope.loginMember.m_name }" placeholder="이름"
							maxlength="8">
					</div>
				</div>
				<div class="address_wrap">
					<div class="address_name">주소</div>
					<div class="address_input_1_wrap">
						<div class="address_input_1_box">
							<input class="address_input_1" name="address_input1"
								value="${addr[0] }" readonly="readonly" placeholder="우편번호">
						</div>
						<div class="address_button">
							<span>주소 찾기</span>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="address_input_2_wrap">
						<div class="address_input_2_box">
							<input class="address_input_2" name="address_input2"
								value="${addr[1] }" readonly="readonly" placeholder="도로명">
						</div>
					</div>
					<div class="address_input_3_wrap">
						<div class="address_input_3_box">
							<input value="${addr[2] }" class="address_input_3"
								name="address_input3" placeholder="상세주소" autocomplete="off">
						</div>
					</div>
				</div>
				<div class="gender_wrap">
					<div class="gender_name">성별</div>
					<div class="gender_radio_box">
						<!-- &nbsp; 띄어쓰기 -->
						<input name="gender_radio" type="radio" value="남자">&nbsp;&nbsp;남성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="gender_radio" type="radio" value="여자">&nbsp;&nbsp;여성
						<input type="hidden" name="member_grade"
							value="${sessionScope.loginMember.m_grade }">
					</div>
				</div>
				<div class="money_wrap">
					<div class="money" hidden="hidden">돈</div>
					<div>
						<input name="money_input" hidden="hidden" readonly="readonly"
							value="${sessionScope.loginMember.m_money }">
					</div>
				</div>
				<div class="money_wrap">
					<div class="point" hidden="hidden">포인트</div>
					<div>
						<input name="point_input" hidden="hidden" readonly="readonly"
							value="${sessionScope.loginMember.m_point }">
					</div>
				</div>
				<!-- div 떨어져있어서 수정 및 목적 알아볼수있게 클래스명 수정 (1/24) 찬호 -->
				<div class="button_wrap">
					<div class="button_click">
						<button class="button_update_wrap">수정</button>
						<button class="button_delete_wrap" onclick="del();">탈퇴</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
