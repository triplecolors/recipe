<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<header>

<div class="header-area ">
    <div id="sticky-header" class="main-header-area">
        <div class="container">
             <div class="row align-items-center main-menu d-lg-block">
                 <nav>
                     <ul class="mein_menu_list" id="navigation">
                        <li><a href="${ pageContext.request.contextPath }/index.jsp">HOME</a></li>
						<li><a href="">Services</a></li>
						
						<!-- <div class="btn-group btn-group-toggle" data-toggle="buttons"> --> <!-- 현재 클릭한 부분 표시 내용을위한 버튼 준비 -->
						<li><a href="#">menu </a> 
							<ul class="submenu">
								<li><!-- <label class="btn btn-secondary active"> --> <!-- 현재 클릭한 부분 표시 -->
									<a href="${ pageContext.request.contextPath}/views/recipe/menuList.jsp">menu</a> <!-- 레시피 -->
									<!-- </label> -->
								</li>
								 <!-- <label class="btn btn-secondary"> --> <!-- 현재 클릭한 부분 표시 -->
								<li><a href="">link-lecipe</a></li> <!-- 레시피 즐겨찾기-->
								<!--  </label> -->
								<!--  <label class="btn btn-secondary"> --> <!-- 현재 클릭한 부분 표시 -->
								<li><a href="">goodslist-lecipe</a></li> <!-- 레시피 추천목록 -->
								<!--    </label> -->
							</ul>
						<!-- </div> -->
						</li>
						
						<li><a href="">gallery</a>
						</li>
						<div>
							<a href="${ pageContext.request.contextPath }/index.jsp">
								<img src="${ pageContext.request.contextPath }/resources/images/로고.png" width="160px" height="120px">
						    </a>
						</div>
						<li><a href="#">blog <i class="ti-angle-down"></i></a>
						    <ul class="submenu">
						        <li><a href="">blog</a></li>
						        <li><a href="">single-blog</a></li>
						    </ul>
						</li>
						<c:if test="${!empty member }">
						<li><a href="${pageContext.request.contextPath }/views/mypage/myPageList.jsp">마이페이지</a>
						    <ul class="submenu">
						        <li><a href="${pageContext.request.contextPath }/views/recipe/recipeWrite.jsp">레시피 작성하기</a></li>
						    </ul>
						</li></c:if>
						<c:if test="${empty member }">
						<a href="${pageContext.request.contextPath }/views/member/login.jsp">마이페이지</a> 
						</c:if>
						
					<c:if test="${ empty member }">
                        <li><a href="${pageContext.request.contextPath }/views/member/login.jsp">로그인</a>
                    </c:if><c:if test="${ !empty member }">
                        <li><a href="${pageContext.request.contextPath }/logout.me">로그아웃</a>
                    </c:if>
							<ul class="submenu">
						        <li><a href="${pageContext.request.contextPath }/views/member/memberJoin.jsp">회원가입</a></li>
                            </ul>
                        </li>
                     </ul>
                 </nav>
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