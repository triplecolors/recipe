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
}

li {
    list-style-type: none;
}


body {
	
    background-color: #5180BF;
    text-align: center;
}

.wrapper {
    padding: 0 20px;
    max-width: 960px;
    margin: 0 auto;
}

.cover {
    background-image: url(images/cover.png);
    color: aliceblue;
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
    #firstId{
    	align : center; 
    	font-size : 50px;
    }
    .content_div1{
    	color : black;
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






</div>

		<div class="full-second">
			
		</div>
		<div class="full-first">
			<div class="center">
			</div>
		</div>
	

		
		</div>

        <div class="main">
			<div class="cover">
            <h1 class="cover-title">
                <b id="firstId">${Recipe.rtitle}</b>
            </h1><br /><br /><br />
            ${Recipe.rcontent}
        </div>
        
        <div class="content_div1">
			<h4><b>요리 재료</b></h4>
		</div><br /><br /><br /><br /><br />
        
        <img class="card-icon" id="fVisible0"/>
        
        
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
		<button onclick="location.href='${pageContext.request.contextPath}/updateView.rcp?bno='+${Recipe.bno}">수정하기</button>
		


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
		       	 $(this).css('width','400px');
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
		
        
    </body>
</html>

</body>
</html>