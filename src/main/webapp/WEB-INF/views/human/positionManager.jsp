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
		<h1>직급관리</h1>
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
					<button type="button" id="deleteBtn" onclick="deletePosition();">삭제</button>
				</form>
			</div>
		</div>
		<!-- // 검색영역 -->
		<!-- 테이블 -->
		<form name="tableForm">
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
		</form>
	</div>
	<!-- // wrap -->
<script type="text/javascript" src="resources/js/human/positionManager.js"></script>
</body>
</html>