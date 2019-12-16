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
<script src="resources/js/fullpage.min.js"></script>
<link rel="stylesheet" href="resources/css/fullpage.min.css" />
<c:import url="views/common/commonUtil.jsp"></c:import>
<style>
 body {
     background: url("/recipe/resources/images/MainBackground후보1.gif") no-repeat;
     background-size: cover;
   }
  a {
  	color: black !important; 
  }
 
  #back {
  	width : 80%;
  	height : 100%;
  	background: rgba(255, 255, 255, 0.4);
  	position: fixed;
  	margin-left: 10%;
  	margin-right: 10%;
  }
.section {
  text-align:center;
  font-size: 3em;
	z-index : 100;
}
.section {
	text-align:center;
  	font-size: 3em;
	z-index : 100;
}

</style>
</head>
<body>
<div id="back"></div>
<c:import url="views/common/header.jsp"></c:import>
	<div id="fullpage">
       <div class="section">
					       <div class="row">
						<div class="col-xl-4 col-lg-2 col-md-1 d-sm-block d-none"></div>
						<div id="main_contents" class="col-xl-4 col-lg-8 col-md-10 col-sm-12">
							<div id="carouselExampleCaptions1" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner">
							  <ol class="carousel-indicators"> 
							    <li data-target="#carouselExampleCaptions1" data-slide-to="0" class="active"></li>
							    <li data-target="#carouselExampleCaptions1" data-slide-to="1"></li>
							    <li data-target="#carouselExampleCaptions1" data-slide-to="2"></li>
							  </ol>
							    <div class="carousel-item active">
							      <img src="resources/images/r1.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>First slide label</h5>
							        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img src="resources/images/r2.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>Second slide label</h5>
							        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img src="resources/images/r3.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>Third slide label</h5>
							        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
							      </div>
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleCaptions1" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleCaptions1" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div>
						</div>
						<div class="col-xl-4 col-lg-2 col-md-1 d-sm-block d-none"></div>
					</div>
       </div>
       <div class="section">
					       <div class="row">
						<div class="col-xl-4 col-lg-2 col-md-1 d-sm-block d-none"></div>
						<div id="main_contents" class="col-xl-4 col-lg-8 col-md-10 col-sm-12">
							<div id="carouselExampleCaptions2" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner">
							  <ol class="carousel-indicators"> 
							    <li data-target="#carouselExampleCaptions2" data-slide-to="0" class="active"></li>
							    <li data-target="#carouselExampleCaptions2" data-slide-to="1"></li>
							    <li data-target="#carouselExampleCaptions2" data-slide-to="2"></li>
							  </ol>
							    <div class="carousel-item active">
							      <img src="resources/images/r1.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>First slide label</h5>
							        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img src="resources/images/r2.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>Second slide label</h5>
							        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img src="resources/images/r3.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>Third slide label</h5>
							        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
							      </div>
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleCaptions2" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleCaptions2" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div>
						</div>
						<div class="col-xl-4 col-lg-2 col-md-1 d-sm-block d-none"></div>
					</div>
       </div>
       <div class="section">
					       <div class="row">
						<div class="col-xl-4 col-lg-2 col-md-1 d-sm-block d-none"></div>
						<div id="main_contents" class="col-xl-4 col-lg-8 col-md-10 col-sm-12">
							<div id="carouselExampleCaptions3" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner">
							  <ol class="carousel-indicators"> 
							    <li data-target="#carouselExampleCaptions3" data-slide-to="0" class="active"></li>
							    <li data-target="#carouselExampleCaptions3" data-slide-to="1"></li>
							    <li data-target="#carouselExampleCaptions3" data-slide-to="2"></li>
							  </ol>
							    <div class="carousel-item active">
							      <img src="resources/images/r1.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>First slide label</h5>
							        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img src="resources/images/r2.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>Second slide label</h5>
							        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img src="resources/images/r3.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>Third slide label</h5>
							        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
							      </div>
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleCaptions3" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleCaptions3" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div>
						</div>
						<div class="col-xl-4 col-lg-2 col-md-1 d-sm-block d-none"></div>
					</div>
       </div>
       <div class="section">
					       <div class="row">
						<div class="col-xl-4 col-lg-2 col-md-1 d-sm-block d-none"></div>
						<div id="main_contents" class="col-xl-4 col-lg-8 col-md-10 col-sm-12">
							<div id="carouselExampleCaptions4" class="carousel slide" data-ride="carousel">
							  <div class="carousel-inner">
							  <ol class="carousel-indicators"> 
							    <li data-target="#carouselExampleCaptions4" data-slide-to="0" class="active"></li>
							    <li data-target="#carouselExampleCaptions4" data-slide-to="1"></li>
							    <li data-target="#carouselExampleCaptions4" data-slide-to="2"></li>
							  </ol>
							    <div class="carousel-item active">
							      <img src="resources/images/r1.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>First slide label</h5>
							        <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img src="resources/images/r2.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>Second slide label</h5>
							        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
							      </div>
							    </div>
							    <div class="carousel-item">
							      <img src="resources/images/r3.jpg" class="d-block w-100" alt="...">
							      <div class="carousel-caption">
							        <h5>Third slide label</h5>
							        <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
							      </div>
							    </div>
							  </div>
							  <a class="carousel-control-prev" href="#carouselExampleCaptions4" role="button" data-slide="prev">
							    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
							    <span class="sr-only">Previous</span>
							  </a>
							  <a class="carousel-control-next" href="#carouselExampleCaptions4" role="button" data-slide="next">
							    <span class="carousel-control-next-icon" aria-hidden="true"></span>
							    <span class="sr-only">Next</span>
							  </a>
							</div>
						</div>
						<div class="col-xl-4 col-lg-2 col-md-1 d-sm-block d-none"></div>
					</div>
       </div>
       
       
	</div>
<c:import url="views/common/footer.jsp"></c:import>
<script>
	new fullpage('#fullpage', {
	});
</script>
</body>
</html>