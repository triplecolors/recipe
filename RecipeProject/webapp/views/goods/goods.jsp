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
<c:import url="../common/commonUtil.jsp" />





<style>
.outer {
	width: 1000px;
	height: auto;
	background: rgb(209, 209, 255, 0.4);
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

.thumbnailArea {
	width: 760px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

.searchArea {
	width: 420px;
	margin-left: auto;
	margin-right: auto;
}

.thumb-list {
	width: 220px;
	border: 1px solid white;
	display: inline-block;
	margin: 10px;
	align: center;
}

.thumb-list:hover {
	opacity: 0.8;
	cursor: pointer;
}

img {
	width: 200px;
	height: 150px;
}
</style>

</head>
<body>
	<c:import url="../common/header.jsp" />
	<section class="outer">

		<br>
		<h2 align="center">GOODS</h2>

		

		<div class="searchArea" >
			<select id="searchCondition" name="searchCondition">
				<option>---</option>
				<option value="writer">작성자</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
			</select> <input type="search">
			<button type="submit">검색하기</button>
		</div>
			<c:if test="${ !empty member }">
			<div align="right">
				<button onclick="location.href='goodsInsert.jsp'">작성하기</button>
			</div>
			</c:if>
		<br>
		<br>
		
		<div class="goodsListArea">
		</div>

		<script>
		
		$(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/selectProduct.gs",
				type : "post",
				success : function(goodsList) {
					/* <div class="goodsDiv"><a onclick="location='goodsList[i].pcurl'">
							<div>
								<img src="/recipe/resources/images/GoodsImages/goodsList[i].pcfname" width="200px">
							</div>
							<p> <b>goodsList[i].pcgname</b> <br> goodsList[i].pcname</p>

							<div style="display : none;">
								<button onclick="location.href='views/goods/selectOne.gs?pcid=goodsList[i].pcid'">수정하기</button>
								<button onclick="location.href='/delete.gs?pcid=goodsList[i].pcid'">삭제하기</button>
							</div>
							
						</a></div> */
					for(var i in goodsList) {
					var $div = $('<div>').append($('<img>').attr('src','/recipe/resources/GoodsImages/'+goodsList[i].pcfname).css('width','200px').css('cursor', 'pointer'));
					var $p = $('<p>').css('width','200px').css('height','50px').html('<b>'+goodsList[i].pcgname+'</b> <br> '+goodsList[i].pcname);
					
							var $update = $('<button>').attr('onclick', "location.href='/recipe/selectOne.gs?pcid="+goodsList[i].pcid+"'").text('수정하기');
							var $delete = $('<button>').attr('onclick', "location.href='/recipe/delete.gs?pcid="+goodsList[i].pcid+"'").text('삭제하기');
					var $bntDiv = $('<div>').append($update).append($delete);
					
					if(goodsList[i].uno != "${ member.uno }"){
						$bntDiv.css('display','none');
					}
					
					var $a = $('<a>').attr('onclick', "location='"+goodsList[i].pcurl+"'");
						$a.append($div)
					$('.goodsListArea').append($('<div>').css('display','inline-block').css('padding','10px').append($a).append($p).append($bntDiv));
					
					}	

				}, error : function() {
					console.log("실패했어요!");
				}
			});
		});
		
	  </script>

		<%-- 페이지처리 구현하기 --%>
		<div class="pagingArea" align="center">
			<c:url var="selectList" value="selectList.bo" />

			<!-- 처음페이지 버튼 -->
			<button onclick="location.href='${selectList}?currentPage=1'">
				&lt;&lt;</button>


			<!-- 이전페이지 버튼 -->
			<c:if test="${ pi.currentPage le 1 }">
				<button disabled>&lt;</button>
			</c:if>
			<c:if test="${ pi.currentPage gt 1 }">
				<button
					onclick="location.href='${selectList}?currentPage=${pi.currentPage - 1}'">
					&lt;</button>
			</c:if>


			<!-- 상세페이지 구현을 위한 반복문 -->
			<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
				<c:if test="${p eq pi.currentPage }">
					<button disabled>${p}</button>
				</c:if>

				<c:if test="${ p ne pi.currentPage }">
					<button onclick="location.href='${selectList}?currentPage=${p}'">
						${p}</button>
				</c:if>
			</c:forEach>

			<!-- 다음페이지 버튼 -->
			<c:if test="${ pi.currentPage ge pi.maxPage }">
				<button disabled>&gt;</button>
			</c:if>
			<c:if test="${ pi.currentPage lt pi.maxPage }">
				<button
					onclick="location.href='${selectList}?currentPage=${pi.currentPage + 1}'">
					&gt;</button>
			</c:if>


			<!-- 마지막페이지 버튼 -->
			<button
				onclick="location.href='${selectList}?currentPage=${pi.maxPage}'">
				&gt;&gt;</button>

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
$(function() {
	$('.breadcam_text').find('h3').text('주방용품 검색하기');
	$('.breadcam_text').find('p').text('레시피와 관련된 용품을 검색해보세요.');
});
</script>



	</section>
	<br>
	<br>
	<br>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
</body>
</html>

