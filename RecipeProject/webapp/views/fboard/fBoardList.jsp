<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="css/util.css"> -->
	<link rel="stylesheet" type="text/css" href="css/fBoard.css">
<!--===============================================================================================-->
</head>
<body>
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								번호
							</div>
							<div class="cell">
								제목
							</div>
							<div class="cell">
								작성자
							</div>
							<div class="cell">
								작성일
							</div>
							<div class="cell">
								조회수
							</div>
							<div class="cell">
								파일여부
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								1
							</div>
							<div class="cell" data-title="Age">
								고구마 맛탕 요리 성공!
							</div>
							<div class="cell" data-title="Job Title">
								일요일 요리사
							</div>
							<div class="cell" >
								2019-12-14
							</div>
							<div class="cell" >
								15
							</div>
							<div class="cell" >
								X
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								1	
							</div>
							<div class="cell" data-title="Age">
								2
							</div>
							<div class="cell" data-title="Job Title">
								3
							</div>
							<div class="cell" data-title="Location">
								4
							</div>
							<div class="cell" data-title="Location">
								5
							</div>
							<div class="cell" data-title="Location">
								6
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								3
							</div>
							<div class="cell" data-title="Age">
								26
							</div>
							<div class="cell" data-title="Job Title">
								Front-End Developer
							</div>
							<div class="cell" data-title="Location">
								Los Angeles
							</div>
							<div class="cell" data-title="Location">
								15
							</div>
							<div class="cell" data-title="Location">
								X
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								4
							</div>
							<div class="cell" data-title="Age">
								25
							</div>
							<div class="cell" data-title="Job Title">
								Web Designer
							</div>
							<div class="cell" data-title="Location">
								San Francisco
							</div>
							<div class="cell" data-title="Location">
								15
							</div>
							<div class="cell" data-title="Location">
								X
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								5
							</div>
							<div class="cell" data-title="Age">
								20
							</div>
							<div class="cell" data-title="Job Title">
								Graphic Designer
							</div>
							<div class="cell" data-title="Location">
								New York, NY
							</div>
							<div class="cell" data-title="Location">
								15
							</div>
							<div class="cell" data-title="Location">
								X
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								6
							</div>
							<div class="cell" data-title="Age">
								32
							</div>
							<div class="cell" data-title="Job Title">
								Photographer
							</div>
							<div class="cell" data-title="Location">
								New York
							</div>
							<div class="cell" data-title="Location">
								15
							</div>
							<div class="cell" data-title="Location">
								X
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								100
							</div>
							<div class="cell" data-title="Age">
								31
							</div>
							<div class="cell" data-title="Job Title">
								iOS Developer
							</div>
							<div class="cell" data-title="Location">
								Washington
							</div>
							<div class="cell" data-title="Location">
								15
							</div>
						
						</div>

					

					</div>
			</div>
		</div>
	</div>
	<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
</body>
</html>