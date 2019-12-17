<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피 등록</title>
<c:import url="../common/commonUtil.jsp"></c:import>
<link rel="stylesheet" href="../../resources/css/recipeWrite.css">
<script src="../../resources/js/recipeWrite.js"></script>
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
<form action="${ pageContext.request.contextPath }/update.rcp" method="post" enctype="multipart/form-data">
<input type="hidden" name="bno" value="${recipe.bno}" />
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
			  <input type="text" name="rtitle" class="form-control" id="basic-url" aria-describedby="basic-addon3" value="${recipe.rtitle}">
			</div>
			
			<div class="input-group desc_div">
			  <div class="input-group-prepend">
			    <span class="input-group-text">레시피 소개</span>
			  </div>
			  <textarea name="rcontent" class="form-control" aria-label="With textarea">${recipe.rcontent}</textarea>
			</div>
			
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon3">동영상 링크</span>
			  </div>
			  <input type="text" name="rvideo" class="form-control" id="basic-url" aria-describedby="basic-addon3" value="${recipe.rvideo}">
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
  				<select name="rtime" class="custom-select">
					<option value="0">시간</option>
					<option value="5">5분이내</option>
					<option value="10">10분이내</option>
					<option value="15">15분이내</option>
					<option value="20">20분이내</option>
					<option value="30">30분이내</option>
					<option value="60">60분이내</option>
					<option value="90">90분이내</option>
					<option value="120">2시간이내</option>
					<option value="999">2시간이상</option>
  				</select>
  				
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="basic-addon3">난이도</span>
			  </div>
  				<select name="rlevel" class="custom-select">
  					<option value="0" >난이도</option>
  					<option value="1">타노스</option>
					<option value="2">초급</option>
					<option value="3">중급</option>
					<option value="4">고급</option>
					<option value="5">신의경지</option>
  				</select>
  			
  			</div>
  			
		</div>
			
		
		<div class="col-md-5" align="center" onclick="clickFile(0);">
			<img src="" id="fVisible0"/>
		</div>
	</div>

	
	
	
	<hr />
	<div class="content_div1">
		<div class="form-group row" align="center">
		    <label class="col-4 col-form-label"><strong>재료구분</strong></label>
		    <label class="col-3 col-form-label"><h4><strong>재료 명</strong></h4></label>
		    <label class="col-4 col-form-label"><strong>용량</strong></label>
		</div>
		
		<div class="row input-group">
		  <div class="input-group-prepend col-4 srcTitle">
		  <button type="button" class="btn btn-outline-warning" onclick="srcTitleRemove(this);">─</button>
		  <input type="text" class="form-control srcTitle">
		  </div>
		  <div class="col-8">
			  <div class="input-group-prepend srcContent">
				  <input type="text" class="form-control srcName">
				  <input type="text" class="form-control">
				  <button type="button" class="btn btn-outline-warning">─</button>
			  </div>
			  <div class="input-group-prepend srcContent">
				  <input type="text" class="form-control srcName">
				  <input type="text" class="form-control">
				  <button type="button" class="btn btn-outline-warning">─</button>
			  </div>
			  <div align="center">
				<button type="button" class="btn btn-outline-dark" onclick="addContent(this);"><strong>╂</strong></button>
			  </div>
		  </div>
		</div>
		
		
		  <div class="srcLBtn longBtn" align="center">
			<button type="button" class="btn btn-outline-primary" onclick="oneClick();">한번에 넣기</button>
			<button type="button" class="btn btn-outline-success" onclick="addSrcTitle(this);">추가</button>
		  </div>
	</div>
	
<hr />
	<div class="content_div2">
		<h4><strong>요리 순서</strong></h4>
		
		<div class="form-group row">
		    <label for="inputPassword" class="col-md-2 col-form-label"><h2>Step1</h2>
			  <button type="button" class="btn btn-outline-warning" onclick="srcTitleRemove(this);">─</button>
			</label>
		    <div class="col-7">
		      <textarea class="form-control" placeholder="작성" rows="5" name="ctntText"></textarea>
		    </div>
		    <div class="col-3" align="center" onclick="clickFile(1);">
				<img src="" id="fVisible1"/>
			</div>
		</div>
		
		  <div class="longBtn" align="center">
			<button type="button" class="btn btn-outline-success" onclick="addPict(this);">추가</button>
		  </div>
	</div>
<hr />
	<div class="content_div3">
		<div class="form-group row">
			<h4  class="col-md-2"><strong>셰프의 팁</strong></h4>
		    <div class="col-10">
		      <textarea type="text" class="form-control" placeholder="작성" rows="5" name="rtip">${recipe.rtip}</textarea>
		    </div>
		</div>
	</div>
<hr />
	<div class="content_div4">
		<h4><strong>사용된 요리도구</strong></h4>
	    <div>
	      <input type="text" class="form-control" placeholder="콤마(,)로 구분하여 작성해주세요!" name="rgoods" value="${recipe.rgoods}"/>
	    </div>
	</div>
<hr />
	  <div class="longBtn" align="center">
			<button type="submit" class="btn btn-primary btn-lg">등록하기</button>
			<button type="button" class="btn btn-secondary btn-lg" onclick="WriteConfirm();">취소하기</button>
	  </div>





	</div>
<div class="col-lg-2 col-md-1 d-md-block d-none"></div>
</div>
	<div id="fileArea">
       <input type="file" id="flevel0" name="fpath0" onchange="LoadImg(this,0)">
       <input type="file" id="flevel1" name="fpath1" onchange="LoadImg(this,1)">
    </div>
    
	<input type="text" name="rsource" value="" style="display: none;"/>
    <input type="text" name="rprocess" value="" style="display: none;"/>
    <input type="text" id="i" name="i" value="2" style="display : none;"/>
</form>    
<!-- ------------------------------form------------------------------------------- -->
    
    
    
	<c:import url="../common/footer.jsp"></c:import>
	<script>
	// 요리 재료 
	$(function() {
		var str = $.trim("${Recipe.rsource}");
	       if(str.indexOf('[') > str.indexOf(']') || str.lastIndexOf('[') > str.lastIndexOf(']')
	       || str.indexOf('[') == -1 || str.indexOf(']') == -1){
	           alert('형식을 확인해주세요!');
	           return;
	       }
	       for(var i=0; str.indexOf('[') != -1; i++){
	           var ctg = $.trim(str.substring(str.indexOf('[')+1, str.indexOf(']')));
	           var div = '<div class="row input-group">'
	        			 + '<div class="input-group-prepend col-4 srcTitle">'
		        			 + '<button type="button" class="btn btn-outline-warning" onclick="srcTitleRemove(this);">─</button>'
		        			 + '<input type="text" class="form-control srcTitle" value="' + ctg + '">'
	        			 + '</div>'
	        			 + '<div class="col-8">'
		        			
	        			 + '</div>'
	    			 + '</div>';
				 
			$('.srcLBtn').before(div);
			var $div_col8 = $('.srcLBtn').prev().find('.col-8');
			
	           str = str.substring(str.indexOf(']'));
	           var strArr;
	           if(str.indexOf('[') == -1){
	               strArr = str.substring(str.indexOf(']')+1).split(',');
	           }else{
	               strArr = str.substring(str.indexOf(']')+1, str.indexOf('[')).split(',');
	           }
	           strArr.forEach(function(item, idx, strArr){
	               item = $.trim(item)
	               itemArr = item.split(' ');
	               if(itemArr.length == 1){
	                   $div_col8.append('<div class="input-group-prepend srcContent">'
					        			 + '<input type="text" class="form-control srcName" value="'+itemArr[0]+'">'
					        			 + '<input type="text" class="form-control">'
					        			 + '<button type="button" class="btn btn-outline-warning">─</button>'
					    			 + '</div>');
	               }else{
	                   $div_col8.append('<div class="input-group-prepend srcContent">'
					        			 + '<input type="text" class="form-control srcName" value="'+itemArr[0]+'">'
					        			 + '<input type="text" class="form-control" value="'+item.substring(item.indexOf(itemArr[1]))+'">'
					        			 + '<button type="button" class="btn btn-outline-warning">─</button>'
					    			 + '</div>');
	               
	               }
	               
	           });
	           $div_col8.append('<div align="center">'
	        		+ '<button type="button" class="btn btn-outline-dark" onclick="addContent(this);"><strong>╂</strong></button>'
	   			+ '</div>');
	           str = str.substring(str.indexOf('['));
	       }
	       
	       $('.srcTitle').parent().each(function() {
		    	var checkStr = "";
	    	   $(this).find('input').each(function() {
		    	   checkStr = checkStr + $(this).val();
				})
		       if(checkStr.length == 0){
		    	   srcTitleRemove();
		       }
			})
			
	});
	
	// 시간, 난이도
	$(function() {
		$('[name=rtime]').find('option').each(function() {
			if($(this).val() == ${recipe.rtime}){
				$(this).attr('select', true);
			}
		})
		$('[name=rlevel]').find('option').each(function() {
			if($(this).val() == ${recipe.rlevel}){
				$(this).attr('select', true);
			}
		})
	});
	
	// 요리 순서
	$(function() {
		var str = $.trim("${Recipe.rprocess}");
	       if(str.indexOf('[') > str.indexOf(']') || str.lastIndexOf('[') > str.lastIndexOf(']')
	       || str.indexOf('[') == -1 || str.indexOf(']') == -1){
	           alert('형식을 확인해주세요!');
	           return;
	       }
		for(var i=1; str.indexOf('[') != -1; i++){
	           str = str.substring(str.indexOf(']'));
	           
	           // 요리 순서 내용 추출
	           var text;
	           if(str.indexOf('[') == -1){
	        	   text = str.substring(str.indexOf(']')+1);
	           }else{
	               text = str.substring(str.indexOf(']')+1, str.indexOf('['));
	           }
	           
	           // 내용 넣기
	           if($.trim(text).length > 0){
	    			if(i>1){ addPict(); }
					var $textarea = $('.content_div2 div:last').prev().find('textarea').val($.trim(text));
					
	           }  
	           str = str.substring(str.indexOf('['));
	       }
		
		// 사진 로드 시키기
		console.log($('[id*=fVisible]'));
		var text = '';
		<c:forEach var="i" items="${fileList}">
			text += '${i.fname}, ';
		</c:forEach>
		
		$('[id*=fVisible]').each(function(j) {
			console.log($(this));
			var imgArr = text.split(', ');
			$(this).attr('src', '${pageContext.request.contextPath}/resources/RecipeBoardImages/' + imgArr[j]);
			if(j==0){
	       	 $(this).css('width','300px');
	        } else {
	       	 $(this).css('width','190px');
	        }
		});
	});
	
	$('form').on('submit', function(event){
		var rprocessCheck = false;
		$('.content_div2').find('textarea').each(function() {
			if($(this).val().trim().length == 0){
				rprocessCheck = true;
			}
		});
		if($('input[name=rtitle]').val().trim().length == 0){
			alert("제목이 없습니다!");
	    	event.preventDefault();
		} else if($('input[name=rsource]').val().trim().length == 0){
			alert("요리 재료가 없습니다!");
	    	event.preventDefault();
		} else if($('input[name=rprocess]').val().trim().length == 0){
			alert("요리 순서가 없습니다!");
	    	event.preventDefault();
		} else if(rprocessCheck){
			alert("요리 순서 중 빈 순서가 있습니다!");
	    	event.preventDefault();
		} else if($('#fVisible0').attr('src') == "/recipe/resources/images/요리대표_레시피등록_준비화면.jpg"){
			alert("대표 사진이 없습니다!");
	    	event.preventDefault();
		} else {
			var result = window.confirm("등록하시겠습니까? \n(요리순서를 글로만 기입해도 되지만, \n요리순서에 사진을 등록하고자 한다면 모든 순서에 추가되어 있어야 \n같은 순서로 인식할 수 있습니다.)");
		    if(result){
		    } else {
		    	event.preventDefault();
		    }
		}
	});
	
	// 카테고리 Ajax
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
						var sel = 0;
						if (idx == 1) {
							str = "종류별";
							nameCate = "rkind";
							sel = ${recipe.rkind};
						} else if (idx == 2) {
							str = "상황별";
							nameCate = "rsituation";
							sel = ${recipe.rsituation};
						} else if (idx == 3) {
							str = "방법별";
							nameCate = "rway";
							sel = ${recipe.rway};
						} else if (idx == 4) {
							str = "재료별";
							nameCate = "ringred";
							sel = ${recipe.ringred};
						} else {
							console.log(idx+"카테고리에 없는데...?");
						}
						
					    var $select = $('<select>');
						$select.attr('class','custom-select').attr('name', nameCate);
						var $option = $('<option>');
						$option.text(str).val(0);
						$select.append($option);
						
						for(var i in list){
							var $option = $('<option>');
							$option.val(i);
							if(i == sel){
								$option.attr('selected',true);
							}
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
	
	// 재료 한번에 넣기
	function oneClick() {
		$('.oneClick').removeClass('disNone');
	}

	$('.oneBtn').on('click', function() {
		$('.oneClick').addClass('disNone');
		if($(this).text().length == 2) return;

	       var str = $.trim($('#oneClickText').val());
	       if(str.indexOf('[') > str.indexOf(']') || str.lastIndexOf('[') > str.lastIndexOf(']')
	       || str.indexOf('[') == -1 || str.indexOf(']') == -1){
	           alert('형식을 확인해주세요!');
	           return;
	       }
	       for(var i=0; str.indexOf('[') != -1; i++){
	           var ctg = $.trim(str.substring(str.indexOf('[')+1, str.indexOf(']')));
	           var div = '<div class="row input-group">'
	        			 + '<div class="input-group-prepend col-4 srcTitle">'
		        			 + '<button type="button" class="btn btn-outline-warning" onclick="srcTitleRemove(this);">─</button>'
		        			 + '<input type="text" class="form-control srcTitle" value="' + ctg + '">'
	        			 + '</div>'
	        			 + '<div class="col-8">'
		        			
	        			 + '</div>'
	    			 + '</div>';
				 
			$('.srcLBtn').before(div);
			var $div_col8 = $('.srcLBtn').prev().find('.col-8');
			
	           str = str.substring(str.indexOf(']'));
	           var strArr;
	           if(str.indexOf('[') == -1){
	               strArr = str.substring(str.indexOf(']')+1).split(',');
	           }else{
	               strArr = str.substring(str.indexOf(']')+1, str.indexOf('[')).split(',');
	           }
	           strArr.forEach(function(item, idx, strArr){
	               item = $.trim(item)
	               itemArr = item.split(' ');
	               if(itemArr.length == 1){
	                   $div_col8.append('<div class="input-group-prepend srcContent">'
					        			 + '<input type="text" class="form-control srcName" value="'+itemArr[0]+'">'
					        			 + '<input type="text" class="form-control">'
					        			 + '<button type="button" class="btn btn-outline-warning">─</button>'
					    			 + '</div>');
	               }else{
	                   $div_col8.append('<div class="input-group-prepend srcContent">'
					        			 + '<input type="text" class="form-control srcName" value="'+itemArr[0]+'">'
					        			 + '<input type="text" class="form-control" value="'+item.substring(item.indexOf(itemArr[1]))+'">'
					        			 + '<button type="button" class="btn btn-outline-warning">─</button>'
					    			 + '</div>');
	               
	               }
	               
	           });
	           $div_col8.append('<div align="center">'
	        		+ '<button type="button" class="btn btn-outline-dark" onclick="addContent(this);"><strong>╂</strong></button>'
	   			+ '</div>');
	           str = str.substring(str.indexOf('['));
	       }
	});
	
	
	// 요리 재료 :rsource 파라메터
	$('.content_div1').mouseout(function() {
		$('[name=rsource]').val("");
		$(this).find('input').each(function() {
			var src = $(this).val().trim();
			if($(this).hasClass('srcTitle')){
				src = "[" + src + "] ";
			} else if ($(this).hasClass('srcName')) {
				src = src + " ";
			} else {
				src = src + " , ";
			}
			$('[name=rsource]').val($('[name=rsource]').val()+src);
		});
	});
	
	// 요리 순서 :rprocess 파라메터
	var p = 0;
	$('.content_div2').mouseout(function() {
		$('[name=rprocess]').val("");
		p = 0;
		$(this).find('textarea').each(function() {
			var pcs = $(this).val().trim();
			if (pcs.length > 0) {
				p++;
				$('[name=rprocess]').val($('[name=rprocess]').val()+ "[" + p + "] "+ pcs + " ");					
			}
		});
	});
	</script>
</body>
</html>