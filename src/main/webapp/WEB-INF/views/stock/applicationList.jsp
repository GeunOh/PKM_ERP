<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/stock/applicationList.css">
<title>비품 신청목록</title>
</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>비품 신청목록</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Stock/searchApplication">
					
					<div class="search-area">
						<span class="title">상태</span>
						<div class="selectBox">
							<input type="hidden" id="selectVal" name="selectVal" data-value="all" value="all">
							<a href="#none" class="link-selected">전체</a>
							<ul>
								<li><a href="#" class="link-select" data-value="all">전체</a></li>
								<li><a href="#" class="link-select" data-value="wait">대기</a></li>
								<li><a href="#" class="link-select" data-value="ok">승인</a></li>
								<li><a href="#" class="link-select" data-value="no">거절</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle" aria-hidden="true"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">사원명</span>
						<input type="text" class="txtBox" name="ename">
					</div>
					
					<div class="search-area">
						<span class="title">비품명</span>
						<input type="text" class="txtBox" name="sname">
					</div>
					
					<br>
			
					<div class="search-area downSearch" style="height: 31px;">
						<span class="title">조회일자</span>
						<div class="selectBox wid_55">
							<input type="hidden" id="selectDate" name="selectDate" data-value="dateAll" value="dateAll">
							<a href="#none" class="link-selected wid_55">전체</a>
							<ul class="wid_75">
								<li><a href="#" class="link-select wid_55" data-value="dateAll">전체</a></li>
								<li><a href="#" class="link-select wid_55" data-value="dateRequest">신청일</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
						<input type="date" id="date" name="date" class="date" disabled> <label>~</label>
						<input type="date" id="date2" name="date2" class="date rightDate" disabled>
					</div>
					<button id="searchBtn">검색</button>
					<button type="button" id="resetBtn" onclick="location.href='/Stock/applicationList'">초기화</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<form name="applicationForm">
			<!-- 비품신청 목록 테이블 -->
			<table id="applicationTable">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
						<th>소속</th>
						<th>사원명</th>
						<th>비품코드</th>
						<th>비품이름</th>
						<th>수량</th>
						<th>신청일자</th>
						<th>가격</th>
						<th>승인여부</th>
						<th>사유</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty alist}">
						<tr>
							<td colspan="10">신청내역 존재하지않습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty alist}">	
						<c:forEach items="${alist }" var="a">
							<tr>	
								<c:choose>
									<c:when test="${a.STATUS eq 'Y' or a.STATUS eq 'F'}">
										<td><input type="checkbox" name="ano" value=${a.ANO } disabled></td>
									</c:when>
									<c:otherwise>
										<td><input type="checkbox" name="ano" value=${a.ANO }></td>
									</c:otherwise>
								</c:choose>
								<td>${a.DNAME }</td>
								<td>${a.ENAME }</td>
								<td>${a.SCODE }</td>
								<td>${a.SNAME }</td>
								<td>${a.COUNT }</td>
								<td><fmt:formatDate value="${a.APPLICATE_DATE }" pattern="yyyy-MM-dd"/></td>
								<td>
									<fmt:formatNumber value="${a.COST_PRICE }" type="currency" />
								</td>
								<c:if test="${a.STATUS eq 'N'}"> <td>승인대기중</td> </c:if>
								<c:if test="${a.STATUS eq 'Y'}"> <td style="color:green">승인완료</td> </c:if>
								<c:if test="${a.STATUS eq 'F'}"> <td style="color:red">승인거절</td> </c:if>
								<td>${s.A_COMMENT }</td>
							</tr>
						</c:forEach>
						<c:if test="${ fn:length(alist) < 10 }">
							<c:forEach begin="${fn:length(alist)}" end="9">
								<tr>
									<td>&nbsp;</td>
									<td></td>
									<td></td>
									<td></td>
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
			<!-- // 비품신청 목록 테이블 -->
			<div class="buttons">
				<button type="button" onclick="approval();">승인</button>
				<button type="button" onclick="refuse();">거절</button>
			</div>
		</form>
		<!-- 페이징 폼 -->
		<div id="pagingForm">
			<!-- 첫 페이지로 -->
			<c:if test="${pi.currentPage > 1}">
				<c:url var="start" value="${loc}">
					<c:param name="page" value="1"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectVal" value="${hs.selectVal}"/>
						<c:param name="ename" value="${hs.ename}"/>
						<c:param name="sname" value="${hs.sname}"/>
						<c:param name="selectDate" value="${selectDate}"/>
						<c:if test="${hs.selectDate eq 'dateRequest' }">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
			</c:if>
			
			<!-- 10개씩 전 페이징 -->
			<c:if test="${ pi.currentPage > 10 }">
				<c:url var="prev" value="${ loc }">
					<c:param name="page" value="${pi.startPage - 10}"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectVal" value="${hs.selectVal}"/>
						<c:param name="ename" value="${hs.ename}"/>
						<c:param name="sname" value="${hs.sname}"/>
						<c:param name="selectDate" value="${selectDate}"/>
						<c:if test="${hs.selectDate eq 'dateRequest' }">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ prev }"><i class="fas fa-caret-left"></i></a>
			</c:if>
			
			<!-- 기본 페이지-->
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<strong class="pg_current">${ p }</strong>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="${loc}">
						<c:param name="page" value="${p}"/>
						<c:if test="${ not empty hs }">
							<c:param name="selectVal" value="${hs.selectVal}"/>
							<c:param name="ename" value="${hs.ename}"/>
							<c:param name="sname" value="${hs.sname}"/>
							<c:param name="selectDate" value="${selectDate}"/>
							<c:if test="${hs.selectDate eq 'dateRequest' }">
								<c:param name="date" value="${hs.date}"/>
								<c:param name="date2" value="${hs.date2}"/>
							</c:if>
						</c:if>
					</c:url>
					<a class="pg_page" href="${pagination}">${p}</a>
				</c:if>
			</c:forEach>
			
			<!-- 10개 씩 다음 페이지로 -->
			<c:if test="${ pi.maxPage > 10 and pi.currentPage > 1 and pi.maxPage ne pi.endPage }">
				<c:url var="next" value="${loc }">
					<c:param name="page" value="${pi.endPage + 1}" />
					<c:if test="${ not empty hs }">
						<c:param name="selectVal" value="${hs.selectVal}"/>
						<c:param name="ename" value="${hs.ename}"/>
						<c:param name="sname" value="${hs.sname}"/>
						<c:param name="selectDate" value="${selectDate}"/>
						<c:if test="${hs.selectDate eq 'dateRequest' }">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
			</c:if>
			
			<!-- 마지막 페이지로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="end" value="${loc}">
					<c:param name="page" value="${pi.maxPage }" />
					<c:if test="${ not empty hs }">
						<c:param name="selectVal" value="${hs.selectVal}"/>
						<c:param name="ename" value="${hs.ename}"/>
						<c:param name="sname" value="${hs.sname}"/>
						<c:param name="selectDate" value="${selectDate}"/>
						<c:if test="${hs.selectDate eq 'dateRequest' }">
							<c:param name="date" value="${hs.date}"/>
							<c:param name="date2" value="${hs.date2}"/>
						</c:if>
					</c:if>
				</c:url>
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>
		</div>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/stock/applicationList.js"></script>
</body>
</html>