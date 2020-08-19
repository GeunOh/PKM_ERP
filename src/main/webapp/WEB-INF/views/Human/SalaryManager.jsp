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
					<input type="button" value="조회">
					<input type="button" value="엑셀">
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
		<!-- 사원정보 -->
		<div id="result-box">
			<h2>사원정보</h2>
			<table>
				<tr>
					<th>부서명</th>
					<th>사원번호</th>
					<th>사원명</th>
					<th>급여액</th>
				</tr>
				<tr class="row">
					<td>개발부</td>
					<td>000000</td>
					<td>박근오</td>
					<td>100,000,000</td>
				</tr>
				<tr class="row">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
				<tr class="row">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
				<tr class="row">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
				<tr class="row">
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
				</tr>
			</table>
			<span>총 사원수 : <span class="number">0</span> 명</span>
		</div>
		<!-- 사원정보 -->
		<!-- 인사 기본 정보 -->
		<div id="basicInfo-box">
			<h2>인사기본정보</h2>
			<form action="">
				<table>
					<tr>
						<th><label for="eno">사원번호</label></th>
						<td><input type="text" id="eno" name="eno"></td>
						<th><label for="ename">사원명(한글)</label></th>
						<td><input type="text" id="ename" name="ename"></td>
						<th><label for="dno">부서코드</label></th>
						<td><input type="text" id="dno" name="dno"></td>
						<th><label for="dname">부서명</label></th>
						<td><input type="text" id="dname" name="dname"></td>
						<td><input type="text" id="isRetire" value="재직" disabled></td>
					</tr>
					<tr>
						<th><label for="#">주민번호</label></th>
						<td><input type="text" id="#" name="#"></td>
						<th><label for="email">이메일</label></th>
						<td><input type="text" id="email" name="email"></td>
						<th><label for="phone">핸드폰번호</label></th>
						<td><input type="text" id="phone" name="phone"></td>
					</tr>
					<tr>
						<th><label for="#">은행코드</label></th>
						<td><input type="text" id="#" name="#"></td>
						<th><label for="#">계좌번호</label></th>
						<td><input type="text" id="#" name="#"></td>
						<th><label for="#">식대보조</label></th>
						<td>
							<input type="radio" id="#" name="#"> 지원
							<input type="radio" id="#" name="#"> 미지원
						</td>
						
					</tr>
				</table>
			</form>
		</div>
		<!-- // 인사 기본 정보  -->
		<!-- 급여 수당 정보 -->
		<div id="salaryInfo-box">
		
		</div>
		<!-- // 급여 수당 정보 -->
	</div>
	<!-- // wrap  -->
</body>
</html>