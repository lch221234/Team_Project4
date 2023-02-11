<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 수정 페이지</title>
<link rel="stylesheet"
	href="resources/css/admin/companyUpdate.css">
<script type="text/javascript" src="resources/js/ValidChecker.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/CompanyReg.js"></script>

</head>
<body>
	<!-- 코드 줄이는 방법 찾아서 적용 (1.31)찬호-->
	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>업체 수정</span>
		</div>
		<!-- 예시 현재 DB어케 짜여진지 몰라서 만든거 전부 수정 예정 -->
		<div class="admin_content_main">
			<form action="company.update" method="get" name="enrollForm"
				onsubmit="return CompanyCheck()">
				<div class="form_section">
					<div class="form_section_title">
						<label>업체 이름</label>
					</div>
					<div class="form_section_content">
						<input name="company_name" class="company_name" value="업체이름 나오게">
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<!-- 국외기업도 있으니까 만든거라 DB에 안넣을꺼면 삭제 -->
						<label>소속 국가</label>
					</div>
					<div class="form_section_content">
						<select name="country_id" class="country_id">
							<option value="" selected>=== 선택 ===</option><!-- none 대신 공백으로 변경 (02/02) 찬호 -->
							<option value="01">국내</option>
							<option value="02">국외</option>
						</select>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>업체소개</label>
					</div>
					<div class="form_section_content">
						<input name="company_introduce" class="company_introduce"
							type="text" value="업체 소개 나오게">
					</div>
				</div>
				<div class="btn_section">
					<!--  <button id="cancelBtn" class="btn" onclick="companyCancle()">취 소</button>-->
					<button id="enrollBtn" class="btn_enroll_btn">수 정</button>
				</div>
			</form>
		</div>
	</div>

	<%@include file="../includes/admin/footer.jsp"%>
</body>
</html>