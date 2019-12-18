<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>게시글 작성</title>
 	<c:import url="../common/commonUtil.jsp"></c:import>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <style>
        
    .red{
    color:red;
    }

    #btnSubmit {
        background: #ff666f;
        border:#ff666f;
    }
    #btnSubmit:hover,
    #btnSubmit:active,
    #btnSubmit:focus {
            background: #ff666f;
            border:#ff666f;
        }
    </style>
</head>

 	<c:import url="../common/header.jsp"></c:import>
<body body style="background: gray;">
<!------ Include the above in your HEAD tag ---------->
<c:if test="${!empty member }">
<h1 class="text-center" style="color: white;">글 작성</h1>
</c:if>
<hr>
<p>&nbsp;</p>
<div class="container">
    <div>        
        <br style="clear:both">
                <form action="${pageContext.request.contextPath}/ninsert.bo?uno=${member.uno}" method="post">
                <input type="hidden" class="uno" name="uno" value="${member.uno }"/>
            <div class="form-group col-md-12 ">                                
			
                    <input type="text" id="title" name="title" class="form-control input-sm" placeholder="제목"> <br>
                    <textarea class="form-control input-sm " type="textarea" id="message" name="content" placeholder="내용을 입력하세요" maxlength="3000" rows="7"></textarea>
                    <span class="help-block"><p id="characterLeft" class="help-block "style="color:snow">You have reached the limit</p></span>                    
                </div>
                <br style="clear:both">
                <div class="form-group col-md-12">
                    <button class="form-control input-sm btn btn-success disabled" id="btnSubmit" name="btnSubmit" type="submit" style="height:35px"> 글쓰기</button>    
                </div>
            </form>
</div>
</div>

<script>
    $(document).ready(function(){ 
    $('#characterLeft').text('3000 자 이내로 입력해주세요');
    $('#message').keyup(function () {
        var max = 3000;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft').text('You have reached the limit');
            $('#characterLeft').addClass('red');
            $('#btnSubmit').addClass('disabled');            
        } 
        else {
            var ch = max - len;
            $('#characterLeft').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft').removeClass('red');            
        }
    });    
});

</script>
	<c:import url="../common/footer.jsp"/>
</body>
</html>