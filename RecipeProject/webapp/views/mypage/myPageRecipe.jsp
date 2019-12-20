<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 레시피조회</title>
<link rel="stylesheet" href="../../resources/pro.png" />

<style>


 table {
        width: 200;
        border: 1px solid #333333;
      }
      td {
        padding: 10px;
        border: 1px solid #333333;
      }
      .a {
        border-collapse: separate;
      }
      .b {
        border-collapse: collapse;
      }
}

}
</style>
<body>
<c:import url="../common/commonUtil.jsp"/>
<c:import url="../common/header.jsp"/>

<h2 align="center" style="top-margin:5em;">My Recipe 목록</h2>
		<div class="tableArea">
			<table align="center" id="listArea">
			<tr>
				<th width="100px">글번호</th>
				<th width="300px">글제목</th>
				<th width="150px">작성일</th>
				<th width="100px">첨부파일</th>
			</tr>
			<c:forEach var="recipe" items="${list}">
			<tr>
				<td>
				<input type="hidden" value="${recipe.rno}">
					${recipe.rno}
				</td>
				<td>${recipe.rtitle}</td>
				<td>${recipe.rdate}</td>
				<c:if test="${!empty recipe.rvideo }">
				<td> O </td>
				</c:if><c:if test="${empty recipe.rvideo }">
				<td> X </td>
				</c:if>
			</tr>
			</c:forEach>
			</table>
		</div>

<c:import url="../common/footer.jsp"/>
</body>
</html>