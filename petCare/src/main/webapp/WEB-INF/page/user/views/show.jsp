<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="/resources/css/user/show.css" rel="stylesheet">
<link href="/resources/css/user/mywrite.css" rel="stylesheet">
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

</head>

<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>

		<!--본문-->
		<div class="getboard">
			<span class="badge badge-pill badge-success"
				style="font-size: 20px; margin-bottom: 10px; width: 100%;">자
				랑 하 기</span>
			<button type="button" class="button_class"
				onclick="location.href='qna_write.do'">저도 질문있어요</button>
			<div class="mainboard">
				<div class="card" style="width: 20rem;">
					<img src="/resources/img/동물자랑1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title" value="${show.title}">제목</h5>
						<p class="card-text" value="${show.content}">내용</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item" value="${show.write}">작성자 :</li>
						<li class="list-group-item" value="${show.date}">작성일 :</li>
					</ul>
					<div class="card-body btns">
						<a href="#" class="card-link">
							<button type="button" class="btn btn-success btn-sm"
								onclick="location.href='show_board.html'">게시글 보기</button>
						</a>
					</div>
				</div>
				<div class="card" style="width: 20rem;">
					<img src="/resources/img/동물자랑1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<p class="card-text">내용</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">작성자 :</li>
						<li class="list-group-item">작성일 :</li>
					</ul>
					<div class="card-body btns">
						<a href="#" class="card-link">
							<button type="button" class="btn btn-success btn-sm">게시글
								보기</button>
						</a>
					</div>
				</div>

				<div class="card" style="width: 20rem;">
					<img src="/resources/img/동물자랑1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<p class="card-text">내용</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">작성자 :</li>
						<li class="list-group-item">작성일 :</li>
					</ul>
					<div class="card-body btns">
						<a href="#" class="card-link">
							<button type="button" class="btn btn-success btn-sm"
								onclick="location.href='show_board.html'">게시글 보기</button>
						</a>
					</div>
				</div>

				<div class="card" style="width: 20rem;">
					<img src="/resources/img/동물자랑1.jpg" class="card-img-top" alt="...">
					<div class="card-body">
						<h5 class="card-title">제목</h5>
						<p class="card-text">내용</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">작성자 :</li>
						<li class="list-group-item">작성일 :</li>
					</ul>
					<div class="card-body btns">
						<a href="#" class="card-link">
							<button type="button" class="btn btn-success btn-sm">게시글
								보기</button>
						</a>
					</div>
				</div>
			</div>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link">이전</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">다음</a></li>
				</ul>
			</nav>
		</div>
		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>

	</div>
</body>

</html>