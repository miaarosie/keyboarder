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
            left : 23%;
        }
        
        #login_text1 {
            font-weight: 600;
        }
    
        #enrollContent {
            position: relative;
            left : 23%;
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
            font-size: 21px;
            top : 80px;
        }

        #text3 {
            border: 1px solid black;
            width : 68%;
            height : 250px;
            top : 130px;
            background-color: #F2F2F2;
            text-align: center;
        }

        #text3_1 {
            margin-top: 50px;
            font-size: 26px;
        }

        #text3_2 {
            margin-top: 30px;
            font-size: 19px;
        }

        img {
            width : 35px;
            height: 35px;
        }

        #text4 {
            top : 168px;
            font-size: 21px;
            font-weight: 540;
        }

        #text5 {
            top : 198px;
            font-size : 18px;
        }

        #text6 {
            width : 250px;
            /* height : 50px;
            background-color: #323232; */
            line-height: 50px;
            font-size: 20px;
            text-align: center;
            vertical-align: center;
        }
        
        a {
            position: relative;
            top : 268px;
            text-decoration: none;
            color : white;
            left : 525px;
        }


    </style>
    <!-- jQuery -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="resources/plugins/fontawesome-free/css/all.min.css">
    <!-- IonIcons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="resources/dist/css/adminlte.min.css">
    <script src="http://kit.fontawesome.com/77ad8525ff.js" crossorigin="anonymous"></script>
</head>
<body>
    
    <div id="wrap">

        <div id="enrollHeader">
            <div id="login_text1">KEYBOAR</div>
            <div id="login_text2">-DER 판매자매니저</div> 
        </div>
        <hr>
        <div id="enrollContent">
            <div id="text1">오픈마켓 판매자 가입</div>
            <div id="text2">
                오픈마켓에 입점 시 상품 판매부터 판촉활동까지 다양한 활동이 가능합니다.<br>
                판매자 가입 시 판매상품 등록, 대금 정산 등 시스템을 관리하실 수 있습니다.
            </div>
            <div id="text3">
                <div id="text3_1">
                    <img src="resources/images/check.jpg">국내 사업자 판매 가입
                </div>
                <div id="text3_2">
                    사업자 등록이 있으신 분이라면<br>
                    누구나 가입하실 수 있습니다
                </div>
            </div>
            <div id="text4">국내 사업자 판매자 가입 안내</div>
            <div id="text5">
                -  사업자 등록증을 갖춘 개인 또는 법인이라면 누구나 사업자 판매자로 가입할 수 있습니다.<br>
                - 가입신청 후, 사업자 서류 인증 절차를 통한 인증 후 상품 판매가 가능합니다.
            </div>
            <a href="poEnroll2.me" class="btn btn-dark"><div id="text6">판매자 가입하기</div></a>
        </div>
    </div>

</body>
</html>