<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="/resources/css/user/index.css" rel="stylesheet">
    <link href="/resources/css/user/color.css" rel="stylesheet">
    <link href="/resources/css/user/text.css" rel="stylesheet">
    <link href="/resources/css/user/header.css" rel="stylesheet">
    <link href="/resources/css/user/footer.css" rel="stylesheet">
    <link href="/resources/css/user/button.css" rel="stylesheet">
    <link href="/resources/css/user/loginForm.css" rel="stylesheet">
    <link href="/resources/css/user/home.css" rel="stylesheet">
    <link href="/resources/css/user/myreservation.css" rel="stylesheet">
    <link href="/resources/css/user/hospital_detail.css?after" rel="stylesheet">

    
  <!--부트스트랩-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"  crossorigin="anonymous">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- 제이쿼리 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <!--alert-->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
  <!-- 카카오 주소 -->
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <!-- 경은이 카카오 MAP API-KEY -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
	<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
	<title>PetCare Page</title>
<script>

function onclickOk(){
	var rw_content= $("#rw_content").val();
	console.log(rw_content);

	if(rw_content == ""){
		swal('내용을 입력해주세요.', 'error');
		document.getElementById("rw_content").focus();
		console.log
		return false;
	}
	alert("등록되었습니다.")
	document.getElementById("form12").submit();
}

function onClickComment(index) {
	const comment = document.getElementsByClassName('comment-text')[index]
	const isMin = comment.className.includes('comment-min');
	if(isMin) {
		comment.classList.remove('comment-min')
	} else {
		comment.classList.add('comment-min')
	}
}

</script>

</head>
<body>
<div id="pet-layout" class="background--white">
<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
<div class="pet-hospital-detail__title text--20-bold" id="title"></div>
<div class="pet-hospital-detail__infos pet-row">
    <div id="map" style="width:100%;height:300px;"></div>
    <div class="pet-hospital-detail__info-text" id="infos"></div>
</div>
 <c:if test="${criteria.rw_partner_number != 0}">
<div class="pet-hospital-detail__reviews">
    <div class="comment">
        <!--리뷰 추가-->
 				<div class="comment">
 				<div>
					<table class="table">
						<thead>
							<tr>
								<th scope="col" colspan="2">총 댓글 수 : ${criteria.total} 개</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="comment" items="${hos_com}" varStatus="status">
								<tr>
									<th scope="row">
									<c:out value="${criteria.pageNum + (status.count)}"></c:out></th>
									<td>${comment.rw_writer}
									</td>
									<td class="sb-sidenav-collapse-arrow" style="width: 450px;">
										<div class="comment-text comment-min" onclick="onClickComment(${status.index})">
											${comment.rw_content}
										</div>
									</td>
									<td>${comment.rw_date}</td>
									<c:if test="${user.m_number == comment.rw_number}">
									<td>
										<a role="button" href="${path}/hospital_reply_delete.do?review_num=${comment.review_num}" class="btn-close cancle" aria-label="Close"></a>
									</td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- 페이징처리 -->

					<div class="page1">
						<ul class="pagination1 modal1">

							<c:if test="${criteria.pageNum > 1 }">
								<li><a
									href="javascript:fnSubmitForm(${criteria.block_start-1});"
									class="arrow1 left1">[처음]</a></li>
							</c:if>

							<c:forEach var="i" begin="${criteria.block_start}"
								end="${criteria.block_end}">
								<li><a href="javascript:fnSubmitForm(${i});" class="num1">[${i}]</a>
								<li>
							</c:forEach>

							<c:if test="${!(criteria.block_num >= criteria.total_block)}">
								<li><a
									href="javascript:fnSubmitForm(${criteria.block_end+1});"
									class="arrow1 right1">[마지막]</a></li>
							</c:if>

						</ul>
					</div>
				</div>
				<hr>
				<c:if test="${user.m_number != null}">
					<script>
						window.user_number = ${user.m_number};
						window.user_role = ${user.m_role}
					</script>
					<form id="form12" name="ReplyVO" method="POST" onsubmit="return onclickOk()" action="hospital_reply_write.do" enctype="multipart/form-data">
						<div>
							<div class="form-floating">
								<textarea class="commentbox form-control" id="floatingTextarea2" name="rw_content"></textarea>
								<label for="floatingTextarea2">리뷰 작성</label>
							</div>
						<input type="hidden" name="rw_partner_number" value="${criteria.rw_partner_number}">
						<input type="hidden" name="rw_writer" value="${user.m_name}">
						<input type="hidden" name="rw_number" value="${user.m_number}">
					
							<input type="submit" class="btn btn-success" id="btnReply" role="button" value="댓글 등록">
						</div>
					</form>
				</c:if>


				</div>
				<!-- 페이징 끝 -->
				
				
    </div>
    <hr>
    		<!-- 페이징 처리 폼 -->
		<form action="/hospital_detail.do" name="pageNumform">
			<input type="hidden" name="pageNum" id="pageNumId" value="">
			<input type="hidden" name="m_number" value="${criteria.rw_partner_number}">
		</form>
</div>
</c:if>
<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
	<script type="text/javascript">
function fnSubmitForm(page){
		document.getElementById("pageNumId").value = page;
		document.pageNumform.submit(); 
}
</script>
<script src="/resources/js/user/hospital_detail.js"></script>
</div>
</body>
</html>