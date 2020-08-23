<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
				<form action="/Human/SearchHuman">
					<div class="search-area">
						<span class="title">상태</span>
						<div class="selectBox">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all" value="all">
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
							<input type="hidden" id="selectDept" name="selectDept" data-value="all">
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
							<input type="hidden" id="selectRank" name="selectRank" data-value="all">
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
						<input type="text" class="txtBox" name="email">
					</div>
					
					<br>
					
					<div class="search-area downSearch">
						<span class="title">사번</span>
						<input type="text" class="txtBox" name="eno">
					</div>
					<div class="search-area">
						<span class="title">사원명</span>
						<input type="text" class="txtBox" name="name">
					</div>
					<div class="search-area" style="height: 31px;">
						<span class="title">입사일</span>
						<div class="selectBox wid_55">
							<input type="hidden" id="selectDate" name="selectDate" data-value="dateAll">
							<a href="#none" class="link-selected wid_55">전체</a>
							<ul class="wid_75">
								<li><a href="#" class="link-select wid_35" data-value="dateAll">전체</a></li>
								<li><a href="#" class="link-select wid_35" data-value="dateSelect">선택</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
						<input type="date" id="date" name="date" class="date" disabled> <label>~</label>
						<input type="date" id="date2" name="date2" class="date rightDate" disabled>
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
					<th style="width: 3%;">상태</th>
					<th style="width: 10%">입사일</th>
					<th style="width: 10%">사번</th>
					<th style="width: 7%">이름</th>
					<th style="width: 5%">직급</th>
					<th style="width: 5%">부서</th>
					<th style="width: 10%">업무 메일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="h" items="${hList}" >
					<tr>
						<c:if test="${h.outyn eq 'N'}">
							<td>재직</td>
						</c:if>
						<td>${h.indate }</td>
						<td>${h.eno }</td>
						<td>${h.name }</td>
						<td>${h.rcode }</td>
						<td>${h.dcode }</td>
						<td>${h.email }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty hList}">
					<tr><td colspan="7">사원정보가 없습니다.</td></tr>
				</c:if>
				<c:if test="${!empty hList}">
					<c:if test="${10 - fn:length(hList) > 0 }">
						<c:forEach var="h" begin="1" end="${10 - fn:length(hList)}" >
							<tr>
								<td>&nbsp;</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:forEach>
					</c:if>
				</c:if>
			</tbody>
		</table>
		<!-- 페이징 버튼 -->
		<div id="pagingForm">
				<c:if test="${ pi.currentPage > 1 }">
				<c:url var="start" value="${ loc }">
					<c:param name="page" value="1"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.dept}"/>
						<c:param name="selectRank" value="${hs.rank}"/>
						<c:param name="email" value="${hs.email}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
						<c:param name="date" value="${hs.date}"/>
						<c:param name="date2" value="${hs.date2}"/>
					</c:if>
					<c:if test="${selectVal ne null }"><c:param name="selectVal" value="${selectVal}"/></c:if>
					<c:if test="${selectDate ne null }"><c:param name="selectDate" value="${selectDate}"/></c:if>
				</c:url>
				<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
			</c:if>
			<!--10개씩 전 페이징  -->
			<c:if test="${ pi.currentPage > 10 }">
				<c:url var="prev" value="${ loc }">
					<c:param name="page" value="${pi.startPage - 10}"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.dept}"/>
						<c:param name="selectRank" value="${hs.rank}"/>
						<c:param name="email" value="${hs.email}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
						<c:param name="date" value="${hs.date}"/>
						<c:param name="date2" value="${hs.date2}"/>
					</c:if>
					<c:if test="${selectVal ne null }"><c:param name="selectVal" value="${selectVal}"/></c:if>
					<c:if test="${selectDate ne null }"><c:param name="selectDate" value="${selectDate}"/></c:if>
				</c:url>
				<a class="pg_page" href="${ prev }"><i class="fas fa-caret-left"></i></a>
			</c:if>
			<!-- 기본페이지 -->
			<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<strong class="pg_current">${ p }</strong>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:if test="${p ne 0}">
						<c:url var="pagination" value="${ loc }">
							<c:param name="page" value="${ p }"/>
							<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.dept}"/>
						<c:param name="selectRank" value="${hs.rank}"/>
						<c:param name="email" value="${hs.email}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
						<c:param name="date" value="${hs.date}"/>
						<c:param name="date2" value="${hs.date2}"/>
					</c:if>
					<c:if test="${selectVal ne null }"><c:param name="selectVal" value="${selectVal}"/></c:if>
					<c:if test="${selectDate ne null }"><c:param name="selectDate" value="${selectDate}"/></c:if>
						</c:url>
						<a class="pg_page" href="${ pagination }">${ p }</a>
					</c:if>
				</c:if>
			</c:forEach>
			<!--10개씩 다음 페이징  -->
			<c:if test="${ pi.currentPage > 1 and pi.maxPage > 10}">
				<c:url var="next" value="${ loc }">
					<c:param name="page" value="${pi.endPage + 1 }"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.dept}"/>
						<c:param name="selectRank" value="${hs.rank}"/>
						<c:param name="email" value="${hs.email}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
						<c:param name="date" value="${hs.date}"/>
						<c:param name="date2" value="${hs.date2}"/>
					</c:if>
					<c:if test="${selectVal ne null }"><c:param name="selectVal" value="${selectVal}"/></c:if>
					<c:if test="${selectDate ne null }"><c:param name="selectDate" value="${selectDate}"/></c:if>
				</c:url>
				<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
			</c:if>
			<!--맨 끝으로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="end" value="${ loc }">
					<c:param name="page" value="${ pi.maxPage }"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.dept}"/>
						<c:param name="selectRank" value="${hs.rank}"/>
						<c:param name="email" value="${hs.email}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
						<c:param name="date" value="${hs.date}"/>
						<c:param name="date2" value="${hs.date2}"/>
					</c:if>
					<c:if test="${selectVal ne null }"><c:param name="selectVal" value="${selectVal}"/></c:if>
					<c:if test="${selectDate ne null }"><c:param name="selectDate" value="${selectDate}"/></c:if>
				</c:url> 
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>
		</div>
	</div>
	<!-- 팝업창 -->
	<div class="popup-form">
		<div class="popupContent">
		</div>
		<div class="popupLayer"></div>
	</div>
<script type="text/javascript" src="resources/js/human/humanManager.js"></script>
</body>
</html>