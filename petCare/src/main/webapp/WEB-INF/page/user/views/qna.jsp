<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<link href="/resources/css/user/index.css" rel="stylesheet">
<link href="/resources/css/user/color.css" rel="stylesheet">
<link href="/resources/css/user/text.css" rel="stylesheet">
<link href="/resources/css/user/header.css" rel="stylesheet">
<link href="/resources/css/user/footer.css" rel="stylesheet">
<link href="/resources/css/user/button.css" rel="stylesheet">
<link href="/resources/css/user/loginForm.css" rel="stylesheet">
<link href="/resources/css/user/qna.css?after" rel="stylesheet">
<link href="/resources/css/user/mywrite.css" rel="stylesheet">
<link href="/resources/css/user/myreservation.css" rel="stylesheet">
<!--부트스트랩-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--alert-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- 카카오 주소 -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 카카오 MAP API-KEY -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Page</title>
</head>

<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>

		<!--본문-->
		<div class="getboard">
			 
				<span class="badge badge-pill badge-success">Q n A</span>
				<a class="button_class" href="javascript:void(0);" onclick="qna_write_check();" role="button"> 저도 질문 있어요</a>
				<ul class="list-group">
				<c:forEach var="qnaPageList" items="${qnaPageList}" varStatus ="status">
				<li class="list-group-item" onclick="location.href='qna_board.do?faq_num=${qnaPageList.faq_num}'">
					<div class="card mb-3">
						<div class="row g-0">
							<div class="col-md-4">
							<c:choose>
                   				<c:when test="${qnaPageList.f_file_path == null }">
                   				<img class="no-image" src = "/resources/img/no_image_dogs.png">
                   				</c:when>
                   				<c:otherwise>
                   				<img class="image-path"src="${qnaPageList.f_file_path}" class="card-img-top" alt="...">
                   				</c:otherwise>
                   			</c:choose>
							</div>
							<div class="col-md-8">
								<div class="card-body">
								<h6 class="text-muted look">LOOK ${qnaPageList.f_hit}</h6>
								<div class ="qna-board">
									<h5 class="card-title">${qnaPageList.f_title}</h5>
									<div class="qna-board-row">
										<small class="text-muted writer">WRITER : ${qnaPageList.f_writer}</small>
										<small class="text-muted">${qnaPageList.f_date}</small>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
				</li>
				</c:forEach>
			</ul>

				<div class="page1">
					<ul class="pagination1 modal1">
							
						<c:if test="${qnaPage.pageNum > 1 }">
							<li><a
								href="javascript:fnSubmitForm(0,1);"
								class="arrow1 left1">[처음으로]</a></li>
							
						</c:if>

						<c:forEach var="i" begin="${qnaPage.block_start}" end="${qnaPage.block_end}">
							<li><a href="javascript:fnSubmitForm(${i},${qnaPage.pageConunt});" class="num1">[${i}]</a>
							<li>
						</c:forEach> 
						
						<c:if test="${qnaPage.block_end < qnaPage.total_page}">
							<li><a href="javascript:fnSubmitForm(${qnaPage.block_end+1},${qnaPage.pageConunt+1});" class="arrow1 right1">[다음]</a></li>
						</c:if>


					</ul>
				</div>
				
				<form action="/qna.do" method="post" name="pageNumform">
					<input type="hidden" name="pageNum" id="pageNumId" value="">
					<input type="hidden" name="pageConunt" id="pageConunt" value="">
				</form>

		</div>
		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
<script type="text/javascript">
function qna_write_check(){

		$.ajax({	
		 	url: "/check_qna.do",
	        type: "GET",
		 	success : function(data) {
		 		if(data.user_ok=="0"){
		 			swal('로그인 진행 요청.', '회원만 가능합니다', 'error');
		 		}else{
		 			window.location.href ="/qna_write.do";
		 		}
			},
			error : function(error) {
				alert("error : " + error);
			}
		});
}
function fnSubmitForm(page , pageConunt){
	document.getElementById("pageNumId").value =page;
	document.getElementById("pageConunt").value =pageConunt;
	
	document.pageNumform.submit();
}	
</script>

	</div>
</body>

</html>