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
${recipe.bno}
${recipe.rtitle}
${recipe.rcontent}
${recipe.rvideo}
${recipe.rtip}
${recipe.rgoods}
${recipe.rsource}
${recipe.rtime}
${recipe.rlevel}
${recipe.rprocess}
${recipe.rkind}
${recipe.rsituation}
${recipe.rway}
${recipe.ringred}
<div class="content_div2">
	<h4><strong>요리 순서</strong></h4>
	
	<div class="form-group row">
	    <label for="inputPassword" class="col-md-2 col-form-label"><h2>Step1</h2>
		</label>
	    <div class="col-7">
	      <p class="form-control" name="ctntText"></p>
	    </div>
	    <div class="col-3" align="center">
			<img src="" id="fVisible1"/>
		</div>
	</div>
	
	  <div class="longBtn" align="center" style="display: none;">
		<button type="button" class="btn btn-outline-success" onclick="addPict(this);">추가</button>
	  </div>
</div>
<div id="fileArea">
   <input type="file" id="flevel0" name="fpath0" onchange="LoadImg(this,0)">
   <input type="file" id="flevel1" name="fpath1" onchange="LoadImg(this,1)">
</div>

<script>
$(function() {
	var str = $.trim(${recipe.rprocess});
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
				$('.content_div2 div:last').prev().find('p').val($.trim(text));
				
           }  
           str = str.substring(str.indexOf('['));
       }
	
	// 사진 로드 시키기
	$('[name*=fpath]').each(function(j) {
		$(this).load('${tUpFolder}${fileList['+j+'].fname}');
		LoadImg($(this), j);
	})
});
var i = 2;
function addPict(obj) {
	console.log($(obj).parent());
	$(obj).parent().before('<div class="form-group row">'
								    + '<label for="inputPassword" class="col-md-2 col-form-label"><h2>Step'+ i +'</h2>'
								    + '</label>'
								    + '<div class="col-7">'
									    + '<p class="form-control" name="ctntText"></p>'
								    + '</div>'
								    + '<div class="col-3" align="center"">'
									    + '<img src="" id="fVisible'+ i +'"/>'
								    + '</div>'
							    + '</div>');
	$('#fileArea').append('<input type="file" id="flevel'+ i +'" name="fpath'+ i +'" onchange="LoadImg(this,'+ i +')">');
	i++;
	$('#i').val(i);
}
function LoadImg(value, num) {
	   if(value.files && value.files[0]) {
	      var reader = new FileReader();
	      
	      reader.onload = function(e){
	    	  var str = '#fVisible'+num;
	         $(str).attr('src', e.target.result);
		         if(num==0){
		        	 $(str).css('width','300px');
		         } else {
		        	 $(str).css('width','190px');
		         }
	      }
	      reader.readAsDataURL(value.files[0]);
	   }
	}
</script>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>