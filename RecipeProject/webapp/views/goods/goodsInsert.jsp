<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조리용품등록창</title>
<c:import url="../common/commonUtil.jsp"/>

<style>

 

.outer {

      width:900px;

      height:650px;

      background:rgba(255, 255 , 255, 0.5);

      color:gray;

      margin-left:auto;

      margin-right:auto;

      margin-top:50px;

   }

   table {

      padding: 15px;

      border:1px solid white;

   }

 

   .tableArea {

      width:600px;

      height:250px;

      margin-left:auto;

      margin-right:auto;

   }

 

</style>

</head>

<body>

 

<c:import url="../common/header.jsp"/>

 

<section class="outer">

      <br>

      <h2 align="center">게시판 작성</h2>

      <div class="tableArea">

         <form action="${pageContext.request.contextPath }/insert.bo" 

               method="post" enctype="multipart/form-data">

               <!-- encode type = 이렇게 바꾸겠따! -->

               

            <table>
            
            <div class="btn-group" role="group" aria-label="Button group with nested dropdown">

 

  <div class="btn-group" role="group">

    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

      제품카테고리

    </button>

    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">

      <a class="dropdown-item" href="#">Kitchen</a>

      <a class="dropdown-item" href="#">Cooking'</a>

    </div>

  </div>

</div>

               <tr>

                  <td>제목 </td>

                  <td colspan="3"><input type="text" size="51" name="title"></td>

               </tr>

               <tr>

                  <td>작성자 </td>

                  <td colspan="3">${member.userName}

                     <input type="hidden" name="userId" value="${member.userId}"/>

                  </td>

               </tr>

               <tr>

                  <td>첨부파일 </td>

                  <td colspan="3">

                  <input type="file" name="bfile" />

                  </td>

               </tr>

               <tr>

                  <td>내용 </td>

                  <td colspan="3">

                     <textarea name="content" cols="52" rows="15" style="resize:none;"></textarea>

                  </td>

               </tr>

            </table>

            <br>

            <div align="center">

               <button type="reset">취소하기</button>

               <button type="submit">등록하기</button>

            </div>

         </form>

      </div>

   </section>

<br><br><br><br><br>

<c:import url="../common/footer.jsp"/>

</body>
</html>