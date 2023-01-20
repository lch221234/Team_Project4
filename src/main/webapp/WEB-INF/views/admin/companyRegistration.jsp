<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>업체 등록 페이지</title>
<link rel="stylesheet" href="resources/css/admin/companyRegistration.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
</head>
<body>
 <div class="wrapper">
        <div class="wrap">
            <!-- gnb영역 -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/main">메인 페이지</a></li>
                    <li><a onclick="logout();">로그아웃</a></li>
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- 제목영역 -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- 콘텐츠영역 -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
                   <ul>
                        <li >
                            <a class="admin_list_01" href="productRegistration.go">상품 등록</a>
                        </li>
                        <li>
                            <a class="admin_list_02" href="productList.go">상품 목록</a>
                        </li>
                        <li>
                            <a class="admin_list_03" href="companyRegistration.go">업체 등록</a>                            
                        </li>
                        <lI>
                            <a class="admin_list_04" href="companyList.go">업체 목록</a>                            
                        </li>
                        <li>
                            <a class="admin_list_05" href="memberList.go">회원 관리</a>                            
                        </li>                                                                                             
                    </ul>
                    <!--  페이지 영역 -->
                </div>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>업체 등록</span></div>
                     <!-- 예시 현재 DB어케 짜여진지 몰라서 만든거 전부 수정 예정 -->
                <div class="admin_content_main">
                    	<form action="/admin/companyRegistration.do" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>업체 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="companyName">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    			<!-- 국외기업도 있으니까 만든거라 DB에 안넣을꺼면 삭제 -->
                    				<label>소속 국가</label>
                    			</div>
                    			<div class="form_section_content">
                    				<select name="nationId">
                    					<option value="none" selected>=== 선택 ===</option>
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
                    				<input name="companyIntro" type="text">
                    			</div>
                    		</div>
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>
                </div>
               
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</body>
</html>