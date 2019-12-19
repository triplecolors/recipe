<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="../common/commonUtil.jsp"></c:import>
<meta charset="UTF-8">
<style>
body, h1, h2, ul, dl, dd {
    margin: 0;
    padding: 0;
    color : black;
    
}

li {
    list-style-type: none;
}


body {
	
    background-color: #97DC90;
    text-align: center;
}

.wrapper {
    padding: 0 20px;
    max-width: 960px;
    margin: 0 auto;
    margin-bottom: 200px;
}

.cover {
    background-image: url(images/cover.png);
    color: black;
    background-size: cover;
    background-position: bottom;
    padding-top: 20%;
    padding-bottom: 10%;
    transition: padding .5s;
}

.cover-title {
    font-size: 20vw;
    font-family: 'Yellowtail', cursive;
    font-weight: normal;
    line-height: 1;
    font-style: italic;
    transition: font-size .5s;
}

.cover-title span {
    font-family: 'arial';
    font-size: 0.2em;
    display: block;
    text-indent: 3em;
}

.timeline {
    position: relative;
    padding-bottom: 100px;
}

.timeline:after {
    content: ' ';
    position: absolute;
    left: 50%;
    background-color: rgba(0,0,0,0.5);
    z-index: -1;
    margin-top: 20px;
    top: 5vw;
    bottom: 0;
    width: 6px;
    border-radius: 5px;
    margin-left: -3px;
}

.timeline-item {
    margin-top: 70px;
}

.card {
    background-color: rgba(0,0,0,0.6);
    color: #999;
    padding: 0 20px 20px 20px;
    border-radius: 30px;
}

.card-icon {
    width: 170px;
    height: auto;
    vertical-align: top;
    margin: -80px -110px 0;
    border-radius: 30px;
}

.card-title {
    font-size: 20vw;
    color: dodgerblue;
    font-family: 'impact';
    line-height: 1;
    margin: 20px;
}

.card-definition {
    margin: 20px;
}

.card-definition dt {
    font-size: 25px;
    color: #ddd;
    margin-bottom: 20px;
}

.card-definition dt span {
    color: dodgerblue;
    display: block;
    font-size: 0.5em;
}
#firstId{
   	align : center; 
   	font-size : 50px;
   	font-style: normal;
  		font-family: -webkit-body;
  		color : black;
}
@media ( min-width: 720px ) {
    .cover {
        padding-top: 10%;
        padding-bottom: 5%;
    }
    .cover-title {
        font-size: 15vw;
    }
    .timeline:after {
        background-color: dodgerblue;
    }
    .timeline-item {
        width: 50%;
        padding: 0 20px;
        box-sizing: border-box;
        text-align: right;
    }
    .timeline-item:nth-child(even) {
        margin-left: auto;
        margin-top: -150px;
        margin-bottom: -200px;
        text-align: left;
    }
    .timeline-item:nth-child(odd):not(:first-child) {
        margin-top: 320px;
    }
    .card {
        position: relative;
    }
    .card-title {
        font-size: 10vw;
        display: inline-block;
        position: relative;
    }
    .card-title:after {
        content: ' ';
        position: absolute;
        right: -60px;
        top: 50%;
        background-color: white;
        border: 6px solid dodgerblue;
        border-radius: 50%;
        width: 10px;
        height: 10px;
        transform: translate(50%,-50%);
        background-color: #0a222b;
        z-index: 10;
    }
    .card-icon {
        position: absolute;
        left: 0;
        top: 0;
    }
    .timeline-item:nth-child(even) .card-icon {
        left: auto;
        right: 0;
    }
    .timeline-item:nth-child(even) .card-title:after {
        left: -60px;
        transform: translate(-50%,-50%);
    }
   
    .content_div1{
    	color : black;
    }
    #fVisible0{
    	align : center;
    }
 }
</style>
        <title>Responsive Timeline</title>
		<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, user-scalable=no">
<link href="https://fonts.googleapis.com/css?family=Passion+One|Roboto|Yellowtail" rel="stylesheet">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

		<link href="https://fonts.googleapis.com/css?family=Kaushan+Script" rel="stylesheet">
        <link rel="stylesheet" href="common.css">
        <link rel="stylesheet" href="style.css">
</head>
<body>
<c:import url="../common/header.jsp"></c:import>
<div class="main" >
	
	
	<div class="cover">
		<img class="card-icon" id="fVisible0" style="position:inherit;"/>
		<h1 class="cover-title"><b id="firstId">${Recipe.rtitle}</b></h1>
		
		<br /><br /><br />
		
		${Recipe.rcontent}
	</div>
		
		
	<div class="content_div1">
		<h4><b>요리 재료</b></h4>
	</div>
	
	<br /><br /><br /><br /><br />
      
      
        <!-- 순서 -->
        <div class="wrapper">
            <ul class="timeline">
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" id="fVisible1"/>
                        <h2 class="card-title"></h2>
                        <dl class="card-definition">
                            <dt>Chapter.1</dt>
                            <dd>빵을 구워 줍니다.</dd>

                            
                        </dl>
                    </div>
                </li>
            </ul>
        </div> 
        
        
</div>
        
        <div>
			<%-- <div class="w3-border w3-center w3-padding">
				<c:if test="${ memeber. == null }">
					<button type="button" id="newLogin"><b class="w3-text-blue">로그인</b></button><br />
					<i class="fa fa-heart" style="font-size:16px;color:red"></i>
					<span class="rec_count"></span>					
				</c:if>
				<c:if test="${ id != null }">
					<button class="w3-button w3-black w3-round" id="rec_update">
						<i class="fa fa-heart" style="font-size:16px;color:red"></i>
						&nbsp;<span class="rec_count"></span>
					</button> 
				</c:if>
			</div> --%>
		</div>
		<div align="center">
			<button onclick="location.href='${pageContext.request.contextPath }/views/recipe/menuList.jsp'">메뉴로 돌아가기</button>
			<c:if test="${ !empty member and member.uno eq Recipe.uno }">
				<c:url var="boardUpdate" value="bUpView.bo">
					<c:param name="bno" value="${board.bno }" />
				</c:url>
				<button onclick="location.href='${pageContext.request.contextPath}/updateView.rcp?bno='+${Recipe.bno}">수정하기</button>
			</c:if>
		</div>
		<div class="replyArea">
			<div class="replyWriteArea">
				<form action="${pageContext.request.contextPath }/insert.co" method="post">
					<input type="hidden" name="uno" value="${ member.uno }"/>
					<input type="hidden" name="bno" value="${Recipe.bno }" />
					<input type="hidden" name="ref_cno" value="0" />
					<input type="hidden" name="clevel" value="1" />
					
					<table align="center">
						<tr>
							<td>댓글 작성</td>
							<td><textArea rows="3" cols="80" id="replyContent" name="ccontent"></textArea></td>
							<c:if test= "${!empty member }">
							<td><button type="submit" id="addReply">댓글 등록</button></td>
							</c:if>
						</tr>
					</table>
				</form>
			</div>
			<div id="replySelectArea">
				<c:if test="${ !empty clist }">
		   		<c:forEach var="bco" items="${ clist }">
		   			<table id="replySelectTable"
	      	 style="margin-left : ${(bco.clevel - 1) * 15}px;
	      	 		width : ${800 - ((bco.clevel - 1) * 15)}px;"
	      	 class="replyList${bco.clevel}">
				  		<tr>
				  			<td rowspan="2"> </td>
							<td><b>${bco.unick}</b></td>
							<td>${bco.cdate}</td>
							<td align="center">
							<c:if test="${member.uno eq bco.uno }">
								<input type="hidden" name="cno" value="${bco.cno}"/>
									  
								<button type="button" class="updateBtn" 
									onclick="updateReply(this);">수정하기</button>
									
								<button type="button" class="updateConfirm"
									onclick="updateConfirm(this);"
									style="display:none;" >수정완료</button> &nbsp;&nbsp;
									
								<button type="button" class="deleteBtn"
									onclick="deleteReply(this);">삭제하기</button>
									
							</c:if><c:if test="${ bco.clevel lt 3 }">
								<input type="hidden" name="uno" value="${member.uno}"/>
								<input type="hidden" name="ref_cno" value="${bco.cno}" />
								<input type="hidden" name="clevel" value="${bco.clevel}" />
								<button type="button" class="insertBtn" 
									 onclick="reComment(this);">댓글 달기</button>&nbsp;&nbsp;
									 
								<button type="button" class="insertConfirm"
									onclick="reConfirm(this);"
									style="display:none;" >댓글 추가 완료</button> 
									
							</c:if><c:if test="${bco.clevel ge 3}">
								<span> 마지막 레벨입니다.</span>
							</c:if>
							</td>
						</tr>
						<tr class="comment replyList${bco.clevel}">
							<td colspan="3" style="background : transparent;">
							<textarea class="reply-content" cols="105" rows="3"
							 readonly="readonly">${bco.ccontent}</textarea>
							</td>
						</tr>
					</table>
		   		</c:forEach>
		   </c:if>
			</div>
		</div>
		<div class="goods"></div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
<c:import url="../common/footer.jsp"></c:import>

		<script>
		$(function() {
			var rtime = "${Recipe.rtime}";
			var result = "";
			if(rtime == 0){
			} else if (rtime == 999) {
				result = '2시간이상';
			} else if (rtime == 120) {
				result = '2시간이내';
			} else if (rtime > 0) {
				result = rtime+'분이내';
			} else {
				result = '삐뽀삐뽀! 에러';
			}
			$('#rtime').empty().text(result);
		});
		$(function() {
			var rlevel = "${Recipe.rlevel}";
			var result = "";
			if(rlevel == 1){
				result = '타노스';
			} else if (rlevel == 2) {
				result = '초급';
			} else if (rlevel == 3) {
				result = '중급';
			} else if (rlevel == 4) {
				result = '고급';
			} else if (rlevel == 5) {
				result = '신의경지';
			} else {
			}
			$('#rlevel').empty().text(result);
		});
		$(function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/selectCate.do",
				type : "post",
				success : function(catelist) {
						$('.rcategory').empty();
						$.each(catelist, function(idx, list) {
							for(var i in list){
								if( i == '${Recipe.rkind}' || i == '${Recipe.rsituation}' || i == '${Recipe.rway}' || i == '${Recipe.ringred}'){
								console.log(list[i]);
								var $span = $('<span>');
								$span.text(list[i]);
								$('.rcategory').append($span);
								}
							}
						});
						
				},
				error : function() {
					console.log("가지마 가지마 가지마\n"
								+"아~직 너를 위한 코드들이 남아있는데"
								+"너는 어디에");
					}
			});
		}); 
		$(function() {
			$('.content_div1').html($('.content_div1').html() + "${Recipe.rsource}".split(", [").join(", <br>["));
		});
		// 요리 순서
		$(function() {
			var str = $.trim("${Recipe.rprocess}");
		       
			for(var i=1; str.indexOf('[') != -1; i++){
		           str = str.substring(str.indexOf(']'));
		           
		           // 요리 순서 내용 추출
		           var text;
		           if(str.indexOf('[') == -1){
		        	   text = str.substring(str.indexOf(']')+1);
		           }else{
		               text = str.substring(str.indexOf(']')+1, str.indexOf('['));
		           }
		           // 내용 넣기
		           if($.trim(text).length > 0){
		    			if(i>1){ addPict(); }
						$('.timeline li:last').find('dd').text($.trim(text));
						
		           }  
		           str = str.substring(str.indexOf('['));
		       }
			
			// 사진 로드 시키기
			console.log($('[id*=fVisible]'));
			var text = '';
			<c:forEach var="i" items="${fileList}">
				text += '${i.fname}, ';
			</c:forEach>
			
			$('.card-icon').each(function(j) {
				console.log($(this));
				var imgArr = text.split(', ');
				$(this).attr('src', '${pageContext.request.contextPath}/resources/RecipeBoardImages/' + imgArr[j]);
				if(j==0){
		       	 $(this).css('width','40%');
		        } else {
		       	 $(this).css('width','250px');
		        }
			});
		});
		var i = 2;
		function addPict() {
			var $li = $('<li>').addClass('timeline-item');
			var $div = $('<div>').addClass('card');
				var $img = $('<img>').addClass('card-icon').attr('id', 'fVisible'+i);
				var $dl = $('<dl>').addClass('card-definition');
			
			$('.timeline').append($li);
				$li.append($div);
					$div.append($img);
					$div.append($dl);
						$dl.append($('<dt>').text('Chapter.'+i)).append($('<dd>'));
			
			i++;
		}
			/* $(window).keydown( function(event) {
				var key = event.keyCode;
				if ( key == 85 ) {
					$('.full').toggleClass('show', 400);
				} 
				if ( key == 73 ) {
					$('.full-first').toggleClass('show', 400);
				} 
				if ( key == 69 ) {
					$('.full-second').toggleClass('show', 400);
				} 
				if ( key == 65 ) {
					$('.full-second.full-wow').toggleClass('show', 400);
				} 
			});
			
			
			
			
			
			
			$(function(){
				// 추천버튼 클릭시(추천 추가 또는 추천 제거)
				$("#rec_update").click(function(){
					$.ajax({
						url: "/expro/RecUpdate.do",
		                type: "POST",
		                data: {
		                no: ${content.board_no},
		                id: '${id}'
		                },
		                success: function () {
					        recCount();
		                },
					})
				})
				// 게시글 추천수
			    function recCount() {
					$.ajax({
						url: "/testLike.do",
		                type: "POST",
		                data: {
		                    no: ${content.board_no}
		                },
		                success: function (count) {
		                	$(".rec_count").html(count);
		                },
					})
			    };
			    recCount(); // 처음 시작했을 때 실행되도록 해당 함수 호출
			});
		 */
		</script>
		<script>
		// 게시글 번호를 전달할 전역 변수 생성
		var bno = ${Recipe.bno};
		
		// 댓글 수정 함수
		function updateReply(obj){
			// 현재 위치와 가장 가까운 textarea 가져오기
			$(obj).parent().parent().next().find('textarea')
			.removeAttr('readonly');
			
			// 수정 완료 버튼 보여주기
			$(obj).siblings('.updateConfirm').css('display', 'inline');
			
			// 수정 하기는 숨기기
			$(obj).css('display', 'none');
		}
		
		// 수정 완료 기능 구현 함수
		function updateConfirm(obj) {
			// 댓글 내용 가져오기
			
			var content 
			    = $(obj).parent().parent()
			      .next().find('textarea').val();
			
			// 댓글 번호 가져오기
			var cno = $(obj).siblings('input').val();
			
			location.href="/recipe/update.co?cno="+cno+"&bno="+bno
					     +"&ccontent=" + content;
		}
		
		// 댓글 삭제 함수
		function deleteReply(obj){
			
			var cno = $(obj).siblings('input').val();
			
			location.href="/recipe/delete.co?cno="+cno+"&bno="+bno;
		}
		
		// 대댓글 기능 구현 함수
		function reComment(obj){
			if( "${empty member}" ) {
				alrat("로그인을 해주세요~"); 
				return;
			}
			// 추가 완료 기능 버튼 보이게 하기
			$(obj).siblings('.insertConfirm').css('display', 'inline');
			
			// 현재 버튼은 숨기기
			$(obj).css('display', 'none');
			
			// 내용 입력 공간 만들기
			// $(obj).parents('table').append(htmlCode);
			var htmlCode = 
				'<tr class="comment"> <td></td>'
			  + '<td colspan="3" style="background: transparent;">'
			  + '<textarea class="reply-content" style="background:#ffc;"'
			  + '  cols="100" rows="3"></textarea>'
			  + '</td></tr>';
			  
			  $(obj).parents('table').append(htmlCode);
		}
		
		// 대댓글 작성 완료 시 동작할 함수
		function reConfirm(obj){
			// 참조한 댓글의 정보 가져오기
			
			// 참조한 원본 댓글의 번호
			var refcno = $(obj).siblings('input[name=ref_cno]').val();
			// 참조한 댓글의 레벨 + 1
			var clevel = Number($(obj).siblings('input[name=clevel]').val()) + 1;
			
			// console.log(refcno + " : " + clevel);
			
			var parent = $(obj).parent();
			var grandParent = parent.parent();
			var siblingsTR = grandParent.siblings().last();
			
			var content = siblingsTR.find("textarea").val();
			
			location.href='/recipe/insert.co?'
					+ 'uno=${member.uno}'
					+ '&ccontent=' + content
					+ '&bno=' + bno
					+ '&ref_cno=' + refcno
					+ '&clevel=' + clevel;
		}

		$(function() {
			$.ajax({
				url : '${pageContext.request.contextPath}/good.gs',
				data : {goodsName : "${Recipe.rgoods}"},
				type : "post",
				success : function(goodsList) {
					/* <div class="goodsDiv"><a onclick="location='goodsList[i].pcurl'">
							<div>
								<img src="/recipe/resources/images/GoodsImages/goodsList[i].pcfname" width="200px">
							</div>
							<p> <b>goodsList[i].pcgname</b> <br> goodsList[i].pcname</p>

							<div style="display : none;">
								<button onclick="location.href='views/goods/goodsUpdate.jsp?pcid=goodsList[i].pcid'">수정하기</button>
								<button onclick="location.href='/delete.gs?pcid=goodsList[i].pcid'">삭제하기</button>
							</div>
							
						</a></div> */
					for(var i in goodsList) {
					var $div = $('<div>').append($('<img>').attr('src','/recipe/resources/GoodsImages/'+goodsList[i].pcfname).css('width','200px'));
					var $p = $('<p>').css('width','200px').css('height','50px').html('<b>'+goodsList[i].pcgname+'</b> <br> '+goodsList[i].pcname);
					
							var $update = $('<button>').attr('onclick', "location.href='goodsUpdate.jsp?goods="+goodsList[i]+"'").text('수정하기');
							var $delete = $('<button>').attr('onclick', "location.href='/delete.gs?pcid="+goodsList[i].pcid+"'").text('삭제하기');
					var $bntDiv = $('<div>').append($update).append($delete);
					
					if(goodsList[i].uno != "${ member.uno }"){
						$bntDiv.css('display','none');
					}
					
					var $a = $('<a>').attr('onclick', "location='"+goodsList[i].pcurl+"'");
						$a.append($div)
					$('.goods').append($('<div>').css('display','inline-block').css('padding','10px').append($a).append($p).append($bntDiv));
					
					}	

				}, error : function() {
					console.log("실패했어요!");
				}
			});
		});
				
		</script>
        
    </body>
</html>

</body>
</html>