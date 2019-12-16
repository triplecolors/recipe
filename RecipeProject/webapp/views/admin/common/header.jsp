<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<header>
	<nav class="navbar navbar-expand-lg navbar-light"
		style="background-color: rgba(9, 113, 204, 0.3);">
		<a class="navbar-brand"
			href="${ pageContext.request.contextPath }/views/admin/adminMain.jsp">레시피를
			부탁해</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">회원관리
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">레시피 글 관리</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">레시피 카테고리
						관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">공지사항 관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">QnA 관리</a></li>
			</ul>
			<span class="navbar-text"> 관리자님 반가워요! </span>
		</div>
	</nav>
</header>
<div class="row">
	<aside class="d-lg-block d-none col-md-2">
		<div id="side"></div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">회원관리</li>
			<li class="list-group-item">레시피 글 관리</li>
			<li class="list-group-item">카테고리 관리</li>
			<li class="list-group-item">공지사항 관리</li>
			<li class="list-group-item">QnA 관리</li>
		</ul>
	</aside>