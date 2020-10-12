<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 템플릿 마크업 html 영역 --%>
<!-- header -->
<header id="header">
	<div class="header_wrap">
		<div class="logo_area">
			<h1>WORKSPACE</h1>
		</div>
		<div class="menu_option">
			<ul>
				<li>
					<a>
						<i class="fas fa-bell" aria-hidden="true" title="알람"></i>
					</a>
				</li>
				<li>
					<c:if test="${loginUser.renameFileName eq null}"><img class="profile" src="resources/images/default-profile.jpg"></c:if> 
					<c:if test="${loginUser.renameFileName ne null}"><img class="profile" src="resources/Profile-images/${loginUser.renameFileName }"></c:if> 
				</li>
				<li onclick="showMenu();">
					<span>${loginUser.name}님</span>
					<i class="fas fa-angle-down" aria-hidden="true"></i>
					<div id="dropdown-menu">
						<ul>
							<li onclick="location.href='/Human/myInfo'"><i class="fas fa-user-circle"></i>내 정보</li>
							<li><i class="fas fa-lock"></i>비밀번호변경</li>
							<c:if test="${loginUser.adminyn eq 'Y' }">
								<li onclick="location.href='/quickMenu'"><i class="fas fa-cog"></i>관리자모드</li>
							</c:if>
							<li onclick="location.href='/Logout'"><i class="fas fa-power-off"></i>로그아웃</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</div>
</header>
<!-- // header  -->

<!-- sideMenu -->
<div id="sideMenu">
	<ul id="mainMenu">
		<li>
			<ul id="human" class="subMenu">
				<li>
					<a href="/Human/myInfo"><span id="">내 정보</span></a>
				</li>
				<li>
					<a href="/MyInfo/notice"><span id="">공지사항</span></a>
				</li>
				<li>
					<a href="/MyInfo/searchHuman"><span id="">사원검색</span></a>
				</li>
				<li>
					<a href="/MyInfo/workCalendar"><span id="">근태현황</span></a>
				</li>
				<li>
					<a href="/MyInfo/myVacation"><span id="">휴가사용현황</span></a>
				</li>
				<li>
					<a href="/MyInfo/productWork"><span id="">제품목록 및 입/출고</span></a>
				</li>
				<li>
					<a href="/MyInfo/mySupplyRequest"><span id="">비품신청</span></a>
				</li>
			</ul>
		</li>
	</ul>
</div>
<!-- // sideMenu -->
<!-- 비밀번호 변경 팝업 -->
<div id="changePwdPopUp" class="popup-form" style="display: none;">
	<div id="changePwdContent" class="popupContent">
		<h1>비밀번호 변경</h1>
		<p>현재 비밀번호와 변경하실 비밀번호를 입력해주세요.</p>
		<form>
			<div class="change-area">
				<label for="now_pwd">현재 비밀번호&nbsp;</label>
				<input type="password" name="now_pwd" id="now_pwd">
			</div>
			<div class="change-area">
				<label for="new_pwd">변경하실 비밀번호&nbsp;</label>
				<input type="password" name="new_pwd" id="new_pwd">
			</div>
			<div class="change-area">
				<label for="re_pwd">비밀번호 확인&nbsp;</label>
				<input type="password" name="re_pwd" id="re_pwd">
			</div>
			<div class="btn-form">
				<button type="button"><i class="fas fa-times"></i> 취소</button>
				<button type="button" onclick="changePwd();"><i class="fas fa-check"></i> 확인</button>
			</div>
		</form>
	</div>
	<div class="popupLayer"></div>
</div>
<!-- 비밀번호 변경 팝업 -->


