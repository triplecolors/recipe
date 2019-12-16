<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div id="headerback"></div>
<header>
	<div class="header-area ">
		<div id="sticky-header" class="main-header-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-xl-10 col-lg-10">
						<div class="main-menu d-lg-block">
							<nav>
								<ul class="mein_menu_list" id="navigation">
									<li>
										<a href="${ pageContext.request.contextPath }/index.jsp">HOME</a>
									</li>
									<li>
										<a href="${ pageContext.request.contextPath }/selectList.no">Services</a>
									</li>
									<li>
										<a href="${ pageContext.request.contextPath}/views/test/menuList.jsp">menu</a>
									</li>
									<li>
										<a href="">gallery</a>
									</li>
									<div class="logo-img d-none d-lg-block">
										<a href="${ pageContext.request.contextPath }/index.jsp">
											<img src="${ pageContext.request.contextPath }/resources/images/로고.png" width="160px" height="120px">
										</a>
									</div>
									<li>
										<a href="#">blog <i class="ti-angle-down"></i></a>
										<ul class="submenu">
											<li><a href="">blog</a></li>
											<li><a href="">single-blog</a></li>
										</ul>
									</li>
									
									<ul class="submenu" >
										<li>
											<a href="${pageContext.request.contextPath }/views/mypage/myPageList.jsp">v마이페이지 <i class="ti-angle-down"/></a>
										</li>
										<li>
											<a href="">elements</a>
										</li>
									</ul>
										<li>
											<a href="">로그인</a>
										<ul class="submenu">
											<li><a href="">아이디/비밀번호 찾기</a></li>
											<li><a href="">회원가입</a></li>
										</ul>
										
										</li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-12">
						<div class="mobile_menu "></div>
					</div>
					<div class="logo-img-small d-sm-block d-md-block ">
						<a href="">
							 <img src="" alt="">
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</header>