<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/css/main.css">
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/go.js"></script>
<script type="text/javascript" src="resources/js/goProduct.js"></script>

<!-- bxslider로 상품 가져오기 (02.13)-장창호 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
</head>
<body>
	<script>
		window.onscroll = function() {
			scrollFunction()
		};

		function scrollFunction() {
			if (document.body.scrollTop > 250
					|| document.documentElement.scrollTop > 250) {
				document.getElementById("navi_scorll_area").style.top = "0";
			} else {
				document.getElementById("navi_scorll_area").style.top = "-70px";
			}
		}
	</script>

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
									: ${sessionScope.loginMember.m_grade}</span>
									<span class="login_grade">보유금액 :
									${sessionScope.loginMember.m_money}</span>
									<span class="login_grade">보유포인트 :
									${sessionScope.loginMember.m_point}</span>  <span class="logout"
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
			<div class="navi_bar_area">
				<!--  메뉴네비 -->
				<ul class="menulist">
					<li><a href="productAll.go">전체상품</a></li>
					<li><a href="productTop.go">상의</a></li>
					<li><a href="productBottom.go">하의</a></li>
					<li><a href="productShoes.go">신발</a></li>
					<li><a href="productHeadwear.go">모자</a></li>
					<li><a href="productAccessory.go">악세서리</a></li>
				</ul>
			</div>
			<div class="content_area">
				<!-- 메인제품 구역 -->
				<!-- bxslider 추가-장창호 -->
				<h2>상의 대표상품</h2>
				<div>
					<ul class="bxslider">
						<li><img id="p1"
							src="resources/img/product/Top/CASHMERE BLENDED PULLOVER FLOWERMARDI_IVORY SKY.jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150x; height: 150px;"></li>
						<li><img id="p2"
							src="resources/img/product/Top/Half Patchwork Knitwear Black.jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p3"
							src="resources/img/product/Top/OW HEART LOGO KNIT(IVORY).jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p4"
							src="resources/img/product/Top/TWIST KNITTING R-N_NAVY.jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p5"
							src="resources/img/product/Top/에센셜 하찌 라운드 오버핏 니트 -7col-.jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p6"
							src="resources/img/product/Top/스트라이프 카라 니트_그린_KN091.jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p7"
							src="resources/img/product/Top/터틀넥 니트 티셔츠.jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p8"
							src="resources/img/product/Top/케이블 조직니트 (레드).jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p9"
							src="resources/img/product/Top/SHIRT LAYERD CROPPED KNIT IVORY.jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p10"
							src="resources/img/product/Top/램스울 크루넥 오버니트(연차콜).jpg"
							onclick="productTop.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
					</ul>
				</div>
				<h2>하의 대표상품</h2>
				<div>
					<ul class="bxslider2">
						<li><img id="p11"
							src="resources/img/product/Bottom/모어 와이드 데님 팬츠 (OFF WHITE).jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150x; height: 150px;"></li>
						<li><img id="p12"
							src="resources/img/product/Bottom/블랙 데님 오버롤 (T32D0NED20TWT11BY).jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p13"
							src="resources/img/product/Bottom/와이드 데님 팬츠 (LIGHT BLUE).jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p14"
							src="resources/img/product/Bottom/햄튼 미디 스커트-DARK NAVY.jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p15"
							src="resources/img/product/Bottom/투턱 스커트_블랙.jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p16"
							src="resources/img/product/Bottom/원턱 와이드 스웨트팬츠 그레이.jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p17"
							src="resources/img/product/Bottom/XP127 셔링 카고 팬츠 (KHAKI).jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p18"
							src="resources/img/product/Bottom/SS 포플린 커버롤 Red.jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p19"
							src="resources/img/product/Bottom/Sharon romper.jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p20"
							src="resources/img/product/Bottom/OG se 카고조거 슬랙스 Black.jpg"
							onclick="productBottom.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
					</ul>
				</div>
				<h2>신발 대표상품</h2>
				<div>
					<ul class="bxslider3">
						<li><img id="p21"
							src="resources/img/product/Shoes/어센틱 - 레드.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150x; height: 150px;"></li>
						<li><img id="p22"
							src="resources/img/product/Shoes/375 웰던 더비 구두 루시블랙.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p23"
							src="resources/img/product/Shoes/베이직 캔버스 스니커즈_블랙.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p24"
							src="resources/img/product/Shoes/Punching Pumps LC212_7cm.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p25"
							src="resources/img/product/Shoes/Goofy 2Color 청키 워커 4.5Cm.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p26"
							src="resources/img/product/Shoes/1461 3홀 모노 블랙 14345001.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p27"
							src="resources/img/product/Shoes/컴피쿠시 슬립온 - (클래식) 체커보드 트루 화이트.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p28"
							src="resources/img/product/Shoes/포인트 토 사이드 오픈 슬링백 412312004.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p29"
							src="resources/img/product/Shoes/인텐스 여성 몰드 웨이브 옥스포드화 4.5cm.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p30"
							src="resources/img/product/Shoes/척테일러 올스타 블랙 하이 M9160C.jpg"
							onclick="productShoes.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
					</ul>
				</div>
				<h2>모자 대표상품</h2>
				<div>
					<ul class="bxslider4">
						<li><img id="p31"
							src="resources/img/product/Cap/Fur Marin beret in houndstooth check.jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150x; height: 150px;"></li>
						<li><img id="p32"
							src="resources/img/product/Cap/루키 언스트럭쳐 볼캡 LA (Blue).jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p33"
							src="resources/img/product/Cap/루키 언스트럭쳐 볼캡 NY (Black).jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p34"
							src="resources/img/product/Cap/GOLD LOGO TWEED BERET BLACK.jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p35"
							src="resources/img/product/Cap/스몰 트위치로고 코튼 커브 볼캡 베이지.jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p36"
							src="resources/img/product/Cap/H fur bucket hat_ivory.jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p37"
							src="resources/img/product/Cap/Stitch Hat - BLACK.jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p38"
							src="resources/img/product/Cap/스터드 로고 오버핏 볼캡 블랙.jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p39"
							src="resources/img/product/Cap/코어 베이직 비니 - 블랙.jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p40"
							src="resources/img/product/Cap/모노그램 버킷햇 (QO123TCP11).jpg"
							onclick="productHeadwear.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
					</ul>
				</div>
				<h2>악세서리 대표상품</h2>
				<div>
					<ul class="bxslider5">
						<li><img id="p41"
							src="resources/img/product/Accessory/T40M-SLS 써큘러 하트비트 오토매틱 워치 메탈 남자 시계.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150x; height: 150px;"></li>
						<li><img id="p42"
							src="resources/img/product/Accessory/AK-94 스켈레톤D 컬렉션 남녀커플 오토매틱 손목시계.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p43"
							src="resources/img/product/Accessory/베이직 니트 머플러 로얄 블루.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p44"
							src="resources/img/product/Accessory/밍크 퍼 머플러 아이보리.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p45"
							src="resources/img/product/Accessory/베이직 니트 체크 머플러 - 21COLOR.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p46"
							src="resources/img/product/Accessory/베이직 니트 머플러 로얄 블루.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p47"
							src="resources/img/product/Accessory/RC 울니트 머플러 블루.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p48"
							src="resources/img/product/Accessory/이지 웨빙 벨트.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p49"
							src="resources/img/product/Accessory/실크혼방 올오버 로고 마이크로패턴 넥타이 RED.jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
						<li><img id="p50"
							src="resources/img/product/Accessory/제이블랑 목걸이 (JJPJNQ9AF509SR420).jpg"
							onclick="productAccessory.go()"
							style="cursor: pointer; width: 150px; height: 150px;"></li>
					</ul>
				</div>
			</div>
			<!-- 하단 영역 -->
			<div class="bottom_nav">
				<div class="bottom_nav_container">
					<ul>
						<li>회사소개</li>
						<span class="line">|</span>
						<li>이용약관</li>
						<span class="line">|</span>
						<li><a href="voc.go">고객센터</a></li>
						<span class="line">|</span>
						<li>광고문의</li>
						<span class="line">|</span>
						<li>채용정보</li>
						<span class="line">|</span>
					</ul>
				</div>
			</div>
			<!-- class="bottom_nav" -->

			<div class="bottom">
				<div class="bottom_container">

					<div class="bottom_left">
						<img src="resources/img/Logo.png">
					</div>
					<div class="bottom_right">
						(주) T1mall 대표이사 : Team1조 <br> 사업자등록번호 : 210-81-65986 <br>
						대표전화 : 1644-7583(발신자 부담전화) <br> 평일 AM 09:30 ~ PM 17:00<br>
						점심시간 전화상담가능 · 주말&공휴일 휴무 · 배송문의 2시 이후<br> <br>
						COPYRIGHT(C) <strong>https://github.com/lch221234/Team_Project4</strong>
						ALL RIGHTS RESERVED.
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<!-- class="bottom" -->
		</div>
	</div>
</body>
</html>