<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/recipe/resources/js/jquery-3.4.1.min.js"></script>
<c:import url="../common/commonUtil.jsp"></c:import>

<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

<style> 
	.top {
		margin-top: 110px;
	}
	.select {
	    color: #856404;
		background-color: #fff3cd !important;
	    border-color: #ffeeba;
	}
	.card {
	    padding-right: 0px;
	    padding-left: 0px;
	}
	.btn-lg {
		background: rgba(255, 193, 7, 0.1);
		width : 40%;
		margin : 10px;
		align: center;
	}
	
	/* 레시피 리스트 카드 */
	#searchResult {
		align-items: center;
	}
	.card {
		width: 230px;
		display: inline-block;
	}
	.rounded-circle {
		width: 40px; 
		height : 40px;
	}
	.Btnwon {
		width:20px; 
		height:20px;
	}
	.click{
		margin:3px;
		width:80px;
		height:40px;
		float:left;
	}
	.click{
		width:100px;
	}
	.moving {
		margin-top: 200px;
		height: 450px;
	}
	 on{
	 border:1px solid #000;
        background: skyblue;
        margin: 2px 0 0 0;
	}

	
	/* 숨기기 처리 높이 지정해주기  */
	 btn_hide.on{
		backgrpund:hotpink;
		margin-top:5%;
	} 
	.BtnTog {
		border: 1px solid;
		height:100%;
	}
	data-off{
	data-off-color:danger;
	}
	.liname{
	width:80px;
	height:40px;
	color:#6FAD9C;
	}
	.listsel {
	width:80px;
	height:40px;
	}
	.card-img-top{
	height:210px;
	margin-top:0px;
	}
}
</style>

</head>
<body>
<c:import url="../common/header.jsp"/>

<div class="BtnTog">  <!-- 숨기기 기능 묶음 시작 --> 

<div class="row top">
   <div class="col-xl-3 col-lg-2 col-md-1 d-sm-block d-none"></div>
   <div class="col-xl-6 col-lg-8 col-md-10">
   
   <br />
   <br />
   <br />
       
       <!--Navbar-->
<nav class="navbar navbar-expand-lg navbar-dark blue lighten-2 mb-4">

  <!-- Collapsible content -->
  <div class="collapse navbar-collapse" id="navbarSupportedContent">

    
      <input class="form-control word" type="text" placeholder="조회하고자 하시는 레시피를 입력하세요 " aria-label="Search" onkeyup="enterKey();">
      <button class="btn btn-mdb-color btn-rounded btn-sm my-0 ml-sm-2" type="button" style="background: #6F7EAD;" onclick="selectedBtn();">검색</button>
    

  </div>
  <!-- Collapsible content -->

  <!-- Navbar brand -->
  <a class="navbar-brand"></a> 
  </nav>
	<!-- <d class="liname">레시피를 부탁해 </d> -->


    <form>
        <fieldset  class="myCategory">
        <legend><strong>카테고리를 선택해보세요!</strong></legend>
    <div class="row">
   <div class="card col-3" >
     <div class="card-header">
       <strong>종류별</strong>
     </div>
      <ul class="list-group">
         <select size="8" multiple id="1">
         </select>
      </ul>
   </div>
   
   <div class="card col-3" >
     <div class="card-header">
       <strong>상황별</strong>
     </div>
      <ul class="list-group">
         <select size="8" multiple id="2">
         </select>
      </ul>
   </div>
     
     <div class="card col-3" >
     <div class="card-header">
       <strong>방법별</strong>
     </div>
      <ul class="list-group">
         <select size="8" multiple id="3">
         </select>
      </ul>
   </div>
   
   <div class="card col-3" >
     <div class="card-header">
      <strong>재료별</strong>
     </div>
      <ul class="list-group">
         <select size="8" multiple id="4">
         </select>
      </ul>
   </div>
</div> 
   
   
   <div align="center">
      <button type="button" class="btn btn-outline-warning btn-lg selectedBtn" onclick="selectedBtn();"><strong>검색하기</strong></button>
    </div>
        </fieldset>
   </form>

  </div>
  
  </div>  <!-- 숨기기 기능 묶음 끝 -->
  
	</div>
	
<div align="center">
	<input  class="stat" type="checkbox" data-toggle="toggle" data-on="불러오기" data-off="숨기기">
</div>	

<span id="result"></span>
<div id="searchResult">

</div>
	<script>
	$(function() {
		selectedBtn();
	});
	// 엔터키 누를때 동작할 함수
	function enterKey() {
		// 13 == 엔터키
		if (window.event.keyCode == 13) selectedBtn();
		
	}
	/* 각각의 해당 레시피 선택 표시 방식 구현 */
	$(document).on('click', 'option', function() {
		if($(this).hasClass('select')){
			$(this).removeClass('select').removeAttr('selected').find('strong').remove();      			
		} else {			
			$(this).addClass('select').attr('selected', true).html("<strong>✔</strong> "+$(this).text());
		}
	});
	
	/* 숨김처리 기능 구현 */
	$(function() {
		$('div.toggle').on('click', function(){
	    	$('.myCategory').slideToggle();
	    	$(".stat").prop("checked",$(".BtnTog").prop("checked"));
	    });
		/* 선택한 레시피 를 보내는 기능 구현 */
		$.ajax({
			url : "${pageContext.request.contextPath}/selectCate.do",
			type : "post",
			success : function(catelist) {
				console.log(catelist);
	
					$.each(catelist, function(idx, list) {
						var $select;
						var nameCate = "";
						if (idx == 1) {
							$select = $('#1');
							nameCate = "rkind";
						} else if (idx == 2) {
							$select = $('#2');
							nameCate = "rsituation";
						} else if (idx == 3) {
							$select = $('#3');
							nameCate = "rway";
						} else if (idx == 4) {
							$select = $('#4');
							nameCate = "ringred";
						} else {
							console.log(idx+"카테고리에 없는데...?");
						}
						
						$select.find('option').remove();
						for(var i in list){
							var $option = $('<option>');
							$option.attr('class', 'list-group-item');
							$option.attr('name', nameCate);
							$option.val(i);
							$option.text(list[i]);
							$select.append($option);
						}
					});

			},
			error : function() {
				console.log("실패했지만~~~~ \n그대는 실 패 해앴지마아안~\n"
							+"그저 이렇게 코드를 바라볼 뿐 \n다가갈수 없어");
			}
		});
	});
	
	

	// 검색하기를 누르면 카테고리를 전달해서 리스트를 뽑아준다.
	
	function selectedBtn(){
		var word = '';
		word = $('.word').val();
		console.log(word);
		var str = '';
		
		$('option').each(function(){
			if($(this).hasClass('select') == true){
				console.log($(this).val());
				str = str + $(this).val() + ",";
				
				console.log(str);
			}
		});
				console.log("str ="+str);
		
		if(word.length == 0 && str.length == 0){
			$('#result').text('전체 결과입니다. 검색해주세요!');
		} else {
			$('#result').text('');
		}
		$.ajax({
			url : '${pageContext.request.contextPath}/menuPage.do',
			data : {menu : str, word : word},
			success : function(menulist){
				$('#searchResult div').remove();
				// ArrayList<HashMap<String, Object>>
				console.log(menulist);
				
				
				// ArrayList<Recipe> : menulist
				for(var i in menulist) {
					console.log(menulist[i].Recipe.bno);
					console.log(menulist[i].Bfile.fname);
					/* <div class="card" style="width: 230px;  margin-top: 200px; ">
					  <img src="/recipe/resources/images/test내용입니다. 삭제예정.PNG" class="card-img-top" alt="...">
						<div class="card-body">
					    <h5 class="card-title" >만든이 <img src="/recipe/resources/images/곰발바닥.PNG" style = "width: 40px; height : 40px;"alt="..." class="rounded-circle"></h5>
					    <h5 class="card-title">title</h5>
					    <p class="card-text">내용 작성할 부분</p>
		
					   <a href="#" class="card-link" type="click"><img src="/recipe/resources/images/즐겨찾기 사진1.PNG" class="Btnwon"; style="width:20px; height:20px";  
					   												onclick="src='/recipe/resources/images/즐겨찾기 사진.PNG' "> </a>
						</div>
					</div> */
					var $div = $('<div>').addClass('card'); 
						
						var $input = $('<input>').attr('type', 'hidden').val(menulist[i].Recipe.bno);
						var $img = $('<img>').attr('src','/recipe/resources/RecipeBoardImages/'+menulist[i].Bfile.fname).addClass('card-img-top').addClass('moving').css('cursor', 'pointer');
						var $divBody = $('<div>').addClass('card-body');
						
							var $h5_writer = $('<h5>').addClass('card-title').text(menulist[i].Recipe.unick); 
								var $img_writer = $('<img>').attr('src', '/recipe/resources/images/곰발바닥.PNG').addClass('rounded-circle');
							var $h5_title = $('<h5>').addClass('card-title').text(menulist[i].Recipe.rtitle);
							var $p_content = $('<p>').addClass('card-text').text(menulist[i].Recipe.rcontent);
							var $a_like = $('<a>').addClass('card-link').attr('type', 'click').attr('href', '#self'); // href # 새로고침해주는 역할 하는 녀석 self로 정지진행.
								var $img_like = $('<img>').attr('src', '/recipe/resources/images/즐겨찾기 사진1.PNG').addClass('Btnwon');
					

									// $h5_writer.append
									$h5_writer.append($img_writer);
									// $a_like.append
									$a_like.append($img_like);
								// $divBody.append
								$divBody.append($h5_writer);
								$divBody.append($h5_title);
								$divBody.append($p_content);
								$divBody.append($a_like);
							// $div.append
							$div.append($input);
							$div.append($img);
							$div.append($divBody);
					$('#searchResult').append($div);
				}
			}, error : function(){
				console.log("실패 했네요 ㅠㅠ");
			}
		});
	}
	


	// 상세페이지 이동.
	$(document).on('click', '.moving', function() {
       var bno = $(this).prev().val();
       // console.log(bno);
       location.href="/recipe/selectOneRecipe.rcp?bno="+bno;
    });
	
	
	
	// 즐겨찾기 이미지 변환
	$(document).on('click', '.Btnwon', function() {
		if($(this).hasClass('like_selected')){
			$(this).removeClass('like_selected').removeAttr('src');
			$(this).attr('src', '/recipe/resources/images/즐겨찾기 사진1.PNG');
		} else {			
			$(this).addClass('like_selected').removeAttr('src');
			$(this).attr('src', '/recipe/resources/images/즐겨찾기 사진.PNG');
		}
	});
	$(function() {
		$('.breadcam_text').find('h3').text('레시피 검색하기');
		$('.breadcam_text').find('p').text('레시피를 검색해보세요.');
	});
</script>


<br />
<br />
<br />
<br />
<c:import url="../common/footer.jsp"/>
</body>

</html>