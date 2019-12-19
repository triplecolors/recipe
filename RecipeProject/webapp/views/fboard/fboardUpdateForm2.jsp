<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style>
   .mb-3{
      display:inline-block;
   }
   #yu{
  width:500px;
  height:150px;
  background-size: 400px;
  background-repeat:no-repeat;
}
</style>


<!-- 썸머노트 css, js 설정 -->

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
</head>
<body>

      <div class="editorArea"  style="margin-top:20px;">
              <textarea id="summernote" name="editordata">${fboard.pContent }</textarea>
      </div>
     

<script>
$(function(){
	
	$('#summernote').summernote({
	    placeholder: '내용을 입력하세요.',
	    tabsize: 2,
	    height: 500,
	    width: 900,
	    focus: true,
	    callbacks: {
	       onImageUpload: function(files, editor, welEditable) {
	             for (var i = files.length - 1; i >= 0; i--) {
	                sendFile(files[i], this);
	             }
	         }
	    }
	 });
   
  $('.dropdown-toggle').dropdown();
 
 function sendFile(file, el) {
    
	 var form_data = new FormData();
	  form_data.append('file', file);
	  // console.log(form_data.file);
	
	  
	  $.ajax({
	       data: form_data,
	       type: "post",
	       url: 'fiupdate.fb',
	    cache : false,
	    contentType : false,
	       enctype: 'multipart/form-data',
	    processData : false,
	       success: function(url) {
	          console.log('----------------------------');
	          console.log(url);
	          console.log('----------------------------');
	          url.replace("\/","/");
	         $(el).summernote('editor.insertImage', url);
	       }, error: function(){
	          console.log("실패실패");
	       }
	  });
	}
});
  
 
  function insertbtn(){
      if($('#title').val() == ""){
         alert("제목을 입력하세요.");
         $('#title').focus();
      } else if($('#summernote').val() == ""){
         alert("내용을 입력해 주세요.");
         $('#summernote').focus();
      } else {
         $('#insertForm').submit();
      }
      event.preventDefault();   
      
   }
   
   function cancelbtn(){
      var answer = confirm("게시글 작성을 취소하시겠습니까?");
      
      if(answer == true){
         location.href = "${pageContext.request.contextPath}/selectList.fb";
        } 
   }
   
 
</script>

</body>
</html>