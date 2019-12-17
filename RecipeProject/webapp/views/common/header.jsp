<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="headerback"></div>
<header>

<div class="header-area ">
    <div id="sticky-header" class="main-header-area">
        <div class="container">
             <div class="row align-items-center main-menu d-lg-block">
                 <nav>
                     <ul class="mein_menu_list" id="navigation">
                        <li><a href="${ pageContext.request.contextPath }/index.jsp">HOME</a></li>
                       <li>
										<a href="${ pageContext.request.contextPath }/selectList.no">Services</a>
									</li>
						<li><a href="${ pageContext.request.contextPath}/views/recipe/menuList.jsp">레시피 검색하기</a></li>
						<li><a href="${ pageContext.request.contextPath}/views/goods/goods.jsp">주방용품 검색하기</a></li>
						
						<div>
							<a href="${ pageContext.request.contextPath }/index.jsp">
								<img src="${ pageContext.request.contextPath }/resources/images/로고.png" width="160px" height="120px">
						    </a>
						</div>
						
						<li><a href="#">v마이페이지 <i class="ti-angle-down"></i></a>
						    <ul class="submenu">
					<c:if test="${!empty member }">
						        <li><a href="${pageContext.request.contextPath }/views/mypage/myPageList.jsp">마이페이지</a>
						        <li><a href="${pageContext.request.contextPath }/views/recipe/recipeWrite.jsp">레시피 작성하기</a></li>
					</c:if>
						    </ul>
						</li>
						<li><a href="#">게시판 <i class="ti-angle-down"></i></a>
						    <ul class="submenu">
						        <li><a href="${ pageContext.request.contextPath }/selectList.no">공지사항</a></li>
						        <li><a href="${pageContext.request.contextPath }/views/">자유 게시판</a></li>
						        <li><a href="${pageContext.request.contextPath }/views/">건의 게시판</a></li>
						    </ul>
						</li>
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
    </div>
</div>
</header>
