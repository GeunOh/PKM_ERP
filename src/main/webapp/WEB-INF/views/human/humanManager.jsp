<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"/>
<title>기본인사관리</title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<link href="resources/css/human/humanManager.css" rel="styleSheet">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
	<div id="wrap">
		<h1>인사 관리</h1>
		<div id="Search-back">
			<div id="Serach-form">
				<form>
					<div class="search-area">
						<span class="title">상태</span>
						<div class="selectBox">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected">전체</a>
							<ul>
								<li><a href="#" class="link-select" data-value="all">전체</a></li>
								<li><a href="#" class="link-select" data-value="in">재직</a></li>
								<li><a href="#" class="link-select" data-value="out">퇴직</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">부서</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
								<li><a href="#" class="link-select wid_150" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_150" data-value="in">재직</a></li>
								<li><a href="#" class="link-select wid_150" data-value="out">퇴직</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">직급</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
								<li><a href="#" class="link-select wid_150" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_150" data-value="in">재직</a></li>
								<li><a href="#" class="link-select wid_150" data-value="out">퇴직</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">업무 메일</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
								<li><a href="#" class="link-select wid_150" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_150" data-value="in">재직</a></li>
								<li><a href="#" class="link-select wid_150" data-value="out">퇴직</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<br>
					
					<div class="search-area downSearch">
						<span class="title">사번</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
								<li><a href="#" class="link-select wid_150" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_150" data-value="in">재직</a></li>
								<li><a href="#" class="link-select wid_150" data-value="out">퇴직</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					<div class="search-area">
						<span class="title">사원명</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
								<li><a href="#" class="link-select wid_150" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_150" data-value="in">선택</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					<div class="search-area" style="height: 31px;">
						<span class="title">입사일</span>
						<div class="selectBox wid_55">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all">
							<a href="#none" class="link-selected wid_55">전체</a>
							<ul class="wid_75">
								<li><a href="#" class="link-select wid_35" data-value="all">전체</a></li>
								<li><a href="#" class="link-select wid_35" data-value="in">선택</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
						<input type="date" id="date" class="date"> <label>~</label>
						<input type="date" id="date2" class="date rightDate">
					</div>
					<button id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="addBtn">추가</label>
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 테이블 -->
		<table id="humanTable">
			<thead>
				<tr>
					<th>상태</th>
					<th>입사일</th>
					<th>사번</th>
					<th>이름</th>
					<th>직급</th>
					<th>부서</th>
					<th>업무 메일</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<!-- 페이징 버튼 -->
		<div id="pagingForm">
			<a class="pg_page"><i class="fas fa-backward"></i></a>
			<a class="pg_page"><i class="fas fa-caret-left"></i></a>
			<b class="pg_current">1</b>
			<a class="pg_page">2</a>
			<a class="pg_page">3</a>
			<a class="pg_page">4</a>
			<a class="pg_page">5</a>
			<a class="pg_page">6</a>
			<a class="pg_page">7</a>
			<a class="pg_page">8</a>
			<a class="pg_page">9</a>
			<a class="pg_page">10</a>
			<a class="pg_page"><i class="fas fa-caret-right"></i></a>
			<a class="pg_page"><i class="fas fa-forward"></i></a>
		</div>
	</div>
<script type="text/javascript" src="resources/js/human/humanManager.js"></script>
</body>
</html>