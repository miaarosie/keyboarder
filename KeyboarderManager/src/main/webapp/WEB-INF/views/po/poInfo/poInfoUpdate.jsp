<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>K-MANAGER :: 판매자 정보 수정</title>        
    <!-- jquery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 우편번호 검색을 위한 API-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>    
    <style>
        #wrap {
            /* width : 1100px; */
            height : 500px;
            margin-left : 300px;        
        }
    
    	.content {
    		/* width : 1100px; */
    		height : 500px;
    		padding : 0px;
    	}
    	
    	#updateContent {
    		
    		/* width : 1100px; */
    		height : 500px;
    	}
    
		#poInfo {
			margin-top : -20px;
			padding: 10px;
		}

        #text1 {
            font-size: 30px;
            font-weight: 540;
        }
       
        #textAndButtons{
            width : 100%;
        }


        #buttons {
            position: relative;
            left : 880px;
            top : -50px;
            width: 200px;
        }

        #buttons button {
            margin-top: 10px;
            font-size: 16px;
            border-radius: 3px;
        }
        
        #infoTable {
            width : 100%;
            /* border: 1px solid #444444; */
            border-collapse: collapse;        
        }

        th{
            text-align: left;
            padding: 18px 0px 18px 20px;
            font-size: 14px;
            font-weight : 540;
            width : 30%;
        }

         .td {
            border-bottom: 1px solid #444444;
         }

         td{
            font-size : 14px;
            font-weight: 540;
            padding-left : 50px;
         }
         
         input {
         	font-size : 15px;
         }
         
        .disabledBtn {
            cursor : default;
            background-color: #a7a7a7;
        }

        .enabledBtn {
            cursor : pointer;
            background-color: #323232;
            color : white;
        }
        
        input[type=text] {
        	border-radius : 3px;
        } 
        
        #email1 {
        	background-color : white;        	
        }
        #email2 {
        	bakcground-color : white;
        }
    </style>
</head>
<body class="hold transition sidebar-mini">

   	<jsp:include page="../../common/poheader.jsp" />

	<jsp:include page="../../common/posidebar.jsp" />
    
    <div class="content-wrapper">
    <div id="wrap" style="width:1100px; height: 700px;">
	
		<div class="content">

        <form action="updateInfo.po" style="width:1100px; height: 700px; margin-left:0px; min-height:700px;">
            <div id="updateContent">
                <div id="textAndButtons">
                    <div id="text1"  style="padding-top: 30px;">판매자 정보 수정</div>
                    <div id="buttons">
                        <button type="submit" id="updateButton" name="updateButton" class="disabledBtn btn btn-dark" disabled>수정하기</button>&nbsp;
                        <button type="button" id="secessionButton" class="btn btn-warning">탈퇴하기</button>
                    </div>                    
                </div>
                <div id="poInfo"  class="card">
                    <table id="infoTable">
                        <tr>
                            <th class="td">상호명 <h6 style="display: inline; color : red;">*</h6></th>                    
                            <td class="td">
                            	${ loginUser.sellerName }
                            	<input type="hidden" id="sellerName" name="sellerName" value="${ loginUser.sellerName }">
                            </td>
                        </tr>
                        <tr>
                            <th class="td">사업자 등록번호 <h6 style="display: inline; color : red;">*</h6></th>
                            <td id="corpNo" class="td">${ loginUser.corpNo }</td>
                        </tr>
                        <tr>
                            <th class="td">대표자명 <h6 style="display: inline; color : red;">*</h6></th>
                            <td class="td">
                                <input type="text" id="updateRepName" name="updateRepName" value="${ loginUser.repName }"  class="col-sm-3 form-control">
                            </td>
                        </tr>
                        <tr>
                            <th class="td">판매자 아이디 <h6 style="display: inline; color : red;">*</h6></th>
                            <td id="sellerId" class="td">${ loginUser.sellerId }</td>
                        </tr>
                        <tr>
                            <th class="td">업체 서류 인증일 <h6 style="display: inline; color : red;">*</h6></th>
                            <td class="td">${ loginUser.joinDate }</td>
                        </tr>
                        <tr>
                            <th style="border:none;" class="td">본사 소재지(기존 주소) <h6 style="display: inline; color : red;">*</h6></th>
                            <td style="border:none; font-size:14px;" class="td">${ loginUser.location }</td>
                        </tr>
                        <tr>
                        	<th style="border:none; text-align: center;" class="td">우편번호 <h6 style="display: inline; color : red;">*</h6></th>
                        	<td style="border:none;" class="td">
                        	<input type="text" class="form-control" name="zip" id="sample6_postcode" maxlength="5" placeholder="우편번호" style="width:154px; display:inline-block;" required>&nbsp;&nbsp;&nbsp;
                            <input type="button" id="findPostCode" name="address_search" class="btn btn-dark" style="display:inline-block;  vertical-align: top; background-color: black;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                        	</td>
                        </tr>
                        <tr>
                        	<th style="text-align: center;" class="td">상세주소 <h6 style="display: inline; color : red;">*</h6></th>
                        	<td style="padding-bottom:22px;" class="td">
                        	<input type="text" class="form-control" name="address1" id="sample6_address" placeholder="주소" style="width:300px;" required>
                       	    <input type="text" class="form-control" name="address2" id="sample6_detailAddress" placeholder="상세주소" style="width:300px; display:inline-block;" required>
                            <input type="text" class="form-control" id="sample6_extraAddress" style="width:150px; display:inline-block;" placeholder="참고항목">
                            <input type="hidden" id="updateLocation" name="updateLocation" value="" />
                            <input type="button" id="confirmLocation" class="btn btn-dark" value="주소 확정" style="width:100px; height:40px;  margin-left:10px;">
                       </td>                       
                        </tr>
                        <tr>
                            <th style="border:none;" class="td">판매자 연락처 <h6 style="display: inline; color : red;">*</h6></th>
                            <td style="border:none;" class="td">
                            </td>
                        </tr>
                        <tr>
                            <th style="border:none; text-align: center;" class="td">이메일 <h6 style="display: inline; color : red;">*</h6></th>
                            <td style="border:none;" class="td">
                            	<input type="hidden" id="sellerEmail" value="${ loginUser.sellerEmail }">
                                <input type="text" id="email1" name="email1" style="width:200px; display:inline-block;" class="col-sm-3 form-control"> @
                                <input type="text" id="email2" name="email2" style="width:200px; display:inline-block;" class="col-sm-3 form-control">
                                <input type="hidden" name="updateSellerEmail" id="updateSellerEmail" value="">
                                <button type="button" id="checkbutton" style="width:100px; height:40px; margin-left:10px;" class="btn btn-dark" onclick="emailCheck();">중복체크</button>
                            </td>
                        </tr>
                        <tr>
                            <th style="text-align:center;" class="td">전화번호 <h6 style="display: inline; color : red;">*</h6></th>
                            <td class="td">
                                <input type="text" id="updateSellerPhone" name="updateSellerPhone" value="${ loginUser.sellerPhone }"  class="col-sm-3 form-control">
                            </td>
                        </tr>
                        <tr>
                            <th>계좌번호 <h6 style="display: inline; color : red;">*</h6></th>
                            <td>
                                <input type="text" id="updateAccountNo" name="updateAccountNo" style="width:400px;" placeholder=" - 포함" value="${ loginUser.accountNo }"   class="col-sm-3 form-control">
                            </td>
                        </tr>
                    </table>
                </div>             
            </div>
           	<script>

			</script>	
        </form>
    </div>    
</div>
</div>
	<script>
		$(function() {
			
			// 이메일 칸 채우기
			var sellerEmail = $("#sellerEmail").val();
			
			var atIndex = sellerEmail.indexOf("@");
			
			var email1 = sellerEmail.substring(0, atIndex);
			var email2 = sellerEmail.substring(atIndex + 1);
			
			$("#email1").val(email1);
			$("#email2").val(email2);
			
		})
		
		// 이메일 중복 및 유효성 검사
        function emailCheck() {
			// 기존 이메일 가져오기
			var sellerEmail = $("#sellerEmail").val();		

			var updateSellerEmail = "" + $("#email1").val() + "@" + $("#email2").val();
			
            var $email1 = $("input[name=email1]");
            var $email2 = $("input[name=email2]");
            
            // 이메일 정규식 
            // 이메일시작은 숫자나 알파벳으로 시작됨
            // 이메일 첫째자리 뒤에는 _- 포함할 수 있음.
            var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

            if(!regExp.test(updateSellerEmail)) {
                alert("유효한 이메일을 입력해주세요.");
                $("#email2").select(); //재입력유도
                return false;
            }
            else {
            	if(updateSellerEmail == sellerEmail) {
            		
            		if(confirm("기존 이메일 주소를 사용하시겠습니까?")){
                        //이메일값 확정 => 다시 수정못하게 readonly 속성 추가
                        $("input[name=email1]").attr("readonly", true);
                        $("input[name=email2]").attr("readonly", true);
                        
                        $("input[name=email1]").css("backgroundColor", "lightgray");
                        $("input[name=email2]").css("backgroundColor", "lightgray"); 
                        
                		// 수정하기버튼 활성화
                        $("button[name=updateButton]").removeAttr("disabled");
                        $("button[name=updateButton]").addClass("enabledBtn");
                        $("button[name=updateButton]").removeClass("disabledBtn");
                		            		                    
                        $("#updateSellerEmail").val(updateSellerEmail);
            		}
                    
            	} else {
                    $.ajax({
                        url :"emailCheck.me",
                        data : {checkEmail : updateSellerEmail},
                        success : function(result) {
                            //result 값은 "NNNNN"또는 "NNNNY"가 담겨있음
                            if(result==="NNNNN") { // 사용불가
                                alert("이미 존재하거나 탈퇴한 회원의 이메일주소입니다.");
                                $email1.focus(); // 재입력유도
                            } else{
                                if(confirm("사용가능한 이메일입니다. 사용하시겠습니까?")) { //사용하겠다.
                                    //이메일값 확정 => 다시 수정못하게 readonly 속성 추가
                                    $("input[name=email1]").attr("readonly", true);
                                    $("input[name=email2]").attr("readonly",true);

                                    $("input[name=email1]").css("backgroundColor", "lightgray");
                                    $("input[name=email2]").css("backgroundColor", "lightgray");                                   
                                    
                              		// 수정하기버튼 활성화
                                    $("button[name=updateButton]").removeAttr("disabled");
                                    $("button[name=updateButton]").addClass("enabledBtn");
                                    $("button[name=updateButton]").removeClass("disabledBtn");
                            		                               
                                    $("#updateSellerEmail").val(updateSellerEmail);
                                    
                                } else {
                                    $email1.focus();
                                }
                            }
                        }, 
                        error : function() {
                            console.log("이메일중복체크용 ajax통신실패!");
                        }
                    });
            	}
            }
        }		
		
		// 정규식 검사
        function validate() {
            
            var ceoName = document.getElementById("ceoName");
            var sellerPhone = document.getElementById("updateSellerPhone");		
            var accountNo = document.getElementById("accountNo");          
            
            // 대표자명 검사 2~6자리 한글만 들어갈수 있게
            regExp = /^[가-힣]{2,10}$/;
            if(!regExp.test(ceoName.value)) {
                alert("한글로 된 2~6자리 이름을 입력해주세요.");
                ceoName.select(); // 재입력 유도
                return false;
            }
            
            // 전화 번호 정규식(다시해야함)
            var regExp = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))-(\d{3,4})-(\d{4})$/;
            if(!regExp.test(sellerPhone.value)) {
                alert("유효한 전화번호를 입력해주세요.");
                $("#updateSellerPhone").select(); // 재입력 유도
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
		
	   // 우편번호로 주소 가져오기
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
		
	   $("#confirmLocation").click(function() {
		   
		   if(confirm("주소를 확정하시겠습니까?")) {
	           var address = "(" + $("#sample6_postcode").val() +")"+ " "+ $("#sample6_address").val() + " " + $("#sample6_detailAddress").val();
	           
	           $("#findPostCode").attr("disabled", true);
	           $("#sample6_postcode").attr("readonly", true);
	           $("#sample6_address").attr("readonly", true);
	           $("#sample6_detailAddress").attr("readonly", true);
	           $("#sample6_extraAddress").attr("readonly", true);
	           
	           $("#postCode").css("backgroundColor", "lightgray");
	           $("#sample6_address").css("backgroundColor", "lightgray");
	           $("#sample6_detailAddress").css("backgroundColor", "lightgray");
	           $("#sample6_extraAddress").css("backgroundColor", "lightgray");
               
	           $("#updateLocation").val(address);
		   }		   
		   
	   })
	   
	   $("#secessionButton").click(function() {
		   
		   var sellerName = $("#sellerName").val();
		   
		   if(confirm("정말 탈퇴하시겠습니까?")){
			   
			   $.ajax ({
				   url : "secession.po",
				   data : {sellerName:sellerName},
				   success : function(result) {	
					  if(result == "true"){
	 					  alert("탈퇴 처리가 완료되었습니다.");
						  location.href = "afterSecession.po";
					  } else {
						  alert("탈퇴 처리 요청이 이루어지지 않았습니다.");
					  }
				   },
				   error : function(result) {
					  alert("판매자 정보 수정용 ajax 통신 실패!");
				   }
			   })
			   
		   }
		     
	   })
	</script>

</body>
</html>