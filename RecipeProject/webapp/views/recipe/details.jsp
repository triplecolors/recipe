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
<c:import url="../common/header.jsp"></c:import>
</head>
<body>
<nav>
<h1 align="center">레시피 상세보기</h1>
<hr />
<h3 align="center">egg tost</h3>
</nav>
<div>
	 <section class="section element-animate">

      <div class="clearfix mb-5 pb-5">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12 text-center heading-wrap">
              <h2>Chefs</h2>
              <span class="back-text">Our Chefs</span>
            </div>
          </div>
        </div>
      </div>
        <div class="container">
          <div class="row">
            <div class="major-caousel js-carousel-1 owl-carousel">
              <div>
                <div class="media d-block media-custom text-center">
                  <a href="adoption-single.html"><img src="img/person_1.jpg" alt="Image Placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <h3 class="mt-0 text-black">Mellisa Howard</h3>
                    <p class="lead">CEO, Co-Founder</p>
                  </div>
                </div>
              </div>
              <div>
                <div class="media d-block media-custom text-center">
                  <a href="adoption-single.html"><img src="img/person_2.jpg" alt="Image Placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <h3 class="mt-0 text-black">Mike Richardson</h3>
                    <p class="lead">CEO, Co-Founder</p>
                  </div>
                </div>
              </div>
              <div>
                <div class="media d-block media-custom text-center">
                  <a href="adoption-single.html"><img src="img/person_3.jpg" alt="Image Placeholder" class="img-fluid"></a>
                  <div class="media-body">
                    <h3 class="mt-0 text-black">Charles White</h3>
                    <p class="lead">CEO, Co-Founder</p>
                  </div>
                </div>
              </div>

               <div>
              <div class="media d-block media-custom text-center">
                <a href="adoption-single.html"><img src="img/person_1.jpg" alt="Image Placeholder" class="img-fluid"></a>
                <div class="media-body">
                  <h3 class="mt-0 text-black">Mellisa Howard</h3>
                  <p class="lead">CEO, Co-Founder</p>
                </div>
              </div>
            </div>
            <div>
              <div class="media d-block media-custom text-center">
                <a href="adoption-single.html"><img src="img/person_2.jpg" alt="Image Placeholder" class="img-fluid"></a>
                <div class="media-body">
                  <h3 class="mt-0 text-black">Mike Richardson</h3>
                  <p class="lead">CEO, Co-Founder</p>
                </div>
              </div>
            </div>
            <div>
              <div class="media d-block media-custom text-center">
                <a href="adoption-single.html"><img src="img/person_3.jpg" alt="Image Placeholder" class="img-fluid"></a>
                <div class="media-body">
                  <h3 class="mt-0 text-black">Charles White</h3>
                  <p class="lead">CEO, Co-Founder</p>
                </div>
              </div>
            </div>
            
              
          </div>
          <!-- END slider -->
          </div>
        </div>
      
    </section> <!-- .section -->
    
</div>
<c:import url="../common/footer.jsp"></c:import>
</body>
</html>