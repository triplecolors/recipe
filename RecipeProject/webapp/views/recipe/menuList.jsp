<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../common/commonUtil.jsp"></c:import>
<style>
.top {
	margin-top: 110px;
}

.select {
	color: #856404;
	background-color: #fff3cd !important;
	border-color: #ffeeba;
}

.card {
	padding-right: 0px;
	padding-left: 0px;
}

.btn-lg {
	background: rgba(255, 193, 7, 0.1);
	width: 40%;
	margin: 10px;
	align: center;
}

table {
	width: 80%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	margin-left: 10%;
	margin-right: 10%;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 1px;
	text-align: center;
}

thead tr {
	background-color: #bbdefb;
}

tbody tr:nth-child(2n) {
	background-color: #bbdefb;
}

tbody tr:nth-child(2n+1) {
	background-color: #e3f2fd;
}

.selectedTd {
	background: #F7DC6F;
	color: darkslategray;
}
</style>
</head>
<body>
	<c:import url="../common/header.jsp" />
	<div class="row top">
		<div class="col-xl-3 col-lg-2 col-md-1 d-sm-block d-none"></div>
		<div class="col-xl-6 col-lg-8 col-md-10">

			<form action="list.rp">
				<fieldset>
					<legend>
						<strong>카테고리를 선택해보세요!</strong>
					</legend>
					<div class="row">
						<div class="card col-3">
							<div class="card-header">
								<strong>종류별</strong>
							</div>
							<ul class="list-group">
								<select size="8" multiple id="1">
								</select>
							</ul>
						</div>

						<div class="card col-3">
							<div class="card-header">
								<strong>상황별</strong>
							</div>
							<ul class="list-group">
								<select size="8" multiple id="2">
								</select>
							</ul>
						</div>

						<div class="card col-3">
							<div class="card-header">
								<strong>방법별</strong>
							</div>
							<ul class="list-group">
								<select size="8" multiple id="3">
								</select>
							</ul>
						</div>

						<div class="card col-3">
							<div class="card-header">
								<strong>재료별</strong>
							</div>
							<ul class="list-group">
								<select size="8" multiple id="4">
								</select>
							</ul>
						</div>
					</div>

					<div align="center">
						<button type="submit"
							class="btn btn-outline-warning btn-lg selectedBtn"
							onclick="selectedBtn();">
							<strong>검색하기</strong>
						</button>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="col-xl-3 col-lg-2 col-md-1 d-sm-block d-none"></div>
	</div>


	<div id="searchResult"></div>
































	<script>
	$(document).on('click', 'option', function() {
		if($(this).hasClass('select')){
			$(this).removeClass('select').removeAttr('selected').find('strong').remove();      			
		} else {			
			$(this).addClass('select').attr('selected', true).html("<strong>✔</strong> "+$(this).text());
		}
	});
	
	$(function() {
		$.ajax({
			url : "${pageContext.request.contextPath}/selectCate.do",
			type : "post",
			success : function(catelist) {
				console.log(catelist);
	
					$.each(catelist, function(idx, list) {
						var $select;
						var nameCate = "";
						if (idx == 1) {
							$select = $('#1');
							nameCate = "rkind";
						} else if (idx == 2) {
							$select = $('#2');
							nameCate = "rsituation";
						} else if (idx == 3) {
							$select = $('#3');
							nameCate = "rway";
						} else if (idx == 4) {
							$select = $('#4');
							nameCate = "ringred";
						} else {
							console.log(idx+"카테고리에 없는데...?");
						}
						
						$select.find('option').remove();
						for(var i in list){
							var $option = $('<option>');
							$option.attr('class', 'list-group-item');
							$option.attr('name', nameCate);
							$option.val(i);
							$option.text(list[i]);
							$select.append($option);
						}
					});
					
			},
			error : function() {
				console.log("실패했지만~~~~ \n그대는 실 패 해앴지마아안~\n"
							+"그저 이렇게 코드를 바라볼 뿐 \n다가갈수 없어");
			}
		});
	});
	
	function selectedBtn(){
		var str = '';
		
		$('option').each(function(){
			if($(this).prop('selected') == true){
				console.log($(this).val());
				str = str + $(this).val() + ",";
				
				console.log(str);
			}
		});
		
		$.ajax({
			url : '${pageContext.request.contextPath}/menuPage.do',
			data : {menu : str},
			success : function(data){
				console.log(data);
				$('#searchResult').html('');
				var result = "";
				
				for(var i in data) {
					result += data[i].rtitle +", ";
				}
					$('#searchResult').html("<h3>" + result + '</h3>');
			}, error : function(){
				console.log("실패 했네요 ㅠㅠ");
			}
		});
	}
</script>


	<c:import url="../common/footer.jsp" />
</body>
</html>