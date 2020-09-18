<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/clientManager.css">

<link rel="stylesheet" href="https://uicdn.toast.com/tui.chart/latest/tui-chart.min.css">
<script src="https://uicdn.toast.com/tui.chart/latest/tui-chart-all.js"></script>
<title>거래처 관리</title>
</head>
<body>
	<jsp:include page="../common/template.jsp"></jsp:include>
	<!-- wrap -->
	<div id="wrap">
		<h1>거래처 관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Stock/searchClient">
					<div class="search-area">
						<span class="title">거래처명</span>
						<input type="text" class="txtBox wid_150" name="cname">
					</div>
					
					<div class="search-area">
						<span class="title">사업자등록번호</span>
						<input type="text" class="txtBox wid_150" name="ccode">
					</div>
					
					<br>
					
					<div class="search-area downSearch">
						<span class="title">담당자</span>
						<input type="text" class="txtBox wid_150" name="cmanager">
					</div>
					
					<div class="search-area downSearch">
						<span class="title">연락처</span>
						<input type="text" class="txtBox wid_150" name="cphone">
					</div>
					
					<div class="search-area">
						<span class="title">비고</span>
						<input type="text" class="txtBox wid_150" name="c_comment">
					</div>
			
					<button id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="addBtn">추가</label>
			<label id="downBtn" onclick="location.href='/Human/excelDown'"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 거래처 테이블 -->
		<table id="clientTable" class="tables">
			<thead>
				<tr>
					<th>거래처명</th>
					<th>사업자등록번호</th>
					<th>담당자</th>
					<th>연락처</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty clist }">
					<tr>
						<td colspan="5">거래처가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty clist }">
					<c:forEach items="${clist }" var="c">
						<tr>
							<td>${c.cname }</td>
							<td>${c.ccode }</td>
							<td>${c.cmanager }</td>
							<td>${c.cphone }</td>
							<td>${c.c_comment }</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${!empty clist }">
					<c:if test="${fn:length(clist) < 10 }">
						<c:forEach	begin="${fn:length(clist)}" end="9"> 
							<tr>
								<td>&nbsp;</td>
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
		<!-- // 거래처 테이블 -->
		<!-- 페이징 -->
		<div id="pagingForm">
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="start" value="${ loc }">
					<c:param name="page" value="1"/>
					<c:if test="${not empty hs}">
						<c:param name="cname" value="${hs.cname}"/>
						<c:param name="ccode" value="${hs.ccode}"/>
						<c:param name="cmanager" value="${hs.cmanager}"/>
						<c:param name="cphone" value="${hs.cphone}"/>
						<c:param name="c_comment" value="${hs.c_comment}"/>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
			</c:if>
			<!--10개씩 전 페이징  -->
			<c:if test="${ pi.currentPage > 10 }">
				<c:url var="prev" value="${ loc }">
					<c:param name="page" value="${pi.startPage - 10}"/>
					<c:if test="${not empty hs}">
						<c:param name="cname" value="${hs.cname}"/>
						<c:param name="ccode" value="${hs.ccode}"/>
						<c:param name="cmanager" value="${hs.cmanager}"/>
						<c:param name="cphone" value="${hs.cphone}"/>
						<c:param name="c_comment" value="${hs.c_comment}"/>
					</c:if>	
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
							<c:if test="${not empty hs}">
								<c:param name="cname" value="${hs.cname}"/>
								<c:param name="ccode" value="${hs.ccode}"/>
								<c:param name="cmanager" value="${hs.cmanager}"/>
								<c:param name="cphone" value="${hs.cphone}"/>
								<c:param name="c_comment" value="${hs.c_comment}"/>
							</c:if>
						</c:url>
						<a class="pg_page" href="${ pagination }">${ p }</a>
					</c:if>
				</c:if>
			</c:forEach>
			<!--10개씩 다음 페이징  -->
			<c:if test="${ pi.currentPage > 1 and pi.maxPage > 10}">
				<c:url var="next" value="${ loc }">
					<c:param name="page" value="${pi.endPage + 1 }"/>
					<c:if test="${not empty hs}">
						<c:param name="cname" value="${hs.cname}"/>
						<c:param name="ccode" value="${hs.ccode}"/>
						<c:param name="cmanager" value="${hs.cmanager}"/>
						<c:param name="cphone" value="${hs.cphone}"/>
						<c:param name="c_comment" value="${hs.c_comment}"/>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
			</c:if>
			<!--맨 끝으로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="end" value="${ loc }">
					<c:param name="page" value="${ pi.maxPage }"/>
					<c:if test="${not empty hs}">
						<c:param name="cname" value="${hs.cname}"/>
						<c:param name="ccode" value="${hs.ccode}"/>
						<c:param name="cmanager" value="${hs.cmanager}"/>
						<c:param name="cphone" value="${hs.cphone}"/>
						<c:param name="c_comment" value="${hs.c_comment}"/>
					</c:if>
				</c:url> 
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>	
		</div>
		
		<!-- 거래처 차트 -->
		<div class="clientChart" id="pieChart">
			<div id="chart-area"></div>
		</div>
		
		<div class="clientChart" id="columnChart">
			<div id="columnChart-area"></div>
		</div>
		
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/clientManager.js"></script>
</body>
</html>