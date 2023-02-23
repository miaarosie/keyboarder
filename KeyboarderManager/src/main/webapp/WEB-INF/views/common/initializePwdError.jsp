<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 비밀번호 초기화</title>
    <style>
        #wrap {
            width : 1920px;
            height : 1080px;
            text-align: center;        
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

        img {
            position: relative;
            top : 100px;
            width : 250px;

        }

        #text1 {
            position: relative;
            font-size: 30px;
            font-weight: 600;
            top : 150px;
        }

        #text2 {
            position: relative;
            font-size: 25px;
            font-weight: 540;
            top : 200px;
        }

        a {
            text-decoration: none;
        }

        #text3 {
            position: relative;
            font-size: 20px;
            font-weight: 540;
            top : 250px;
            left : 800px;
            background-color: #323232;
            color : white;
            width : 15%;
            padding : 10px 20px 10px 20px;
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
        <img src="resources/images/error.jpg">
        <div id="text1">비밀번호 초기화 실패</div>
        <div id="text2">
            아이디 또는 사업자 등록번호가 일치하지 않거나, <br>
            이메일 인증이 되어있지 않은 판매자입니다.
        </div>
        <a href="loginPage.me"><div id="text3">로그인 페이지로 이동</div></a>
    </div>

</body>
</html>