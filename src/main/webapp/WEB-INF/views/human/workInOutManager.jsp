<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"></jsp:include>
<link rel="stylesheet" href="resources/css/human/workInOutManager.css">
<title>근태관리</title>

</head>
<body>

	<jsp:include page="../common/template.jsp"></jsp:include>
	
	<!-- wrap -->
	<div id="wrap">
		<h1>근태 관리</h1>
		<!-- 검색 영역 -->
		<div id="Search-back">
			<div id="Serach-form">
				<form action="/Human/SearchWork" onsubmit="return FormChk();" id="searchForm">
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
						<span class="title">검색일</span>
						<div class="selectBox wid_55">
							<input type="hidden" id="selectDate" name="selectDate" data-value="dateAll" value="dateAll">
							<a href="#none" class="link-selected wid_55">전체</a>
							<ul class="wid_75">
								<li><a href="#" class="link-select wid_55" data-value="dateAll">전체</a></li>
								<li><a href="#" class="link-select wid_55" data-value="dateSelect">선택</a></li>
							</ul>
							<i class="fas fa-angle-down searchAngle"></i>
						</div>
						<input type="month" id="date" name="date" class="date" disabled>
					</div>
					<button id="searchBtn">검색</button>
					<button id="resetBtn">초기화</button>
				</form>
			</div>
		</div>
		<!-- // 검색 영역 -->
		<!-- 추가 외 버튼 -->
		<div id="btnForm">
			<label id="downBtn"><i class="fas fa-download"></i>다운로드</label>
		</div>
		<!-- 테이블 -->
		<table id="workInOutTable" style="table-layout: fixed; max-width: 1601px;">
			<colgroup>
				<col style="width:100px;">
				<col>
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2"></th>			
					<th>일자</th>			
				</tr>
				<tr>
					<th style="border-top: 0; border-left: 0;">요일</th>	
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty wlist}">
					<tr><td id="emptytable" colspan="32" style="text-align: center; border-bottom-left-radius: 6px; height: 50px;">정보가 없습니다</td></tr>
				</c:if>
				<c:if test="${not empty wlist}">
				<c:set var="size" value="${fn:length(wlist)/fn:length(mlist)}"/>
				<c:set var="s" value="0"/>
				<c:set var="e" value="${size-1}"/>
				<c:forEach var="m" items="${mlist}" varStatus="stat1">
					<tr>
						<th rowspan="3" style="width: 100px;">${m.dname}<br>${m.rname} ${m.name}</th>
						<td style="padding: 4px;">출근</td>
						<c:forEach var="w" items="${wlist}" varStatus="stat2" begin="${s}" end="${e}"> 
<!-- 							일자별 반복 -->
							<c:if test="${w.intime eq null}"><td style="padding: 0 2px;" title="-">-</td></c:if>
							<c:if test="${w.intime ne null}"><td style="padding: 0 2px;" title="${w.intime}">${w.intime}</td></c:if>
						</c:forEach>
					</tr>
					<tr>
						<td style="padding: 4px;">퇴근</td>
						<c:forEach var="w" items="${wlist}" begin="${s}" end="${e}"> 
<!-- 							일자별 반복 -->
							<c:if test="${w.outtime eq null}"><td style="padding: 0 2px;" title="-">-</td></c:if>
							<c:if test="${w.outtime ne null}"><td style="padding: 0 2px;" title="${w.outtime}">${w.outtime}</td></c:if>
						</c:forEach>
					</tr>
					<tr>
						<td style="padding: 4px;">구분</td>
						<c:forEach var="w" items="${wlist}" begin="${s}" end="${e}"> 
<!-- 							일자별 반복 -->
							<c:if test="${w.type eq null}"><td style="padding: 0 2px;" title="-">-</td></c:if>
							<c:if test="${w.type ne null}"><td class="overtext" style="padding: 0 2px;" title="${w.type}">${w.type}</td></c:if>
						</c:forEach>
					</tr>
					<c:set var="s" value="${s+size}"/>
					<c:set var="e" value="${e+size}"/>
				</c:forEach>
				</c:if>
			</tbody>
		</table>
		<!-- // 테이블 -->
		<!-- 페이징 -->
		<div id="pagingForm">
			<div id="peopleCountForm">
				<span>총 인원  <label >${mCount.peopleAll}</label> 명 중</span>
				<span>재직 : <label style="color: blue;">${mCount.peopleIn}</label> 명,</span>
				<span>퇴직 : <label style="color: red;">${mCount.peopleOut}</label> 명</span>
			</div>
			<c:if test="${ pi.currentPage > 1 }">
				<c:url var="start" value="${ loc }">
					<c:param name="page" value="1"/>
					<c:if test="${ not empty hs }">
						<c:param name="selectDept" value="${hs.dept}"/>
						<c:param name="selectRank" value="${hs.rank}"/>
						<c:param name="email" value="${hs.email}"/>
						<c:param name="eno" value="${hs.eno}"/>
						<c:param name="name" value="${hs.name}"/>
						<c:if test="${hs.date ne null }"><c:param name="date" value="${hs.date}"/></c:if>
						<c:if test="${hs.date2 ne null }"><c:param name="date2" value="${hs.date2}"/></c:if>
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
						<c:if test="${hs.date ne null }"><c:param name="date" value="${hs.date}"/></c:if>
						<c:if test="${hs.date2 ne null }"><c:param name="date2" value="${hs.date2}"/></c:if>
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
								<c:if test="${hs.date ne null }"><c:param name="date" value="${hs.date}"/></c:if>
								<c:if test="${hs.date2 ne null }"><c:param name="date2" value="${hs.date2}"/></c:if>
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
						<c:if test="${hs.date ne null }"><c:param name="date" value="${hs.date}"/></c:if>
						<c:if test="${hs.date2 ne null }"><c:param name="date2" value="${hs.date2}"/></c:if>
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
						<c:if test="${hs.date ne null }"><c:param name="date" value="${hs.date}"/></c:if>
						<c:if test="${hs.date2 ne null }"><c:param name="date2" value="${hs.date2}"/></c:if>
					</c:if>
					<c:if test="${selectVal ne null }"><c:param name="selectVal" value="${selectVal}"/></c:if>
					<c:if test="${selectDate ne null }"><c:param name="selectDate" value="${selectDate}"/></c:if>
				</c:url> 
				<a class="pg_page" href="${ end }"><i class="fas fa-forward"></i></a>
			</c:if>
		</div>
	</div>
	<!-- // wrap -->
<script type="text/javascript" src="resources/js/human/workInOutManager.js"></script>
<script>
$(document).ready(function(){
	var Smonth = '${month}';
	
	// sysdate 일때 getMonth()+1, 직접 지정한 날일땐  getMonth()
	var today = new Date(); 
	
	var year = today.getFullYear();		// 현재 년도
	var month = today.getMonth(); 		// 현재 달 가져오기 // 8
	var day = today.getDay(); 			// 시작하는 요일 체크
    
    // 달의 마지막날 배열 저장
	var lastDayArr = [31,28,31,30,31,30,31,31,30,31,30,31]; 
	var dayArr = ['일', '월', '화', '수', '목', '금', '토'];
	
	// 윤년 체크 후 2월에 마지막날 값 변경
	if ((year%4==0 && year%100!=0) || (year%400==0)){ 
	    lastDayArr[1] = 29;
	}
	//월 변경
	
    if(Smonth != '') {
    	$('#workInOutTable thead tr:first-child th:first-child').text((Smonth)+"월");
    	month = Smonth-1;
    }else{
    	$('#workInOutTable thead tr:first-child th:first-child').text((month+1)+"월"); 
    }
    $('#emptytable').attr('colspan',lastDayArr[month]+2); 
    
	// 달의 첫째 날 및 요일 가져오기
	var firstDate = new Date(year,month,1);		// 10 -1 > 9
    var firstDay = firstDate.getDay(); // 시작하는 요일 체크  0 = 일
    
    
    // 출력
	for(var i=1; i<=lastDayArr[month]; i++){
		$("thead tr:first").append("<th>"+ i +"</th>");
		if(firstDay == 0) {
			$("thead tr:last").append("<th style='color:red'>"+ dayArr[firstDay] +"</th>");
		} else if( firstDay == 6) {
			$("thead tr:last").append("<th style='color:blue'>"+ dayArr[firstDay] +"</th>");
		} else {
			$("thead tr:last").append("<th>"+ dayArr[firstDay] +"</th>");
		}
		firstDay++;
		if(firstDay == 7) {
			firstDay = 0;
		}
	}
})
</script>
</body>
</html>