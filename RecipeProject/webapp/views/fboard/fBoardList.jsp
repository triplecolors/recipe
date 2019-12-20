<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>

	<!-- <link rel="stylesheet" type="text/css" href="css/util.css"> -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/fBoard.css">
<!--===============================================================================================-->
	<!--===============================================================================================-->	
	<script src="${pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${pageContext.request.contextPath }/resources/js/f_Board.js"></script>	
	<c:import url="../common/commonUtil.jsp"></c:import>
	<style>
		.container-table100{
			display : block;
			margin : auto;
		}
		.pagingArea{
			margin : auto;
			display : block;
		}
		.wrap-table100{
			margin : auto;
		}
		
	</style>
</head>
<body>
	
	<div class="limiter">
		<c:import url="../common/header.jsp"/>
		<br />
		
	
		<div class="container-table100">
		<br />
		<br />
		<br />
		<br />
			<div class="wrap-table100">
			<br />
			<br />
			<br />
			<input type="button" class="write" value="???" onclick="go();"/>
		<c:if test="${!empty member}">
	<input type="button" class="write" value="글작성" onclick="insert();"/>
		</c:if>
					<div class="table">

						<div class="row2 header">
							<div class="cell">
								번호
							</div>
							<div class="cell">
								제목
							</div>
							<div class="cell">
								작성자
							</div>
							<div class="cell">
								작성일
							</div>
							<div class="cell">
								조회수
							</div>
							<div class="cell">
								파일여부
							</div>
						</div>
						<c:forEach var="fBoard" items="${list }">
								<div class="row2">
							<div class="cell bnum" id="num" data-title="Full Name">
								${fBoard.bnum }
							</div>
							<div class="cell" id="title" data-title="Age">
								${fBoard.pTitle }
							</div>
							<div class="cell" id="writer" data-title="Job Title">
								${fBoard.writer }
							</div>
							<div class="cell" id="date" >
								${fBoard.pDate }
							</div>
							<div class="cell" id="count" >
								${fBoard.pCount }
							</div>
							<div class="cell" id="file" >
								X
							</div>
						<input type="hidden" class="bno" name="uno" value="${fBoard.bno }"/>
						</div>
						</c:forEach>
		
					</div>
			</div>
		<br />

		<div class="pagingArea" align="center">
			<c:url var="selectList" value="selectList.fb"/>
			
			<!-- 처음 페이지 버튼 -->
			<button onclick="location.href='${selectList}?currentPage=1'">
				&lt;&lt;
			</button>
			
			<!-- 이전 페이지 버튼 -->
			<c:if test="${ pi.currentPage le 1 }">
				<button disabled>&lt;</button>
			</c:if>
			<c:if test="${ pi.currentPage gt 1 }">
				<button onclick="location.href='${selectList}?currentPage=${pi.currentPage - 1}'">
					&lt;
				</button>
			</c:if>
			
			<!-- 상세 페이지 구현을 위한 반복문 -->
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<button disabled>
					<b>${p}</b>
					</button>
				</c:if>
				<c:if test="${p ne pi.currentPage }">
					<button onclick="location.href='${selectList }?currentPage=${p }'">${p}</button>
				</c:if>
			</c:forEach>
			
			
			<!-- 다음 페이지 버튼 -->
			<c:if test="${ pi.currentPage ge pi.maxPage }">
				<button disabled>&gt;</button>
			</c:if>
			<c:if test="${ pi.currentPage lt pi.maxPage }">
				<button onclick="location.href='${selectList}?currentPage=${pi.currentPage + 1}'">
					&gt;
				</button>
			</c:if>
			
			<!-- 마지막 페이지 버튼 -->
			<button onclick="location.href='${selectList}?currentPage=${pi.maxPage}'">
				&gt;&gt;
			</button>
			</div>
		</div>
	</div>
	

		<br />
		<script>
			$(function(){
				
				$('.row2').click(function(){
					 var bno = $(this).find('.bno').val()
			          var bnum = $(this).find('.bnum').text();
			     
			           location.href="${pageContext.request.contextPath}/selectOne.fb?bno=" + bno+"&bnum="+bnum;
				});
				$('.row2').mouseenter(function(){
				
				});
			});
			
			function insert(){
					location.href="${pageContext.request.contextPath}/views/fboard/fboardInsertForm.jsp";
			}
			
			function go(){
				location.href="${pageContext.request.contextPath}/views/fboard/SecretPage.jsp";
			}
		</script>
	
	
	<c:import url="../common/footer.jsp"/>
</body>
</html>