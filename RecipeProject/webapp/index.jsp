<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>레시피를 부탁해</title>
<c:import url="views/common/commonUtil.jsp"></c:import>
<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.4.1.min.js"></script>
</head>
<body>
<c:import url="views/common/header.jsp"></c:import>


<div class="gallery_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title mb-70">
                        <h3>추천 레시피</h3>
                        <p>회원들이 가장 많이 찾는 레시피 입니다.</p>
                    </div>
                </div>
            </div>
            <div class="row grid">
                <div class="col-xl-5 col-lg-5 col-md-6 grid-item">
                    <div class="single_gallery long_height">
                        <a></a>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 grid-item">
                    <div class="single_gallery mini_height">
                        <a></a>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 grid-item ">
                    <div class="single_gallery mini_height">
                        <a></a>
                    </div>
                </div>
                <div class="col-xl-7 col-lg-7 col-md-6 grid-item">
                    <div class="single_gallery mid_height">
                        <a></a>
                    </div>
                </div>
                <div class="col-xl-5 col-lg-5 col-md-6 grid-item">
                    <div class="single_gallery large_height">
                        <a></a>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 grid-item">
                    <div class="single_gallery mini_height">
                        <a></a>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 grid-item">
                    <div class="single_gallery mini_height">
                        <a></a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="load_more_button text-center">
                        <a href="${ pageContext.request.contextPath}/views/recipe/menuList.jsp" class="load_more_btn">더 많은 레시피 보기</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


<c:import url="views/common/footer.jsp"></c:import>
<script>
$(function() {
	$('.breadcam_text').find('h3').text('레시피를 부탁해');
	$('.breadcam_text').find('p').text('메인 페이지입니다.');
	var str = '';
	var word = '';
	
	$.ajax({
		url : "${pageContext.request.contextPath}/menuPage.do",
		data : {menu : str, word : word},
		success : function(catelist) {
			$('.single_gallery').each(function(j) {
				$(this).css('background-image', 'url(resources/RecipeBoardImages/'+ catelist[j].Bfile.fname +')');
				$(this).find('a').attr('href','/recipe/selectOneRecipe.rcp?bno='+catelist[j].Recipe.bno);
			})
		},
		error : function() {
			console.log("에러!");
			}
	});
});
</script>
</body>
</html>