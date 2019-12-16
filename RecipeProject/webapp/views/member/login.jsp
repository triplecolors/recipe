<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="../../resources/css/login.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
<c:import url="../common/commonUtil.jsp"></c:import>
<style>
.marginTop {
	margin-top: 80px;
}
.loginBody {
	padding: 8%;
	background: rgba(255, 255, 255, 0.7);
	border-radius: 20px 20px 20px 20px;
}
</style>
  </head>
  <body>
<div class="row marginTop">
<div class="col-xl-4 col-lg-3 col-md-2 col-sm-1"></div>
<div class="loginArea col-xl-4 col-lg-6 col-md-8 col-sm-10 loginBody">
	<c:if test = "${ empty member }">
      <form class="loginArea" action="${ pageContext.request.contextPath }/login.me">
        <h1>Login</h1>

        <div class="txtb">
          <input type="text"  name="id">
          <span data-placeholder="Username"></span>
        </div> 

        <div class="txtb">
          <input type="password"  name="password">
          <span data-placeholder="Password"></span>
        </div>

        <input type="submit" class="logbtn" value="Login">

        <div align="center" class="bottom-text">
           <a href="memberJoin.jsp">회원 가입</a>
        </div>

      </form>
   </c:if>
</div>
<div class="col-xl-4 col-lg-3 col-md-2 col-sm-1"></div>
</div>

      <script type="text/javascript">
      function login(){
    	  $('#loginArea')submit();
      }
      
      function logout(){
     	 location.href = "${pageContext.request.contextPath}/logout.me";
      }
       
  
      $(".txtb input").on("focus",function(){
        $(this).addClass("focus");
      });

      $(".txtb input").on("blur",function(){
        if($(this).val() == "")
        $(this).removeClass("focus");
      });

      </script>

<c:import url="../common/footer.jsp"></c:import>
</body>
</html>