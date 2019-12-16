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
</head>
<body>
 <form action="${pageContext.request.contextPath }/ninsert.bo" 
               method="post">
            <table>
               <tr>
                  <td>제목 </td>
                  <td colspan="3"><input type="text" size="51" name="title"></td>
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
</body>
</html>