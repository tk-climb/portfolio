<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.kh.dplate.member.model.vo.Member, javax.servlet.http.HttpSession" %>
<%
	HttpSession session = request.getSession();
	Member loginUser = (Member)session.getAttribute("loginUser");
	// 로그인 전 : menubar.jsp 가 로딩될때 null
	// 로그인 후 : menubar.jsp 가 로딩될때 로그인한 회원의 정보가 담겨있음
	String alertMsg = (String)session.getAttribute("alertMsg");
%>    
    
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>menubar</title>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
		<link href="${pageContext.request.contextPath}/resources/assets/css/app.css" rel="stylesheet" type="text/css" id="light-style" />
		
		
		<style>
       
	   ul>li>ol  {
           display : none; /* 숨겨두기 */
       }

		</style>
		
</head>
<body>
	<c:if test="${ !empty alertMsg }">
      <script>
         var msg = "${ alertMsg }";
         alert(msg);
      </script>
      <c:remove var="alertMsg" scope="session" />
   </c:if>
	<body class="is-preload">
		<!-- Wrapper -->
			
		<div id="wrapper">
				<!-- Header -->
			<header id="header">
						<div class="inner">

							<!-- Logo -->
								<a href="${pageContext.request.contextPath}/mainList.do" class="logo">
									<span class="symbol"><img src="${pageContext.request.contextPath}/resources/images/D.png" alt="" /></span>
								</a>

							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu" style="display:block;">Menu</a></li>
									</ul>
								</nav>

						</div>
					</header>
					
				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul id="navi">
							
						
							
							<li>
								<p style="margin-top: 5%; margin-bottom: 5%;">조회</p>
								
								
								 <% if(loginUser != null) { %>
									
								  	<ol style="list-style-type: none; font-size: medium;">
										<li><a href="${pageContext.request.contextPath}/bookmark?memberNo=<%= loginUser.getMemberNo() %>">즐겨찾기조회</a></li>
										<li><a href="${pageContext.request.contextPath}/myReview?memberNo=<%= loginUser.getMemberNo() %>">리뷰조회</a></li>
										<li><a href="${pageContext.request.contextPath}/qnaList?memberNo=<%= loginUser.getMemberNo() %>" >Q&A조회</a></li>
										<li><a href="${pageContext.request.contextPath}/myRe?memberNo=<%= loginUser.getMemberNo() %>">예약조회</a></li>
									</ol>
								<% } %>
								
							</li>
							<% if(loginUser != null) { %>
							<li>
								<p style="margin-top: 5%; margin-bottom: 5%;">마이페이지</p>
								<ol style="list-style-type: none; font-size: medium;">
									<li><a href="#" data-bs-toggle="modal" data-bs-target="#add-new-taekyoung-modal" class="btn btn-success btn-sm ms-3">개인정보수정</a></li>
									<li><a href="${pageContext.request.contextPath}/insert.do">맛집추가</a></li>
									
										<c:set var="a" value="<%= loginUser.getResNo() %>"/>
								<c:if test="${ a ne null }">
									<li><a href="${pageContext.request.contextPath}/update/${ a} ">맛집수정</a></li>
									<li><a href="${pageContext.request.contextPath}/delete/${ a }">맛집삭제</a></li>
								</c:if>
									
								</ol>
							<li>
							<% } %>
							<li>
								<a href="${pageContext.request.contextPath}/business.do">사업자 전환</a>
								
							</li>
							<% if(loginUser != null) { %>
							<li>
								<p style="margin-top: 5%; margin-bottom: 5%;">사업자메뉴</p>
								<c:set var="r" value="<%= loginUser.getResNo() %>"/>
								<ol style="list-style-type: none; font-size: medium;">
									<li><a href="${pageContext.request.contextPath}/reservationList">예약관리</a></li>
									<li><a href="${pageContext.request.contextPath}/insert/${r}">예약일정관리</a></li>
									<li><a href="#">리뷰관리</a></li>
								</ol>
							</li>
							<% } %>
							<% if(loginUser != null && loginUser.getMemberNo() == 1) { %>
								
							<li>
								<p style="margin-top: 5%; margin-bottom: 5%;">관리자</p>
								<ol style="list-style-type: none; font-size: medium;">
									<li><a href="${pageContext.request.contextPath}/memberList.do">이용자관리</a></li>
									<li><a href="${pageContext.request.contextPath}/businessList.do">사업자관리</a></li>
									<li><a href="${pageContext.request.contextPath}/restaurantList.do">맛집관리</a></li>
									<li><a href="${pageContext.request.contextPath}/reviewList.do">리뷰관리</a></li>
									<li><a href="${pageContext.request.contextPath}/qnaList.do">Q&A관리</a></li>
								</ol>
							</li>
								
							<% } %>
						</ul>
						
						
						<% if(loginUser == null) { %>
						<h5 style="transform: translateY(900%); float:right;">
								<a href="#" data-bs-toggle="modal" data-bs-target="#add-new-task-modal-login" class="btn btn-success btn-sm ms-3" > 로그인 </a> | <a href="${pageContext.request.contextPath}/signup.do">회원가입</a><br>
								<a href="#" data-bs-toggle="modal" data-bs-target="#add-new-task-modal-id">ID 찾기</a> |
								<a href="#" data-bs-toggle="modal" data-bs-target="#add-new-task-modal-pwd">PW 찾기</a>
								
						</h5>
						<% } else { %>
							<h4 style="transform: translateY(1500%); float:right;">
								<a href="${pageContext.request.contextPath}/logout.do">로그아웃</a>
							</h4>
						<% } %>
					</nav>
			</div>		
			
					<!-- 개인정보 수정 모달창 -->
		<form action="password" method="post">
              <div class="modal fade task-modal-content" id="add-new-taekyoung-modal" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
	            <div class="modal-dialog modal-dialog-centered modal-lg" style="width: 500px;">
	                <div class="modal-content" style="height: 280px;" >
	                    <p style="position: relative; text-align: center; top: 30px;">비밀번호 확인</p>
	                    <br><br>
	                    <% if( loginUser == null) { %>
	                    	<input type="hidden">
	                    <% } else { %>
	                    	<input type="hidden" name="memberId" value="<%= loginUser.getMemberPwd() %>" >
	                    <% } %>
	                    <input name="memberPwd" type="password" placeholder="비밀번호를 입력해주세요." style="width: 95%; height: 30px; position: relative; left: 10px;">
	                    <input type="submit" value="확인" style="width: 80px; height: 40px; font-size: small; position: relative; bottom: -30px; left: 400px;">
	                </div><!-- /.modal-content -->
	            </div><!-- /.modal-dialog -->
	          </div><!-- /.modal -->
         </form>
			
			
	
				
			<!-- Scripts -->
		<script>
			$("ul>li").click(function(){
				var $li = $(this).children("ol");
	
				if($li.css("display") == "none") {
					$(this).siblings("li").children("ol").slideUp(500);
					
					$li.slideDown(500);
				}
				else {
					$li.slideUp(500);
				}
			});
		</script>
				
</body>
</html>