<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
	#searchId {
		width: 500px;
		height: 500px;
		margin: auto;
		margin-top: 150px;
	}
</style>
</head>
<body>
	<div id="searchId">
		<div>
			<h3>아이디 찾기</h3>
			<p>회원가입 시 이메일인증을 완료한 계정만 아이디찾기가 가능합니다.</p>
		</div><br>
		<form id="findForm" action="" method="post">
			<div>
				<div class = "find-name">
					<label>이름</label>
					<input type="text" id="conName" name="conName" class="form-control" minlength="2" maxlength="6" placeholder = "회원가입 시 등록한 이름을 입력해주세요." required>
					<span class="error_next_box" id="nameMsg"></span>
				</div><br>
				<div class = "find-email">
					<label>이메일</label>
					<input type="email" id="conEmail" name="conEmail" class="form-control" placeholder = "ex) email@gmail.com" required>
					<span class="error_next_box" id="emailMsg">이메일 주소를 다시 확인해주세요.</span>
				</div><br>
				<div class = "find-phone">
					<label>핸드폰번호</label>
					<input type="text" id="conPhone" name="conPhone" class="form-control" placeholder = "전화번호 (-포함)" required>
					<span class="error_next_box" id="phoneMsg" style="display:none;">-을 포함한 유효한 전화번호를 입력해주세요.</span>
				</div>
				<br><br>
				<div class ="btnSearch">
					<button type="button" id="findIdBtn" class="btn btn-dark btn-block" style="background-color : black;" data-toggle="modal" data-target="#myModal" disabled>찾기</button>
					<input type="button" name="cancle" class="btn btn-warning btn-block" value="취소" onClick="history.back()">
				</div>
			</div>
		</form>
		<script>
			
			$(function() {
				$("#conName").blur(function() {
				// 이름 정규식
				// 한글 2~6글자
				let regExp = /^[가-힣]{2,6}$/;
				if(!regExp.test($("#conName").val())) {
					$("#nameMsg").text("띄어쓰기없는 한글 2~6자 이름을 입력해주세요.");
					$("#nameMsg").css("display","block");
					$("conName").select(); //재입력 유도
					return false;
				} else {
					$("#nameMsg").css("display", "none");
					$("#findForm button[type=button]").removeAttr("disabled");
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
						$("#findForm button[type=button]").removeAttr("disabled");
						return true;
					}
				})

				$("#conPhone").blur(function() {
					// 핸드폰 번호 정규식
					let regExp = /^(010)-[0-9]{4}-[0-9]{4}$/;
					if(!regExp.test($("#conPhone").val())) {
						$("#phoneMsg").css("display", "block");
						$("#conPhone").select(); // 재입력 유도
						return false;
					} else {
						$("#phoneMsg").css("display", "none");
						$("#findForm button[type=button]").removeAttr("disabled");
						return true;
					}
				});
			})
		</script>

		<!--찾기 버튼 클릭 시 띄울 모달창-->

		<!-- The Modal -->
		<div class="modal fade" id="myModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
					<h4 class="modal-title">아이디 찾기 결과</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					
					<!-- Modal body -->
					<div class="modal-body" id="findresult">
						<p>
							회원님의 아이디는 
							<b style="font-size:15px;"></b> 
							입니다.
						</p>
					</div>
					
					<!-- Modal footer -->
					<div class="modal-footer">
					<button type="button" class="btn btn-warning" onclick="location.href='login.me';">메인페이지로</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">닫기</button>
					</div>
				</div>
				</div>
		</div>
	</div>
	<script>
				
		$("#findIdBtn").click(function() {
			
			$.ajax({
				url: "findId.me",
				data: {
					conName : $("#conName").val(),
                    conPhone : $("#conPhone").val(),
                    conEmail : $("#conEmail").val()
				},
				success : function(result) {
					//console.log(result);
					if(result == "NNNNN") { //찾지못했을경우
						$("#myModal p").html("회원님의 정보와 일치하는 아이디를 찾을 수 없습니다.<br> 입력하신 정보를 다시 확인해주세요.");
						$("#myModal p").show();
					} else { // 찾았을경우
						$("#myModal p").html("회원님의 아이디는 <b></b> 입니다.")
						$("#myModal b").text(result);
						$("#myModal p").show();
					}
				},
				error : function() {
					console.log("아이디찾기 체크용 ajax통신실패!");
				}
			});
		})
		
	</script>
	
</body>
</html>