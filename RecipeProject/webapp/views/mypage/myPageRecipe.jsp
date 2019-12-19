<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="https://static.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://static.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<c:import url="../common/commonUtil.jsp"/>
<title>내가쓴 레시피글보기</title>
<style>
      .container{
  display: flex;
  width: 100%;
  overflow-x: scroll;
  scroll-snap-type: x mandatory;
  scroll-padding:30px;
  padding:50px;
}

::-webkit-scrollbar { height: 0 !important }

.slide{
  display:inline-block;
  position:relative;
  height: 250px;
  min-width: 150px;
  border-radius:5px;
  box-shadow:0px 0px 20px 1px rgba(1,1,1,0.2);
  margin:10px;
  user-select: none;
  scroll-snap-align: center;
}

.active{
  transform:scale(1.2);
  margin:40px;
  transition: transform 0.3s ease;
}
    </style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>
<body translate="no">
<c:import url="../common/header.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<div class="container">
<div class="slide">
1
</div>
<div class="slide">
2
</div>
<div class="slide">
3
</div>
<div class="slide">
4
</div>
<div class="slide">
5
</div>
<div class="slide">
6
</div>
<div class="slide">
7
</div>
<div class="slide">
8
</div>
<div class="slide">
9
</div>
<div class="slide">
10
</div>
<div class="slide">
11
</div>
<div class="slide">
12
</div>
<div class="slide">
13
</div>
</div>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>
<script id="rendered-js">
      let container = document.querySelector(".container");
let slide = document.querySelector(".slide");

let clicked = false;
let initialScrollLeft;
let startPos;
let extraScroll;

// let pageCenterX = window.outerWidth / 2;
// let pageCenterY = container.clientHeight / 2;
// let centerElement;

container.addEventListener("mousedown", function (e) {
  clicked = true;
  startPos = e.clientX - container.offsetLeft;
 +
  initialScrollLeft = container.scrollLeft;

  // if(document.querySelector(".active"))   {
  //   document.querySelector(".active").classList.remove("active");
  //   e.target.classList.add("active")
  // }else{
  //   e.target.classList.add("active")
  // }
});

container.addEventListener("mouseleave", function (e) {
  clicked = false;
});

container.addEventListener("mouseup", function (e) {
  clicked = false;
});

container.addEventListener("mousemove", function (e) {
  if (clicked) {
    extraScroll = e.pageX - container.offsetLeft;
    let x = extraScroll - startPos;
    container.scrollLeft = initialScrollLeft - x;
    console.log({ e, extraScroll, startPos, initialScrollLeft });
  }
});

/////
container.addEventListener("touchstart", function (e) {
  clicked = true;
  startPos = e.touches[0].clientX - container.offsetLeft;
  console.log({ startPos });
  initialScrollLeft = container.scrollLeft;
});

container.addEventListener("mouseleave", function (e) {
  clicked = false;
});

container.addEventListener("touchend", function (e) {
  clicked = false;
});

container.addEventListener("touchmove", function (e) {
  if (clicked) {
    extraScroll = e.touches[0].pageX - container.offsetLeft;
    let x = extraScroll - startPos;
    container.scrollLeft = Math.round(initialScrollLeft - x);
    console.log({ e, extraScroll, startPos, initialScrollLeft });
  }

  //   if(){

  //      }
});
      //# sourceURL=pen.js
    </script>
    <c:import url="../common/footer.jsp"/>
</body>
</html>
