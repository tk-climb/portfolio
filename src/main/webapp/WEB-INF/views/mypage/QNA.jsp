<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <title>:D plate</title>
    <meta charset="utf-8" />
    	<script src="jquery-3.5.1.min.js"></script>
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/noscript.css" /></noscript>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

		
		
        <style>
        .wrap {
            width: 100%;
            height: 100%;
        }

        .mid{
            position: absolute;
            height: 70%;
            width: 80%;
            top: 80%;
            left: 65%;
            transform: translate(-75%, -75%);
            z-index: 1;
        }
        #myMenu {
            height: 100%;
            width: 180px;
            border-right: 1px solid gray;
            z-index: 1;
        }

        #myMenu>p {
            text-align: center;
            font-size: 23px;
            font-weight: 900;
        }
        ul {
            margin: 0px;
            padding: 0px;
        }
        #myMenu>ul>li {  
            position: relative;
            right: 8px;
           text-align: center; 
            list-style: none;            
        }
        
        #myContent {
            position: absolute;
            width: 70%;
            right: 7%;
            height: 500px;
            
        }

        #myTitle {
            position: relative;
            left: 25px;
            top: 25px;
            
        }
        #myInfo {
            border-bottom: solid 2px;
            height: 25%;
        }
        #myInfoContent{
            float: right;
            width: 78%;
            height: 100%;
        }
        #email{
            position: relative;
            left: 15px;
            top: 30px;
            font-size: 15px;
        }
        #nickName{
            position: relative;
            left: 15px;
            top: 10px;
            font-size: 20px;
        }
        
        #updateInfo>p {
            color: fuchsia;
            font-weight: 600;
        }
        .QNA {
            border: solid 1px;
            border-radius: 12px;
            text-indent: 20px;
            margin: 20px;
            padding: 12px 0;
        }

        #Qinsert{
            position: relative;
            left: 91%;
            width: 90px;
            font-size: 10px;
            top: -60px;
        }
        
        thead>tr>th {
            padding-top: 15px;
            height: 40px;
        }
        
        </style>
</head>
<body class="is-preload">
<%@ include file="../common/menubar.jsp" %>
    <div id="wrapper">
    
    <script>
			// script ?????? ???????????? ?????????????????? ?????? jsp ????????? ??? ??? ??????.
			
				var msg = "<%= alertMsg %>"; 
				
				if(msg != "null") { // ???, ?????? / ?????? ????????? ????????? ???????????? ??????
					alert(msg);
				
					// session ??? ???????????? alertMsg ????????? ?????? ????????? ???????????????!!
					// ???????????? menubar.jsp ??? ?????????????????? ?????? alert ??? ??????
					// => XX.removeAttribute("??????");
					<% session.removeAttribute("alertMsg"); %>
				}
			
		</script>
    
    <!-- ??????????????? -->
        
        <div class="back"></div>
        <div class="mid">

            <div id="myContent">
            
                <h2 id="myTitle">?????? ????????? ??????</h2>
                    
                <input id="Qinsert" type="button" value="????????????">
            
            <!-- ????????? ????????? -->
            <!-- ?????? ????????? -->
		<table name="value" class="table-bordered" >
            <thead class="thead-dark">
               <tr style="text-align: center;">
                  <th style="text-align: center;">????????????</th>
                  <th style="text-align: center;">?????????</th>
                  <th style="text-align: center;">??????</th>
                  <th style="text-align: center;">????????????</th>

               </tr>
            </thead>
            <!-- ?????? ????????? ????????? -->
           <tbody>
               <c:choose>
                  <c:when test="${empty list}">
                     <tr>
                        <td colspan="5">????????? ????????? ????????????.</td>
                     </tr>
                  </c:when>
                  <c:otherwise>
			             	<c:forEach var="q" items="${ list }">
			                       <tr>
			                          <input type="hidden" value="${q.qnaStatus}">
			                          <input type="hidden" value="${q.qnaContent}">
			                          <input type="hidden" value="${q.qnaAnswer}">
			                          <td style="text-align: center;">${q.qnaNo}</td>
			                          <td style="text-align: center;"><fmt:formatDate value="${q.qnaDate}" pattern="yy-MM-dd HH:mm" /></td>
			                          <td style="text-align: center;">${q.qnaTitle}</td>
			                          
			                          <!-- ?????? ????????? N?????? ?????? ????????? ??????  -->
			                          <c:choose>
			                             <c:when test="${q.qnaStatus eq 'N'}">
			                                <td style="text-align: center; ">????????????
			                                <button style="width: 100px; height: 30px; line-height: 50%; margin:10px; " class="updateQna" data-toggle="modal" data-target="#updateModal">??????</button>
			                                <button style="width: 100px; height: 30px; line-height: 50%; margin:10px; " class="deleteQna">??????</button></td>
			                             </c:when>
			                             <c:otherwise>
			                                <td style="text-align: center; ">????????????
			                                 <button class="showAnswer"
			                                      	 data-toggle="modal" data-target="#answer"
			                                      	 style="width: 150px; height: 30px; line-height: 50%; margin:10px;">????????????
			                                 </button></td>
			                             </c:otherwise>
			                          </c:choose>
			                       </tr>
		                     </c:forEach>
		                  </c:otherwise>
		               </c:choose>
		            </tbody>
		         </table>
		         		    <div style="margin-left:45%;" >   
               
               <c:if test="${currentPage != 1}">
                  <a  class="btn" href="${pageContext.request.contextPath}/qnaList?currentPage=${currentPage - 1}">&lt;</a>
               </c:if>
               <c:forEach begin="${startPage }" end="${endPage}" var="p">
                  <c:choose>
                     <c:when test="${p == currentPage}">
                        <b>${p}</b>
                     </c:when>
                     <c:when test="${p != currentPage }">
                        <a  class="btn" href="${pageContext.request.contextPath}/qnaList?currentPage=${p}">${p}</a>
                     </c:when>
                  </c:choose>
               </c:forEach>
               <c:if test="${currentPage != maxPage}">
               
                  <a class="btn" href="${pageContext.request.contextPath}/qnaList?currentPage=${currentPage +1}">&gt;</a>
               </c:if>
            </div>   
               </div>   
            </div>
        </div>


		<!-- ????????? ???????????? -->

         <div class="modal" id="answer" style="height: 1500px;">
            <div class="modal-dialog modal-lg modal-center">
               <div class="modal-content">

                  <!-- Modal ?????? -->
                  <div class="modal-header">
                     <h4 class="modal-title">????????????</h4>
                     <button type="button" class="close" data-dismiss="modal"
                        style="width: 35px; height: 35px; padding: 8px;">&times;</button>
                  </div>

                  <!-- Modal ?????? -->
                  <div class="modal-body">
                        <table class="table-bordered">

                           <tr>
                              <th>??????</th>
                              <td id="qnaTitle"></td>
                           </tr>
                           <tr>
                              <th>????????????</th>
                              <td id="qnaContent"></td>
                           </tr>
                           <tr>
                              <th>????????????</th>
                              <td><textarea id="qnaAnswer" style="resize: none;" readonly>
                              </textarea></td>
                           </tr>
                        </table>
                        
                     
                  </div>
               </div>
            </div>
         </div>
         
                  <!-- ?????? ????????? -->
         <div class="modal" id="updateModal" style="height: 1500px;">
            <div class="modal-dialog modal-lg modal-center">
               <div class="modal-content">

                  <!-- Modal ?????? -->
                  <div class="modal-header">
                     <h4 class="modal-title">????????????</h4>
                     <button type="button" class="close" data-dismiss="modal"
                        style="width: 35px; height: 35px; padding: 8px;">&times;</button>
                  </div>

                  <!-- Modal ?????? -->
                  <div class="modal-body">
                 	 <form method="get" action="updateQNA" name="updateQnaModal" >	
	                      <input name="qnaNo" type="hidden" value="">
	                      <input name="memberNo" type="hidden" value="<%= loginUser.getMemberNo() %>">
	                        <table class="table-bordered">
							       <tr>
		                              <th>??????</th>
		                              <td id="qT"></td>
		                           </tr>
		                           <tr>
		                              <th>????????????</th>
		                              <td id="content"></td>
		                           </tr>


		                           <tr>
		                              <th>????????? ??????</th>
		                              <td ><input name="qnaTitle" type="text" placeholder="????????? ????????? ???????????????." required></td>
		                           </tr>
		                           <tr>
		                              <th>????????? ????????????</th>
		                              <td><textarea name="qnaContent" id="" cols="20" rows="5" style="border: 1px solid; resize: none;" required></textarea></td>
		                           </tr>	
		                                       
		                     </table>
	                     
	                     <br>
	                           
	                    <input type="submit" value="??????">
	                  </form>      
                     
                  </div>
               </div>
            </div>
         </div>




            <script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/browser.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/breakpoints.min.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/util.js"></script>
			<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
   
    <!-- Qinsert ????????? ????????? ???????????? ?????? -->
	 <script>
		$(function() {
			$("#Qinsert").click(function() {
				location.href="${pageContext.request.contextPath}/qnaWrite";
			});
		});
		
		
		// ?????? ???????????? ????????????
		
        $(function() {

            $(".showAnswer").click(
                  function() {
                     
                     
                     var qnaAnswer = $(this).parent().siblings().eq(2).val();
                     var qnaTitle = $(this).parent().siblings().eq(5).text(); // text??? ?????????????????? text??? ??????
                     var qnaContent = $(this).parent().siblings().eq(1).val(); // val??? ??????????????? ??????????????? val??? ??????                                    
                     
                             
                     $("#qnaAnswer").text(qnaAnswer);
                     $("#qnaTitle").text(qnaTitle);
                     $("#qnaContent").text(qnaContent);

                  });

         });
		
		// ??????????????? ?????? ???????????? ?????? ?????????
        	$(function() {
        		$(".deleteQna").click(
        			function(){
        			var qnaNo = $(this).parent().siblings().eq(3).text();
        			location.href = "${pageContext.request.contextPath}/deleteQNA?qnaNo=" + qnaNo;
        		});
        	});
        
		
        	// ??????????????? ?????? ???????????? ?????? ?????????
        	// ????????? ????????? ????????? ???????????? ??????
        	// ????????? ????????? ?????? ???????????? ???????????? ????????? ??? ????????? ????????? ??????
        	$(function() {
        		$(".updateQna").click(
        			function(){		
        			var qnaNumber = $(this).parent().siblings().eq(3).text();
        			var qT = $(this).parent().siblings().eq(5).text(); // text??? ?????????????????? text??? ??????
                    var content = $(this).parent().siblings().eq(1).val();
        			
        			document.updateQnaModal.qnaNo.value=qnaNumber;
        			$("#qT").text(qT);
        			$("#content").text(content);
        			
        		});

        	});
        </script>
        

</body>
</html>