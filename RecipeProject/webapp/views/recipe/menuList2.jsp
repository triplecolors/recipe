<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.4.1.min.js"></script>
<style>

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
		background : #F7DC6F;
		color : darkslategray;
	}
</style>
</head>

<body>
<c:import url="../common/header.jsp"/>
<form action="list.rp">
<table>
      
      <tbody style="">
        <tr class="List1">
       <td>디저트</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="5">빵</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="6">생크림과일</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="7">단호박</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="8">꽈베기</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="9">술빵</td>
        </tr>  
        <tr class="List2">
       <td>조림</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="10">도미조림</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="11">고등어조림</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="12">돼지고기장조림</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="13">가자미조림</td>
       <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="14">조림</td>
        </tr>
        <tr class="List3">
          <td>한식</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="15">수제비</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="16">김밥</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="17">곤드레나물밥&볶음밥</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="18">미역국</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="19">된장국&찌개</td>
        </tr>
        <tr class="List4">
          <td>중식</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="20">파스타</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="21">당면볶음</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="22">비빔국수</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="23">칼국수</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="24">잔치국수</td>
        </tr>
        <tr class="List5">
          <td>다이어트</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="25">샐러드</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="26">파프리카두부</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="27">유부초밥</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="28">견두부</td>
          <td> <input type='checkbox' onclick="clickMe(this);" style="cursor:pointer;" value="29">과일사라다</td>
        </tr>
      </tbody>
    </table>
    <!-- <div onclick="search();" value="">검색하기</div> -->
    <button type="button" class="selectedBtn" onclick="selectedBtn();">검색하기</button>
</form> 
<div id="searchResult">
</div>
    <script>
    	function clickMe(obj){
    		
    		if($(obj).parent().hasClass('selectedTd')){
	    		$(obj).parent().removeClass('selectedTd');    			
    		} else {			
	    		$(obj).parent().addClass('selectedTd');
    		}
    	}
    	
    	function selectedBtn(){
    		var str = '';
    		
    		$('input:checkbox').each(function(){
    			if($(this).prop('checked') == true){
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
    
<c:import url="../common/footer.jsp"/>
</body>
</html>

























