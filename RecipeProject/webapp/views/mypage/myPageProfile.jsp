<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
<c:import url="../common/commonUtil.jsp"></c:import>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="../../resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../../resources/css/myProfile.css"/>
<link rel="stylesheet" href="../../resources/css/mypageheader.css" />
<style>
body{
		background: linear-gradient(90deg, #e8e8e8 50%, #3d009e 50%);
		
	}
	.portfolio{
		padding:6%;
		text-align:center;
		margin-top: 8em;	
	}
	.heading{
		background: #fff;
		padding: 1%;
		text-align: left;
		box-shadow: 0px 0px 4px 0px #545b62;
	}
	.heading img{
		width: 10%;
	}
	.bio-info{
		padding: 5%;
		background:#fff;
		box-shadow: 0px 0px 4px 0px #b0b3b7;
	}
	.name{
		font-family: 'Charmonman', cursive;
		font-weight:600;
	}
	.bio-image{
		text-align:center;
	}
	.bio-image img{
		border-radius:50%;
	}
	.bio-content{
		text-align:left;
	}
	.bio-content p{
		font-weight:600;
		font-size:30px;
	}


</style>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="container portfolio">
	<div class="row">
		<div class="col-md-12">
			<div class="heading">				
				<img src="https://image.ibb.co/cbCMvA/logo.png" />
			</div>
		</div>	
	</div>
	<div class="bio-info">
		<div class="row">
			<div class="col-md-6">
				<div class="row">
					<div class="col-md-12">
						<div class="bio-image">
							<img src="https://image.ibb.co/f5Kehq/bio-image.jpg" alt="image" />
						</div>			
					</div>
				</div>	
			</div>
			<div class="col-md-6">
				<div class="bio-content">
					<h1>${member.unick }님, 등급은 : ${member.mrank} </h1>
					<ul>
							<li>아이디 : ${member.userid }</li>
							<li>이름 :${member.unick }</li>
							<li>주소 : ${member.uadrs }</li>
							<li>핸드폰 번호 : ${member.uphone }</li>
					</ul>
				
				</div>
			</div>
		</div>	
	</div>
</div>

<c:import url="../common/footer.jsp"/>
</body>
</html>