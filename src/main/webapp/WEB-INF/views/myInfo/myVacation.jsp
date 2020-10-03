<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag_user.jsp"></jsp:include>
<link href="resources/css/myInfo/myVacation.css" rel="styleSheet">
<title>휴가사용현황</title>
</head>
<body>

	<jsp:include page="../common/template_user.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>내 휴가사용현황</h1>
		<div id="myInfo-back">
			<div id="myInfo-form">
				<div class="myInfo-area">
					<span class="title">입사일</span>
					<input type="text" class="txtBox" value="${indate }">
				</div>
				<div class="myInfo-area">
					<span class="title">연차휴가일수</span>
					<input type="text" class="txtBox" name="email">
				</div>
				<div class="myInfo-area">
					<span class="title">휴가잔여일수</span>
					<input type="text" class="txtBox" name="${useDay }">
				</div>
			</div>
		</div>
	</div>
	<!-- // wrap -->
	
</body>
</html>