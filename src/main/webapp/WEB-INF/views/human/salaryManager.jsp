<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/human/salaryManager.css">
<link href="resources/css/plugin/selectbox.min.css" rel="stylesheet">
<script src="resources/js/plugin/selectbox.min.js"></script>
<title>급여 관리</title>
</head>
<body>
	
	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<!-- 급여 관리 -->
		<h1>급여 관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Human/searchSalary">
					<div class="search-area">
						<span class="title">부서</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectDept" name="selectDept" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">사번</span>
						<input type="text" class="txtBox" name="eno">
					</div>
					
					<div class="search-area">
						<span class="title">사원명</span>
						<input type="text" class="txtBox" name="name">
					</div>
					
					<br>
				
					<div class="search-area downSearch" style="height: 31px;">
						<span class="title">입사일</span>
						<div class="selectBox wid_55">
							<input type="hidden" id="selectDate" name="selectDate" data-value="dateAll" value="dateAll">
							<a href="#none" class="link-selected wid_55">전체</a>
							<ul class="wid_75">
								<li><a href="#" class="link-select wid_55" data-value="dateAll">전체</a></li>
								<li><a href="#" class="link-select wid_55" data-value="dateSelect">선택</a></li>
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
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 테이블 -->
		<table id="salaryTable">
			<thead>
				<tr>
					<th>사번</th>
					<th>부서명</th>
					<th>직급명</th>
					<th>성명</th>
					<th>입사일</th>
					<th>급여</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sList }" var="s">
					<tr>
						<td>${s.eno }</td>
						<td>${s.dname }</td>
						<td>${s.rname }</td>
						<td>
							<a class="human_name">${s.ename }</a>
						</td>
						<td>${s.indate }</td>
						<td>${s.salary }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty sList }">
					<tr>
						<td colspan="6">급여 목록이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty sList }">
					<c:if test="${10 - fn:length(sList) > 0 }">
						<c:forEach begin="1" end="${10 - fn:length(sList)}">
							<tr>
								<td>&nbsp;</td>
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
		<!-- // 테이블 -->
		<!-- 급여수정 팝업창 -->
		<form name="modifyForm" class="popup-form">
			<div class="popupContent">
				<h2>급여 수정
					<i class="fas fa-times" aria-hidden="true"></i>
				</h2>
				<div class="content-form">
					<div class="modify-form">
						<span class="modify-title">사번</span>
						<input type="text" class="txtBox modify-text" name="modify-eno" readonly>
					</div>
					<div class="modify-form">
						<span class="modify-title">이름</span>
						<input type="text" class="txtBox modify-text" disabled>
					</div>
					<div class="modify-form">
						<span class="modify-title">급여</span>
						<input type="text" class="txtBox modify-text" name="modify-salary">
					</div>
				</div>
				<div class="content-form modify-btn-form">
					<button type="button">
						<i class="fas fa-times" aria-hidden="true"></i> 취소
					</button>
					<button type="button">
						<i class="fas fa-check" aria-hidden="true"></i> 수정
					</button>
				</div>
			</div>
			<div class="popupLayer"></div>
		</form>
		<!-- // 급여수정 팝업창 -->
		
		<!-- 페이징 -->
		<div id="pagingForm">
			<!-- 첫 페이지 -->
			<c:if test="${pi.currentPage > 1 }">
				<c:url var="start" value="${loc }">
					<c:param name="page" value="1" />
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.selectDept}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
					</c:if>
					<c:if test="${selectDate ne null }">
						<c:param name="selectDate" value="${selectDate}"/>
						<c:if test="${selectDate eq 'dateSelect'}">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${start}"><i class="fas fa-backward"></i></a>
			</c:if>
			
			<!-- 이전 페이지 -->
			<c:if test="${pi.currentPage > 10 }">
				<c:url var="prev" value="${loc }">
					<c:param name="page" value="${pi.startPage - 10 }"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.selectDept}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
					</c:if>
					<c:if test="${selectDate ne null }">
						<c:param name="selectDate" value="${selectDate}"/>
						<c:if test="${selectDate eq 'dateSelect'}">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ prev }"><i class="fas fa-caret-left"></i></a>
			</c:if>
			<!-- 기본 페이징 -->
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" >
				<c:if test="${p eq pi.currentPage }">
					<strong class="pg_current">${ p }</strong>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<c:url var="pagination" value="${loc }">
						<c:param name="page" value="${p }" />
						<c:if test="${ not empty hs }">
							<c:param name="selectDept" value="${hs.selectDept}"/>
							<c:param name="eno" value="${hs.eno}"/>
							<c:param name="name" value="${hs.name}"/>
						</c:if>
						<c:if test="${selectDate ne null }">
							<c:param name="selectDate" value="${selectDate}"/>
							<c:if test="${selectDate eq 'dateSelect'}">
								<c:param name="date" value="${hs.date}"/>
								<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
					</c:url>
					<a class="pg_page" href="${pagination}">${p}</a>
				</c:if>
			</c:forEach>
			<!-- 다음 페이지 -->
			<c:if test="${ pi.maxPage > 10 and pi.currentPage }">
				<c:url var="next" value="${loc }">
					<c:param name="page" value="${pi.endPage + 1 }"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.selectDept}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
					</c:if>
					<c:if test="${selectDate ne null }">
						<c:param name="selectDate" value="${selectDate}"/>
						<c:if test="${selectDate eq 'dateSelect'}">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
			</c:if>
			<!-- 끝 페이지 -->
			<c:if test="${pi.currentPage < pi.endPage }">
				<c:url var="end" value="${loc }">
					<c:param name="page" value="${pi.endPage }" />
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.selectDept}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
					</c:if>
					<c:if test="${selectDate ne null }">
						<c:param name="selectDate" value="${selectDate}"/>
						<c:if test="${selectDate eq 'dateSelect'}">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>
		</div>
	</div>
	<!-- // wrap  -->
	<script type="text/javascript" src="resources/js/human/salaryManager.js"></script>
</body>
</html>