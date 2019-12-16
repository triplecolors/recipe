<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/main.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<c:import url="../common/commonUtil.jsp"></c:import>
<style>
.outer {
	width: 700px;
	height: 500px;
	background: rgba(250, 250, 250, 0.7);
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: 110px;
}

#idCheck, #ckZip, #goMain, #joinBtn {
	background: orangered;
	border-radius: 5px;
	width: 80px;
	height: 25px;
	text-align: center;
}

#idCheck:hover, #ckZip:hover, #joinBtn:hover, #goMain:hover {
	cursor: pointer;
}

td {
	text-align: right;
}

#ckZip, #joinBtn {
	background: yellowgreen;
}

#joinBtn, #goMain {
	display: inline-block;
}
</style>
</head>
<body>

	<c:import url="../common/header.jsp" />

	<section class="outer">

		<br>
		<h2 align="center">회원가입</h2>

		<form id="joinForm"
			action="${pageContext.request.contextPath }/insert.me" method="post">

			<table align="center">
				<tr>
					<td width="200px">* 아이디</td>
					<td><input type="text" name="userId" id="userId"
						required="required"></td>
					<td width="200px"><div id="idCheck">중복확인</div></td>
				</tr>
				<tr>
					<td>* 비밀번호</td>
					<td><input type="password" id="password" name="password"
						required="required"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 비밀번호확인</td>
					<td><input type="password" id="password2" name="password2"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				<tr>
					<td>* 이름</td>
					<td><input type="text" maxlength="5" name="userName"
						required="required"></td>
					<td></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="text" maxlength="3" name="tel1" size="2">-
						<input type="text" maxlength="4" name="tel2" size="2">- <input
						type="text" maxlength="4" name="tel3" size="2"></td>
					<td></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="zipCode" name="zipCode"></td>
					<td><div id="ckZip" onclick="addrSearch();">검색</div></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" id="address1" name="address1"></td>
					<td></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" id="address2" name="address2"></td>
					<td></td>
				</tr>

			</table>
			<br>
			<div class="btns" align="center">
				<div id="goMain" onclick="goMain();">메인으로</div>
				<div id="joinBtn" onclick="insertMember();">가입하기</div>
			</div>
		</form>
		<script>
			function insertMember() {
				$("#joinForm").submit();
			}

			$("#joinForm").submit(function(event) {
				if ($("#password").val() == "" || $("#userId").val() == "")
					alert("아이디나 비밀번호는 필수 값입니다.");
				else if ($('#password').val() != $('#password2').val())
					alert("비밀번호 확인 값과 다릅니다.");
				else
					return;
				event.preventDefault();
			});

			// 참조 API : http://postcode.map.daum.net/guide
			function addrSearch() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var fullAddr = ''; // 최종 주소 변수
								var extraAddr = ''; // 조합형 주소 변수

								// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									fullAddr = data.roadAddress;

								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									fullAddr = data.jibunAddress;
								}

								// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
								if (data.userSelectedType === 'R') {
									//법정동명이 있을 경우 추가한다.
									if (data.bname !== '') {
										extraAddr += data.bname;
									}
									// 건물명이 있을 경우 추가한다.
									if (data.buildingName !== '') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
									fullAddr += (extraAddr !== '' ? ' ('
											+ extraAddr + ')' : '');
								}

								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								$('#zipCode').val(data.zonecode); //5자리 새우편번호 사용

								$('#address1').val(fullAddr);

								// 커서를 상세주소 필드로 이동한다.
								$('#address2').focus();
							}
						}).open();
			};

			function goMain() {
				location.href = '/myWeb/index.jsp';
			};
			
			$('#idCheck').click(function(){
				$.ajax({
					url : "${pageContext.request.contextPath}/idDup.me",
					type: "post",
					data : { userId : $('#userId').val()},
					success : function(data){
						if(data == 'true') {
							alert("사용 가능한 아이디입니다.");
						} else {
							alert("사용 불가~!");
							$('#userId').val('');
						}
					}, error : function(request, status, error){
						console.log(request);
						console.log(status);
						console.log(error);
						
						console.log("에러 발생!!!!");
					}					
				});
			});
		</script>

	</section>

	<c:import url="../common/footer.jsp" />

</body>
</html>

