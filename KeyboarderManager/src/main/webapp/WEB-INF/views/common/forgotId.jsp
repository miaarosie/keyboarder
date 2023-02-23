<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 아이디찾기</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
            left : 30%;
        }
        
        #login_text1 {
            font-weight: 600;
        }
    
        #enrollContent {
            position: relative;
            left : 30%;
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
            height : 100px;
            background-color: rgb(226, 226, 226);
            top : 150px;
            padding-top: 20px;
        }

        #text3 {
            padding : 25px 0 0 120px;
            font-size: 18px;
        }

        #corpNo {
            font-size: 16px;
            width : 300px;
            height: 25px;
            border-radius: 5px;
        }

        #nextStep {
            position: relative;        
            left : 40px;
            width : 150px;
            height : 33px;
            background-color: #323232;
            color : white;
            font-size: 16px;
            text-align: center;
            border-radius: 5px;
            border: none;
        }

        #checkResult {
            position: relative;
            left : 190px;
        }

        .disabledBtn {
            cursor : default;
        }

        .enabledBtn {
            cursor : pointer;
        }

        a {
            text-decoration: none;
        }

        #text4 {
            position: relative;
            font-size: 20px;
            font-weight: 540;
            top : 250px;
            left : 890px;
            background-color: #323232;
            color : white;
            width : 15%;
            padding : 10px 20px 10px 20px;
            text-align: center;
            border-radius: 5px;
            border: none;
        }

        #result {
            position: relative;
            top : 180px;
            left : 20px;
            font-size: 20px;
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
            <div id="text1">판매자 아이디 찾기</div>
            <div id="text2">
                * 회원가입시 입력한 사업자 등록번호를 입력해주세요.
            </div>
            <form>
                <div id="forgotId">
                    <div id="text3">
                        사업자 등록 번호 :&nbsp;&nbsp;&nbsp;
                        <input type="text" id="corpNo" name="corpNo" minlength="12" maxlength="12" placeholder=" - 포함 12자 입력" required>
                        <button type="button" id="nextStep" class="disabledBtn">아이디 찾기</button>
                        <div id="checkResult" style="font-size:0.8em; display:none;"></div>
                        <div id="testResult"></div>
                    </div>                
                </div>       
            </form>
            <div id="result" style="display: none;"></div>
        </div>
        <div>
            <a href="logout.me"><div id="text4">로그인 페이지로 이동</div></a>
        </div>
    </div>    

<script>
    $(function() {
         
        // 사업자 등록 번호를 입력받는 input 요소 객체를 변수에 담아두기 => keyup 이벤트 걸기
        var $corpNoInput = $("#corpNo");
        
        var corpNo = document.getElementById("corpNo");
        var regExp = /^\d{3}-\d{2}-\d{5}$/;

        $corpNoInput.keyup(function() {
            
            // 우선 최소 12글자 이상으로 아이디값이 입력되어 있을 때만 ajax 요청
            // => 쿼리문의 갯수가 한정되어있을 수 있기 때문
            if($corpNoInput.val().length == 12) {
                
                if(!regExp.test(corpNo.value)) {
                    
                    // 빨간색 메세지 출력
                    $("#checkResult").show();
                    $("#checkResult").css("color", "red").text("올바르지 않은 형식 입니다. 다시 입력해주세요.");
                        
                    // 버튼 비활성화
                    $("#nextStep").attr("disabled", true);
                    $("#nextStep").css('backgroundColor', '#a7a7a7');
                    $("#nextStep").addClass("disabledBtn");
                    $("#nextStep").removeClass("enabledBtn");

                    return false;

                }   else {
                                
                        // 초록색 메세지 출력
                        $("#checkResult").show();
                        $("#checkResult").css("color", "green").text("아이디 찾기 버튼을 눌러주세요.");

                    $("#nextStep").removeAttr("disabled");
                    $("#nextStep").css('backgroundColor', '#323232');
                    $("#nextStep").addClass("enabledBtn"); // cursor : pointer css를 가진 class 추가
                    $("#nextStep").removeClass("disabledBtn"); // cursor : dafault css를 가진 class 삭제

                } 
                
            } else { // 12글자 미만일 때 => 버튼 비활성화, 메세지 내용 숨기기
                
                $("#checkResult").hide();
                $("#nextStep").attr("disabled", true);
                $("#nextStep").css('backgroundColor', '#a7a7a7');
                $("#nextStep").addClass("disabledBtn");
                $("#nextStep").removeClass("enabledBtn");
            }
            
        });

        // 아이디 찾기 결과 출력 ajax
        $("#nextStep").click(function() {

        	var corpNo = $("#corpNo").val();
        	
            $.ajax({
                url : "findId.me",
                data : {corpNo : corpNo},
				success : function(result) {
					
					$("#result").show();
					
					if(result != '') {
	                    $("#result").text("회원님의 아이디는 " + result + " 입니다.");
					} else {
						$("#result").html("해당 사업자 등록번호로 등록된 아이디가 없거나, <br> 이메일 인증이 안된 판매자입니다.");
					}
                    
					
				},
				error : function() {
					console.log("아이디 찾기용 ajax 통신 실패")
				}

            });

        });

    });
</script>

</body>
</html>