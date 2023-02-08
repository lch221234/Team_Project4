<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<link rel="stylesheet" href="resources/css/admin/memberUpdate.css">
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
	<!-- 코드 줄이는 방법 찾아서 적용 (1.31)찬호-->
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>회원 수정</span>
		</div>
		<!-- 예시 현재 DB어케 짜여진지 몰라서 만든거 전부 수정 예정 -->
		<div class="admin_content_main">
			<form action="admin.member.update" method="post" name="infoForm"
				onsubmit="return adminUserInfoChk();">
				<div class="id_wrap">
					<div class="id_name">
						<label>회원 아이디</label>
					</div>
					<div class="id_input_box">
						<input value="아이디 나오게" class="id_input" name="id_input"
							readonly="readonly" placeholder="아이디" maxlength="50">
						<!-- id는 수정x --성현 -->
					</div>
				</div>
				<div class="pw_wrap">
					<div class="pw_name">
						<label>회원 비밀번호</label>
					</div>
					<div class="pw_input_box">
						<input class="pw_input" autocomplete="off" name="pw_input"
							id="pw_input" type="password" value="회원 비밀번호 나오게"
							placeholder="비밀번호" maxlength="20"> <img alt="눈 닫음"
							src="resources/img/eye-close.png" class="pw_eye_img"
							name="pw_eye_img" id="pw_eye_img" onclick="eyeImgJoinPw();">
					</div>
				</div>
				<div class="user_wrap">
					<div class="user_name">
						<label>회원 이름</label>
					</div>
					<div class="user_input_box">
						<input class="user_input" name="user_input" autocomplete="off"
							value="회원이름 나오게" placeholder="이름" maxlength="8">
					</div>
				</div>
				<div class="address_wrap">
					<div class="address_name">
						<label>회원 주소</label>
					</div>
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
				<div class="form_section">
					<div class="form_section_title">
						<label>회원 성별</label>
					</div>
					<div class="gender_radio_box">
						<!-- &nbsp; 띄어쓰기 -->
						<input name="gender_radio" type="radio" value="남자">&nbsp;&nbsp;남성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="gender_radio" type="radio" value="여자">&nbsp;&nbsp;여성
					</div>
				</div>
				<div class="button_wrap">
					<div class="button_click">
						<!--  <button id="cancelBtn" class="btn" onclick="companyCancle()">취 소</button>-->
						<button id="button_update_wrap" class="button_update_wrap">수정</button>
						<button id="button_delete_wrap" class="button_delete_wrap"
							onclick="del();">탈퇴</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>