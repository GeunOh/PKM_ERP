// input에 금액단위 , 자동생성 메서드
function numberWithCommas(x, t) {
	x = x.replace(/[^0-9]/g, ''); // 입력값이 숫자가 아니면 공백
	x = x.replace(/,/g, ''); // ,값 공백처리
	t.value = x.replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 정규식을 이용해서 3자리 마다 , 추가
}