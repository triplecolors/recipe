<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 조회</title>
<style>
@media only screen and (max-width: 2000px){
	 .outer{
      width:1000px;
      
      background:rgba(50, 50, 50, 0.5);
      color:white;
      
      margin-left:auto;
      margin-right:auto;
       margin-top : 150px;
   }
   td {
   	  width : 1000px;
      border:1px solid black;
      background : black;
      color: white;
   }

   .tableArea {
 	 
      border:1px solid black;
      background : white;
      color: black;
      width:auto;
      height:auto;
      
      
   }
   #content {
      height:259px;
   }
  tbody{
  	width : 1000px;
  	align : center;
  }
  }
	
	
	@media only screen and (max-width: 900px){
		 .outer{
     		  width:auto;
		      background:rgba(50, 50, 50, 0.7);
		      color:white;
		      margin : auto;
  		 }
  	.tableArea {
	      border:1px solid black;
	      background : white;
	      color: black;
	      width:auto;
	      height:350px;
	      margin : auto;
  		 }
  		 
   	 td {
   	 		 width : 500px;
		      border:1px solid black;
		      background : black;
		      color: white;
		      margin : auto;
		  }
	table {
		width : auto;
	
	}
	.footer p{
			font-size : 14px;
	}
</style>
</head>
<body>
	
	
	
		
	<section class="outer">
      <br>
      <h2 align="center">게시글 내용</h2>
      <div class="tableArea">
            <table >
               <tr>
                  <td>제목 </td>
                  <td colspan="5"><span>${notice.nTitle}</span></td>
               </tr>
               <tr>
                  <td>작성자 </td>
                  <td><span>${notice.writer}</span></td>
                  <td>작성일</td>
                  <td><span>${notice.nDate}</span></td>
                
               </tr>
               
               <tr>
                  <td colspan="6">
                
                     <p id="content">${notice.nContent}
                  </td>
               </tr>
            </table>
            <br>
      </div>
      </section>
	
	<c:import url="../common/footer.jsp"/>	
</body>
</html>