<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 로그인 실패</title>
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
        <div id="text1">로그인 실패</div>
        <div id="text2">
            아이디 또는 비밀번호가 일치하지 않습니다.
        </div>
        <a href="/kmanager"><div id="text3">로그인 페이지로 이동</div></a>
    </div>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

</body>
</html>