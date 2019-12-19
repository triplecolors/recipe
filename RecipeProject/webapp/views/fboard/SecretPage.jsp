<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회결과</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
</head>
<body>

<div id="p1">

</div>
<br />
<br />
-----------------------------
<br />
<br />
<div id="p2">

</div>





<div class="submitform">
x : <input type="number" id="xaxis" name="xaxis"/>
y : <input type="number" id="yaxis" name="yaxis"/>
</div>
	<input type="button" onclick="setAxix();"/>
<script>
	function setAxix(){
		var $p1 = $('#p1');
		var $p2 = $('#p2');
		$p1.empty();
		$p2.empty();
		
		var num = [];
		num.push($('#xaxis').val());
		num.push($('#yaxis').val());
		$.ajax({
			url : '${pageContext.request.contextPath}/battleship.gm',
			type : 'get',
			data : {
				x : $('#xaxis').val(),
				y : $('#yaxis').val()
			},
			success : function(data){
				console.log(data);
				console.log(data[0]);
				console.log(data.length);
				var p1 = data[0];
				var p2 = data[1];
				
				for(var i= 0;i<data[0].length;i++){
					
					$p1.append(p1[i]);
					$p1.append("<br>");
					
				}
				for(var i=0;i<data[1].length;i++){
					
					$p2.append(p2[i]);
					$p2.append("<br>");
					
				}
				
				
			}, error : function(request){
				console.log(request);
			}
		});
	}

</script>

</body>
</html>