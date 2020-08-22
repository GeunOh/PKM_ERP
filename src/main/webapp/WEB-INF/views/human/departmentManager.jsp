<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<li><span>인사부</span></li>
							<li><span>자재부</span></li>
							<li><span>경리부</span></li>
							<li><span>개발부</span></li>
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
						<th>부서명</th>
						<td>WORKSPACE Company</td>
					</tr>
					<tr>
						<th>부서코드</th>
						<td>ADMKL1231231</td>
					</tr>
					<tr>
						<th>부서장</th>
						<td>쿠크다스</td>
					</tr>
					<tr>
						<th>시작일</th>
						<td>2020-08-22</td>
					</tr>
					<tr>
						<th>종료일</th>
						<td>2099-12-31</td>
					</tr>
					<tr>
						<th>설명</th>
						<td>엄청난 회사입니다.</td>
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