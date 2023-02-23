<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>K-MANAGER :: 로그인</title>
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
        #wrap {
            width : 1860px;
            height : 930px;
        }

        #wrap>div {
            float : left;
        }

        #login_left {
            background-color: #323232;
            width :45%;
            height : 100%;
        }

        #login_text {
            color : white;
            font-size : 36px;
            margin-top : 25%;
            margin-left : 40%;
        }

        #login_text div {
            float : left;
        }

        #login_text1 {
            font-weight: 600;
        }

        #login_text2 {
            font-weight: 300;
        }

        #login_right {
            width :55%;
            height : 100%;
        }

        #login_area {
            width : 505px;
            height : 470px;
            margin-left : 25%;
            margin-top : 305px;
            text-align: center;
        } 

        #login_form {
            margin-top: 20px;
        }

        #login_form input {
            margin : 2%;
            width : 70%;
            height : 50px;
            border-radius: 5px;
        }

        input[type=submit] {
            background-color: #323232;
            color : white;
            font-size: 18px;
        }

        input[type=submit]:hover {
            cursor: pointer;
        }

        #saveIdArea {
            text-align: left;
        }

        label {
            position: relative;
            top : -6px;
            font-size: 20px;   
        }

        #findAndJoin {
            position: relative;
            top : 15px;
            font-size: 20px;
        }

        #findAndJoin a {
            text-decoration: none;
            color : black;
        }
    </style>
</head>
<body>
    
    <div id="wrap">

        <div id="login_left">
            <div id="login_text">
                <div id="login_text1">KEYBOAR</div>
                <div id="login_text2">-DER</div>
                <br>
                판매자매니저 로그인
            </div>
        </div>

        <div id="login_right">

            <div id="login_area">
                <h2>개인 / 국내 사업자</h2>
                <hr>
                <form id="login_form" action="login.me" method="post">
                    <input type="text" id="userId" name="sellerId" placeholder="아이디를 입력하세요" value="${ cookie.saveId.value }" required>                 
                    <input type="password" name="sellerPwd" maxlength="20" placeholder="비밀번호를 입력하세요" required>                   
                    <input type="submit" value="로그인">
                    <br>
                    <c:choose>
                    	<c:when test="${ not empty cookie.saveId.value }">
		                    <div id="saveIdArea">
		                        <input type="checkbox" id="saveId" name="saveId" value="y" 
		                        style="width:25px; height : 25px; margin-left: 14%;" checked> <label for="saveId">아이디 저장</label>
		                    </div>                    		
                    	</c:when>
                    	<c:otherwise>
		                    <div id="saveIdArea">
		                        <input type="checkbox" id="saveId" name="saveId" value="y" 
		                        style="width:25px; height : 25px; margin-left: 14%;"> <label for="saveId">아이디 저장</label>
		                    </div>                    	
                    	</c:otherwise>
                    </c:choose>

                </form>
                <hr>
                <div id="findAndJoin">
              		<a href="forgotId.me">아이디찾기</a>&nbsp;|
                    <a href="forgotPwd.me">비밀번호찾기</a>&nbsp;|
                    <a href="poEnroll1.me">회원가입</a>
                </div>
            </div>

        </div>
    </div>

	<!-- 액션 태그의 특징 : script 태그 영역에서 사용 불가 (인식이 안됨) -->
	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

</body>
</html>