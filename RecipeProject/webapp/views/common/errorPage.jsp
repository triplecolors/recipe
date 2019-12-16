<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Service ERROR</title>
<c:import url="commonUtill.jsp"></c:import>
<style>
	.outer{
      padding: 20px;
      width:600px;
      height:500px;
      background:rgba(50,50,50,0.7);
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
	span {
	   font-size:21pt;
	   background: white;
	   color: navy;
	}
</style>
</head>
<body>
	<c:import url="header.jsp" />
	
	<section class="outer">
	      <h1>서비스 에러 발생!</h1>
	   <c:if test="${ !empty exception}">
	      <h3 style="color:hotpink;">에러명:: ${exception.message }</h3>
	   </c:if>
	      <!-- 첫글자 강조, 나머지 글자 표현 -->
	      <h4><span>${fn:substring(msg,0,1)}</span>${fn:substring(msg,1,-1)}<br><br>
	      전송 값을 확인해 보시고, 이상이 없을 시 <br>
	      부서 담당자에게 연락하시기 바랍니다.</h4>
    </section>
    
	<c:import url="footer.jsp" />
</body>
</html>