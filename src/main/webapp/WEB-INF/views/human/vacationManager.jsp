<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/human/vacationManager.css">
<title>휴가승인관리</title>
</head>
<body>
	
	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>휴가 관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Human/searchVacation">
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
						<span class="title">직급</span>
						<div class="selectBox wid_150">
							<input type="hidden" id="selectRank" name="selectRank" data-value="all">
							<a href="#none" class="link-selected wid_170">전체</a>
							<ul class="wid_170">
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
					</div>
					
					<div class="search-area">
						<span class="title">사원명</span>
						<input type="text" class="txtBox" name="name">
					</div>
					
					<br>
					
					<div class="search-area downSearch">
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
			
					<div class="search-area" style="height: 31px;">
						<span class="title">조회일자</span>
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
					<button type="button" id="resetBtn" onclick="location.href='/Human/vacationManager'">초기화</button>
					<button id="searchBtn">검색</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<form name="vacationForm">
			<!-- 휴가제출 목록 테이블 -->
			<table id="vacationTable">
				<thead>
					<tr>
						<th><input type="checkbox"></th>
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
					<c:forEach items="${vList }" var="v">
						<tr>
							<c:choose>
								<c:when test="${v.status eq 'Y' or v.status eq 'F'}">
									<td><input type="checkbox" name="vno" value=${v.vno } disabled></td>
								</c:when>
								<c:otherwise>
									<td><input type="checkbox" name="vno" value=${v.vno }></td>
								</c:otherwise>
							</c:choose>
							<td>${v.vType }</td>
							<td>${v.dname }</td>
							<td>${v.rname }</td>
							<td>${v.eno }</td>
							<td>${v.startDate }</td>
							<td>${v.endDate }</td>
							<td>${v.useDay}</td>
							
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
					<c:if test="${empty vList }">
						<td colspan="11">휴가내역이 없습니다.</td>
					</c:if>
					<c:if test="${!empty vList }">
						<c:if test="${8 - fn:length(vList) > 0 }">
							<c:forEach var="v" begin="1" end="${10 - fn:length(vList)}" >
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
									<td></td>
								</tr>
							</c:forEach>
						</c:if>
					</c:if>
				</tbody>
			</table>
			<!-- // 휴가제출 목록 테이블 -->
			<div class="buttons">
				<button type="button" onclick="approvalVacation();">승인</button>
				<button type="button" onclick="refuseVacation();">거절</button>
			</div>
		</form>
		<!-- 페이징 폼 -->
		<div id="pagingForm">
			<!-- 첫 페이지로 -->
			<c:if test="${pi.currentPage > 1}">
				<c:url var="start" value="${loc}">
					<c:param name="page" value="1"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.selectDept}"/>
						<c:param name="selectRank" value="${hs.selectRank}"/>
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
				<a class="pg_page" href="${ start }"><i class="fas fa-backward"></i></a>
			</c:if>
			
			<!-- 10개씩 전 페이징 -->
			<c:if test="${ pi.currentPage > 10 }">
				<c:url var="prev" value="${ loc }">
					<c:param name="page" value="${pi.startPage - 10}"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.selectDept}"/>
						<c:param name="selectRank" value="${hs.selectRank}"/>
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
			
			<!-- 기본 페이지-->
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${ p eq pi.currentPage }">
					<strong class="pg_current">${ p }</strong>
				</c:if>
				<c:if test="${ p ne pi.currentPage }">
					<c:url var="pagination" value="${loc}">
						<c:param name="page" value="${p}"/>
						<c:if test="${ not empty hs }">
							<c:param name="selectDept" value="${hs.selectDept}"/>
							<c:param name="selectRank" value="${hs.selectRank}"/>
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
			
			<!-- 10개 씩 다음 페이지로 -->
			<c:if test="${ pi.maxPage > 10 and pi.currentPage > 1 and pi.maxPage ne pi.endPage }">
				<c:url var="next" value="${loc }">
					<c:param name="page" value="${pi.endPage + 1}" />
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.selectDept}"/>
						<c:param name="selectRank" value="${hs.selectRank}"/>
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
			
			<!-- 마지막 페이지로 -->
			<c:if test="${ pi.currentPage < pi.maxPage }">
				<c:url var="end" value="${loc}">
					<c:param name="page" value="${pi.maxPage }" />
						<c:if test="${ not empty hs }">
							<c:param name="selectDept" value="${hs.selectDept}"/>
							<c:param name="selectRank" value="${hs.selectRank}"/>
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
		<!-- 알림창 -->
		<div id="alertBox">
			<p></p>
		</div>
		<script type="text/javascript">
			var success = "${success}";
			var fail = "${fail}";
			
			if(success!='') {
				$("#alertBox p").text(success);
				$("#alertBox").fadeIn();
				setTimeout(function(){
					$("#alertBox").fadeOut();
				}, 3000);
			}
			
			if(fail!=''){
				$("#alertBox p").text(fail);
				$("#alertBox").fadeIn();
				setTimeout(function(){
					$("#alertBox").fadeOut();
				}, 3000);
			}
		</script>
		<!-- 알림창 -->
	</div>
	<!-- // wrap  -->
	<script type="text/javascript" src="resources/js/human/vacationManager.js"></script>
</body>
</html>