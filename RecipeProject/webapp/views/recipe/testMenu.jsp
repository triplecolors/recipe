<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="/resources/js/jquery-3.4.1.min.js"/> -->
<style>
	.card-link {
		width : 80%;
  		height : 100%;
		margin-left:-10%;


	}

</style>
<c:import url="../common/commonUtil.jsp"></c:import> 
</head>

<body>

	<c:import url="../common/header.jsp"></c:import>

<br />
<br />

<div class="card" style="width: 230px;  position: fixed; ">
  <img src="/recipe/resources/images/test내용입니다. 삭제예정.PNG" class="card-img-top" alt="...">
	<div class="card-body">
    <h5 class="card-title" >만든이 <img src="/recipe/resources/images/곰발바닥.PNG" style = "width: 40px; height : 40px;"alt="..." class="rounded-circle"></h5>
    <h5 class="card-title">title</h5>
    <p class="card-text">내용 작성할 부분</p>

   <a href="#" class="card-link" type="click"><img src="/recipe/resources/images/즐겨찾기 사진1.PNG" class="Btnwon"; style="width:20px; height:20px";  
   												onclick="src='/recipe/resources/images/즐겨찾기 사진.PNG' "> </a>
    
    
    


	</div>
 
</div>


<script>
	

</script>
 




<br />
<br />
<br />
<br />
<br />
<br />


		<c:import url="../common/footer.jsp" ></c:import>

</body>
</html>