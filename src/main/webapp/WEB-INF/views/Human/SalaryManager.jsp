<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/SalaryManager.css">
<title>급여 관리</title>
</head>
<body>
	
	<jsp:include page="../common/header.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<!-- 급여기본관리 -->
		<h1>급여기본관리</h1>
		<div id="search-box">
			<form>
				<div class="buttons">
					<input type="button" value="조회"> <input type="button"
						value="엑셀">
				</div>
				<table>
					<tr>
						<th><label for="date">조회일</label></th>
						<td>
							<input type="date" id="date">
						</td>
						<th><label for="eno">사원번호</label></th>
						<td><input type="text" id="eno" name="eno"> <input type="button" class="searchBtn"></td>
						<th><label for="ename">사원명</label></th>
						<td><input type="text" id="ename" name="ename"></td>
						<th>재직구분</th>
						<td><select name="" id="">
								<option value="">재직</option>
								<option value="">퇴직</option>
						</select></td>
					</tr>
					<tr>
						<th><label for="dno">부서</label></th>
						<td><input type="text" id="dno" name="dno"> <input type="button" class="searchBtn"></td>
						<th>직급</th>
						<td><input type="text"> <input type="button" class="searchBtn"></td>
						<th>반</th>
						<td><input type="text"> <input type="button" class="searchBtn"></td>
					</tr>

				</table>
			</form>
		</div>
		<!-- // 급여기본관리 -->
	</div>
	<!-- // wrap  -->
</body>
</html>