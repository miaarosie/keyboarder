<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% response.setStatus(HttpServletResponse.SC_OK); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="hold-transition sidebar-mini">

	<!-- 로그인세션의 계정 검사해서 헤더와 사이드바 로그인한 계정에 맞는걸로 조건 설정 -->
	<c:choose>
		<c:when test="${ loginUser.sellerId eq 'admin' }">
			<jsp:include page="boheader.jsp" />
			<jsp:include page="bosidebar.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="poheader.jsp" />
			<jsp:include page="posidebar.jsp" />
		</c:otherwise>
	</c:choose>

<div class="content-wrapper">
	<div class="content">
		<div style="width:100%; height: 1000px; background-color: white;">
			<img src="resources/images/500.png" width="95%"/>
		</div>
	</div>
</div>


</body>
</html>