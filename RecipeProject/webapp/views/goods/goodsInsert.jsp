<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조리용품등록창</title>
<c:import url="../common/commonUtil.jsp"/>

<style>

 

.outer {

      width:900px;

      height:650px;

      background:rgba(255, 255 , 255, 0.5);

      color:gray;

      margin-left:auto;

      margin-right:auto;

      margin-top:50px;

   }

   table {

      padding: 15px;

      border:1px solid white;

   }

 

   .tableArea {

      width:600px;

      height:250px;

      margin-left:auto;

      margin-right:auto;

   }

 header a {
 width: max-content;
 }

</style>

</head>

<body>

 

<c:import url="../common/header.jsp"/>

 

<section class="outer">

      <br>

      <h2 align="center">상품 등록</h2>

      <div class="tableArea">

         <form action="${pageContext.request.contextPath }/insert.gs" method="post" enctype="multipart/form-data"> <!-- 사진 :enctype="multipart/form-data"  -->
               <!-- encode type = 이렇게 바꾸겠따! -->

               

            <table>
            
            <div class="btn-group" role="group" aria-label="Button group with nested dropdown">

 

  <div class="btn-group" role="group">

    <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

      제품카테고리

    </button>

    <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">

      <a class="dropdown-item">Kitchen<input type="hidden" value="1" /></a>

      <a class="dropdown-item">Cooking<input type="hidden" value="2" /></a>
    </div>


  </div>

</div>

               <tr>

                  <td>상품명</td>

                  <td colspan="3"><input type="text" size="51" name="pcname"></td>

               </tr>
               <tr>

                  <td>작성자</td>

                  <td colspan="3"><input type="hidden" name="uno" value=${ member.uno }>${ member.unick }</td>

               </tr>

               <tr>

                  <td>첨부파일 </td>

                  <td colspan="3">

                  <div class="col-md-5" align="center" onclick="clickFile(0);">
			<img src="${ pageContext.request.contextPath}/resources/images/요리대표_레시피등록_준비화면.jpg" id="fVisible0"/>
		</div>
		
		<div id="fileArea" style="display: none;">
       <input type="file" id="flevel0" name="fpath0" onchange="LoadImg(this,0)">
        </div>
                  </td>

               </tr>

               <tr>

                  <td>연결할 링크  </td>

                  <td colspan="3">

                     <textarea name="pcurl" cols="52" rows="3" style="resize:none;"></textarea>

                  </td>

               </tr>

            </table>

            <br>

            <div align="center">

               <button type="reset">취소하기</button>

               <button type="submit">등록하기</button>

            </div>

         </form>

      </div>

   </section>

<br><br><br><br><br>

<c:import url="../common/footer.jsp"/>
<script>
$(document).on('click', '.dropdown-item', function() {
	if($(this).hasClass('select')){
		$(this).removeClass('select').find('input').removeAttr('name');      			
	} else {			
		console.log($(this).find('input').val());
		$(this).addClass('select').find('input').attr('name', 'pcgtype');
		$('#btnGroupDrop1').text($(this).text());
	}
});

// 사진
function clickFile(num) {
	var str = '#flevel'+num;
		$(str).click();
}

function LoadImg(value, num) {
   if(value.files && value.files[0]) {
      var reader = new FileReader();
      
      reader.onload = function(e){
    	  var str = '#fVisible'+num;
         $(str).attr('src', e.target.result);
	        	 $(str).css('width','300px');
      }
      reader.readAsDataURL(value.files[0]);
   }
}
</script>
</body>
</html>