// input에 금액단위 , 자동생성 메서드
function numberWithCommas(x, t) {
	x = x.replace(/[^0-9]/g, ''); // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g, ''); // ,값 공백처리
	t.value = x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가
}

//팝업창 버튼들 작동
$('h1 .fa-times').on('click',function(){
	$('.popup-form').fadeOut();
})
$('.btn-form button:last-child').on('click',function(){
	$('.popup-form').fadeOut();
})

// 행 더블 클릭 시  이벤트 발생
var trs = document.querySelectorAll('tbody tr');
for(var i=0; i<trs.length; i++){
	trs[i].addEventListener('dblclick', dblclick);		// 더블클릭 시 수정화면
	trs[i].addEventListener('mouseenter', hoverCss);	// 호버시 css 효과
}

function dblclick() {
	var pcode = $(this).children("td").eq(0).text();
	var pname = $(this).children("td").eq(1).text();
	var pcount = $(this).children("td").eq(4).text();
	
	$("input[name=modify_pcode").attr("value", pcode);
	$("input[name=modify_pcount").attr("value", pcount);
	
	$("#selectInfo").text("["+pcode+"] " +pname + " " );
	$('#modify-popup-form').fadeIn();
}

function hoverCss() {
	for(var i=0; i<trs.length; i++){
		trs[i].style.backgroundColor = '#fff';
		trs[i].style.cursor = 'pointer';
	}
	this.style.backgroundColor = '#f6f6f6';
}

function modifyForm() {
	if(confirm('정말로 수정하시겠습니까?')){
		$('#modify-popup-form').submit();
		alert("수정이 완료되었습니다.");
	}
}