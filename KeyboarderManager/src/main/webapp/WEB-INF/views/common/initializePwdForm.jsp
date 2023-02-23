<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sellerId = (String)session.getAttribute("seller"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <title>K-MANAGER :: 비밀번호 초기화</title>
    <style>
        #wrap {
            width : 1920px;
            height : 1080px;            
        }
        
        #enrollHeader {
            width : 100%;
            height : 8%;
            font-size: 30px;
        }

        #enrollHeader div{
            float : left;
            position: relative;
            top : 25px;
            left : 17%;
        }
        
        #login_text1 {
            font-weight: 600;
        }
    
        #enrollContent {
            position: relative;
            left : 17%;
        }

        #enrollContent div {
            position : relative;
        }

        #text1 {
            font-size: 30px;
            font-weight: 540;
            top : 30px;
        }

        #text2 {
            font-size: 19px;
            top : 80px;
        }

        #forgotId {
            width : 50%;
            height : 200px;
            background-color: rgb(226, 226, 226);
            top : 150px;
        }

        #text3 {
            padding : 25px 0 0 20px;
            font-size: 21px;
            width : 100%;
            height : 100%;
        }

        #newPwd {
            font-size: 21px;
            width : 300px;
        }

        #newPwdCheck {
            font-size: 21px;
            width : 300px;
            position: relative;
            left : 20px;
        }

        #origin {
            height : 20%;
        }

        #check {
            position: relative;
            top : 50px;
        }

        #checkResult1 {
            position: relative;
            left : 185px;
            top : 5px;
        }

        #checkResult2 {
            position: relative;
            left : 185px;
            top : 5px;
        }

        button {
            position: relative;
            font-size: 20px;
            font-weight: 540;
            top : 200px;
            left : 400px;
            background-color: #323232;
            color : white;
            width : 15%;
            padding : 10px 20px 10px 20px;
            text-align: center;
        }

        .disabledBtn {
            cursor : default;
            background-color: #a7a7a7;
        }

        .enabledBtn {
            cursor : pointer;
            background-color: #323232;
        }
    </style>
</head>
<body>
    
    <div id="wrap">

        <div id="enrollHeader">
            <div id="login_text1">KEYBOAR</div>
            <div id="login_text2">-DER 판매자매니저</div> 
        </div>
        <hr>
        <div id="enrollContent">
            <div id="text1">판매자 비밀번호 초기화</div>
            <div id="text2">
                * 새로운 비밀번호를 입력해주세요.<br>
                (영문, 숫자, 특수문자 포함 12 ~ 20자)
            </div>
            <form action="initializePwd.me">
            	<input type="hidden" name="sellerId" value="<%= sellerId %>">
                <div id="forgotId">
                    <div id="text3">
                        <div id="origin">
                            새로운 비밀번호 :&nbsp;&nbsp;&nbsp;
                            <input type="password" id="newPwd" name="newPwd" minlength="12" maxlength="20" placeholder="영문,숫자,특수문자 12~20자" required>
                            <div id="checkResult1" style="font-size:0.8em; display:none;"></div>
                        </div>                    
                        <div id="check">
                            비밀번호 확인 :&nbsp;&nbsp;&nbsp; 
                            <input type="password" id="newPwdCheck" name="newPwdCheck" minlength="12" maxlength="20" placeholder="영문,숫자,특수문자 12~20자" required>
                            <div id="checkResult2" style="font-size:0.8em; display:none;"></div>
                                                     
                        </div>
                        
                    </div>                
                </div>
                <div>
		            <button type="submit" id="initializePwd" class="disabledBtn">비밀번호 초기화</button>
		        </div>        
            </form>
        </div>
    </div>    

    <script>
        $(function() {
             
            // 사업자 등록 번호를 입력받는 input 요소 객체를 변수에 담아두기 => keyup 이벤트 걸기
            var $newPwdInput = $("#newPwd");
            var $newPwdCheckInput = $("#newPwdCheck");

            var newPwd = document.getElementById("newPwd");
            var nwePwdCheck = document.getElementById("newPwdCheck");
            var regExp = /^[a-z\d!@#$%^&*()]{12,20}$/i;

            $newPwdInput.keyup(function() {
                
                // 우선 최소 12글자 이상으로 아이디값이 입력되어 있을 때만 ajax 요청
                // => 쿼리문의 갯수가 한정되어있을 수 있기 때문
                if($newPwdInput.val().length >= 12) {
                    
                    if(!regExp.test(newPwd.value)) {
                        
                        // 빨간색 메세지 출력
                        $("#checkResult1").show();
                        $("#checkResult1").css("color", "red").text("올바르지 않은 형식 입니다. 다시 입력해주세요.");
    
                        return false;
    
                    }   else {
                                    
                            // 초록색 메세지 출력
                            $("#checkResult1").show();
                            $("#checkResult1").css("color", "green").text("올바른 형식의 비밀번호 입니다.");
        
                    } 
                    
                } else { // 12글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기
                    
                    $("#checkResult1").hide();
                }
                
            });

            $newPwdCheckInput.keyup(function() {
                
                // 우선 최소 12글자 이상으로 아이디값이 입력되어 있을 때만 ajax 요청
                // => 쿼리문의 갯수가 한정되어있을 수 있기 때문
                if($newPwdCheckInput.val().length >= 12) {
                    
                    if(newPwdCheck.value != newPwd.value) {
                        
                        // 빨간색 메세지 출력
                        $("#checkResult2").show();
                        $("#checkResult2").css("color", "red").text("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
    
                        // 버튼 비활성화
                        $("#initializePwd").attr("disabled", true);
                        $("#initializePwd").addClass("disabledBtn");
                        $("#initializePwd").removeClass("enabledBtn");

                        return false;
    
                    }   else {
                                    
                            // 초록색 메세지 출력
                            $("#checkResult2").show();
                            $("#checkResult2").css("color", "green").text("새로운 비밀번호와 일치합니다.");							

                            // 버튼 활성화
                            $("#initializePwd").removeAttr("disabled");
                            $("#initializePwd").addClass("enabledBtn"); // cursor : pointer css를 가진 class 추가
                            $("#initializePwd").removeClass("disabledBtn"); // cursor : dafault css를 가진 class 삭제                            
        
                    } 
                    
                } else { // 12글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기
                    
                        // 버튼 비활성화
                        $("#checkResult2").hide();
                        $("#initializePwd").attr("disabled", true);
                        $("#initializePwd").addClass("disabledBtn");
                        $("#initializePwd").removeClass("enabledBtn");
                }
                
            });            
    
        });
    </script>

</body>
</html>