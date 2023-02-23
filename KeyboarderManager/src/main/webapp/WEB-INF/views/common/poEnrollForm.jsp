<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String corpNo = (String)session.getAttribute("corpNo"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 회원가입</title>

    <!--부트스트랩-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <style>
        #enrollHeader {
            width : 100%;
            height : 8%;
            font-size: 30px;
        }

        #enrollHeader div{
            float : left;
            position: relative;
            left : 500px;
        }

        #login_text1 {
            font-weight: 600;
        }

        #headerHr {
            position: relative;
            top : 60px;
        }

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
    <div id="enrollHeader">
        <div id="login_text1">KEYBOAR</div>
        <div id="login_text2">-DER 판매자매니저</div> 
    </div>
    <hr id="headerHr">

    <br><br><br>
    <div id="enroll">
        <h4>판매자 회원가입</h4>
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
            <form id="signup-form" action="insert.me" method="post" enctype="multipart/form-data">
                <table>
                    <tr>
                        <th width="130px"> 아이디 *</th>
                        <td colspan="3"><input type="text" class="form-control" id="sellerId" name="sellerId" minlength="7" maxlength="20" placeholder="띄어쓰기 없는 영문,숫자 7~20자" required ></td>
                        <td width="130px" align="center"><button type="button" id="checkbutton" style="width:106px;" class="btn btn-dark" onclick="idCheck();">중복체크</button></td>
                    </tr>
                    <tr>
                        <th> 비밀번호 *</th>
                        <td colspan="3"><input type="password" class="form-control" id ="sellerPwd" name="sellerPwd" minlength="12" maxlength="20" placeholder="영문,숫자,특수문자 12~20자" required></td>
                    </tr>
                    <tr>
                        <th> 비밀번호 확인 *</th>
                        <td  colspan="3"><input type="password" class="form-control" id="checkPwd" name="" minlength="12" maxlength="20"  placeholder="영문,숫자,특수문자 12~20자"></td>
                        <!-- 서버로 넘기지는 않을것이기 때문에 name 속성은 생략 -->
                    </tr>
                    <tr>
                        <th> 업체명 *</th>
                        <td  colspan="3"><input type="text" class="form-control" id="sellerName" name="sellerName" required></td>
                    </tr>
                    <tr>
                        <th> 대표자명 *</th>
                        <td  colspan="3"><input type="text" class="form-control" id="repName" name="repName" minlength="2" maxlength="10" placeholder="띄어쓰기없는 한글 2~6자" required></td>
                    </tr>
                    <tr>
                        <th> 전화번호 *</th>
                        <td colspan="3"><input type="text" class="form-control" id="sellerPhone" name="sellerPhone" minlength="11" maxlength="13" placeholder="-포함" required></td>
                    </tr>
                    <tr>
                        <th> 이메일 *</th> <!-- 이메일 선택해서 인풋에 넣기 -->
                        <td colspan="3">
                            <input type="email" id="sellerEmail" name= "sellerEmail" class="form-control" required>
                        </td>
                    </tr>
                    <tr>
                        <th> 사업자등록번호 *</th>
                        <td  colspan="3"><input type="text" class="form-control" id="corpNo" name="corpNo" value="<%= corpNo %>" readonly required></td>
                    </tr>
                    <tr>
                        <th> 계좌번호 *</th>
                        <td  colspan="3"><input type="text" class="form-control" id="accountNo" name="accountNo" placeholder="- 포함" required></td>
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
                        <th> 본사소재지 *</th>
                        <td  colspan="3"><input type="text" class="form-control" name="address1" id="sample6_address" placeholder="주소" style="width:300px;" required></td>
                    </tr>
                    <tr>
                        <th> 상세주소</th>
                        <td colspan="4">
                            <input type="text" class="form-control" name="address2" id="sample6_detailAddress" placeholder="상세주소" style="width:300px; display:inline-block;" required>
                            <input type="text" class="form-control" id="sample6_extraAddress" style="width:150px; display:inline-block;" placeholder="참고항목">
                            <input type="hidden" id="location" name="location" value="" />
                        </td>
                    </tr>                    
                    <tr>
                        <th> 로고 </th>
                        <td  colspan="3">
                        	<img src="resources/images/basicLogo.png" id="logoPreview" width="250"> <br>
                        	<input type="file" id="logoFile" name="logoFile"><br>
                        	<input type="button" id="resetFile" name="resetFile" value="초기화">
                        </td>
                    </tr>                    
                </table>

                <script>
                    function idCheck() {
                        
                        // 아이디 중복체크 전 유효성 검사 들어감
                        var sellerId = document.getElementById("sellerId");
                        
                        // 아이디를 입력하는 input 요소 객체
                        var $sellerId = $("#signup-form input[name=sellerId]");
                        // name 속성이 userId 인 요소가 menubar.jsp 에도 있기 때문에
                        // 확실하게 어디에 속해있는 요소인지 잘 적어둬야함               
                        
                            
                            $.ajax({
                                url : "idCheck.me",
                                data : {checkId : $sellerId.val()},
                                success : function(result) {
                                    
                                    // result 의 값은 "NNNNN" 또는 "NNNNY" 가 담겨있음
                                    if(result == "NNNNN") { // 사용 불가
                                        
                                        alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
                                        $sellerId.focus(); // 재입력 유도
                                    } else { // 사용 가능
                                        
                                        if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")) { // 사용하겠다.
                                            
                                            // 아이디값 확정 => 다시 수정 못하게 readonly 속성 추가
                                            $sellerId.attr("readonly", true);
                                            
                                            // 회원가입버튼 활성화
                                            $("#signup-form button[type=submit]").removeAttr("disabled");
                                            
                                        } else { // 사용하지 않겠다.
                                            
                                            // 재입력 유도
                                            $sellerId.focus();
                                        }
                                    }
                                }, 
                                error : function() {
                                    console.log("아이디 중복체크용 ajax 통신 실패!");
                                }
                            });	                    	
                        
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
                    <button type="submit" id="enroll-btn" onclick="return validate();  " disabled>가입하기</button>
                </div>
                <br>
            </form>

            <script>
                function validate() {
                    
                    var sellerPwd = document.getElementById("sellerPwd");
                    var checkPwd = document.getElementById("checkPwd");
                    var ceoName = document.getElementById("ceoName");
                    var sellerPhone = document.getElementById("sellerPhone");
                    var corpNo = document.getElementById("corpNo");
                    var accountNo = document.getElementById("accountNo");
                    
                    // 비밀번호 정규식
                    // 영문자, 숫자, 특수문자(!@#$%^&*()) 로 총 12~20 자 로 이루어져야함
                    regExp = /^[a-z\d!@#$%^&*()]{12,20}$/i;
                    if(!regExp.test(sellerPwd.value)) {
                        alert("비밀번호를 영문자,숫자,특수문자로 총 12~20자로 입력해주세요.");
                        sellerPwd.value = "";
                        sellerPwd.focus(); // 재입력 유도
                        return false;
                    }
                    
                    // 비밀번호 유효성 검사
                    if($("input[name=selelrPwd]").val() != $("input[name=checkPwd]").val()) {
                        alert("비밀번호가 일치하지 않습니다.");
                        checkPwd.select(); // 재입력 유도
                        return false;
                    }
                    
                    // 대표자명 검사 2~6자리 한글만 들어갈수 있게
                    regExp = /^[가-힣]{2,10}$/;
                    if(!regExp.test(ceoName.value)) {
                        alert("한글로 된 2~6자리 이름을 입력해주세요.");
                        ceoName.select(); // 재입력 유도
                        return false;
                    }
                    
                    // 전화 번호 정규식
                    var regExp = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;
                    if(!regExp.test(sellerPhone.value)) {
                        alert("-포함 유효한 전화번호를 입력해주세요.");
                        sellerPhone.select(); // 재입력 유도
                        return false;
                    }

                    // 사업자 등록 번호 정규식
                    var regExp = /^\d{3}-\d{2}-\d{5}$/;
                    if(!regExp.test(corpNo.value)) {
                        alert("-포함 유효한 사업자 등록 번호를 입력해주세요.");
                        corpNo.select(); // 재입력 유도
                        return false;
                    }
                    
                    // 계좌번호 정규식
                    var regExp = /^\d{3,}-\d{2,}-\d{6,}$/;
                    if(!regExp.test(accountNo.value)) {
                        alert("-포함 유효한 계좌번호 번호를 입력해주세요.");
                        accountNo.select(); // 재입력 유도
                        return false;
                    }
                } 
            </script>
            
            <script>
                // 주소 값 합쳐서 한번에 넘기기
                $(function() {
                    $("#enroll-btn").click(function() {
                        var address = $("#sample6_postcode").val() + " " + $("#sample6_address").val() + $("#sample6_detailAddress").val();
                        $("#location").val(address);
                    });
                });
            </script>
                       
            <script>
	            $("#logoFile").on("change", function(event) { // 로고 파일 업로드 시 미리보기
	
	                var file = event.target.files[0];
	
	                var reader = new FileReader(); 
	                reader.onload = function(e) {
	
	                    $("#logoPreview").attr("src", e.target.result);
	                }
	
	                reader.readAsDataURL(file);
	                
	   	     	    // 확장자가 이미지 파일인지 확인
		            function isImageFile(file) {

		              	  var ext = file.name.split(".").pop().toLowerCase(); // 파일명에서 확장자를 가져온다. 

		             	  return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
		           	 }
	   	     	    
		            // 파일의 최대 사이즈 확인
		            function isOverSize(file) {

		            	  var maxSize = 3 * 1024 * 1024; // 3MB로 제한 

		            	  return (file.size > maxSize) ? true : false;
		            }
	            });
            
				$("#resetFile").click(function() {
					
					$("#logoPreview").attr("src", "");
					$("#logoFile").val("");
					
				});
	            
            </script>
            
        </div>
        <br>
    </div>
</body>
</html>