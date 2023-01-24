<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="stylesheet" href="resources/css/admin/main.css">
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
                    <div class="admin_content_subject"><span>관리자 페이지 입니다</span></div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</body>
</html>