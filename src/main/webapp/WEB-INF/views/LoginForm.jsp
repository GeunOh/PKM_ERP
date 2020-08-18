<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="resources/css/LoginForm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head> 
<body>
	<div id="login-form">
		<h1>LOGIN</h1>
		<form action="/Login">
			<div class="text-area">
				<input type="text" name="id" id="id" autocomplete="off" required>
				<label for="id">USER NAME</label>
			</div>
			<div class="text-area">
				<input type="text" name="pwd" id="pwd" autocomplete="off" required>
				<label for="pwd">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button type="submit" id="btn">LOGIN</button>
			</div>
		</form>
		<div class="caption">
			<a href="">Forgot Password?</a>
		</div>
	</div>
	
	<script type="text/javascript" src="resources/js/LoginForm.js"></script>
	
	
</body>
</html>