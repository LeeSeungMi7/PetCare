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
<link href="/resources/css/user/comm_board.css" rel="stylesheet">
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
<!-- MAP API-KEY -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>

<script>
function onclickOk(){
	var c_content= $("#c_content").val();
	console.log(c_content);

	if(c_content == ""){
		swal('내용을 입력해주세요.', 'error');
		document.getElementById("c_content").focus();
		console.log
		return false;
	}
	swal('등록되었습니다.');
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

<style>
.comment-min {
	overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    width: calc(450px - 1.5em);
}
</style>

</head>

<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
		<!--본문-->
		<div >
		
			<div class="board shadow p-3 mb-5 bg-body rounded">
				<div class="mb-3">
					<label for="formGroupExampleInput" class="form-label">TITLE</label>
					<input type="text" class="titlebox form-control"
						id="formGroupExampleInput" value="${view.f_title }" disabled>
				</div>
				<div class="mb-3">
					<label for="formGroupExampleInput2" class="form-label">WRITER</label>
					<input type="text" class="namebox form-control"
						id="formGroupExampleInput2" value="${view.f_writer }" disabled>
				</div>
				<div class="mb-3">
					<label for="formGroupExampleInput2" class="form-label">DATE</label>
					<input type="text" class="datebox form-control"
						id="formGroupExampleInput2" value="${view.f_date }" disabled>
				</div>
				<div class="mb-3">
					<label for="formGroupExampleInput" class="form-label">CONTENT</label>
					<div class="form-floating">
						<div class="contentbox form-control" id="floatingTextarea2"
							disabled>${view.f_content }</div>
					</div>
				</div>
				<hr>
				<div class="comment">
					<table class="table">
						<thead>
							<tr>
								<th scope="col" colspan="2">총 댓글 수 : ${criteria.total} 개</th>
							</tr>
						</thead>
						<tbody>
						
							<c:forEach var="comment" items="${qna_com}" varStatus="status">
								<tr>
									<th scope="row">
									<c:out value="${criteria.pageNum + (status.count)}"></c:out></th>
									<td>${comment.c_writer}
									<c:if test="${comment.c_pro == 1 }">
									<img src = "/resources/img/hos.jpg" style="width: 20px;">
									</c:if>
									</td>
									<td class="sb-sidenav-collapse-arrow" style="width: 450px;">
										<div class="comment-text comment-min" onclick="onClickComment(${status.index})">
											${comment.c_content}
										</div>
									</td>
									<td>${comment.c_date}</td>
									<c:if test="${user.m_number == comment.c_member_num}">
									<td>
										<a role="button" href="${path}/qna_reply_delete.do?comment_num=${comment.comment_num }" class="btn-close cancle" aria-label="Close"></a>
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

					<!-- 페이징 끝 -->
				</div>
				<hr>
				<c:if test="${user.m_number != null}">
					<form id="form12" name="ReplyVO" method="POST" onsubmit="return onclickOk()" action="/qna_reply_write.do" enctype="multipart/form-data">
						<div>
							<input type="hidden" name="faq_num" value="${view.faq_num}">
							<div class="form-floating">
								<textarea class="commentbox form-control" id="floatingTextarea2" name="c_content"></textarea>
								<label for="floatingTextarea2">댓글 작성</label>
							</div>
						
						<input type="hidden" name="c_pro" value="${user.m_role}">
						<input type="hidden" name="c_num" value="${view.faq_num}">
						<input type="hidden" name="c_writer" value="${user.m_name}">
						<input type="hidden" name="c_member_num" value="${user.m_number}">
					
							<input type="submit" class="btn btn-success" id="btnReply" role="button" value="댓글 등록">
						</div>
					</form>
				</c:if>
				<hr>
				<a class="btn btn-secondary" href="qna.do" role="button">목록으로</a>

				<c:if test="${user.m_number == view.f_number}">
					<a class="btn btn-secondary"
						href="${path}/qna_rewrite.do?faq_num=${view.faq_num}"
						role="button">수정</a>
					<a class="btn btn-danger "
						href="${path}/qna_delete.do?faq_num=${view.faq_num}"
						role="button">삭제</a>
				</c:if>
				<c:if test="${user.m_number != null}">
					<a class="btn btn-success" href="qna_write.do" role="button">글 작성</a>
				</c:if>
			</div>
		</div>

		<!-- 페이징 처리 폼 -->
		<form action="/qna_board.do" name="pageNumform">
			<input type="hidden" name="pageNum" id="pageNumId" value="">
			<input type="hidden" name="faq_num" value="${view.faq_num}">
		</form>
	</div>


	<!--푸터-->
	<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
	<script type="text/javascript">
function fnSubmitForm(page){
		document.getElementById("pageNumId").value =page;
		document.pageNumform.submit(); 
}
</script>
</body>
</html>

