<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag_user.jsp"></jsp:include>
<link href='resources/fullcalendar/main.css' rel='stylesheet' />
<script src='resources/fullcalendar/main.js'></script>
<title>출근 통계</title>
</head>
<body>

	<jsp:include page="../common/template_user.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<div id="calendar"></div>
	</div>
	<!-- // wrap -->
	
</body>
<script>
function getEvent() {
	var eno = '${loginUser.eno}'; 
	var events;
	$.ajax({
		type : 'POST',
		data : {eno:eno},
		datatype : 'json',
		async : false,
		url : '/MyInfo/workData',
		success : function(result) {
			console.log(result)
			events = result;
		}
	});
	return events;
}

 document.addEventListener('DOMContentLoaded', function() {
   var calendarEl = document.getElementById('calendar');
   var calendar = new FullCalendar.Calendar(calendarEl, {
   	timeZone : 'local',
     initialView: 'dayGridMonth',
     height: '90%',
     buttonText:{ // 버튼 글자 커스텀
				today : '오늘',
				month : '월',
				week : '주',
				day : '일',
				 },
 	 events: getEvent()
   });
   calendar.render();
 });

</script>
</html>