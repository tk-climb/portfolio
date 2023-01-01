<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- modal -->
			

			<!-- 로그인 -->
			<div class="modal fade task-modal-content" id="add-new-task-modal-login" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true" style="z-index:1000000">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content" style="height: 40%; width: 40%; margin-left: 31%;" >
						<div class="modal-header">
							<h4 class="modal-title" id="NewTaskModalLabel">LOGIN</h4>
							<!-- <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button> -->
						</div>
						<div class="modal-body">
							<form class="p-2" action="login.do" method="post">
								<div class="row">
									<div class="idForm">
										<input type="text" class="idform" name="memberId" placeholder="ID" required>
									</div>
									<div class="passForm">
										<input type="password" class="pwd" name="memberPwd" placeholder="PW" required>
									</div>


									<div class="col-md-6">
										<div class="mb-3">
											<label for="task-priority" class="form-label"></label>
											<input type="text" class="form-control form-control-light" id="birthdatepicker" data-toggle="date-picker" data-single-date-picker="true">
										</div>
									</div>
								</div>
								
								<div class="text-end">
									<button type="submit" style="width: 100px; height: 35px; font-size: 11px;" class="btn">로그인</button>
								</div>
							</form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			  </div><!-- /.modal -->
			
			<!-- 아이디 찾기 -->
	 <div class="modal fade task-modal-content" id="add-new-task-modal-id" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content" style="height: 50%; width: 45%; margin-left: 31%;" >
						<div class="modal-body">
                            <form action="findid.do" method="post">
                                <div  style="position : absolute;">
                                      <h4 id="title" style="text-align: center; margin-top: 30px;">아이디를 잊으셨나요?</h4>
                                      <input type="text" name="memberName" placeholder="이름을 입력해 주세요" style="margin-top: 40px;">
                                      <input type="text" name="memberPhone" placeholder="전화번호를 입력해 주세요" style="margin-top: 40px;"> 
                                                                            
                                      		<!-- 이름과 전화번호가 일치하지 않을 때-->
										

                                      <button type="submit" id="findIdBtn" style="margin: 30%;">아이디 찾기</button>  
                                      
                                      <a style="position:relative; bottom:77px; left: 96px;" href="#" id="returnlog">로그인 돌아가기</a>
                               </div>
                            </form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			  </div><!-- /.modal -->
			  
			  
			  <!-- 비밀번호 찾기 -->
			  <div class="modal fade task-modal-content" id="add-new-task-modal-pwd" tabindex="-1" role="dialog" aria-labelledby="NewTaskModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered modal-lg">
					<div class="modal-content" style="height: 50%; width: 45%; margin-left: 31%;" >
						<div class="modal-body">
						<form action="sendpw.do" method="post">
                            <div id="pop">
                                <div  style="position : absolute;">
                                      <h4 id="title" style="text-align: center; margin-top: 35px;">비밀번호를 잊으셨나요?</h4>
                                      <input type="text" id="mail" name="memberId" placeholder="아이디" style="margin-top: 40px;">
                                      <input type="text" id="mail" name="memberEmail" placeholder="이메일" style="margin-top: 40px;"> <br>
                                      <p id="info">
                                           	아이디와 이메일 주소를 입력해주세요. <br>
                                      </p>
                                      
                                      <button type="submit" id="sendPwBtn" style="margin: 22%;">비밀번호 찾기</button>  
                                      
                                      <a style="position:relative; bottom:60px; left: 93px;" href="#" data-bs-toggle="modal" data-bs-target="#add-new-task-modal-login" id="returnlog">로그인 돌아가기</a>
                               </div>
                            </div>
                         </form>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
			  </div><!-- /.modal -->
			  
			  
</body>
</html>