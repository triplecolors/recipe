<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/notice.css">
<link href='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<c:import url="../common/commonUtil.jsp"/>
</head>
<body>
<c:import url="../common/header.jsp"/>
<div class="container-fluid mt-100">
    <div class="row">
        <div class="col-md-12">
            <div class="card mb-3">
                <div class="card-header pr-0 pl-0">
                    <div class="row no-gutters align-items-center w-100">
                        <div class="col font-weight-bold pl-3">General</div>
                        <div class="d-none d-md-block col-6 text-muted">
                            <div class="row no-gutters align-items-center">
                                <div class="col-3">Threads</div>
                                <div class="col-3">Replies</div>
                                <div class="col-6">Last update</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-body py-3">
                    <div class="row no-gutters align-items-center">
                        <div class="col"><a href="javascript:void(0)" class="text-big font-weight-semibold" data-abc="true">Getting started with BBBootstrap.com</a></div>
                        <div class="d-none d-md-block col-6">
                            <div class="row no-gutters align-items-center">
                                <div class="col-3">120</div>
                                <div class="col-3">14</div>
                                <div class="media col-6 align-items-center"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583246/AAA/2.jpg" alt="" class="d-block ui-w-30 rounded-circle">
                                    <div class="media-body flex-truncate ml-2"> <a href="javascript:void(0)" class="d-block text-truncate" data-abc="true">Thankyou for your help. appreciate your solution</a>
                                        <div class="text-muted small text-truncate">2d ago &nbsp;·&nbsp; <a href="javascript:void(0)" class="text-muted" data-abc="true">William Smith</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="m-0">
                <div class="card-body py-3">
                    <div class="row no-gutters align-items-center">
                        <div class="col"><a href="javascript:void(0)" class="text-big font-weight-semibold" data-abc="true">Announcements</a></div>
                        <div class="d-none d-md-block col-6">
                            <div class="row no-gutters align-items-center">
                                <div class="col-3">23</div>
                                <div class="col-3">12</div>
                                <div class="media col-6 align-items-center"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583319/AAA/3.jpg" alt="" class="d-block ui-w-30 rounded-circle">
                                    <div class="media-body flex-truncate ml-2"> <a href="javascript:void(0)" class="d-block text-truncate" data-abc="true">We have created a new feature for developers and designers</a>
                                        <div class="text-muted small text-truncate">1d ago &nbsp;·&nbsp; <a href="javascript:void(0)" class="text-muted" data-abc="true">Rodie Angel</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="m-0">
                <div class="card-body py-3">
                    <div class="row no-gutters align-items-center">
                        <div class="col"><a href="javascript:void(0)" class="text-big font-weight-semibold" data-abc="true">Guides</a></div>
                        <div class="d-none d-md-block col-6">
                            <div class="row no-gutters align-items-center">
                                <div class="col-3">42</div>
                                <div class="col-3">654</div>
                                <div class="media col-6 align-items-center"> <img src="https://res.cloudinary.com/dxfq3iotg/image/upload/v1574583336/AAA/4.jpg" alt="" class="d-block ui-w-30 rounded-circle">
                                    <div class="media-body flex-truncate ml-2"> <a href="javascript:void(0)" class="d-block text-truncate" data-abc="true">To enable new notifications. just go to settings.</a>
                                        <div class="text-muted small text-truncate">1d ago &nbsp;·&nbsp; <a href="javascript:void(0)" class="text-muted" data-abc="true">Kim Nicolas </a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
	<a href="test.jsp">테스트</a> <br />
	<a href="dashBoardSample1.jsp">테스트2</a> <br />
	<a href="dashBoardSample2.jsp">테스트3</a> <br />
		<a href="noticeListForm.jsp">테스트4</a> <br />
	
	<script>
	
	
	</script>
	
	
</body>
</html>
