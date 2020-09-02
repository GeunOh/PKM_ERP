/**
 * 
 */
$(function(){
	
	// sysdate 일때 getMonth()+1, 직접 지정한 날일땐  getMonth()
	var today = new Date(); 
	
	var year = today.getFullYear();		// 현재 년도
	var month = today.getMonth(); 		// 현재 달 가져오기 // 8
	var day = today.getDay(); 			// 시작하는 요일 체크
    
    console.log(year);
    console.log(month);
    console.log(date);
    console.log(day);
    
    // 달의 마지막날 배열 저장
	var lastDayArr = [31,28,31,30,31,30,31,31,30,31,30,31]; 
	var dayArr = ['일', '월', '화', '수', '목', '금', '토'];
	
	// 윤년 체크 후 2월에 마지막날 값 변경
	if ((year%4==0 && year%100!=0) || (year%400==0)){ 
	    lastDayArr[1] = 29;
	}
	
	// 달의 첫째 날 및 요일 가져오기
	var firstDate = new Date(year,month,1);		// 10 -1 > 9
    var firstDay = firstDate.getDay(); // 시작하는 요일 체크  0 = 일
//	console.log(firstDate);
//	console.log(firstDay);
	
//    console.log("firstDay" + firstDay);
//    console.log(lastDayArr[month-1]);
//    console.log(dayArr.lenght);
    
    // 출력
	for(var i=1; i<=lastDayArr[month]; i++){
		$("thead tr:first").append("<th>"+ i +"</th>");
		if(firstDay == 0) {
			$("thead tr:last").append("<th style='color:red'>"+ dayArr[firstDay] +"</th>");
		} else if( firstDay == 6) {
			$("thead tr:last").append("<th style='color:blue'>"+ dayArr[firstDay] +"</th>");
		} else {
			$("thead tr:last").append("<th>"+ dayArr[firstDay] +"</th>");
		}
		firstDay++;
		if(firstDay == 7) {
			firstDay = 0;
		}
	}
	
	

});
