<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 상세보기</title>
<c:import url="../common/commonUtil.jsp"></c:import>
<div>
			<div class="w3-border w3-center w3-padding">
				<c:if test="${ id == member }">
					추천 기능은 <button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
					<i class="fa fa-heart" style="font-size:16px;color:blue"></i>
					<span class="favorites_count"></span>					
				</c:if>
				<c:if test="${ id != member }">
					<button class="w3-button w3-black w3-round" id="rec_update">
						<i class="fa fa-heart" style="font-size:16px;color:green"></i>
						&nbsp;<span class="favorites_count"></span>
					</button> 
				</c:if>
			</div>
		</div>
		
		<script>
			$(function(){
				// 추천버튼(추천 추가 또는 추천 제거)
				$("rec_update").click(function(){
					$.ajax({
						url: "/expro/RecUpdate.do",
						type: "POST",
						data: {
							uno: ${content.board_no},
							me: '${member}'
						},
						success: function(){
							recCount();
						},
					})
				})
				
				//게시글 추천수 
			function recCount(){
					$.ajax({
						url: "/expro/RecCount.do",
						type: "POST",
						data: {
							uno: ${content.board_no}
						},
						success: function(count){
							$(".rec_count").html(count);
						},
					})
				};
				recCount(); // 처음 시작했을 떄 실행 되도록 해당 함수 호춤
			
		</script>
</body>
</html>






