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
						<button type="button" id="addBtn">등록</button>
						<button type="button" id="modifyBtn">수정</button>
						<button type="button" id="delBtn">삭제</button>
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
						<td class="dname">WORKSPACE COMPANY</td>
					</tr>
					<tr>
						<th>회사코드</th>
						<td class="dcode">C123123123</td>
					</tr>
					<tr>
						<th>회사대표</th>
						<td class="dboss">쿠크다스</td>
					</tr>
					<tr>
						<th>시작일</th>
						<td class="startDate">2020-11-11</td>
					</tr>
					<tr>
						<th>종료일</th>
						<td>2099-12-31</td>
					</tr>
					<tr>
						<th>회사소개</th>
						<td class="dcomment">좋은 회사입니다.</td>
					</tr>
				</table>
			</div>
			<!-- // 조직정보 -->
		</div>
		<!-- 부서 등록 수정 삭제 -->
		<div id="popupBox">
			<div id="dimBox"></div>
			<!-- 부서 등록 -->
			<div id="addDept" class="crud_box">
				<h2>부서 등록</h2>
				<form action="/Human/addDept" name="addFrm">
					<table>
						<tr>
							<th>부서명</th>
							<td>
								<input type="text" name="dname">
							</td>
						</tr>
						<tr>
							<th>부서코드</th>
							<td>
								<input type="text" name="dcode">
							</td>
						</tr>
						<tr>
							<th>부서장</th>
							<td>
								<input type="text" name="ename">
							</td>
						</tr>
					</table>
					<p>부서 설명 및 소개</p>
					<textarea rows="6" name="dcomment"></textarea>
					<div class="button_group">
						<button>등록</button>
						<button type="button" class="cancleBtn">취소</button>
					</div>
				</form>
			</div>
			<!-- // 부서 등록 -->
			<!-- 부서 삭제 -->
			<div id="delDept" class="crud_box">
				<h2>부서 삭제</h2>
				<form action="/Human/delDept">
					<p>삭제하실 부서를 선택해주세요.</p>
					<div id="deptList">
						<table>
							<tr>
								<th><input type="checkbox"></th>
								<th>부서명</th>
							</tr>
							<%-- 존재하는 부서들 출력 --%>
							<c:forEach items="${deptList}" var="dept">
								<tr>
									<td><input type="checkbox" id="${dept.dname}" name="dname" value="${dept.dname}"></td>
									<td><label for="${dept.dname}">${dept.dname}</label></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div id="deptInfo">
						<h3>조직 정보</h3>
						<table>
							<tr>
								<th>회사명</th>
								<td class="dname">WORKSPACE COMPANY</td>
							</tr>
							<tr>
								<th>회사코드</th>
								<td class="dcode">C123123123</td>
							</tr>
							<tr>
								<th>회사대표</th>
								<td class="dboss">쿠크다스</td>
							</tr>
							<tr>
								<th>시작일</th>
								<td class="startDate">2020-11-11</td>
							</tr>
							<tr>
								<th>회사소개</th>
								<td class="dcomment">좋은 회사입니다.</td>
							</tr>
						</table>
					</div>
					<div class="button_group">
						<button>삭제</button>
						<button type="button" class="cancleBtn">취소</button>
					</div>
				</form>
			</div>
			<!-- // 부서 삭제  -->
			<!-- 부서 수정 -->
			<div id="modifyDept" class="crud_box">
				<h2>부서 수정</h2>
				<form action="/Human/modifyDept">
					<p>수정하실 부서를 선택해주세요.</p>
					<div id="deptList">
						<table>
							<tr>
								<th>부서명</th>
							</tr>
							<%-- 존재하는 부서들 출력 --%>
							<c:forEach items="${deptList}" var="dept">
								<tr>
									<td>${dept.dname}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div id="deptInfo">
						<h3>조직 정보</h3>
						<table>
							<tr>
								<th>부서명</th>
								<td id="m_dname"></td>
							</tr>
							<tr>
								<th>부서코드</th>
								<td id="m_dcode"></td>
							</tr>
							<tr>
								<th>부서장</th>
								<td id="m_dboss"></td>
							</tr>
							<tr>
								<th>시작일</th>
								<td id="m_startDate"></td>
							</tr>
							<tr>
								<th>부서소개</th>
								<td id="m_dcomment"></td>
							</tr>
						</table>
					</div>
					<div class="button_group">
						<button>수정</button>
						<button type="button" class="cancleBtn">취소</button>
					</div>
					<input type="hidden" id="beforeDept" name="beforeDept">
				</form>
			</div>
			<!-- // 부서 수정 -->
		</div>
		<!-- // 부서 등록 수정 삭제 -->
		
	</div>
	<!-- // wrap -->
<script type="text/javascript" src="resources/js/human/departmentManager.js"></script>
</body>
</html>