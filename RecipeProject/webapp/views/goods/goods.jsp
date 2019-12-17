<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GOODS</title>
<c:import url="../common/commonUtil.jsp"/>





<style>
   .outer{
      width:1000px;
      height:auto;
      background:rgb(50,50,150,0.4);
      color:white;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
   .thumbnailArea {
      width:760px;
      height:auto;
      margin-left:auto;
      margin-right:auto;
   }
   .searchArea {
      width:420px;
      margin-left:auto;
      margin-right:auto;
   }
   .thumb-list {
      width:220px;
      border:1px solid white;
      display:inline-block;
      margin:10px;
      align:center;
   }
   .thumb-list:hover {
      opacity:0.8;
      cursor:pointer;
   }
   
   img{
      width:200px;
      height:150px;
   }

</style>

</head>
<body>
	<c:import url="../common/header.jsp"/>
	<section class="outer">
	
		<br>
      <h2 align="center">GOODS</h2>
      
      <div class="thumbnailArea">
      <c:forEach var="thumb" items="${list}">
         <div class="thumb-list" align="center">
            <div>
               <input type="hidden" value="${thumb.bno}">
               <img src="/myWeb/resources/thumbnailFiles/${thumb.bfile}" width="200px" height="150px">
            </div>
            <p>No. ${thumb.bno} ${thumb.btitle}<br>
          	      조회수 : ${thumb.bcount}
            </p>
         </div>
      </c:forEach>
      </div>
	  
	  <script>
	  $(function(){
		 $('.thumb-list').click(function(){
			 var bno = $(this).children().children().eq(0).val();
			 
			 location.href="/myWeb/selectOne.tn?bno=" +bno;
			 
		 });
	  });
	  
	  </script>
		
	<div class="searchArea">
         <select id="searchCondition" name="searchCondition">
            <option>---</option>
            <option value="writer">작성자</option>
            <option value="title">제목</option>
            <option value="content">내용</option>
         </select>
         <input type="search">
         <button type="submit">검색하기</button>
         <c:if test="${ !empty member }">
            <button onclick="location.href='views/thumbnail/thumbnailInsertForm.jsp'">작성하기</button>
         </c:if>
      </div>
      <br><br>	
      
        
      <%-- 페이지처리 구현하기 --%>
      <div class="pagingArea" align="center">
      		<c:url var="selectList" value="selectList.bo"/>
      		
      <!-- 처음페이지 버튼 -->
      <button onclick="location.href='${selectList}?currentPage=1'">
      &lt;&lt;
      </button>
      
      
      <!-- 이전페이지 버튼 -->
      <c:if test="${ pi.currentPage le 1 }">
      		<button disabled>&lt;</button>
      </c:if>
      <c:if test="${ pi.currentPage gt 1 }">
      	<button onclick="location.href='${selectList}?currentPage=${pi.currentPage - 1}'">
      	&lt;
      	</button>
      </c:if>
      
      
      <!-- 상세페이지 구현을 위한 반복문 -->
      <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
      	<c:if test="${p eq pi.currentPage }">
      		<button disabled>${p}</button>
     	 </c:if>
     
      	<c:if test="${ p ne pi.currentPage }">
     		 <button onclick = "location.href='${selectList}?currentPage=${p}'">
      			${p}
      		</button>
      	</c:if>
      </c:forEach>
      
      <!-- 다음페이지 버튼 -->
      <c:if test="${ pi.currentPage ge pi.maxPage }">
      		<button disabled>&gt;</button>
      </c:if>
      <c:if test="${ pi.currentPage lt pi.maxPage }">
      	<button onclick="location.href='${selectList}?currentPage=${pi.currentPage + 1}'">
      	&gt;
      	</button>
      </c:if>
      
      
      <!-- 마지막페이지 버튼 -->
      <button onclick="location.href='${selectList}?currentPage=${pi.maxPage}'">
      &gt;&gt;
      </button>
      		
      </div>

<script>
$(function(){
    $("#listArea td").mouseenter(function(){
       $(this).parent().css({"background":"darkgray", "cursor":"pointer"});
    }).mouseout(function(){
       $(this).parent().css({"background":"rgba(70,70,70,0.5)"});
    }).click(function(){
       var bno = $(this).parent().find("input").val();
       location.href="${pageContext.request.contextPath}/selectOne.bo?bno=" + bno;
    });
 });

</script>
  
      
		
	</section>
	<br><br><br><br><br>
	<c:import url="../common/footer.jsp"/>
</body>
</html>

