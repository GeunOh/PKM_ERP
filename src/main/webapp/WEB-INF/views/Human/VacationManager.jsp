<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<title>휴가 관리</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>휴가관리</h1>
		<!-- 휴가조회 -->
		<div id="search-box">
			<form>
				<div class="buttons">
					<a>조회</a>
					<a>엑셀</a>
				</div>
				<table>
					<tr>
						<th><label>휴가일자</label></th>
						<td>
							<input type="text" id="loc">
						</td>
						
						<td>
							<input type="date"> ~ <input type="date">
						</td>
					</tr>
					<tr>
						<th><label>부서</label></th>
						<td><input type="text" id="dno" name="dno"> <input type="button" class="searchBtn"></td>
						<th>직급</th>
						<td><input type="text"> <input type="button" class="searchBtn"></td>
						<th>반</th>
						<td><input type="text"> <input type="button" class="searchBtn"></td>
					</tr>

				</table>
			</form>
		</div>
		<!-- // 휴가조회 -->
		
	</div>
	<!-- // wrap  -->
</body>
</html>