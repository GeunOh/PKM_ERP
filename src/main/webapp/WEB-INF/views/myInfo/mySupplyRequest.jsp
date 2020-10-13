<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag_user.jsp"></jsp:include>
<link href="resources/css/myInfo/mySupplyRequest.css" rel="styleSheet">
<title>비품 신청</title>
</head>
<body>

	<jsp:include page="../common/template_user.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>비품 신청 목록</h1>
		<!-- 내 신청 정보(상단) -->
		<div id="myInfo-back">
			<div id="myInfo-form">
				<div class="myInfo-area">
					<span class="title">총 개수</span>
					<input type="text" class="txtBox wid_55" value="${hs.TOTALCOUNT}" disabled>
				</div>
				<div class="myInfo-area">
					<span class="title">승인</span>
					<input type="text" class="txtBox wid_40" value="${hs.SUCCESSCOUNT}" disabled>
				</div>
				<div class="myInfo-area">
					<span class="title">거절</span>
					<input type="text" class="txtBox wid_40" value="${hs.FAILCOUNT}" disabled>
				</div>
				<div class="myInfo-area">
					<span class="title">대기</span>
					<input type="text" class="txtBox wid_40" value="${hs.WAITCOUNT}" disabled>
				</div>
			</div>
		</div>
		<!-- // 내 신청 정보(상단) -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="addBtn">추가</label>
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 비품 신청 제출 목록 테이블 -->
		<table id="supplyRequestTable">
			<thead>
				<tr>
					<th>비품코드</th>
					<th>비품이름</th>
					<th>비품가격</th>
					<th>수량</th>
					<th>상태</th>
					<th>신청일자</th>
					<th>사유</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty slist}">
					<tr>
						<td colspan="7">신청내역 존재하지않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty slist}">	
					<c:forEach items="${slist }" var="s">
						<tr>
							<td>${s.SCODE }</td>
							<td>${s.SNAME }</td>
							<td>
								<fmt:formatNumber value="${s.COST_PRICE }" type="currency" />
							</td>
							<td>${s.COUNT }</td>
							<c:if test="${s.STATUS eq 'N'}"> <td>승인대기중</td> </c:if>
							<c:if test="${s.STATUS eq 'Y'}"> <td style="color:green">승인완료</td> </c:if>
							<c:if test="${s.STATUS eq 'F'}"> <td style="color:red">승인거절</td> </c:if>
							<td><fmt:formatDate value="${s.APPLICATE_DATE }" pattern="yyyy-MM-dd"/></td>
							<td>${s.A_COMMENT }</td>
						</tr>
					</c:forEach>
					<c:if test="${ fn:length(slist) < 10 }">
						<c:forEach begin="${fn:length(slist)}" end="9">
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
		<!-- 비품 신청 팝업창 -->
		<form action="/MyInfo/addSupplyRequest" id="add-popup-form" class="popup-form" style="display: none;">
			<div class="popupContent">
				<h1>비품 신청
					<i class="fas fa-times" aria-hidden="true"></i>
				</h1>
				<div class="content-form">
					<span>비품 목록</span>
					<div id="contentList">
						<table id="supplyList">
							<thead>
								<tr>
									<th>비품코드</th>
									<th>비품이름</th>
									<th>가격</th>
									<th>현재수량</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${supplyList }" var="sl">
									<tr>
										<td>${sl.scode }</td>
										<td>${sl.sname }</td>
										<td><fmt:formatNumber value="${sl.cost_price }" type="currency" /></td>
										<td>${sl.scount }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="content-form">
					<span>신청 정보</span>
					<span>없는 비품이라도 자유롭게 기재해서 신청해주세요.</span>
					<div class="add-textform">
						<span class="add-title add-title2">비품코드</span>
						<input type="text" class="txtBox add-text" name="scode" autocomplete="off">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">비품이름</span>
						<input type="text" class="txtBox add-text" name="sname">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">수량</span>
						<input type="number" class="txtBox add-text" name="count">
					</div>
					<div class="add-textform">
						<span class="add-title add-title2">사유</span>
						<input type="text" class="txtBox add-text" name="comment">
					</div>
					<div class="add-textform btn-form">
						<button type="button"><i class="fas fa-times" aria-hidden="true"></i> 취소</button>
						<button type="button" onclick="addSupply();"><i class="fas fa-check" aria-hidden="true"></i> 신청</button>
					</div>
				</div>
			</div>
			<div class="popupLayer"></div>
			<input type="hidden" name="eno" value="${loginUser.eno }">
		</form>
	</div>
	<!-- // wrap -->
	<script type="text/javascript" src="resources/js/myInfo/mySupplyRequest.js"></script>
</body>
</html>