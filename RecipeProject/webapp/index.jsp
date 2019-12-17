<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/fullpage.min.js"></script>
<link rel="stylesheet" href="resources/css/fullpage.min.css" />
<c:import url="views/common/commonUtil.jsp"></c:import>
<style>
body {
	background: url("/recipe/resources/images/r1.jpg") no-repeat;
	background-size: cover;
}

a {
	color: black !important;
}

#back {
	width: 80%;
	height: 100%;
	background: rgba(255, 255, 255, 0.4);
	position: fixed;
	margin-left: 10%;
	margin-right: 10%;
}

#carouselExampleCaptions {
	margin-left: 10%;
	margin-right: 10%;
}

.section {
	text-align: center;
	font-size: 3em;
}
</style>
</head>
<body>
	<div id="back"></div>
	<c:import url="views/common/header.jsp"></c:import>
	<div id="fullpage">
		<div class="section">
			<c:import url="mainCommon.jsp"></c:import>
		</div>
		<div class="section">
			<c:import url="mainCommon.jsp"></c:import>
		</div>
		<div class="section">
			<c:import url="mainCommon.jsp"></c:import>
		</div>
		<div class="section">
			<c:import url="mainCommon.jsp"></c:import>
		</div>
	</div>

	<c:import url="views/common/footer.jsp"></c:import>
	<script>
	new fullpage('#fullpage', {
	});
</script>
</body>
</html>