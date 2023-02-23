<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>K-MANAGER :: 회원가입</title>
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
            width : 150px;

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

        #text4 {
            position: relative;
            font-size: 20px;
            font-weight: 600;
            top : 300px;
            left : 570px;
            background-color: #D9D9D9;
            width : 40%;
            border-radius: 10px;
            padding : 10px;
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
        <img src="resources/images/enrollcheck.jpg">
        <div id="text1">회원가입 완료</div>
        <div id="text2">
            판매자님 (아이디) 의 회원가입이 <br>
            성공적으로 완료되었습니다. <br>
            이메일 인증 후 로그인해주세요.
        </div>
        <a href="loginPage.me"><div id="text3">로그인 페이지로 이동</div></a>
        <div id="text4">
            회원가입 내역 확인 및 수정은 마이페이지>회원정보수정에서 가능합니다.
        </div>
    </div>

</body>
</html>