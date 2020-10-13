<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag_user.jsp"></jsp:include>
<link href="resources/css/myInfo/myVacation.css" rel="styleSheet">
<title>휴가사용현황</title>
</head>
<body>

	<jsp:include page="../common/template_user.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>내 휴가사용현황</h1>
		<!-- 내 휴가 정보(상단) -->
		<div id="myInfo-back">
			<div id="myInfo-form">
				<div class="myInfo-area">
					<span class="title">입사일</span>
					<input type="text" class="txtBox" value="${indate }" disabled>
				</div>
				<div class="myInfo-area">
					<span class="title">연차휴가일수</span>
					<input type="text" class="txtBox wid_40" value="${useDay.ALLDAY + useDay.USEDAY}" disabled>
				</div>
				<div class="myInfo-area">
					<span class="title">휴가잔여일수</span>
					<input type="text" class="txtBox wid_40" value="${useDay.USEDAY }" disabled>
				</div>
			</div>
		</div>
		<!-- // 내 휴가 정보(상단) -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 휴가제출 목록 테이블 -->
		<table id="vacationTable">
			<thead>
				<tr>
					<th>분류</th>
					<th>소속</th>
					<th>직위</th>
					<th>사원명</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>사용일수</th>
					<th>상태</th>
					<th>신청일자</th>
					<th>사유</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${vlist }" var="v">
					<tr>
						<td>${v.vType }</td>
						<td>${v.dname }</td>
						<td>${v.rname }</td>
						<td>${v.eno }</td>
						<td>${v.startDate }</td>
						<td>${v.endDate }</td>
						<td>${v.useDay }</td>
						<c:if test="${v.status eq 'N'}">
							<td>승인대기중</td>
						</c:if>
						<c:if test="${v.status eq 'Y'}">
							<td style="color:green">승인완료</td>
						</c:if>
						<c:if test="${v.status eq 'F'}">
							<td style="color:red">승인거절</td>
						</c:if>
						<td>${v.requestDate }</td>
						<td>${v.reason }</td>
					</tr>
				</c:forEach>
				<c:if test="${empty vlist }">
						<td colspan="11">휴가내역이 없습니다.</td>
				</c:if>
				<c:if test="${!empty vlist }">
					<c:if test="${8 - fn:length(vList) > 0 }">
						<c:forEach var="v" begin="1" end="${10 - fn:length(vlist)}" >
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
		<!-- 페이징 버튼 -->
		<div id="pagingForm">
				<c:if test="${ pi.currentPage > 1 }">
				<c:url var="start" value="${ loc }">
					<c:param name="page" value="1"/>
				</c:url>
				<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
			</c:if>
			<!--10개씩 전 페이징  -->
			<c:if test="${ pi.currentPage > 10 }">
				<c:url var="prev" value="${ loc }">
					<c:param name="page" value="${pi.startPage - 10}"/>
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
						</c:url>
						<a class="pg_page" href="${ pagination }">${ p }</a>
					</c:if>
				</c:if>
			</c:forEach>
			<!--10개씩 다음 페이징  -->
			<c:if test="${ pi.currentPage > 1 and pi.maxPage > 10}">
				<c:url var="next" value="${ loc }">
					<c:param name="page" value="${pi.endPage + 1 }"/>
				</c:url>
				<a class="pg_page" href="${ next }"><i class="fas fa-caret-right"></i></a>
			</c:if>
			<!--맨 끝으로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="end" value="${ loc }">
					<c:param name="page" value="${ pi.maxPage }"/>
				</c:url> 
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>
		</div>
	</div>
	<!-- // wrap -->
	
</body>
</html>