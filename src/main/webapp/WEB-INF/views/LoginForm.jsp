<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="common/headTag.jsp"/>
<meta charset="UTF-8">
<title>Login</title>
<link href="resources/css/LoginForm.css" rel="stylesheet">
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head> 
<body>
	<c:if test="${empty saveId.value}">
		<c:set var="chk" value=""/>
	</c:if>
	<c:if test="${!empty saveId.value}">
		<c:set var="chk" value="checked"/>
	</c:if>
	
	<div id="login-form">
		<h1>LOGIN</h1>
		<form action="/Login" method="post">
			<div class="text-area">
				<input type="text" name="id" id="id" autocomplete="off" required>
				<label for="id">USER NAME</label>
			</div>
			<div class="text-area">
				<input type="password" name="pwd" id="pwd" autocomplete="off" required>
				<label for="pwd">PASSWORD</label>
			</div>
			<div class="btn-area">
				<button type="submit" id="btn">LOGIN</button>
			</div>
			<div class="check-area">
				<input type="checkbox" id="idChk" name="idChk" value="checked" ${chk}><label for="idChk" class="chkBox"><em></em>아이디 저장</label>
				<div class="caption">
					<a href="#" id="idSearch" onclick="idSearch();">아이디찾기</a> / 
					<a href="#" id="pwdSearch" onclick="pwdSearch();">비밀번호 찾기</a>
				</div>
			</div>
			
		</form>
		
		<div id="error-popup" style="display:none;"></div>
	</div>
	<!-- 아이디 찾기 -->
	<div class="popupContent" id="idpopup" style="display:none;">
		<h2>아이디 찾기</h2>
		<P>아래의 정보를 입력하시면<br> 가입하셨던 이메일로 아이디를 보내드립니다.</P>
		<form>
			<div class="find-area">
				<label for="id_ename">이름&nbsp;</label>
				<input type="text" name="ename" id="id_ename">
			</div>
			<div class="find-area">
				<label for="id_eno">핸드폰번호&nbsp;</label>
				<input type="tel" name="phone" id="id_phone" class="phoneNumber" maxlength="13">
			</div>
			<div class="btn-form">
				<button type="button"><i class="fas fa-times"></i> 취소</button>
				<button type="button" onclick="idFind();"><i class="fas fa-check"></i> 확인</button>
			</div>
		</form>
	</div>	
	<div class="popupContent" id="pwdpopup" style="display:none;">
			<h2>비밀번호 찾기</h2>
			<P>아래의 정보를 입력하시면<br> 가입하셨던 이메일로 새로운 비밀번호를 보내드립니다.</P>
		<form>
			<div class="find-area">
				<label for="pwd_id">아이디&nbsp;</label>
				<input type="text" name="id" id="pwd_id">
			</div>
			<div class="find-area" id="name-area">
				<label for="pwd_ename">이름&nbsp;</label>
				<input type="text" name="ename" id="pwd_id">
			</div>
			<div class="find-area">
				<label for="id_eno">핸드폰번호&nbsp;</label>
				<input type="tel" name="phone" id="pwd_phone" class="phoneNumber" maxlength="13">
			</div>
			<div class="btn-form">
				<button type="button"><i class="fas fa-times"></i> 취소</button>
				<button type="button" onclick="pwdFind();"><i class="fas fa-check"></i> 확인</button>
			</div>
		</form>
	</div>	
	<script type="text/javascript" src="resources/js/LoginForm.js"></script>
	<script>
		$(function(){
			var cookie = '${saveId.value}';
			var idfalse = '${idFalse}';
			var pwdfalse = '${pwdFalse}';
			var errorMsg;
			
			if(idfalse != ''){
				errorMsg = '존재하지 않는 아이디거나, 탈퇴한 아이디입니다.';
				$('#error-popup').text(errorMsg);
				$('#error-popup').fadeIn();
				setTimeout(function(){
					$('#error-popup').fadeOut();
				}, 5000);
			}else if(pwdfalse != ''){
				errorMsg = '비밀번호가 틀렸습니다. 다시 입력해주세요.';
				$('#error-popup').fadeIn();
				$('#error-popup').text(errorMsg);
				setTimeout(function(){
					$('#error-popup').fadeOut();
				}, 5000);
			}
			if(cookie != ''){
				$('#id').val(cookie);
			}
		})
		
		function idSearch(){
			 $("#idpopup").fadeIn();
			 $("#idpopup").draggable();
		}
		function pwdSearch(){
			 $("#pwdpopup").fadeIn();
			 $("#pwdpopup").draggable();
		}
	</script>
	
</body>
</html>