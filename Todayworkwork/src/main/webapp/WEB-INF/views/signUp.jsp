<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- header css -->
<%@ include file="../resources/cssjs/head.jsp" %>
<!-- content css -->
<%@ include file="../resources/cssjs/signUpCss.jsp" %>
<!-- footer css -->
<%@ include file="../resources/cssjs/footer.jsp" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("#signup").on("click",function(){
			var user_id = $("#id").val();
			
			$.ajax({
				url: "signUpCheck",
				type: "post",
				data:{id: user_id},
				success: function(result){ 
					alert(result);
					if(result=="success"){
						alert("회원가입에 성공하였습니다 로그인 해주세요");
					}
					else{
						alert("중복된 아이디가 있습니다.");
					}
				},
				error:function(e){ 
					alert("회원가입에 실패했습니다"+e);
					alert("code:"+e.status+"\n"+"message:"+e.responseText+"\n"+"error:"+e);
				}
			});
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
                <div class="right">
                    <h1>세상 모든이들의 일자리</h1>
                </div>
            </div>
            <div id="nav" class="parent">
                <ul id="indiv_menu" class="parent left">
                    <li><a href="#">전체공고</a></li>
                    <li><a href="#">기업정보</a></li>
                    <li><a href="resumeManagement">이력서관리</a></li>
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
            <div id="content_wrap">
            	<h2>??회원 가입</h2>
            	<form action="signUp" method="POST">
	            	<ul id="info">
	            		<li><h3>이름</h3><input type="text" name="name" id="name"/></li>
	            		<li><h3>아이디</h3><input type="text" name="id" id="id"/></li>
	            		<li><h3>비밀번호</h3><input type="password" name="pw" /></li>
	            		<li><h3>전화번호</h3><input type="text" name="tel" /></li>
	            		<li><h3>주소</h3><input type="text" name="addr" /></li>
	            		<li><h3>이메일</h3><input type="text" name="email" /></li>
	            	</ul>
            	</form>
            	<button id="signup" class="btn">가입</button>
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