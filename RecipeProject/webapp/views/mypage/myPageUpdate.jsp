<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../common/commonUtil.jsp" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>회원 수정</title>
    <style>
   .outer{
		 background:url('../../resources/images/mypage/asd.png');
		 background-repeat:no-repeat;
		 background-size: 100%;
		 }
    table {
        width: 200;
        border: 1px solid #333333;
      }
      td {
        padding: 10px;
        border: 1px solid #333333;
      }
      .a {
        border-collapse: separate;
      }
      .b {
        border-collapse: collapse;
      }
      
      
      .button {
  display: inline-block;
  border-radius: 4px;
  background-color: #FF8CFF;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 28px;
  padding: 20px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 5px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}
    
    </style>


</head>
<body>
<c:import url="../common/header.jsp"/>

	<div class="outer">
		<br>
		<h2 align="center">회원 정보 수정</h2>
		
		<form role="form"  id="updateForm" action="${pageContext.request.contextPath }/update.vi" method="post">
			
			<table align="center">
			<br /><br />
				<tr>
					<td width="200px"> 아이디 </td>
					<td style="color:white; text-align: left; padding-left: 20px;">${member.userid }</td>
					<td width="200px"></td>
				</tr>
				<tr>
					<td>* 변경 비번</td>
					<td><input type="password" id="password" name="password" required="required"></td>
					<td></td>
				</tr>
				<tr>
					<td>* 변경 비번 확인</td>
					<td><input type="password" id="password2" name="password2"></td>
					<td><label id="pwdResult"></label></td>
				</tr>
				 <tr>
					<td>* 이름</td>
					<td><input type="name" id="name" name="name"></td>
					<td><label id="nameResult"></label></td>
				</tr>
				<tr>
					<td>연락처 </td>
					<td>
						<input type="text" maxlength="3" name="tel1" size="2">-
						<input type="text" maxlength="4" name="tel2" size="2">-
						<input type="text" maxlength="4" name="tel3" size="2">
					</td>
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
				<div type="button" class="button" id="goMain" onclick="goMain();">메인으로</div>
				<div type="button" class="button"  id="updateBtn" onclick="updateMember();">수정하기</div> 
				<div type="button" class="button" id="deleteBtn" onclick="deleteMember();">회원 탈퇴</div>
			</div>
			</form>
			<script>
			
				$(function(){	
					var phoneArr = '${member.uphone}'.split('-');
				
					$('input[name*="tel"]').each(function(index){
						$(this).val(phoneArr[index]);
					});
					
					var addressArr = '${member.uadrs}'.split(', ');
					
					$('#zipCode').val(addressArr[0]);
					$('#address1').val(addressArr[1]);
					$('#address2').val(addressArr[2]);
	
				});
				
				function updateMember() {
					$("#updateForm").submit();
				}
				
				function deleteMember() {
					location.href = "${pageContext.request.contextPath}/delete.vi?id=${member.userid}";
				}
				
		
				function addrSearch() {
			        new daum.Postcode({
			            oncomplete: function(data) {
			               

			        
			                var fullAddr = ''; 
			                var extraAddr = '';

			              
			                if (data.userSelectedType === 'R') { 
			                    fullAddr = data.roadAddress;

			                } else {
			                    fullAddr = data.jibunAddress;
			                }

			                
			                if(data.userSelectedType === 'R'){
			                  
			                    if(data.bname !== ''){
			                        extraAddr += data.bname;
			                    }
			                   
			                    if(data.buildingName !== ''){
			                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
			                    }
			                    
			                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
			                }

			                
			                $('#zipCode').val(data.zonecode);
			                
			                $('#address1').val(fullAddr);

			               
			                $('#address2').focus();
			            }
			        }).open();
			    };
				
				function goMain(){
					location.href='${ pageContext.request.contextPath }/index.jsp';
				};
				
			</script>
	</div>
	<c:import url="../common/footer.jsp"/>
	
</body>
</html>