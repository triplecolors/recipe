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
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/style.css">

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/fullpage.min.css">

<style>
	.notebody{
		margin : auto;
		width : 1000px;
	}
	#submit{
		margin : auto;
	}
	.button{
		margin :auto;
	}
	
</style>
</head>
<body>

<c:import url="../common/header.jsp"/>

<br />
<br />
<br /><br />
<br />
<br />
<br /><br />
<br />
<br />

<section>
 <div align="center" >
    <div id="yu" class="site-blocks-cover overlay aos-init aos-animate" >
    </div>
   </div>
<div class="mb-2" align="center">
<form id="insertForm" action="${ pageContext.request.contextPath }/ninsert.bo"  method="post"  >
      <div class="input-group mb-3" style="width:900px;">

         <br />
              <input type="text" class="form-control" aria-label="Text input with dropdown button" 
              name="title" placeholder="제목을 입력하세요.">
             
      </div>

      <div class="editorArea"  style="margin-top:20px;">
              <textarea id="summernote" name="editordata"></textarea>
      </div>
      <input type="hidden" name="uno"  value="${member.uno}"/>

<div align="center">
<button type="reset" class="btn btn-primary" onclick="cancelbtn();">취소</button>
<button type="submit" class="btn btn-primary" onclick="insertbtn();">확인</button>
</div>
</form>
            
</div>
</section>

<c:import url="../common/footer.jsp"/>
<script>
$(function(){
	   console.log(${member.uNo});
	});
	$('#summernote').summernote({
	    placeholder: '내용을 입력하세요.',
	    tabsize: 2,
	    height: 500,
	    width: 900,
	    focus: true,
	    lang : 'ko-KR',
	    callbacks: {
	       onImageUpload: function(files, editor, welEditable) {
	             for (var i = files.length - 1; i >= 0; i--) {
	                sendFile(files[i], this);
	             }
	         }
	    }
	 });
	   
	  $('.dropdown-toggle').dropdown()
	 
	 function sendFile(file, el) {
	    
	 var form_data = new FormData();
	  form_data.append('file', file);
	  // console.log(form_data.file);

	  
	  $.ajax({
	       data: form_data,
	       type: "post",
	       url: 'insert.tn',
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
	         location.href = "${pageContext.request.contextPath}/selectList.no";
	        } 
	   }
	   
	
</script>

</body>
</html>