// input에 금액단위 , 자동생성 메서드
function numberWithCommas(x, t) {
	x = x.replace(/[^0-9]/g, ''); // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g, ''); // ,값 공백처리
	t.value = x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가
}

//팝업창 버튼들 작동
$('#addBtn').on('click',function(){
	$('#add-popup-form').fadeIn();	// 추가 팝업창
})
$('h1 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
$('.add-textform button:first-child').on('click',function(){
	$('.popup-form').fadeOut();
})

// 비품 추가시 scode 중복확인