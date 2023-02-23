<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style>
	.search-title{
		width: 500px;
		height: 500px;
		margin: auto;
		margin-top: 150px;
	}
</style>
</head>
<body>
	<div class="search-title">
		<form action="findPwd.me" id="findPwd_form" name="findpwd_form" method = "post" >
			<div>
				<h3>비밀번호 찾기</h3>
				<p>회원가입 시 인증한 이메일주소로 비밀번호 변경이 가능합니다.</p>
			</div><br>
				<div class = "find-name">
					<label>아이디</label>
					<input type="text" id="conId" name="conId" class="form-control" minlength="7" maxlength="20" placeholder="띄어쓰기없는 영문,숫자 7~20자" required>
					<span class="error_next_box" id="idMsg">아이디를 다시 확인해주세요.</span>
				</div><br>
				<div class="find-email">
					<label>이메일</label>
					<input type="text" id="conEmail" name="conEmail" class="form-control" placeholder="ex)email@gmail.com" required>
					<span class="error_next_box" id="emailMsg">이메일 주소를 다시 확인해주세요.</span>
				</div><br>
				<div id="emailConfirm">
					<!-- 이메일 본인인증 -->
                    <button id="emailConfirmBtn" class="btn btn-outline-dark" type="button" disabled>이메일 본인인증</button>
					<br><br>
					<input id="emailConfirminput" name="emailConfirm" class="form-control" type="text" placeholder="인증 번호를 입력해주세요." style="display:none;" required>
					<span class="error_next_box" id="emailConfirmMsg"></span>
				</div>
			<br>
			<div class="btnSearch">
				<button type="button" id="findPwdBtn" class="btn btn-dark btn-block" style="background-color : black;" data-toggle="modal" data-target="#myModal" disabled>비밀번호 변경하기</button>
				<input type="button" name="cancle" class="btn btn-warning btn-block" value="취소" onClick="history.back()">
			</div>
		</form>
		<script>
			$("#conId").blur(function() {
				// 아이디 정규식
				let regExp = /^[a-z\d]{7,20}$/;
				if(!regExp.test($("#conId").val())) {
					$("#idMsg").css("display", "block");
					$("conId").select(); //재입력유도
					return false;
				} else {
					$("#idMsg").css("display","none");
					$("#emailConfirm button[type=button]").removeAttr("disabled");
					return true;
				}
			})

			$("#conEmail").blur(function() {
				// 이메일 정규식
				// - 이메일주소 시작은 숫자나 알파벳으로 시작됨
				// - 이메일 첫째자리 뒤에는 -_. 을 포함하여 들어올 수 있음
				// - 도메인 주소 전에는 @ 포함
				// - . 이 최소한 하나는 있어야 하며 마지막 마디는 2-3자리 여야 함
				let regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
				if(!regExp.test($("#conEmail").val())) {
					$("#emailMsg").css("display", "block");
					$("#conEmail").select(); // 재입력 유도
					return false;
				} else {
					$("#emailMsg").css("display", "none");
					$("#emailConfirm button[type=button]").removeAttr("disabled");
					return true;
				}
			})
		</script>

		<!--  비밀번호 변경 모달창 -->
		<form action="pChange.me"> 
			<div class="modal fade" id="myModal">
			<div class="modal-dialog">
			<div class="modal-content">
			
				<!-- Modal Header -->
				<div class="modal-header">
				<h4 class="modal-title">비밀번호변경하기</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body">
				<input name='conId' type='text' class='form-control' placeholder='아이디'><br>
				<input id='memPwd2' name='conPwd' type='password' class='form-control' placeholder='새 비밀번호' required><br>
				<input id='pwOk' type='password' class='form-control' placeholder='새 비밀번호 확인' required><br>
				<span class='error_next_box' id='pwd2Msg'>비밀번호가 일치하지 않습니다.</span>
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer">
				<button id='pwdChange' type='submit' class='btn btn-dark'>변경</button>
				</div>
				
			</div>
			</div>
		</div>
		</form>
	
		<script>
			$(function() {

				
				let code;
				$("#emailConfirmBtn").click(function() {
					// 이메일인증
					let email = $('#conEmail').val(); // 이메일주소값받아오기
					const checkInput = $('#emailConfirm'); // 인증번호입력하는칸
					
					$.ajax({
						type : 'get',
						url : 'findPwd.me?email='+ email,
						success : function(data) {
							$('#emailConfirminput').show();
							code = data;
							alert('인증번호가 전송되었습니다.');
						}
					});
				})
				
				$("#emailConfirminput").on({blur:function() {
					// 이메일 인증번호 정규식
					let regExp = /^[0-9]{6,6}$/;
					if(!regExp.test($("#emailConfirm").val())) {
						$("#emailConfirmMsg").text("인증번호는 6글자입니다.");
						$("#emailConfirmMsg").show();
						$("#emailConfirm").select(); // 재입력유도
						return false;
					} else {
						return true;
					} 
				}, keyup: function() {
						// 이메일 인증번호 비교
						if($("#emailConfirminput").val().length >= 6) {
							let inputCode = $(this).val();
							
							if(inputCode === code) {
								$('#emailConfirmMsg').show();
								$('#emailConfirmMsg').text("인증번호가 일치합니다.");
								$('#emailConfirmmsg').css('color', 'green');
								$('#conEmail').attr('readonly', true);
								
								$("#findPwdBtn").css("background-color", "black").attr("disabled", false);
								$("#findPwdBtn").removeAttr("disabled");
								$('#emailConfirm').attr('readonly', true);
							} else {
								$('#emailConfirmMsg').text("인증번호가 일치하지 않습니다. 인증번호 혹은 이메일 주소를 다시 확인해주세요.");
								$('#emailConfirmMsg').show();
								$('#emailConfirmMsg').css('color', 'red');
								$('#conEmail').attr('readonly', false);
								// 버튼 비활성화
								$("#findPwdBtn").attr("disabled", true);
							} 
						}  else { // 6글자 미만일 때
                            $("#findPwdBtn").attr("disabled", true);
                        }
					}
				});
				
				$("#pwOk").on({keyup:function() {
                     // 비밀번호 유효성 검사
					let pwOk = $("#pwOk").val();
					if($("#memPwd2").val() != (pwOk)) {
						$("#pwd2Msg").css("display", "block");
						// $("#memPwd").select(); // 비밀번호부터 재입력 유도
						$("#pwdChange").attr("disabled", true);
						return false;
					} else {
						$("#pwd2Msg").css("display", "none");
						$("#pwdChange").attr("disabled", false);
						return true;
					}
				}});
			})
		</script>
		
	</div>
</body>
</html>