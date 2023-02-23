<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KEYBOAR-DER</title>

    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style>
        #header { width : 1900px; margin-top : 20px;} 
        #enroll { margin : auto; width : 1100px; }
        #signup-form { 
            width : 90%;
            margin-top : 30px;
        }

        button[class*=btn-dark] {
            background-color: black;
        }

        /*간격*/
        table tr {
            height : 60px;
        }

        #enroll-form {
            border : 2px solid black;
            height : 80%;
            border-radius: 10px;
        }
        /*가입버튼*/
        #enroll-btn {
            background-color: black;
            color : white;
            border-radius: 5px;
            width : 150px;
            height : 40px;
        }
    </style>
</head>

<!-- 우편번호 검색을 위한 API-->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<body>
	<div id="header">
        <h1><a href="/keyboarder" style="color:black; text-decoration : none;">&nbsp;&nbsp;KEYBOAR-DER</a></h1>
    <hr>
    </div>
    <br><br>

    <div id="enroll">
        <h4>회원가입</h4>
        <hr>
        <br>
        <h5>회원정보입력</h5>
        <br>
        <p>
            * 표시 항목은 필수 입력사항입니다.<br>
            &nbsp;&nbsp;정확한 정보를 입력해주시기 바랍니다.
        </p>
        <br>

        <div id="enroll-form" align="center">
            <form id="signup-form" action="insert.me" method="post">
                <table>
                    <tr>
                        <th width="130px"> 아이디 *</th>
                        <td colspan="3"><input type="text" class="form-control" id="memId" name="conId" minlength="7" maxlength="20" placeholder="띄어쓰기 없는 영문,숫자 7~20자" required ></td>
                        <td width="140px" align="center"><button type="button" id="checkbutton" style="width:130px; height:40px; font-size: 85%; margin-left:10px;" class="btn btn-dark" onclick="idCheck();">아이디 중복체크</button></td>
                    </tr>
                    <tr>
                        <th> 비밀번호 *</th>
                        <td colspan="3"><input type="password" class="form-control" id ="memPwd" name="conPwd" minlength="12" maxlength="20" placeholder="영문,숫자,특수문자 12~20자" required></td>
                    </tr>
                    <tr>
                        <th> 비밀번호 확인 *</th>
                        <td  colspan="3"><input type="password" class="form-control" id="checkPwd" name="" minlength="12" maxlength="20"  placeholder="영문,숫자,특수문자 12~20자"></td>
                        <!-- 서버로 넘기지는 않을것이기 때문에 name 속성은 생략 -->
                    </tr>
                    <tr>
                        <th> 이름 *</th>
                        <td  colspan="3"><input type="text" class="form-control" id="memName" name="conName" minlength="2" maxlength="6" placeholder="띄어쓰기없는 한글 2~6자" required></td>
                    </tr>
                    <tr>
                        <th> 전화번호 *</th>
                        <td colspan="3"><input type="text" class="form-control" id="phone" name="conPhone" minlength="13" maxlength="13" placeholder="-포함" required></td>
                    </tr>
                    <tr>
                        <th> 이메일 *</th> <!-- 이메일 선택해서 인풋에 넣기 -->
                        <td colspan="3">
                            <input type="text" id="email_id" name= "email_id" class="form-control" maxlength="18" value="" style="width:150px; display:inline-block;" required> &nbsp;@&nbsp;
                            <select class="custom-select" id="domain" name="emailAno" title="이메일 도메인 주소 선택" style="width:140px; vertical-align:top; display:inline-block;" required>
                                <option>선택</option>
                                    <option value="naver.com">naver.com</option>
                                    <option value="gmail.com">gmail.com</option>
                                    <option value="hanmail.net">hanmail.net</option>
                                    <option value="nate.com">nate.com</option>
                            </select>
                            <td align="center"><button type="button" id="checkbutton" style="width:130px; height:40px; font-size: 85%; margin-left:10px;" class="btn btn-dark" onclick="emailCheck();">이메일 중복체크</button></td>
                            <input type="hidden" name="conEmail" id="conEmail" value="">
                        </td>
                    </tr>
                    <tr>
                        <th> 우편번호 *</th>
                        <td colspan="3">
                            <input type="text" class="form-control" name="zip" id="sample6_postcode" maxlength="5" placeholder="우편번호" style="width:154px; display:inline-block;" required>&nbsp;&nbsp;&nbsp;
                            <input type="button" name="address_search" class="btn btn-dark" style="display:inline-block;  vertical-align: top; background-color: black;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <th> 주소 *</th>
                        <td  colspan="3"><input type="text" class="form-control" name="address1" id="sample6_address" placeholder="주소" style="width:300px;" required></td>
                    </tr>
                    <tr>
                        <th> 상세주소</th>
                        <td colspan="4">
                            <input type="text" class="form-control" name="address2" id="sample6_detailAddress" placeholder="상세주소" style="width:300px; display:inline-block;" required>
                            <input type="text" class="form-control" id="sample6_extraAddress" style="width:150px; display:inline-block;" placeholder="참고항목">
                        </td>
                    </tr>
                    <input type="hidden" id="address" name="address" value="" />
                </table>

                <script>
                    function idCheck() {
                        
                        // 아이디 중복체크 전 유효성 검사 들어감
                        var memId = document.getElementById("memId");
                        
                        // 아이디를 입력하는 input 요소 객체
                        var $memId = $("#signup-form input[name=conId]");
                        // name 속성이 userId 인 요소가 menubar.jsp 에도 있기 때문에
                        // 확실하게 어디에 속해있는 요소인지 잘 적어둬야함
                        
                        var regExp = /^[a-z\d]{7,20}$/i;
                        if(!regExp.test(memId.value)) {
                            alert("아이디를 영문자, 숫자로만 총 7~20자로 입력해주세요.");
                            memId.select(); // 재입력 유도
                            return false;
                        }
                        
                        else {
                            
                            $.ajax({
                                url : "idCheck.me",
                                data : {checkId : $memId.val()},
                                success : function(result) {
                                    
                                    // result 의 값은 "NNNNN" 또는 "NNNNY" 가 담겨있음
                                    if(result == "NNNNN") { // 사용 불가
                                        
                                        alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
                                        $memId.focus(); // 재입력 유도
                                    } else { // 사용 가능
                                        
                                        if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) { // 사용하겠다.
                                            
                                            // 아이디값 확정 => 다시 수정 못하게 readonly 속성 추가
                                            $memId.attr("readonly", true);
                                            
                                            // 회원가입버튼 활성화
                                            $("#signup-form button[type=submit]").removeAttr("disabled");
                                            
                                        } else { // 사용하지 않겠다.
                                            
                                            // 재입력 유도
                                            $memId.focus();
                                        }
                                    }
                                }, 
                                error : function() {
                                    console.log("아이디 중복체크용 ajax 통신 실패!");
                                }
                            });	                    	
                        }
                    }
                </script>
                
                <script>
                    function emailCheck() {
                        var conEmail = "" + $("#email_id").val() + "@" + $("#domain option:selected").val();
                        $("#conEmail").val(conEmail);

                        var $conEmail = $("#signup-form input[name=conEmail]");
                        var $emailId = $("#signup-form input[name=email_id]");
                        var $domain = $("#signup-form input[name=emailAno]");
                        // 이메일 정규식 
                        // 이메일시작은 숫자나 알파벳으로 시작됨
                        // 이메일 첫째자리 뒤에는 _- 포함할 수 있음.
                        var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

                        if(!regExp.test($("#conEmail").val())) {
                            alert("유요한 이메일을 입력해주세요.");
                            $("#conEmail").select(); //재입력유도
                            return false;
                        }
                        else {
                            $.ajax({
                                url :"emailCheck.me",
                                data : {checkEmail : conEmail},
                                success : function(result) {
                                    //result 값은 "NNNNN"또는 "NNNNY"가 담겨있음
                                    if(result==="NNNNN") { // 사용불가
                                        alert("이미 존재하거나 탈퇴한 회원의 이메일주소입니다.");
                                        $emailId.focus(); // 재입력유도
                                    } else{
                                        if(confirm("사용가능한 이메일입니다. 사용하시겠습니까?")) { //사용하겠다.
                                            //이메일값 확정 => 다시 수정못하게 readonly 속성 추가
                                            $emailId.attr("readonly", true);
                                            $domain.attr("readonly",true);

                                            // 회원가입버튼 활성화
                                            $("#signup-form button[type=submit]").removeAttr("disabled");
                                        } else {
                                            $emailId.focus();
                                        }
                                    }
                                }, 
                                error : function() {
                                    console.log("이메일중복체크용 ajax통신실패!");
                                }
                            });
                        }
                    }

                </script>


                
                <script>
                    function sample6_execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                
                                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                var addr = ''; // 주소 변수
                                var extraAddr = ''; // 참고항목 변수
                
                                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                    addr = data.roadAddress;
                                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                    addr = data.jibunAddress;
                                }
                
                                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                if(data.userSelectedType === 'R'){
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                        extraAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraAddr !== ''){
                                        extraAddr = ' (' + extraAddr + ')';
                                    }
                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                    document.getElementById("sample6_extraAddress").value = extraAddr;
                                
                                } else {
                                    document.getElementById("sample6_extraAddress").value = '';
                                }
                
                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('sample6_postcode').value = data.zonecode;
                                document.getElementById("sample6_address").value = addr;
                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById("sample6_detailAddress").focus();
                            }
                        }).open();
                    }
                </script>

                <br>
                <div align="center">
                    <button type="submit" id="enroll-btn" onclick="return validate();" disabled>가입하기</button>
                </div>
                <br>
            </form>

            <script>
                function validate() {
                    
                    var memId = document.getElementById("memId");
                    var memPwd = document.getElementById("memPwd");
                    var checkPwd = document.getElementById("checkPwd");
                    var memName = document.getElementById("memName");
                    var phone = document.getElementById("phone");
                    
                    // 아이디 정규식 영문자, 숫자로만 총 7 ~ 20자로 이루어지게
                    var regExp = /^[a-z\d]{7,20}$/i;
                    if(!regExp.test(memId.value)) {
                        alert("아이디를 영문자, 숫자로만 총 7~20자로 입력해주세요.");
                        memId.select(); // 재입력 유도
                        return false;
                    }
                    
                    // 비밀번호 정규식
                    // 영문자, 숫자, 특수문자(!@#$%^&*()) 로 총 12~20 자 로 이루어져야함
                    regExp = /^[a-z\d!@#$%^&*()]{12,20}$/i;
                    if(!regExp.test(memPwd.value)) {
                        alert("비밀번호를 영문자,숫자,특수문자로 총 12~20자로 입력해주세요.");
                        memPwd.value = "";
                        memPwd.focus(); // 재입력 유도
                        return false;
                    }
                    
                    // 비밀번호 유효성 검사
                    if($("input[name=memPwd]").val() != $("input[name=checkPwd]").val()) {
                        alert("비밀번호가 일치하지 않습니다.");
                        checkPwd.select(); // 재입력 유도
                        return false;
                    }
                    
                    // 이름검사 2~6자리 한글만 들어갈수 있게
                    regExp = /^[가-힣]{2,6}$/;
                    if(!regExp.test(memName.value)) {
                        alert("한글로 된 2~6자리 이름을 입력해주세요.");
                        memName.select(); // 재입력 유도
                        return false;
                    }
                    
                    // 휴대폰 번호 정규식
                    var regExp = /^(010)-[0-9]{4}-[0-9]{4}$/;
                    if(!regExp.test(phone.value)) {
                        alert("-포함 유효한 전화번호를 입력해주세요.");
                        phone.select(); // 재입력 유도
                        return false;
                    }
                }
            </script>
            
            <script>
                // 주소, 이메일 값 합쳐서 한번에 넘기기
                $(function() {
                    $("#enroll-btn").click(function() {
                        var address = "(" + $("#sample6_postcode").val() +")"+ " "+ $("#sample6_address").val() + $("#sample6_detailAddress").val();
                        $("#address").val(address);
                        //console.log($("#address").val);
                        var conEmail = "" + $("#email_id").val() + "@" + $("#domain option:selected").val();
                        $("#conEmail").val(conEmail);
                    });
                });
            </script>
        </div>
        <br>
    </div>
</body>
</html>