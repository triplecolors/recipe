<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록</title>
<c:import url="../common/commonUtil.jsp"></c:import>
<style>
body {
	background: rgb(250, 250, 250);
}

.back_div {
	margin-top: 110px;
	background: white;
	padding: 10px;
}

.title_div {
	background: rgba(227, 154, 125, 0.2);
	padding: 10px;
}

.basic_div {
	padding: 20px;
}

.desc_div {
	margin-bottom: 15px;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp"></c:import>
<div class="oneClick oneClick_back disNone"></div>
<div class="row oneClick oneClick_card disNone">
	<div class="col-xl-3 col-lg-2 col-md-1 d-md-block d-none"></div>
	<div class="col-xl-6 col-lg-8 col-md-10">
	<div class="card">
	  <h5 class="card-header"><strong>[재료] 한번에 넣기</strong></h5>
	  <div class="card-body">
		    <div class="form-group">
			    <label for="oneClickText"><h5 class="card-title">요리에 들어갈 재료, 양념을 작성 또는 따로 작성된 것을 복사/붙여넣기 해주세요.</h5></label>
			    <textarea class="form-control" id="oneClickText" 
						  placeholder="[스테이크 재료] 돼지고기 500g, 양파 1/2개, 고추 1개, 간장
[파절임] 대파 3개, 고춧가루 1숟가락, 매실엑기스 3숟가락, 식초 3숟가락
[양념] 고춧가루 2T, 진간장 1T, 참치액 1T, 참기름 1T, 매실액 1T, 통깨" rows="6">
[스테이크 재료] 돼지고기 500g, 양파 1/2개, 고추 1개, 간장
[파절임] 대파 3개, 고춧가루 1숟가락, 매실엑기스 3숟가락, 식초 3숟가락
[양념] 고춧가루 2T, 진간장 1T, 참치액 1T, 참기름 1T, 매실액 1T, 통깨</textarea>
			</div>
		    <p class="card-text">
		    		*재료가 남거나 부족하지 않도록 정확히 작성<br />
					*각 식재료는 ","쉼표로 구분<br />
					*한개, 반개, 한개반과 같은 표기는 1개, 1/2개, 1+1/2개(또는 1.5개)와 같이 작성<br />
					*재료 및 양념, 소스 등을 구분할 경우 "[]"대괄호를 사용<br />
					*입력란에 작성된 예시를 참고
			</p>
			<div class="row oneClick_btn">
				<div class="col-3"></div>
				<button class="col-3 btn btn-outline-success oneBtn" id="ent">한번에 넣기</button>
				<button class="col-3 btn btn-outline-secondary oneBtn">취소</button>
				<div class="col-3"></div>
		  	</div>
	  </div>
	</div>
	</div>
	<div class="col-xl-3 col-lg-2 col-md-1 d-md-block d-none"></div>
</div>
<!-- ------------------------------form------------------------------------------- -->
<form action="${ pageContext.request.contextPath }/insert.rcp" method="post" enctype="multipart/form-data">
<input type="hidden" name="uno" value="${member.uno}" />
<div class="row">
<div class="col-lg-2 col-md-1 d-md-block d-none"></div>
	<div class="back_div col-lg-8 col-md-10 col-sm-12">

	<div class="title_div"><h3><strong>레시피 등록</strong></h3></div>
	
	<div class="row basic_div">
		<div class="col-md-7">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon3">레시피 제목</span>
			  </div>
			  <input type="text" name="rtitle" class="form-control" id="basic-url" aria-describedby="basic-addon3">
			</div>
			
			<div class="input-group desc_div">
			  <div class="input-group-prepend">
			    <span class="input-group-text">레시피 소개</span>
			  </div>
			  <textarea name="rcontent" class="form-control" aria-label="With textarea"></textarea>
			</div>
			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon3">동영상 링크</span>
			  </div>
			  <input type="text" name="rvideo" class="form-control" id="basic-url" aria-describedby="basic-addon3">
			</div>

			<div class="row basic_div">
				<div class="col-md-7">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">레시피 제목</span>
						</div>
						<input type="text" class="form-control" id="basic-url"
							aria-describedby="basic-addon3">
					</div>

					<div class="input-group desc_div">
						<div class="input-group-prepend">
							<span class="input-group-text">레시피 소개</span>
						</div>
						<textarea class="form-control" aria-label="With textarea"></textarea>
					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">동영상 링크</span>
						</div>
						<input type="text" class="form-control" id="basic-url"
							aria-describedby="basic-addon3">
					</div>


					<div class="input-group mb-3">
						<div class="input-group-prepend" id="category">
							<span class="input-group-text" id="basic-addon3">카테고리</span>
						</div>


					</div>

					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">시간</span>
						</div>
						<select class="custom-select">
							<option name="RTIME" value="">시간</option>
							<option name="RTIME" value="5">5분이내</option>
							<option name="RTIME" value="10">10분이내</option>
							<option name="RTIME" value="15">15분이내</option>
							<option name="RTIME" value="20">20분이내</option>
							<option name="RTIME" value="30">30분이내</option>
							<option name="RTIME" value="60">60분이내</option>
							<option name="RTIME" value="90">90분이내</option>
							<option name="RTIME" value="120">2시간이내</option>
							<option name="RTIME" value="999">2시간이상</option>
						</select>

						<div class="input-group-prepend">
							<span class="input-group-text" id="basic-addon3">난이도</span>
						</div>
						<select class="custom-select">
							<option name="RLEVEL" value="">난이도</option>
							<option name="RLEVEL" value="1">타노스</option>
							<option name="RLEVEL" value="2">아마추어</option>
							<option name="RLEVEL" value="3">중급</option>
							<option name="RLEVEL" value="4">고급</option>
							<option name="RLEVEL" value="5">신의경지</option>
						</select>

					</div>

				</div>


				<div id="titleImgArea" class="photo_basic_div col-md-5"
					align="center">
					<img
						src="${ pageContext.request.contextPath}/resources/images/요리대표_레시피등록_준비화면.jpg"
						id="titleImg" />
				</div>
			</div>


















		</div>
		<div class="col-lg-2 col-md-1 d-md-block d-none"></div>
	</div>
	<div id="fileArea">
		<input type="file" id="thumbnailImg1" name="thumbnailImg1"
			onchange="LoadImg(this,1)"> <input type="file"
			id="thumbnailImg2" name="thumbnailImg2" onchange="LoadImg(this,2)">
		<input type="file" id="thumbnailImg3" name="thumbnailImg3"
			onchange="LoadImg(this,3)"> <input type="file"
			id="thumbnailImg4" name="thumbnailImg4" onchange="LoadImg(this,4)">
	</div>
	<c:import url="../common/footer.jsp"></c:import>
	<script>
		$(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/selectCate.do",
				type : "post",
				success : function(catelist) {
					console.log(catelist);
					
					var $category = $('#category');
					$category.siblings().remove();

						$.each(catelist, function(idx, list) {
							var str = "";
							var nameCate = "";
							if (idx == 1) {
								str = "종류별";
								nameCate = "rkind";
							} else if (idx == 2) {
								str = "상황별";
								nameCate = "rsituation";
							} else if (idx == 3) {
								str = "방법별";
								nameCate = "rway";
							} else if (idx == 4) {
								str = "재료별";
								nameCate = "ringred";
							} else {
								console.log(idx+"카테고리에 없는데...?");
							}
							
						    var $select = $('<select>');
							$select.attr('class','custom-select');
							var $option = $('<option>');
							$option.attr('name', nameCate);
							$option.text(str);
							$select.append($option);
							
							for(var i in list){
								var $option = $('<option>');
								$option.attr('name', nameCate);
								$option.val(i);
								$option.text(list[i]);
								$select.append($option);
							}
							
							$category.append($select);
						});
						
				},
				error : function() {
					console.log("실패했지만~~~~ \n그대는 실 패 해앴지마아안~\n"
								+"그저 이렇게 코드를 바라볼 뿐 \n다가갈수 없어");
				}
			});
		});
		// 사진을 추가하였을 때, 이미지 태그와 연동하여 바로 보이도록
		// '미리보기'기능 구현하기
		$(function() {
			$('#fileArea').hide();
			// $('#titleImgArea').on('click',function(){});
			$('#titleImgArea').click(() => {
				$('#thumbnailImg1').click();
			});
			$('#contentImgArea1').click(() => {
				$('#thumbnailImg2').click();
			});
			$('#contentImgArea2').click(() => {
				$('#thumbnailImg3').click();
			});
			$('#contentImgArea3').click(() => {
				$('#thumbnailImg4').click();
			});
		});
		
		function LoadImg(value, num) {
	           if(value.files && value.files[0]) {
	              var reader = new FileReader();
	              
	              reader.onload = function(e){
	                 switch(num){
	                 case 1: $('#titleImg').attr('src', e.target.result);
	                    break;
	                 case 2: $('#contentImg1').attr('src', e.target.result);
	                    break;
	                 case 3: $('#contentImg2').attr('src', e.target.result);
	                    break;
	                 case 4: $('#contentImg3').attr('src', e.target.result);
	                    break;
	                 }
	              }
	              
	              reader.readAsDataURL(value.files[0]);
	           }
	        }
	</script>
</body>
</html>