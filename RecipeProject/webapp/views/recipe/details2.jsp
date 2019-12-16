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
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<img src="" id="fVisible0"/>
${Recipe.bno}
${Recipe.uno}
${Recipe.unick}
${Recipe.rtitle}
${Recipe.rcontent}
${Recipe.rvideo}
${Recipe.rtip}
${Recipe.rgoods}


<span id="rtime"></span>
<span id="rlevel"></span>
<div class="rcategory">

</div>
<div class="content_div1">
	<h4><strong>요리 재료</strong></h4>
</div>
<div class="content_div2">
	<h4><strong>요리 순서</strong></h4>
	
	<div class="form-group row">
	    <label for="inputPassword" class="col-md-2 col-form-label"><h2>Step1</h2>
		</label>
	    <div class="col-7">
	      <p name="ctntText"></p>
	    </div>
	    <div class="col-3" align="center">
			<img src="" id="fVisible1"/>
		</div>
	</div>
	
	  <div class="longBtn" align="center" style="display: none;">
		<button type="button" id="addPict" class="btn btn-outline-success" onclick="addPict(this);">추가</button>
	  </div>
</div>

<script>
$(function() {
	var rtime = "${Recipe.rtime}";
	var result = "";
	if(rtime == 0){
	} else if (rtime == 999) {
		result = '2시간이상';
	} else if (rtime == 120) {
		result = '2시간이내';
	} else if (rtime > 0) {
		result = rtime+'분이내';
	} else {
		result = '삐뽀삐뽀! 에러';
	}
	$('#rtime').empty().text(result);
});
$(function() {
	var rlevel = "${Recipe.rlevel}";
	var result = "";
	if(rlevel == 1){
		result = '타노스';
	} else if (rlevel == 2) {
		result = '초급';
	} else if (rlevel == 3) {
		result = '중급';
	} else if (rlevel == 4) {
		result = '고급';
	} else if (rlevel == 5) {
		result = '신의경지';
	} else {
	}
	$('#rlevel').empty().text(result);
});
$(function() {
	$.ajax({
		url : "${pageContext.request.contextPath}/selectCate.do",
		type : "post",
		success : function(catelist) {
				$('.rcategory').empty();
				$.each(catelist, function(idx, list) {
					for(var i in list){
						if( i == '${Recipe.rkind}' || i == '${Recipe.rsituation}' || i == '${Recipe.rway}' || i == '${Recipe.ringred}'){
						console.log(list[i]);
						var $span = $('<span>');
						$span.text(list[i]);
						$('.rcategory').append($span);
						}
					}
				});
				
		},
		error : function() {
			console.log("가지마 가지마 가지마\n"
						+"아~직 너를 위한 코드들이 남아있는데"
						+"너는 어디에");
			}
	});
}); 
$(function() {
	$('.content_div1').html($('.content_div1').html() + "${Recipe.rsource}".split(", [").join(", <br>["));
});
$(function() {
	var str = $.trim("${Recipe.rprocess}");
       
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
    			if(i>1){ addPict($('#addPict')); }
				$('.content_div2 div:last').prev().find('p').text($.trim(text));
				
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
var i = 2;
function addPict(obj) {
	console.log($(obj).parent());
	$(obj).parent().before('<div class="form-group row">'
								    + '<label for="inputPassword" class="col-md-2 col-form-label"><h2>Step'+ i +'</h2>'
								    + '</label>'
								    + '<div class="col-7">'
									    + '<p name="ctntText"></p>'
								    + '</div>'
								    + '<div class="col-3" align="center"">'
									    + '<img src="" id="fVisible'+ i +'"/>'
								    + '</div>'
							    + '</div>');
	$('#fileArea').append('<input type="file" id="flevel'+ i +'" name="fpath'+ i +'" onchange="LoadImg(this,'+ i +')">');
	i++;
	$('#i').val(i);
}

</script>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>