<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"/>
<title>부서관리</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<link href="resources/css/human/departmentManager.css" rel="styleSheet">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>부서관리</h1>
		<div id="department-wrap">
			<!-- 조직도 -->
			<div id="organizationChart">
				<form>
					<ul>
						<li>
							<span>
								<i class="fas fa-sitemap"></i>
								조직도
							</span>
						</li>
						<li>
						<span>WORKSPACE Company</span>
						<ul id="branch-area">
							<%-- 존재하는 부서들 출력 --%>
							<c:forEach items="${deptList}" var="dept">
								<li><span>${dept.dname}</span></li>
							</c:forEach>
						</ul>
						</li>
					</ul>
					<div class="buttons">
						<button>등록</button>
						<button>수정</button>
						<button>삭제</button>
					</div>
				</form>
			</div>
			<!-- // 조직도  -->
			<!-- 조직정보 -->
			<div id="organizationInfo">
				<h3>조직정보</h3>
				<table>
					<tr>
						<th>회사명</th>
						<td id="dname">WORKSPACE COMPANY</td>
					</tr>
					<tr>
						<th>회사코드</th>
						<td id="dcode">C123123123</td>
					</tr>
					<tr>
						<th>회사대표</th>
						<td id="dboss">쿠크다스</td>
					</tr>
					<tr>
						<th>시작일</th>
						<td id="startDate">2020-11-11</td>
					</tr>
					<tr>
						<th>종료일</th>
						<td>2099-12-31</td>
					</tr>
					<tr>
						<th>회사소개</th>
						<td id="dcomment">좋은 회사입니다.</td>
					</tr>
				</table>
			</div>
			<!-- // 조직정보 -->
		</div>
	</div>
	<!-- // wrap -->
<script type="text/javascript" src="resources/js/human/departmentManager.js"></script>
</body>
</html>