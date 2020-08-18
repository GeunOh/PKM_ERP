<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/MenuBar.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/4d55e1ad7a.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="header-form">
		<div id="header-menuForm">
			<div id="logo-form">
				<div id="logo-Text">PKM</div>
				<div id="logo-title">통합관리시스템<br>
					<label>System Manager</label>
				</div>
			</div>
			<ul id="Mainmenu">
				<li>인사관리</li>
				<li>재고관리</li>
				<li>매출관리</li>
				<li>공지사항</li>
			</ul>
		</div>
		<div id="header-userForm"></div>
		<ul id="Usermenu">
			<li><i class="fas fa-bell"></i><label>Alram</label></li>
			<li><i class="fas fa-address-card"></i><label>My Info</label></li>
			<li><i class="fas fa-power-off"></i><label>Logout</label></li>
		</ul>
	</div>
</body>
</html>