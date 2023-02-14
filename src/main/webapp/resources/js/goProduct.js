
// bxslider 5개 - Top, Bottom, Shoes, Cap, Accessory
$(document).ready(function() {
	$('.bxslider').bxSlider({
		auto : true, // 애니메이션 자동시작
		speed : 500, // 애니메이션 속도
		pause : 5000, // 애니메이션 유지시간(1000은 1초)
		mode : 'horizontal', // 슬라이드 모드(fade, horizontal, vertical)
		autoControls : true, // 시작 및 중지버튼 보여줌
		slideWidth : 1000, // 슬라이드 너비
		minSlides : 5, // 최소 노출 개수
		maxSlides : 5, // 최대 노출 개수
		slideMargin : 5, // 슬라이드간의 간격
		pager : true, // 페이지 표시 보여줌
		captions : true, // 이미지 위에 텍스트 넣기
		touchEnabled : (navigator.maxTouchPoints > 0), // onclick 안먹는거 해결법 어휴..
	});
});

$(document).ready(function() {
	$('.bxslider2').bxSlider({
		auto : true, // 애니메이션 자동시작
		speed : 500, // 애니메이션 속도
		pause : 5000, // 애니메이션 유지시간(1000은 1초)
		mode : 'horizontal', // 슬라이드 모드(fade, horizontal, vertical)
		autoControls : true, // 시작 및 중지버튼 보여줌
		slideWidth : 1000, // 슬라이드 너비
		minSlides : 5, // 최소 노출 개수
		maxSlides : 5, // 최대 노출 개수
		slideMargin : 5, // 슬라이드간의 간격
		pager : true, // 페이지 표시 보여줌
		captions : true, // 이미지 위에 텍스트 넣기
		touchEnabled : (navigator.maxTouchPoints > 0), // onclick 안먹는거 해결법 어휴..
	});
});

$(document).ready(function() {
	$('.bxslider3').bxSlider({
		auto : true, // 애니메이션 자동시작
		speed : 500, // 애니메이션 속도
		pause : 5000, // 애니메이션 유지시간(1000은 1초)
		mode : 'horizontal', // 슬라이드 모드(fade, horizontal, vertical)
		autoControls : true, // 시작 및 중지버튼 보여줌
		slideWidth : 1000, // 슬라이드 너비
		minSlides : 5, // 최소 노출 개수
		maxSlides : 5, // 최대 노출 개수
		slideMargin : 5, // 슬라이드간의 간격
		pager : true, // 페이지 표시 보여줌
		captions : true, // 이미지 위에 텍스트 넣기
		touchEnabled : (navigator.maxTouchPoints > 0), // onclick 안먹는거 해결법 어휴..
	});
});

$(document).ready(function() {
	$('.bxslider4').bxSlider({
		auto : true, // 애니메이션 자동시작
		speed : 500, // 애니메이션 속도
		pause : 5000, // 애니메이션 유지시간(1000은 1초)
		mode : 'horizontal', // 슬라이드 모드(fade, horizontal, vertical)
		autoControls : true, // 시작 및 중지버튼 보여줌
		slideWidth : 1000, // 슬라이드 너비
		minSlides : 5, // 최소 노출 개수
		maxSlides : 5, // 최대 노출 개수
		slideMargin : 5, // 슬라이드간의 간격
		pager : true, // 페이지 표시 보여줌
		captions : true, // 이미지 위에 텍스트 넣기
		touchEnabled : (navigator.maxTouchPoints > 0), // onclick 안먹는거 해결법 어휴..
	});
});

$(document).ready(function() {
	$('.bxslider5').bxSlider({
		auto : true, // 애니메이션 자동시작
		speed : 500, // 애니메이션 속도
		pause : 5000, // 애니메이션 유지시간(1000은 1초)
		mode : 'horizontal', // 슬라이드 모드(fade, horizontal, vertical)
		autoControls : true, // 시작 및 중지버튼 보여줌
		slideWidth : 1000, // 슬라이드 너비
		minSlides : 5, // 최소 노출 개수
		maxSlides : 5, // 최대 노출 개수
		slideMargin : 5, // 슬라이드간의 간격
		pager : true, // 페이지 표시 보여줌
		captions : true, // 이미지 위에 텍스트 넣기
		touchEnabled : (navigator.maxTouchPoints > 0), // onclick 안먹는거 해결법 어휴..
	});
});

// Top부분 제품 10개
$(function() {
	var i = 1;
	for (var i = 1; i < 11; i++) {
		$("#p"+i).click(function() {
			goTop();
		});
	}
});

function goTop() {
	location.href = "productTop.go";
}

// Bottom부분 제품 10개
$(function() {
	var i = 11;
	for (var i = 11; i < 21; i++) {
		$("#p"+i).click(function() {
			goBottom();
		});
	}
});

function goBottom() {
	location.href = "productBottom.go";
}

// Shoes부분 제품 10개
$(function() {
	var i = 21;
	for (var i = 21; i < 31; i++) {
		$("#p"+i).click(function() {
			goShoes();
		});
	}
});

function goShoes() {
	location.href = "productShoes.go";
}

// Cap부분 제품 10개
$(function() {
	var i = 31;
	for (var i = 31; i < 41; i++) {
		$("#p"+i).click(function() {
			goCap();
		});
	}
});

function goCap() {
	location.href = "productHeadwear.go";
}

// Accessory부분 제품 10개
$(function() {
	var i = 41;
	for (var i = 41; i < 51; i++) {
		$("#p"+i).click(function() {
			goAccessory();
		});
	}
});

function goAccessory() {
	location.href = "productAccessory.go";
}


