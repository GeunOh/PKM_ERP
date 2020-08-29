<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
					<img class="profile" alt="" src="resources/Profile-images/${loginUser.renameFileName}">
				</li>
				<li onclick="showMenu();">
					<span>${loginUser.name}님</span>
					<i class="fas fa-angle-down" aria-hidden="true"></i>
					<div id="dropdown-menu">
						<ul>
							<li onclick="location.href='/Human/myInfo'"><i class="fas fa-user-circle"></i>내 정보</li>
							<li><i class="fas fa-lock"></i>비밀번호변경</li>
							<li><i class="fas fa-bell"></i>알림설정</li>
							<li><i class="fas fa-cog"></i>환경설정</li>
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
			<span>인사관리</span>
			<ul id="human" class="subMenu">
				<li>
					<a href="/Human/humanManager"><span id="humanManager">기본인사관리</span></a>
				</li>
				<li>
					<a href="/Human/positionManager"><span id="positionManager">직급관리</span></a>
				</li>
				<li>
					<a href="/Human/departmentManager"><span id="departmentManager">부서관리</span></a>
				</li>
				<li>
					<a href="/Human/salaryManager"><span id="salaryManager">급여관리</span></a>
				</li>
				<li>
					<a href="/Human/workInOutManager"><span id="workInOutManager">근태관리</span></a>
				</li>
				<li>
					<a href="/Human/vacationManager"><span id="vacationManager">휴가관리</span></a>
				</li>
			</ul>
		</li>
		<li>
			<span>재고관리</span>
			<ul class="subMenu">
				<li>
					<span>제품(?)목록</span>
				</li>
				<li>
					<span>제품재고관리</span>
				</li>
				<li>
					<span>제품 입/출고현황</span>
				</li>
				<li>
					<span>비품(?)목록</span>
				</li>
				<li>
					<span>비품관리</span>
				</li>
				<li>
					<span>비품 신청현황</span>
				</li>
			</ul>
		</li>
		<li>	
			<span>운영/매출관리</span>
			<ul class="subMenu">
				<li>
					<span>거래처 목록</span>
				</li>
				<li>	
					<span>매출관리</span>
				</li>
			</ul>
		</li>
	</ul>
</div>
<!-- // sideMenu -->


