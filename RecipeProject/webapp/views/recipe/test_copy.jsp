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
</head>
<style>
body, h1, h2, ul, dl, dd {
    margin: 0;
    padding: 0;
}

li {
    list-style-type: none;
}


body {
    background-color: #0a222b;
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
    margin: -40px -20px 0;
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
}
















</style>
<body>

<!DOCTYPE html>
<html>
    <head>
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
                <span>egg tost</span>
                 Recipe
            </h1><br /><br /><br />
        </div>
      
        <div class="wrapper">
            <ul class="timeline">
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="bread.jpg">
                        <h2 class="card-title"></h2>
                        <dl class="card-definition">
                            <dt>Chapter.1</dt>
                            <dd>빵을 구워 줍니다.</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="egg.jpg">
                        <h2 class="card-title"></h2>
                        <dl class="card-definition">
                            <dt>
                                Chapter.2
                                <span></span>
                            </dt>
                            <dd>계란은 프라이 해주고 설탕을 뿌려 줍니다.</dd>
                        </dl>
                    </div>
                    <br /><br /><br /><br /><br /><br /><br /><br />
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/3.png">
                        <h2 class="card-title">1994</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop 3.0
                                <span>Tiger Mountain</span>
                            </dt>
                            <dd>Layers and Tabbed palettes were introduced in this version which became an easy process in manipulating images.</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/4.png">
                        <h2 class="card-title">1996</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop 4.0
                                <span>Big Electric Cat</span>
                            </dt>
                            <dd>Adjustment layers and macros were introduced in this version. They designed interface as the same like other Adobe Products.</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/5.png">
                        <h2 class="card-title">1998</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop 5.0
                                <span>Strange Cargo</span>
                            </dt>
                            <dd>Undo command for multiple times, Managing color and Magnetic Lasso was introduced in this version.</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/6.png">
                        <h2 class="card-title">2000</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop 6.0
                                <span>Venus in Furs</span>
                            </dt>
                            <dd>Vector shapes, Liquify Filter, Layer styles, Dialog box were added, User Interface was updated.</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/7.png">
                        <h2 class="card-title">2002</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop 7.0
                                <span>Liquid Sky</span>
                            </dt>
                            <dd>Healing Brush tool was introduced, Designed Text in vector, And Photoshop file browser was first time introduced.</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/cs.png">
                        <h2 class="card-title">2003</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop CS
                                <span>Dark Matter</span>
                            </dt>
                            <dd>Color correction facility with balance, hue and saturation and Image Output Optimization was introduced also</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/cs2.png">
                        <h2 class="card-title">2005</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop CS2
                                <span>Space Monkey</span>
                            </dt>
                            <dd>Camera RAW 2.x, Highly modified â€œSlice Toolâ€, Shadow/Highlight command, Match Color command, Lens Blur filter, Smart Guides, Real-Time Histogram was introduced in this version. A feature that detects and ignores images of banknotes was added.</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/cs3.png">
                        <h2 class="card-title">2007</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop cs3
                                <span>Red Pill</span>
                            </dt>
                            <dd>Black-and-white conversion adjustment, Auto Align and Auto Blend, Smart (non-destructive) Filters, Mobile device graphic optimization was introduced in this version, Furnishes native support for Intel base Macintosh platform and improved support for Windows Vista, Revised user interface, alterations to Curves, Vanishing Point, Channel Mixer, Brightness and Contrast, and the Print dialog were also introduced. Features like cloning and healing were improved. </dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/cs4.png">
                        <h2 class="card-title">2008</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop CS4
                                <span>Stonehenge</span>
                            </dt>
                            <dd>New Adjustments window, Use dodge/burn without affecting other areas, Auto blend feature improved, Content aware cropping, Pixel grid for editing individual pixels, New Adjustments panel, New Masks panel, Content aware scaling, Extended depth of field , Fluid canvas rotation, Smoother panning, Smoother zooming, Support for colour-blind, 3D object painting, 3D object/property editing, 3D animation, 2D conversions to 3D, Volume rendering</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/cs5.png">
                        <h2 class="card-title">2010</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop CS5
                                <span>White Rabbit</span>
                            </dt>
                            <dd>Content Aware Fill, Intelligent selection technology, Advanced HDR processing, Improved raw processing, Extended painting effects, Localised Warp tool, Auto lens correction, Workspace management, Advanced 3D options (CS5 Extended), and 30 JDI (Just Do it) additions.</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/cs6.png">
                        <h2 class="card-title">2012</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop CS6
                                <span>Superstition</span>
                            </dt>
                            <dd>UI redesign (all new icons and optional dark UI), Auto and background saves, Content-aware Patch and Move tools (extensions of content-aware fill introduced in previous version), Blur Gallery includes Tilt Shift, Iris and Field that can be used to create depth of field effects, Color Range: skin tone and face detection, Adobe Camera RAW 7, Enhanced crop tool with straighten option, New properties panel that can be used to vary properties of adjustment layers, Enhanced video support, Oil Paint filter now ships with the program, Adaptive Wide Angle filter, Paragraph and Character Styles, Built in support for Middle Eastern languages, Updated Printing UI, 3DLUT adjustment, Overhauled vector tools including stroking of vector paths, dotted or dashed, Snap to Pixel for vector tools and transforms, 3D UI completely redone, now easier to use, Last release for Windows XP SP3 and OS X Mountain Lion</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/cc.png">
                        <h2 class="card-title">2013</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop CC
                                <span>Lucky 7</span>
                            </dt>
                            <dd>Camera Shake Reduction, Former Extended features now always included, Intelligent Upsampling, Camera Raw as a filter, Editable rounded rectangles, Improved 3D painting, Share on Behance, Conditional Actions, System antialiasing style for type, Min and Max filter round kernel, Sync preferences with Cloud</dd>
                        </dl>
                    </div>
                </li>
                <li class="timeline-item">
                    <div class="card">
                        <img class="card-icon" src="images/cc2014.png">
                        <h2 class="card-title">1990</h2>
                        <dl class="card-definition">
                            <dt>
                                Photoshop CC2014
                                <span>Single Malt Wiskey Cat</span>
                            </dt>
                            <dd>Perspective Warp, Linked smart objects, 3D Printing support, Publish 3D models on Sketchfab, Adobe Camera Raw 8.3, Blur Gallery motion effects, Focus Mask, Expanded Mercury Graphics Engine support, Smart Object improvements, Adobe Camera Raw 8 enhancements</dd>
                        </dl>
                    </div>
                </li>
            </ul>
        </div> 
        </div>
        
        <div>
			<div class="w3-border w3-center w3-padding">
				<c:if test="${ id == null }">
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
			</div>
		</div>


		<script>
			$(window).keydown( function(event) {
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
		
		</script>
		
        
    </body>
</html>

</body>
</html>