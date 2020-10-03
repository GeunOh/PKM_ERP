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

      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          height: '90%',
        });
        calendar.render();
      });

</script>
</html>