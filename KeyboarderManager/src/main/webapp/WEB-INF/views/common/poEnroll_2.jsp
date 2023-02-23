<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>K-MANAGER :: 회원가입</title>
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
    
        #termsContent {
            position: relative;
            left : 30%;
        }

        #termsContent div {
            position : relative;
            display : block;
        }

        input[type=checkbox] {
            width : 20px;
            height : 20px;
        }

        .termsText {
            margin-top : 15px;
            resize : none;
        }

        #text1 {
            font-size: 30px;
            font-weight: 540;
            top : 30px;
        }

        .termsarea {
            height : 170px;
            display: block;
        }

        .terms1{
            top : 60px;
            height : 85px;
            float : left;
            margin-right : 25px;
        }

        .terms2{
            top : 120px;
            height : 85px;
            float : left;
            margin-right : 25px;
        }

        label {
            position: relative;
            top : -4px;
            font-size: 17px;   
        }

		#agreeAll {
			position : relative;
			top : 185px;
			left : 800px;
		}

        #text2 {
            font-size: 30px;
            font-weight: 540;
            top : 190px;
        }

        #nextStep {
            position: relative;
            font-size : 20px;
            top : 300px;
            left : 350px;
            color : white;
            width: 250px;
            height: 50px;
            border-radius: 5px;
            border: none;
        }


        #corpNoArea {
            width : 50%;
            height : 48px;
            top : 230px;
            font-size: 16px;
            font-weight: 550;
            text-align: center;
            border: 1px solid rgb(66, 66, 66);
            border-radius: 3px;
        }

        #corpNoText {
            width : 15%;
            padding : 10px;
            padding-top : 13px;
            padding-bottom: 13px;
            background-color: lightgray;
        }

        #corpNoArea>div, #corpNoArea>input {
            float: left;
        }

        #corpNo {
            width : 30%;
            font-size: 17px;
            margin: 10px 0px 0px 15px;
        }

        #corpNoCheck {            
            font-size: 14px;
            margin : 10px 0px 0px 8px;
            width: 150px;
            height: 30px;
            border-radius: 5px;
            border: none;
        }

        #corpNoGuide {
            top : 250px;
        }

        .disabledBtn {
            background-color: #a7a7a7;
        }

        .enabledBtn {
            cursor : pointer;
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
        <form action="poEnrollForm.me">
        <div id="termsContent">
            <div id="text1">서비스 이용약관</div>
            <div class="termsarea">
                <div class="terms1">
                    <input type="checkbox" id="terms1" required><label for="terms1">키보더 이용약관</label><br>
                    <textarea class="termsText" cols="40" rows="10">
(주)키보더 이용약관
[제 1장 총칙]
제1조 (목적)
이 약관은 ㈜키보더(이하 "회사"라고 합니다)가 운영하는 인터넷사이트 및 오프라인 영업장을 통하여 제공하는 전자상거래 관련 서비스(이하 "서비스"라고 합니다)를 이용함에 있어 회사와 이용자의 권리, 의무 및 책임사항을 정하는 것을 목적으로 합니다.
제2조 (정의)
① "키보더"라 함은 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장(www.keyboarder.com)을 말하며, 아울러 사이버 몰을 운영하는 사업자의 의미로도 사용합니다.
② "이용자"라 함은 회사에 접속하여 이 약관에 따라 회사가 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
                    </textarea>
                </div>
                <div class="terms1">
                    <input type="checkbox" id="terms2" required><label for="terms2">키보더 개인정보 수집</label><br>
                    <textarea class="termsText" cols="40" rows="10">
키보더는 키보더회원에게 쇼핑 서비스와 회원관리서비스, 그리고 보다 다양한 서비스 제공을 위하여 아래와 같이 회원의 개인정보를 수집, 활용합니다.
* 본 수집동의서 상의 용어의 정의는 "키보더 이용약관 및 개인정보처리방침"에 준용하며 키보더 서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해주셔야만 서비스를 이용 하실 수 있습니다.                        
                    </textarea>
                </div>
                <div class="terms1">
                    <input type="checkbox" id="terms3" required><label for="terms3">오픈마켓 판매자 약관</label><br>
                    <textarea class="termsText" cols="40" rows="10">
(주)키보더 오픈마켓 판매자약관
제1조 (약관의 목적과 효력)
1. 이 약관은 ㈜키보더(쇼핑몰 사업부문 및 해외)(이하 "키보더(쇼핑몰 사업부문)"이라 합니다)가 인터넷사이트(http://www.keyboarder.com, 이하 "사이트"라 합니다)를 통하여 제공하는 키보더(쇼핑몰 사업부문) 오픈마켓 및 CBT서비스(이하 "오픈마켓"이라 합니다)를 이용함에 있어서 키보더(쇼핑몰 사업부문)과 오픈마켓 판매자간의 권리, 의무, 책임사항 및 서비스 이용절차에 관한 사항을 규정함을 목적으로 합니다.
2. 이 약관에 대한 동의는 그 당사자 상호 간의 날인에 의해 작성된 계약의 체결과 동일한 효력을 갖습니다.
3. 이 약관은 키보더(쇼핑몰 사업부문)과 판매자간에 성립되는 오픈마켓 서비스 이용계약의 기본 약정입니다. 키보더(쇼핑몰 사업부문)은 필요한 경우 특정 서비스에 관하여 적용될 사항(이하 "개별약관"이라고 합니다)을 정하여 미리 공지할 수 있습니다. 판매자가 이러한 개별약관에 동의하고 특정 서비스를 이용하는 경우에는 개별약관이 우선적으로 적용되고, 이 약관은 보충적인 효력을 갖습니다.                        
                    </textarea>
                </div>
            </div>
            <div class="termsarea">
                <div class="terms2">
                    <input type="checkbox" id="terms4" required><label for="terms4">판매자 개인정보 수집 및 이용안내</label><br>
                    <textarea class="termsText" cols="40" rows="10">
키보더 개인정보 수집 및 이용에 대한 안내
키보더는 판매자회원에게 판매활동과 관련한 서비스 제공을 위하여 아래와 같이 회원의 개인정보를 수집, 활용합니다.
* 본 수집동의서 상의 용어의 정의는 "키보더 이용약관 및 개인정보처리방침"에 준용하며 키보더 서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해주셔야만 서비스를 이용 하실 수 있습니다.                        
                    </textarea>
                </div>
                <div class="terms2">
                    <input type="checkbox" id="terms5" required><label for="terms5">전자금융거래 이용약관</label><br>
                    <textarea class="termsText" cols="40" rows="10">
(주)키보더 전자금융거래 이용약관
제1장 통칙
제1조 (목적)
본 약관은 주식회사 키보더 (이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스, 결제대금예치서비스 또는 선불식전자지급수단의 발행 및 관리 서비스(이하 통칭하여 '전자금융거래서비스'라 합니다)를 ‘이용자’가 이용함에 있어, ‘회사’와 ‘이용자’ 간 권리, 의무 및 ‘이용자’의 서비스 이용절차 등에 관한 사항을 정함에 그 목적이 있습니다.
제2조 (정의)
본 약관에서 정하는 용어의 정의는 다음과 같으며, 본 조에서 정한 것을 제외하고는 전자금융거래법 등 관련법령이 정한 바에 의합니다.
1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자금융업무를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
2. '전자지급거래'라 함은 자금을 주는 자(이하 '지급인'이라 합니다)가 회사로 하여금 전자지급수단을 이용하여 자금을 받는 자(이하 '수취인'이라 합니다)에게 자금을 이동하게 하는 전자금융거래를 말합니다.                        
                    </textarea>
                </div>
                <div class="terms2">
                    <input type="checkbox" id="terms6" required><label for="terms6">개인정보 수집 동의</label><br>
                    <textarea class="termsText" cols="40" rows="10">
키보더는 키보더회원에게 쇼핑 서비스와 회원관리서비스, 그리고 보다 다양한 서비스 제공을 위하여 아래와 같이 회원의 개인정보를 수집, 활용합니다.
* 본 수집동의서 상의 용어의 정의는 "키보더 이용약관 및 개인정보처리방침"에 준용하며 키보더 서비스 제공을 위해서 필요한 최소한의 개인정보이므로 동의를 해주셔야만 서비스를 이용 하실 수 있습니다.                                          
                    </textarea>
                </div>
            </div>
                <div id="agreeAll">
		             <label for="agree_all">
		                 <input type="checkbox" name="agree_all" id="agree_all">
		                 <span>모두 동의</span>
	                </label>
	            </div>            
	            <div id="text2">실명 및 가입 여부 확인</div>
	            <div id="corpNoArea">
	                <div id="corpNoText">사업자 등록번호</div>
	                <input type="text" id="corpNo" name="corpNo" minlength="12" maxlength="12" placeholder="-포함">
	                <input type="button" id="corpNoCheck" value="사업자 번호 인증">
	            </div>
	            <div id="corpNoGuide">
	                * 동일한 판매자의 중복 상품 등록 남용, 판매자 등급별 상품등록 수량 제한규정 우회 등의 악용 사례를 막기 위해 <br>
	                현재 키보더 판매자 관련 정책상 이미 가입한 것으로 판단되는 판매자는 사업자번호가 다르더라도 추가 입점이 제한될 수 있습니다.
	            </div>
	            <button type="subtmit" id="nextStep" class="disabledBtn" disabled>다음단계로 넘어가기</button>

        	</div>
        </form> 
    </div>

    <script>
	    // 체크박스 동의 모두선택 / 해제
	    const agreeChkAll = document.querySelector('input[name=agree_all]');
	    agreeChkAll.addEventListener('change', (e) => {
	        let agreeChk = document.querySelectorAll('input[type=checkbox]');
	        for(let i = 0; i < agreeChk.length; i++){
	        agreeChk[i].checked = e.target.checked;
	        }
	    });
    
	    /*
        $("#corpNoCheck").click(function() {
            
                var corpNo = document.getElementById("corpNo");
                        
                // 사업자 등록번호 정규식 영문자, 숫자로만 총 7 ~ 20자로 이루어지게
                var regExp = /^\d{3}-\d{2}-\d{5}$/;
                if(!regExp.test(corpNo.value)) {
                    alert("올바른 형식의 사업자 등록 번호가 아닙니다.");
                    corpNo.select(); // 재입력 유도

                        // 버튼 비활성화
                        $("#nextStep").attr("disabled", true);
                        $("#nextStep").css('backgroundColor', '#a7a7a7');
                        $("#nextStep").addClass("disabledBtn");
                        $("#nextStep").removeClass("enabledBtn");

                    return false;
                }   else {
                    
                    alert("인증되었습니다.");

                    $("#nextStep").removeAttr("disabled");
                    $("#nextStep").css('backgroundColor', '#323232');
                    $("#nextStep").addClass("enabledBtn"); // cursor : pointer css를 가진 class 추가
                    $("#nextStep").removeClass("disabledBtn"); // cursor : dafault css를 가진 class 삭제
                }
            }
        );
	    */
	    
        // 사업자 등록 번호 중복 체크 결과 출력 ajax
        $("#corpNoCheck").click(function() {

        	var corpNo = document.getElementById("corpNo");
            // 사업자 등록번호 정규식 영문자, 숫자로만 총 7 ~ 20자로 이루어지게
            var regExp = /^\d{3}-\d{2}-\d{5}$/;
        	
            $.ajax({
                url : "corpNoCheck.me",
                data : {corpNo : corpNo.value},
				success : function(result) {
					
	                if(!regExp.test(corpNo.value)) { // 양식이 안 맞을때
	                	
	                    alert("올바른 형식의 사업자 등록 번호가 아닙니다.");

	                        // 버튼 비활성화
	                        $("#nextStep").attr("disabled", true);
	                        $("#nextStep").css('backgroundColor', '#a7a7a7');
	                        $("#nextStep").addClass("disabledBtn");
	                        $("#nextStep").removeClass("enabledBtn");

	                    return false;
	                    
	                }   else { // 양식은 맞을때
	                    
	                	if(result == "NNNNN") { // 중복일 때
	                		
		                   	alert("이미 존재하는 사업자 등록 번호입니다.");
		                    
	                        // 버튼 비활성화
	                        $("#nextStep").attr("disabled", true);
	                        $("#nextStep").css('backgroundColor', '#a7a7a7');
	                        $("#nextStep").addClass("disabledBtn");
	                        $("#nextStep").removeClass("enabledBtn");
	                        
	                	} else { // 중복이 아닐 때
	                		
		                    alert("사업자 등록 번호 인증완료");

		                    // 버튼 활성화
		                    $("#nextStep").removeAttr("disabled");
		                    $("#nextStep").css('backgroundColor', '#323232');
		                    $("#nextStep").addClass("enabledBtn"); // cursor : pointer css를 가진 class 추가
		                    $("#nextStep").removeClass("disabledBtn"); // cursor : dafault css를 가진 class 삭제
	                		
	                	}

	                }
					
				},
				error : function() {
					console.log("사업자 등록 번호 중복 체크용 ajax 통신 실패")
				}

            });

        });
        
    </script>

</body>
</html>