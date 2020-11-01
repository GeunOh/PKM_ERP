<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"/>
<link rel="stylesheet" href="resources/css/human/positionManager.css">
<title>직급 관리</title>
</head>
<body>
	
	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap  -->
	<div id="wrap">
		<h1>직급 관리</h1>
		<!-- 검색영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form name="searchForm">
					<div class="search-area" style="height:31px">
						<span class="title">직급번호</span>
						<input type="text" id="rcode" name="rcode" class="txtBox wid_150" >
					</div>
					<div class="search-area" style="height:31px">
						<span class="title">직급명</span>
						<input type="text" id="rname" name="rname" class="txtBox wid_150" >
					</div>
					<button type="button" id="searchBtn" onclick="searchPosition();">검색</button>
					<button type="button" id="addBtn" onclick="addPosition();">추가</button>
					<button type="button" id="modifyBtn" onclick="modifyPosition();">수정</button>
					<button type="button" id="deleteBtn" onclick="deletePosition();">삭제</button>
				</form>
			</div>
		</div>
		<!-- // 검색영역 -->
		<!-- 테이블 -->
		<form name="tableForm">
			<div id="positionTableWrap">
				<table id="positionTable">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th>직급번호</th>
							<th>직급명</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="p" items="${pList}">
							<tr>
								<td><input type="checkbox" name="rcodeChk" value="${p.rcode }"></td>
								<td>${p.rcode }</td>
								<td>${p.rname }</td>
							</tr>
						</c:forEach>
						<c:if test="${empty pList}">
								<tr><td colspan="3">직급정보가 없습니다.</td></tr>
						</c:if>
						<c:if test="${!empty pList}">
							<c:if test="${10 - fn:length(pList) > 0 }">
								<c:forEach var="p" begin="1" end="${10 - fn:length(pList)}" >
									<tr>
										<td>&nbsp;</td>
										<td></td>
										<td></td>
									</tr>
								</c:forEach>
							</c:if>
						</c:if>
					</tbody>
				</table>
			</div>
		</form>
		<!-- // 테이블 -->
		<div class="notice_box">
            <ul>
	            <li>1. 검색/추가 시 직급코드와 직급명을 입력하시고 해당 버튼을 클릭해 주세요.</li>
                <li>2. 직급을 선택하시면 해당 직급의 사원목록을 확인하실 수 있습니다.</li>
                <li>3. 직급 삭제 시 해당 직급에 사원이 있으면 해당 사원의 직급은 사라집니다.</li>
            </ul>
        </div>
		<!-- 사원목록 -->
		<div id="humanList">
			<h2>사원목록</h2>
			<div id="hListTableWrap">
				<table>
					<thead>
						<tr>
							<th>부서명</th>
							<th>직급명</th>
							<th>사원번호</th>
							<th>사원명</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="4" style="font-size: 16px;">해당하는 직급의 사원을 확인하시려면 직급을 선택해주세요.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- // 사원목록 -->
		<!-- 직급수정 팝업창 -->
		<form name="modifyForm" class="modify-popup-form">
			<div class="popupContent">
				<h2>직급 수정
				<i class="fas fa-times" aria-hidden="true"></i>
				</h2>
				<div class="content-form">
					<div class="modify-form">
						<span class="modify-title">직급번호</span>
						<input type="text" class="txtBox modify-text" name="modify-rcode">
						<input type="hidden" name="before-rcode">
					</div>
					<div class="modify-form">
						<span class="modify-title">직급이름</span>
						<input type="text" class="txtBox modify-text" name="modify-rname">
					</div>
				</div>
				<div class="content-form modify-btn-form">
					<button type="button">
						<i class="fas fa-times" aria-hidden="true"></i> 취소
					</button>
					<button type="button">
						<i class="fas fa-check" aria-hidden="true"></i> 수정
					</button>
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
		<!-- // 직급수정 팝업창 -->
		<!-- 알림창 -->
		<div id="alertBox">
			<p></p>
		</div>
		<script type="text/javascript">
			var addMsg = "${addMsg}";
			var deleteMsg = "${deleteMsg}";
			var modifyMsg = "${modifyMsg}";
			
			if(addMsg!='') {
				$("#alertBox p").text(addMsg);
				$("#alertBox").fadeIn();
				setTimeout(function(){
					$("#alertBox").fadeOut();
				}, 3000);
			}
			
			if(deleteMsg!='') {
				$("#alertBox p").text(deleteMsg);
				$("#alertBox").fadeIn();
				setTimeout(function(){
					$("#alertBox").fadeOut();
				}, 3000);
			}
			
			if(modifyMsg!=''){
				$("#alertBox p").text(modifyMsg);
				$("#alertBox").fadeIn();
				setTimeout(function(){
					$("#alertBox").fadeOut();
				}, 3000);
			}
		</script>
		<!-- 알림창 -->
	</div>
	<!-- // wrap -->
<script type="text/javascript" src="resources/js/human/positionManager.js"></script>
</body>
</html>