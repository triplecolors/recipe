<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:if test="${!empty member }">

<div class="row">
	<div class="col-2 myheader">	
		<h1><b>My Page</b></h1>
		  <ul id="myMenu">
		  <li><a href="../recipe/recipeWrite.jsp" ><b>My</b>레시피등록</a></li>
		  <li><a href="myPageRecipe.jsp"><b>My</b>레시피조회</a></li>
		  <li><a href="myPageProfile.jsp"><b>My</b>회원정보 수정</a></li>
		  <li><a href="myPageInbox.jsp"><b>My</b>쪽지함</a></li>
		  <li><a href="#">신고/제제 내역</a></li>
		  <li><a href="#">고객센터</a></li>
		</ul>
	</div>
	<div class="col-10">
	</c:if>