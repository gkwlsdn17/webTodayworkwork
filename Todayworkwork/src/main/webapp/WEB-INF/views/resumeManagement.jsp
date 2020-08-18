<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- header css -->
<%@ include file="../resources/cssjs/head.jsp" %>
<!-- content css -->
<%@ include file="../resources/cssjs/resumeManagementCss.jsp" %>
<!-- footer css -->
<%@ include file="../resources/cssjs/footer.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".resume").on("click",function(){
			var r_num = $(this).find("input").val();
			window.location = "resumeDetail?r_num="+r_num;
		});
	});
</script>

</head>

<body>
<div class="container">
        <div id="header">
            <div id="title">
                <div class="parent left">
                    <img class="left" src="http://placehold.it/100x100"/>
                    <h1 class="left"><a href="/todayworkwork">오늘부터일일</a></h1>
                </div>
                
            </div>
            <div id="nav" class="parent">
                <ul id="indiv_menu" class="parent left">
                    <li>전체공고</li>
                    <li>기업정보</li>
                    <li>이력서관리</li>
                    <li>후기</li>
                </ul>
                <div class="left">/</div>
                <ul id="com_menu" class="parent left">
                    <li>인재정보</li>
                </ul>
                <div class="right">
                    <input type="text" value="검색">

                </div>
            </div>
        </div>
        <div id="content">
            <div id="content_wrap" class="parent">
                <div id="aside" class="left">
                    <h3>이력서 관리</h2>
                    <ul>
                        <li><a href="resumeInsert">이력서 등록</a></li>
                        <li><a href="#">이력서 현황</a></li>
                    </ul>
                </div>
                <div id="section" class="left">
                    <h2>이력서 현황</h1>
                    <form action="resumeDetail">
	                    <ul id="resume">
	                        <li class="resume"><input type="text" name="r_num" value="1">1번이력서</li>
	                        <li class="resume"><input type="text" name="r_num" value="2">2번이력서</li>
	                        <li class="resume"><input type="text" name="r_num" value="3">3번이력서</li>
	                        <li class="resume"><input type="text" name="r_num" value="4">4번이력서</li>
	                        <li class="resume"><input type="text" name="r_num" value="5">5번이력서</li>
	                    </ul>
                    </form>
                </div>
            </div>
        </div>
        <div id="footer">
            <div id="footer_logo" class="parent">
                <img class="left" src="http://placehold.it/100x100">
                <h3 class="left">오늘부터일일</h3>
            </div>
            <div id="info">
                <div>고객센터 010-2600-7226 (평일 09:00~18:00, 주말·공휴일 휴무)</div>
                <div>이메일 : kk0141@naver.com  Fax : 053-751-7761(대표), 02-6937-0035(세금계산서)</div>
                <div>(주)오늘부터일일, 우 : 412-28, 대구광역시 동구 동부로 121 (신천동,경북산업직업전문학교), 대표 : 권희경</div>
                <div>사업자번호 : 502-91-09709, 통신판매업신고번호 : 동구청 제2-844호, Copyright (c) (주)오늘부터일일. All rights reserved.</div>
            </div>
        </div>
    </div>
</body>
</html>