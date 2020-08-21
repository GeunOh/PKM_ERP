<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/human/vacationManager.css">
<title>휴가승인관리</title>
</head>
<body>
	
	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>휴가승인관리</h1>
		<!-- 휴가조회 -->
		<div id="search-box">
			<form>
				<div class="buttons">
					<a>조회</a>
					<a>엑셀</a>
				</div>
				<table>
					<tr>
						<th>휴가분류</th>
						<th>소속</th>
						<th>직위</th>
						<th>시작일</th>
						<th>종료일</th>
						<th>사용일수</th>
						<th>상태</th>
						<th>신청일자</th>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td>6</td>
						<td>7</td>
						<td>8</td>
					</tr>
				</table>
			</form>
		</div>
		<!-- // 휴가조회 -->
		
	</div>
	<!-- // wrap  -->
</body>
</html>