<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KEYBOAR-DER</title>

	<style>
        div{
            /* border: 1px solid red; */
            box-sizing: border-box;
        }

        #fo-full-main{
            width: 1200px;
            height: 1000px;
            margin: auto;
        }

        #fo-product-body{
            width: 100%;
            height: 900px;
        }

        #fo-product-main{
            width: 100%;
            height: 750px;
            margin: auto;
            margin-top: 80px;
        }
        
        #btn{
        	height: 70px;
        	font-size: 30px;
        	position: absolute;
        	top: 100%;
        	left: 42%;
        }

    </style>
    
</head>
<body>

	<jsp:include page="../common/foHeader.jsp" />
	
	<div id="fo-full-main">

       	<div id="fo-product-body">
           	<div id="fo-product-main">
                <img src="resources/images/mainEvent.jpg"
                	 style="background-size: cover; width: 100%; height: 100%; position : relative;">
                <a href="foProductNotice.pro">
                	<button type="button" class="btn btn-primary" id="btn">
                		키보드 구매페이지 이동
                	</button>
                </a>
           	</div>
           
           
       	</div>
    </div>

</body>
</html>































