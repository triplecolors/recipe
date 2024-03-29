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
<script src="${pageContext.request.contextPath}/resources/js/notice_fullpage.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice_fullpage.min.css" />
<c:import url="../common/commonUtil.jsp"></c:import>

<style>
	body {
		
		margin: 0;
		padding: 20px;
		font-family: "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif; 
	   	font-weight: 300;
	}
	

	#table {
		margin-top : 1000px;
		display: table;
	 	
	 	width: 1000px; 
	 	background: rgba(70,70,70,0.5);
	 	margin : auto;
	 	box-sizing: border-box;
	 	-webkit-box-shadow: 10px 10px 10px 5px #8A8A8A;
		box-shadow: 10px 10px 10px 5px #8A8A8A;

	 	}

	 .caption {
	 	display: block;
	 	width: 1000px;
	 	background: #3CA55C;  /* fallback for old browsers */
        background: -webkit-linear-gradient(to right, #B5AC49, #3CA55C);  /* Chrome 10-25, Safari 5.1-6 */
        background: linear-gradient(to right, #B5AC49, #3CA55C); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

	
	 	height: 55px;
	 	padding-left: 10px;
	 	color: #fff;
	 	font-size: 20px;
	 	line-height: 55px;
	 	text-shadow: 1px 1px 1px rgba(0,0,0,.3);
	 	box-sizing: border-box;
	 	margin : auto;
	 	-webkit-box-shadow: 10px 10px 10px 5px #8A8A8A;
		box-shadow: 10px 10px 10px 5px #8A8A8A;
	 }


	 .header-row {
	 	background: #8b8b8b;
	 	color: #fff;

	 }

	.row2 {
		display: table-row;
	}

	.cell {
		display: table-cell;
		
		padding: 6px; 
		border-bottom: 1px solid #e5e5e5;
		text-align: center;
	}

	.primary {
		text-align: center;
		width : 80px;
	}


	input[type="radio"],
	input[type="checkbox"]{
		display: none;
	}
	

	@media only screen and (max-width: 760px)  {

		body {
			padding: 0;
		}

		#table {
			width : auto;
			display: block;
			margin: 10px;
		}

		.caption {
			position: fixed;
			top: 0;
			text-align: right;
			height: 44px;
			line-height: 44px;
			z-index: 5;
			border-bottom: 2px solid #999;
		}

		.row2 { 
			position: relative;
			display: block;
			border-bottom: 1px solid #ccc; 

		}

		.header-row {
			display: none;
		}
		
		.cell { 
			display: block;
			width : 100%;
			border: none;
			position: relative;
			height: 45px;
			line-height: 45px;
			text-align: left;
			margin-left : 10px;
		}
		
		.type{
		display : none;
		}
		.type : before{
		display : none;
		}
		
		.writer{
		display : none;
		}
		
		.date{
		display : none !important;
		}
		.writer{
			paddig-left : 50px;
		}

		.primary:after {
			content: "";
			display: block;
			position: absolute;
			right:20px;
			top:18px;
			z-index: 2;
			width: 0; 
			height: 0; 
			border-top: 10px solid transparent;
			border-bottom: 10px solid transparent; 
			border-right:10px solid #ccc;

		}

	/*	.cell:nth-of-type(n+2) { 
			display: block; 
		}*/


		input[type="radio"],
		input[type="checkbox"] {
			display: block;
			position: absolute;
			z-index: 1;
			width: 99%;
			height: 100%;
			opacity: 0;
			margin : auto;
			
		}
    
    input[type="radio"]:checked,
		input[type="checkbox"]:checked {
		  z-index: -1;
		}

		input[type="radio"]:checked ~ .cell,
		input[type="checkbox"]:checked ~ .cell {
			display: block;

			border-bottom: 1px solid #eee; 
		}

		input[type="radio"]:checked ~ .cell:nth-of-type(n+2),
		input[type="checkbox"]:checked ~ .cell:nth-of-type(n+2) {
			
			background: #e0e0e0;
		}

		input[type="radio"]:checked ~ .cell:nth-of-type(n+2):before,
		input[type="checkbox"]:checked ~ .cell:nth-of-type(n+2):before {
			content: attr(data-label);

			display: inline-block;
			width: 60px;
			background: #999;
			border-radius: 10px;
			height: 20px;
			margin : auto;
			
			font-size: 12px;
			line-height: 20px;
			text-align: center;
			color: white;

		}

		input[type="radio"]:checked ~ .primary,
		input[type="checkbox"]:checked ~ .primary  {
			border-bottom: 2px solid #999;
		}

		input[type="radio"]:checked ~ .primary:after,
		input[type="checkbox"]:checked ~ .primary:after {
	 		position: absolute;
			right:18px;
			top:22px;
			border-right: 10px solid transparent;
			border-left: 10px solid transparent; 
			border-top:10px solid #ccc;
			z-index: 2;
		}
		
		.footer p{
			font-size : 14px;
		}
	}
	
	@media only screen and (min-width: 760px){
		.cell{
			width : 500px;
		}
	}
	
	@media only screen and (max-width: 1400px){
	.type{
		width : 150px;
	
	}
	.title{
		width : 800px;
		text-align : left !important;
		
	}
	
	.writer{
		width : 100px;
	}
	.date{
		width : 120px;
	}
}
	
	.tableA{
		width : 100%;
	}
	
	
	.rowf:nth-child(odd) {
		background : #F5BCA9;
	}
	.rowf:first-child(even) {
  		background: #F7D358;
	}
	.write{
	position : relative;
	margin-left : 20%;
	
	}
	#uno{
	display : none;
	}
	</style>
	
</head>
<body>

	<c:import url="../common/header.jsp"></c:import>
	
		
	
	<br /><br /><br /><br /> <br />
	
	
	<div class="tableA">
	
	<input type="hidden" class="type" name="type" value="${member.utype }"/>
	<c:if test="${!empty member }">
	<input type="button" class="write" value="글작성" onclick="insert();"/>
	</c:if>
	<br />
	<br />
	
 <div class="caption"><span>건의사항</span> </div>	
<div id="table">
	<div class="header-row row2">
    <span class="cell primary">글 번호</span>
     
    <span class="cell">글제목</span>
    <span class="cell">작성자</span>
    <span class="cell">작성일</span>
  </div>
  <c:forEach var="notice" items="${list }" varStatus="status">
  <div class="row2 rowf  row-${ status.index mod 2 }">
	<input type="radio" name="expand">
    <span class="cell primary bnum" data-label="글번호">${notice.bnum }</span>
    <span class="cell title" data-label="제목">${notice.nTitle }</span>
     <span class="cell wirter" data-label="작성자">${notice.writer }</span>
    <span class="cell date" data-label="작성일">${notice.nDate }</span>
    <input type="hidden" class="bno" name="bno" value="${notice.bno }"/>
    
   <span id="uno"> <input type="hidden" class="bno" name="uno" value="${notice.uno }"/>${notice.uno }</span>
  </div>
  </c:forEach>
 
</div>
	</div>	
		<br /><br /><br />
		<div class="pagingArea" align="center">
			<c:url var="selectList" value="selectList.su"/>
			
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
		
	<c:import url="../common/footer.jsp"/>

		<script>
		$(function(){
			
		    $(".rowf").mouseenter(function(){
		           if($(this).hasClass('row-0')) $(this).css({"background":"#A9F5A9", "cursor":"pointer"});
		           else $(this).css({"background":"#F5A9F2", "cursor":"pointer"});
		        	/* $(this).filter(":odd").css({"background":"gray", "cursor":"pointer"});
		           $(this).filter(":even").css({"background":"white", "cursor":"pointer"}) */;
		        }).mouseleave(function(){
		        	if($(this).hasClass('row-0')) $(this).css({"background":"#F5BCA9", "cursor":"pointer"});
			           else $(this).css({"background":"#F7D358", "cursor":"pointer"});
		        	 /* $(this).filter(":even").css({"background":"#F5BCA9", "cursor":"pointer"});
		        	$(this).filter(":odd").css({"background":"#F7D358", "cursor":"pointer"}); */
	        	 //$(this).css({"background":"gray", "cursor":"pointer"});
	        	// $(this).css({"background":"gray", "cursor":"pointer"});
	           
	        }).click(function(){
	          var bno = $(this).find('.bno').val();
	          var bnum = $(this).find('.bnum').text();
	           //console.log(bno);
	           location.href="${pageContext.request.contextPath}/selectOne.no?bno=" + bno+"&bnum="+bnum;
	        });
	        	
	        
	     });
		
		function insert(){
			var type = $('.type').val();
			var bnum = $(this).find('.bnum').html();
			
			//console.log(type);
			if(type='A'){
				location.href="${pageContext.request.contextPath}/views/notice/suggestInsertForm.jsp";
			}else{
				alert("관리자만 작성 가능합니다!");
			}
			
			
		}
		
		$(function() {
			$('.breadcam_text').find('h3').text('건의게시판');
			$('.breadcam_text').find('p').text('무엇이든 물어보세요');
		});
		</script>
</body>
</html>