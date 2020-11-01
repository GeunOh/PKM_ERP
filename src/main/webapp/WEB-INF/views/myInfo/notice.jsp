<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag_user.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/myInfo/notice.css">
<script type="text/javascript" src="resources/NaverEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>공지사항</title>
</head>
<body>

	<jsp:include page="../common/template_user.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<div id="content">
		<h2>공지사항</h2>
		<c:if test="${loginUser.adminyn eq 'Y'}">
			<button id="writeBtn">작성하기</button>
		</c:if>
		<ul>
			<c:forEach var="n" items="${nlist}">
				<li>
					<div class="title">
						<span class="icon"><i class="fas fa-chevron-right"></i></span>
						<span class="text">${n.title}</span>
						<span class="date">${n.create_date}</span>
					</div>
					
					<div class="contentForm" style="display: none;">
						<c:if test="${loginUser.adminyn eq 'Y' and (loginUser.eno eq n.writer or loginUser.eno eq 'admin')}">
							<button class="wcbtn uBtn ub_right">삭제</button>
							<button class="wcbtn uBtn ub_left">수정</button>
						</c:if>
						<div class="content">
								${n.content}
						</div>
						<c:if test="${ not empty n.org_file_name}">
							<div class="content">
								첨부파일 : <a style="color: blue" href="/MyInfo/fileDown?bNo=${n.bNo}">${n.org_file_name}</a>&nbsp;&nbsp;(${n.file_size}&nbsp;KB)
							</div>
						</c:if>
						
						<input type="hidden" class="no" value="${n.bNo}">
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
	</div>
	
	<div class="modal" id="modal" style="display: none;">
		<div class="modal-content">
			<h2>공지사항 작성</h2>
			<form id="NoticeWriteForm" action="/MyInfo/NoticeInsert" enctype="multipart/form-data" method="post">
				<label>제목</label><input type="text" name="title" id="title" >
				<textarea name="ir1" id="ir1" rows="10" cols="100" style="width: 100%"></textarea>
				<div id="fileform"><input type="file" value="파일 선택" name="file"></div>
				<div class="btnForm">
					<button type="button" id="writeContent" class="wcbtn">등록</button>
					<button type="button" id="wclose" class="close wcbtn">취소</button>
				</div>
			</form>
		</div>
		<div class="modal-layer"></div>
	</div>

	<div class="modal" id="modal2" style="display: none;">
		<div class="modal-content">
			<h2>공지사항 수정</h2>
			<form id="NoticeUpdateForm" name="NoticeUpdateForm" action="/MyInfo/NoticeModify">
				<label>제목</label><input type="text" name="title" id="utitle" >
				<textarea name="ir2" id="ir2" rows="10" cols="100" style="width: 100%"></textarea>
				<div class="btnForm">
				<button type="button" id="updateContent" class="wcbtn">등록</button>
				<button type="button" id="uclose" class="close wcbtn">취소</button>
				<input type="hidden" class="no" name="no" value="">
				</div>
			</form>
		</div>
		<div class="modal-layer"></div>
	</div>
	
	<div class="modal" id="modal3" style="display: none;">
		<div class="modal-content">
			<h2>공지사항 삭제</h2>
			<form id="NoticeDeleteForm" name="NoticeDeleteForm" action="NoticeDelete.no">
				<div  id="txtdiv"><label>정말 삭제하시겠습니까?</label></div>
				<div class="btnForm">
				<button type="button" id="DeleteContent" class="wcbtn">등록</button>
				<button type="button" id="dclose" class="close wcbtn">취소</button>
				<input type="hidden" class="no" name="no" value="">
				</div>
			</form>
		</div>
		<div class="modal-layer"></div>
	</div>
	<!-- 추가 팝업창  -->
	<div id="alertBox">
		<p></p>
	</div>
<script type="text/javascript" src="resources/js/myInfo/myInfo.js"></script>
<script>
var Imsg = '${Imsg}';
var Mmsg = '${Mmsg}';
var Dmsg = '${Dmsg}';

if(Imsg == 'true') {
	$("#alertBox p").text("공지사항을 추가했습니다.");
	$("#alertBox").fadeIn();
	setTimeout(function(){
		$("#alertBox").fadeOut();
	}, 3000);
}
if(Imsg == 'false') {
	$("#alertBox p").text("공지사항 추가 실패했습니다.");
	$("#alertBox").fadeIn();
	setTimeout(function(){
		$("#alertBox").fadeOut();
	}, 3000);
}
if(Mmsg == 'true') {
	$("#alertBox p").text("공지사항을 수정했습니다.");
	$("#alertBox").fadeIn();
	setTimeout(function(){
		$("#alertBox").fadeOut();
	}, 3000);
}
if(Mmsg == 'false') {
	$("#alertBox p").text("공지사항 수정 실패했습니다.");
	$("#alertBox").fadeIn();
	setTimeout(function(){
		$("#alertBox").fadeOut();
	}, 3000);
}
if(Dmsg == 'true') {
	$("#alertBox p").text("공지사항을 삭제했습니다.");
	$("#alertBox").fadeIn();
	setTimeout(function(){
		$("#alertBox").fadeOut();
	}, 3000);
}
if(Dmsg == 'false') {
	$("#alertBox p").text("공지사항 삭제 실패했습니다.");
	$("#alertBox").fadeIn();
	setTimeout(function(){
		$("#alertBox").fadeOut();
	}, 3000);
}
</script>
</body>
</html>