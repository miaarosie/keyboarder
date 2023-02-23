<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- JavaScript -->
	<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
	
	<!-- CSS -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
	<!-- Default theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
	<!-- Semantic UI theme -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
    
    <!-- jQuery 라이브러리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- 부트스트랩에서 제공하고 있는 스타일 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- 부트스트랩에서 제공하고 있는 스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
        .fo-header-full{
            width: 1200px;
            height: 100px;
            margin: auto; 
            margin-top: 30px;
        }

        #fo-header-logo{
        	float: left;
        	padding-top: 45px;
            width: 40%;
            display: inline-block;
        }

        #fo-header-login{
        	padding-top: 20px; 
            width: 40%;
            display: inline-block;
            float: right;
        }
        
        #fo-header-login div {
            float: right;
        	display: inline-block;
        }

        #login-button{
            width: 30%;
            height: 100%;
            font-size: 20px;
            line-height: 95px;
        }

        #order-button{
            width: 35%;
            height: 100%;
            font-size: 17px;
            line-height: 95px;
        }

        #logout-button{
            width: 25%;
            height: 100%;
            line-height: 95px;
            text-align: center;
        }
        
        a:hover{
        	cursor: pointer; 
        	opacity: 0.5;
        }
		#infofind a {
            text-decoration: none;
            color : black;
	    }
    </style>
    
	<link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session" />
   </c:if>

	<div class="fo-header-full">
			<!-- 좌측 상단 로고 -->
            <div id="fo-header-logo">
                <a href="foProductNotice.pro">
                	<img src="resources/fo_upfiles/keyboarder_logo.png" style="background-size: cover; width: 100%; height: 100%;">
                </a>
            </div>
            <div id="fo-header-login">
                <c:choose>
                	<%-- 로그인이 되어있지 않다면 회원가입 버튼과 로그인 버튼이 보임 --%>
                    <c:when test="${ empty loginUser }">
                        <!-- 로그인전 -->
                        <!-- <div id="order-button" align="center"></div> -->
                        <div id="logout-button">
                            <a data-toggle="modal" data-target="#loginModal"><button type="button" class="btn btn-primary">로그인</button></a>
                        </div>
                        <div id="login-button" align="center">
                            <a href="termsForm.me"><button type="button" class="btn btn-primary">회원가입</button></a>
                        </div>
                    </c:when>
                    <c:otherwise>
                    	<%-- 로그인이 되어있다면 로그아웃 버튼, 사용자 이름, 주문내역 조회 버튼이 보임 --%>
                        <div id="logout-button">
                            <button type="button" class="btn btn-primary" onclick="location.href='logout.me'">로그아웃</button>
                        </div>
                        <div id="login-button" align="center">${ loginUser.conName } 님 </div>
                        <div id="order-button" align="center">
                            <a href="foTotalView.order"><button type="button" class="btn btn-primary">주문내역조회</button></a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
    </div>
        
    <!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭 시 보임) -->
    <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">KEYBOAR-DER</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="login.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <input type="text" class="form-control mb-2 mr-sm-2" placeholder="아이디" id="userId" name="conId" value="" required>
                        <input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호" id="userPwd" name="conPwd" required>
                        <br>
                        <button type="submit" class="btn btn-primary" style="width:266px;">로그인</button>
                        <br><br>
                        <c:choose>
                            <c:when test="${ not empty cookie.saveId}">
                                <input type="checkbox" id="saveId" name="saveId" value="y" checked><label for="savdId">&nbsp;&nbsp;아이디저장</label>
                            </c:when>
                            <c:otherwise>
                                <input type="checkbox" id="saveId" name="saveId" value="y"><label for="savdId">아이디저장</label>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer" id="infofind" style="font-size :13px;">
                        <a href="findIdForm.me">아이디찾기</a>&nbsp;|&nbsp;
                        <a href="findPwdForm.me">비밀번호찾기</a>&nbsp;|&nbsp;
                        <a href="termsForm.me">회원가입</a>
                    </div>
                </form>
            </div>
            </div>
        </div>

</body>
</html>