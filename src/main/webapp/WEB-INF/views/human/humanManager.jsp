<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/headTag.jsp"/>
<title>기본인사관리</title>
<link rel="stylesheet" href="resources/css/plugin/fakeLoader.min.css">
<link href="resources/css/human/humanManager.css" rel="styleSheet">
<script src="resources/js/plugin/fakeLoader.min.js"></script>
</head>
<body>
	<div class="fakeLoader"></div>
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
	<form method="post" action="/Human/humanInsert" class="popup-form" enctype="Multipart/form-data" style="display: none;">
		<div class="popupContent">
			<h1>사원 추가 <i class="fas fa-times"></i></h1>
			<div class="filebox bs3-primary preview-image add-image">
				<span class="add-title">프로필 등록</span>
				<div class="upload-display"><div class="upload-thumb-wrap"><img src="resources/images/default-profile.jpg" class="upload-thumb"></div></div>
				<input class="txtBox upload-name " value="파일명" disabled="disabled" style="width: 30%; border-radius: 3px;">
				<label for="input_file">파일 선택</label> 
			  	<input type="file" name="profile_img" id="input_file" class="upload-hidden"> 
			  	<span id="image-ex">- 프로필로 등록할 이미지를 선택해주세요.</span>
			</div>
			<div class="content-form">
				<span>기본 정보</span>
				<span style="top: -23px; right: 0; font-size: 12px; text-align: right;">* 필수 정보 입력란입니다.</span>
				<div class="add-textform">
					<span class="add-title add-title2">사번</span>
					<input type="text" class="txtBox add-text" name="add-eno">
					<label id="enoChk"></label>
					<input type="hidden" id="enoChk2" value="0">
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">이름</span>
					<input type="text" class="txtBox add-text" name="add-name">
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">부서</span>
					<div class="selectBox" id="add-select-dept" style="height: 19px; line-height: 19px; vertical-align: middle; border-radius: 3px;">
						<input type="hidden" id="add-dept" name="add-dept" data-value="all" value="">
						<a href="#none" class="link-selected" style="line-height: 0;">선택</a>
						<ul style="max-height: 120px; overflow-y: scroll;">
						</ul>
						<i class="fas fa-angle-down searchAngle"></i>
					</div>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">직급</span>
					<div class="selectBox" id="add-select-rank" style="height: 19px; line-height: 19px; vertical-align: middle; border-radius: 3px;">
						<input type="hidden" id="add-rank" name="add-rank" data-value="all" value="">
						<a href="#none" class="link-selected" style="line-height: 0;">선택</a>
						<ul style="max-height: 120px; overflow-y: scroll;">
						</ul>
						<i class="fas fa-angle-down searchAngle"></i>
					</div>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">이메일</span>
					<input type="text" class="txtBox" name="add-email" style="width: 155px; border-radius: 3px;"> @ 
					<input type="text" class="txtBox" id="add-email2" name="add-email2" style="width: 155px; border-radius: 3px; cursor:auto;" disabled>
					<div class="selectBox" style="height: 19px; line-height: 19px; vertical-align: unset; border-radius: 3px;">
						<input type="hidden" id="email3" name="add-email3" data-value="all" value="">
						<a href="#none" class="link-selected" style="line-height: 0;">선택</a>
						<ul>
							<li><a  class="link-select" data-value="input-text">선택 입력</a></li>
							<li><a  class="link-select" data-value="naver.com">naver.com</a></li>
							<li><a  class="link-select" data-value="daum.net">daum.net</a></li>
							<li><a  class="link-select" data-value="gmail.com">gmail.com</a></li>
						</ul>
						<i class="fas fa-angle-down searchAngle"></i>
					</div>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">입사일</span>
					<input type="date" class="txtBox" name="add-inDate" style="border-radius: 3px;">
				</div>
			</div>
			<div class="content-form">
				<span>부가 정보</span>
				<div class="add-textform">
					<span class="add-title add-title2">생년월일</span>
					<input type="date" class="txtBox" name="add-date" style="border-radius: 3px;">
					<input type="radio" id="gender-not" name="gender" value="N" checked ><label for="gender-not" >선택안함</label>
					<input type="radio" id="gender-woman" name="gender" value="M"><label for="gender-woman">여자</label>
					<input type="radio" id="gender-man" name="gender" value="M"><label for="gender-man">남자</label>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">주소</span>
					<input type="text" id="address1" name="address1" class="postcodify_address txtBox add-text" value="">
					<button type="button" id="postcodify_search_button" class="address-btn">검색</button>
							
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<script>
						$(function(){
							$("#postcodify_search_button").postcodifyPopUp();
						});
					</script>
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">상세 주소</span>
					<input type="text" name="address2" class="postcodify_extra_info txtBox add-text" value="">
				</div>
				<div class="add-textform">
					<span class="add-title add-title2">핸드폰 번호</span>
					<div class="selectBox" style="height: 19px; line-height: 19px; vertical-align: middle; border-radius: 3px;">
						<input type="hidden" id="phone" name="phone" data-value="all" value="">
						<a href="#none" class="link-selected" style="line-height: 0;">선택</a>
						<ul style="max-height: 120px; overflow-y: scroll;">
							<li><a href="#" class="link-select" data-value="010">010</a></li>
							<li><a href="#" class="link-select" data-value="011">011</a></li>
							<li><a href="#" class="link-select" data-value="017">017</a></li>
							<li><a href="#" class="link-select" data-value="018">018</a></li>
							<li><a href="#" class="link-select" data-value="019">019</a></li>
						</ul>
						<i class="fas fa-angle-down searchAngle"></i>
					</div> - 
					<input type="text" class="txtBox phone2" name="phone2" size="4"> - 
					<input type="text" class="txtBox phone2" name="phone3" size="4">
				</div>
				<div class="add-textform add-btn-form">
					<button type="button"><i class="fas fa-times"></i> 취소</button>
					<button type="button" onclick="dataChk();"><i class="fas fa-check"></i> 추가</button>
				</div>
			</div>
		</div>
		<div class="popupLayer"></div>
	</form>
	
<script>
$(document).ready(function () {
	$.fakeLoader(
	        {
	          timeToHide:1200, //로딩중에 걸리는 시간, 1000 = 1초
	          zIndex:999, // 순서
	          spinner:"spinner3",//Options: 'spinner1', 'spinner2', 'spinner3', 'spinner4', 'spinner5', 'spinner6', 'spinner7' 
	          bgColor:"#374258", //Hex, RGB or RGBA colors 배경색깔
	        }
	    );
});
</script>
<script type="text/javascript" src="resources/js/human/humanManager.js"></script>
</body>
</html>