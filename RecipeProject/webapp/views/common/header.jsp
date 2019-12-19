<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header>
        <div class="header-area ">
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-xl-10 col-lg-10">
                            <div class="main-menu d-none d-lg-block">
                                <nav>
                                    <ul class="mein_menu_list" id="navigation">
                                        <li><a href="${ pageContext.request.contextPath }/index.jsp">HOME</a></li>
										<li><a href="${ pageContext.request.contextPath}/views/recipe/menuList.jsp">레시피 검색하기</a></li>
										<li><a href="${ pageContext.request.contextPath}/views/goods/goods.jsp">주방용품 검색하기</a></li>
										<div class="logo-img d-none d-lg-block">
		                                    <a href="${ pageContext.request.contextPath }/index.jsp">
												<img src="${ pageContext.request.contextPath }/resources/images/로고.png" width="160px" />
										    </a>
                                        </div>
                                        
										 <c:if test="${!empty member }">
										<li><a href="${pageContext.request.contextPath }/views/mypage/myPageList.jsp">마이페이지</a>
						  				  <ul class="submenu">
						   			     <li><a href="${pageContext.request.contextPath }/views/recipe/recipeWrite.jsp">레시피 작성하기</a></li>
						  				  </ul>
											</li></c:if>
										<c:if test="${empty member }">
										<a href="${pageContext.request.contextPath }/views/member/login.jsp">마이페이지</a> 
										</c:if>
										</li>
										<li><a href="#">게시판 <i class="ti-angle-down"></i></a>
										    <ul class="submenu">
										        <li><a href="${ pageContext.request.contextPath }/selectList.no">공지사항</a></li>
										        <li><a href="${pageContext.request.contextPath }/selectList.fb">자유 게시판</a></li>
										        <li><a href="${pageContext.request.contextPath }/selectList.su">건의 게시판</a></li>
										    </ul>
										</li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                        <div class="col-xl-2 col-lg-2 d-none d-lg-block load_more_button">
                            <div class="custom_order">
                                <c:if test="${ empty member }">
			                        <a href="${pageContext.request.contextPath }/views/member/login.jsp" class="load_more_btn"  style="width: max-content;">로그인</a>
			                    </c:if><c:if test="${ !empty member }">
			                        <a href="${pageContext.request.contextPath }/logout.me" class="load_more_btn"  style="width: max-content;">로그아웃</a>
			                    </c:if>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="mobile_menu d-block d-lg-none"></div>
                        </div>
                        <div class="logo-img-small d-sm-block d-md-block d-lg-none">
                                <a href="index.html">
                                    <img src="" alt="">
                                </a>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
    <div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
            <div class="breadcam_inner">
                <div class="breadcam_text">
                    <h3></h3>
                    <p></p>
                </div>
            </div>
    </div>