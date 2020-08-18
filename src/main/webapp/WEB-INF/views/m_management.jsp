<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>인사기본관리</title>

    <link rel="stylesheet" href="/resources/css/m_management.css">
</head>
<body>
    
    <!-- wrap -->
    <div id="wrap">
        <!-- 인사기본사항 -->
        <h1>인사기본사항</h1>
        <div id="search-box">
            <form>
                <div class="buttons">
                    <input type="button" value="조회">
                    <input type="button" value="엑셀">
                </div>
                <table>
                    <tr>
                        <th>사업장</th>
                        <td>
                            <select name="" id="">
                                <option value="">서울</option>
                                <option value="">안양</option>
                            </select>
                        </td>
                        <th>사원</th>
                        <td>
                            <input type="text">
                            <input type="button" value="O">
                        </td>
                        <th>사원명</th>
                        <td><input type="text"></td>
                        <th>재직구분</th>
                        <td>
                            <select name="" id="">
                                <option value="">재직</option>
                                <option value="">퇴직</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>부서</th>
                        <td>
                            <input type="text">
                            <input type="button" value="O">
                        </td>
                        <th>파트</th>
                        <td>
                            <input type="text">
                            <input type="button" value="O">
                        </td>
                        <th>반</th>
                        <td>
                            <input type="text">
                            <input type="button" value="O">
                        </td>
                    </tr>

                </table>
            </form>
        </div>
        <!-- // 인사기본사항 -->
        <!-- 사원현황 -->
        <h2>사원현황</h2>
        <table id="result-box">
            <tr>
                <th>사업장</th>
                <th>사번</th>
                <th>성명</th>
                <th>부서</th>
                <th>파트</th>
                <th>반</th>
                <th>직위</th>
                <th>직책</th>
                <th>급여구분</th>
                <th>근무조</th>
                <th>각사입사일</th>
                <th>그룹입사일</th>
                <th>재직구분</th>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
                <td>11</td>
                <td>12</td>
                <td>13</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
                <td>11</td>
                <td>12</td>
                <td>13</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
                <td>11</td>
                <td>12</td>
                <td>13</td>
            </tr>
            <tr>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
                <td>11</td>
                <td>12</td>
                <td>13</td>
            </tr>
        </table>
        <div id="count-box">
            <span>총 사원수 : <span class="number">0</span> 명</span>
            <span>영업사원 : <span class="number">0</span> 명</span>
            <span>일반사용자 : <span class="number">0</span> 명</span>
            <span>현업관리자 : <span class="number">0</span> 명</span>
            <span>시스템관리자 : <span class="number">0</span> 명</span>
        </div>
        <!-- // 사원현황 -->
        <!-- 사원 상제 정보 -->
        <div id="detail-box">
            <!-- 유사 탭메뉴 -->
            <ul>
                <li><a href="#">인사기본사항</a></li>
                <li><a href="#">가족사항</a></li>
                <li><a href="#">자격/외국어</a></li>
                <li><a href="#">입사전경력</a></li>
                <li><a href="#">발령사항</a></li>
                <li><a href="#">교육사항</a></li>
                <li><a href="#">학력사항</a></li>
                <li><a href="#">특기사항</a></li>
            </ul>
            <div id="info-box">
                <!-- 사원 이미지 -->
                <div id="image-box">
                    <img src="http://placehold.it/150x180" alt="">
                </div>
                <!-- 사원 기본 정보 -->
                <div id="detailInfo-box">
                    <form action="">
                        <!-- 기본 정보 -->
                        <div id="basicInfo-box">
                            <table>
                                <tr>
                                	<th>사원번호</th>
                                    <td><input type="text"></td>
                                    <th>성명(한글)</th>
                                    <td><input type="text"></td>
                                    <th>성명(영문)</th>
                                    <td><input type="text"></td>
                                </tr>
                                <tr>
                                    <th>주민번호</th>
                                    <td><input type="text"></td>
                                    <th>생년월일</th>
                                    <td>
                                    	<input type="date">
                                    	<input id="age" type="text" value="99세" disabled>
                                    </td>
                                    <th>양력/음력</th>
                                    <td>
                                        <input type="radio">양력
                                        <input type="radio">음력
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><input type="text"></td>
                                    <th>이메일</th>
                                    <td><input type="email"></td>
                                    <th>핸드폰번호</th>
                                    <td><input type="tel"></td>
                                </tr>
                                <tr>
                                    <th>부서</th>
                                    <td><input type="text"></td>
                                    <th>직급</th>
                                    <td><input type="text"></td>
                                    <th>입사날짜</th>
                                    <td><input type="date"></td>
                                </tr>
                                <tr>
                                    <th>주민번호</th>
                                    <td><input type="text"></td>
                                    <th>생년월일</th>
                                    <td><input type="date"></td>
                                    <th>양력/음력</th>
                                    <td>
                                        <input type="radio">양력
                                        <input type="radio">음력
                                    </td>
                                </tr>
                                <tr>
                                    <th>주민번호</th>
                                    <td><input type="text"></td>
                                    <th>생년월일</th>
                                    <td><input type="date"></td>
                                    <th>양력/음력</th>
                                    <td>
                                        <input type="radio">양력
                                        <input type="radio">음력
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <!-- 피지컬 정보 -->
                        <div id="psysicalInfo-box">
                            <table>
                                <input type="submit" value="저장">
                                <tr>
                                    <th>신장</th>
                                    <td><input type="text" name="" id=""></td>
                                    <td>cm</td>
                                </tr>
                                <tr>
                                    <th>체중</th>
                                    <td><input type="text" name="" id=""></td>
                                    <td>kg</td>
                                </tr>
                                <tr>
                                    <th>혈액형</th>
                                    <td><input type="text" name="" id=""></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- // 사원 상세 정보 -->
    </div>
    <!-- // wrap -->
</body>
</html>