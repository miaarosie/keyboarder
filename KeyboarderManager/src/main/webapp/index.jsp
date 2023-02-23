<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body class="hold-transition sidebar-mini"> <!-- 모든 body 태그에 적용 -->

	<c:choose>
		<c:when test="${ loginUser.sellerId eq 'admin' }">
			<jsp:forward page="WEB-INF/views/common/bomain.jsp" />
		</c:when>
		
		<c:when test="${ empty loginUser }">
			<jsp:forward page="WEB-INF/views/common/login.jsp" />
		</c:when>
		
		<c:otherwise>
			<jsp:forward page="WEB-INF/views/common/pomain.jsp" />
		</c:otherwise>
	</c:choose>
	

</body>
</html>