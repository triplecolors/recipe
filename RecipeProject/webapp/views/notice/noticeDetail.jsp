<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 보기</title>
    <c:import url="../common/commonUtil.jsp"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    <style>
        #btnup{
            background: #ff666f;
            border:#ff666f;
        }
        #btnde{
            background: #ff666f;
            border:#ff666f;
        }
        #btnli{
            background: #ff666f;
            border:#ff666f;
        }
        #content{
        	height : 350px;
        	overflow : auto;
        }
        
    </style>
</head>
<body style="background: gray;">
<c:import url="../common/header.jsp"/>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

    <div class="row">
        <div class="col-xs-2 col-md-2"></div>
        <div class="col-xs-8 col-md-8">
            <h2 class="text-center" style="color: snow;">게시글 보기</h2>
            <hr>
            <p>&nbsp;</p>
            <div class="table table-responsive" style="overflow-x:hidden;">
                	<input type="hidden" class="type" name="type" value="${notice.bno }"/>
                <table class="table">
                    <tr>
                        <th class="success" style="background: #ff666f;">글번호</th>
                        <td>${notice.bnum }</td>
                        <th class="success" style="background: #ff666f;">작성일</th>
                        <td>${notice.nDate }</td>
                      
                    </tr>
				

                    <tr>
                        <th class="success" style="background: #ff666f;">작성자</th>
                        <td>${notice.writer }</td>
                    </tr>
                        
                    <tr>
                        <th class="success" style="background: #ff666f;">제목</th>
                        <td colspan="3">${notice.nTitle }</td>
                    </tr>

                    <tr>
                        <th class="success"  style="background: #ff666f;">글 내용</th>
                        <td colspan="3" id="content">${notice.nContent }</td>
                    </tr>
                    
                    
                            
               
                                
                  
                   
                    <tr>          
                                    
                        <td colspan="3" class="text-center">
                        <c:set var="unum" value="${notice.uno }"/>
                        <c:if test="${member.uno eq unum}">
                            <input type="button" id="btnup" class="btn btn-warning" value="수정"
                                onclick="updateN();">                        
                            <input type="button" id="btnde" class="btn btn-danger" value="삭제"
                                onclick="deleteN();">
                        </c:if>
                            <input type="button" id="btnli" class="btn btn-primary" value="목록"
                                onclick="goList();">
                        </td>
                    </tr>

                    


                </table>
            </div>
            
			
        </div>
    </div>
		<script>
			function updateN(){
				var bno = $('.type').val();
				location.href="${pageContext.request.contextPath}/nUpView.no?bno="+bno;
			}
			function deleteN(){

				var bno = $('.type').val();
				location.href="${pageContext.request.contextPath}/delete.no?bno="+bno;

			}
			function goList(){
				location.href="${pageContext.request.contextPath}/selectList.no";
			}
		</script>
	<c:import url="../common/footer.jsp"/>
</body>
</html>