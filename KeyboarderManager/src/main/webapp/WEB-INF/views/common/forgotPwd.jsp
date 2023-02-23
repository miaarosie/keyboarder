<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 비밀번호찾기</title>
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
            height : 140px;
            background-color: rgb(226, 226, 226);
            top : 150px;
            padding-top: 20px;
            padding-bottom: 25px;
        }

        #text3 {
            padding : 25px 0 0 200px;
            font-size: 18px;
        }

        #corpNo {
            font-size: 16px;
            width : 300px;
            height: 30px;
            border-radius: 5px;
        }

        #sellerId {
            font-size: 16px;
            width : 300px;
            position: relative;
            left : 95px;
            height: 30px;
            border-radius: 5px;
        }

        button {
            font-size: 20px;
            font-weight: 540;
            background-color: #323232;
            color : white;
            width : 15%;
            padding : 10px 20px 10px 20px;
            text-align: center;
            border-radius: 5px;
            border: none;
        }

        button:hover {
            cursor: pointer;
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
            <div id="text1">판매자 비밀번호 찾기</div>
            <div id="text2">
                * 회원가입시 입력한 사업자 등록번호와 아이디를 입력해주세요.
            </div>
            <form action="initializePwdForm.me">
                <div id="forgotId">
                    <div id="text3">
                        사업자 등록 번호 :&nbsp;&nbsp;&nbsp;
                        <input type="text" id="corpNo" name="corpNo" pattern=",{12, 12}" placeholder=" - 포함 12자 입력" required>
                        <br><br>
                        아이디 :&nbsp;
                        <input type="text" id="sellerId" name="sellerId" required> 
                    </div>                
                </div>
		        <div style="position:relative; top : 200px; left : 350px;">
		            <button type="submit">비밀번호 초기화</button>
		        </div>                       
            </form>
        </div>

    </div>    

</body>
</html>