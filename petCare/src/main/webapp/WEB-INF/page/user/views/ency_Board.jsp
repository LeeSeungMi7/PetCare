<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link href="/resources/css/user/index.css" rel="stylesheet">
<link href="/resources/css/user/color.css" rel="stylesheet">
<link href="/resources/css/user/text.css" rel="stylesheet">
<link href="/resources/css/user/header.css" rel="stylesheet">
<link href="/resources/css/user/footer.css" rel="stylesheet">
<link href="/resources/css/user/button.css" rel="stylesheet">
<link href="/resources/css/user/loginForm.css" rel="stylesheet">
<link href="/resources/css/user/comm_board.css?after" rel="stylesheet">
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Page</title>
</head>
<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
		<div class="board shadow p-3 mb-5 bg-body rounded">
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label">TITLE</label> <input
					type="text" class="titlebox form-control"
					id="formGroupExampleInput" placeholder="${ency_view.en_title}"
					disabled>
			</div>
			<div class="mb-3">
				<label for="formGroupExampleInput2" class="form-label">DATE</label> <input
					type="text" class="datebox form-control"
					id="formGroupExampleInput2" placeholder="${ency_view.en_date}"
					disabled>
			</div>
			<div class="mb-3">
				<label for="formGroupExampleInput" class="form-label">CONTENT</label>
				<div class="form-floating">
					<img style="width: 50%; margin-bottom: 20px;"
							src="${ency_view.en_file_path}">
					<textarea class="contentbox form-control" id="floatingTextarea2" readonly>${ency_view.en_content}</textarea>
				</div>
			</div>
			<hr>

			<a class="btn btn-success" href="./ency_BoardList.do" role="button">목록으로</a>
		</div>
	</div>
	<!--푸터-->
	<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
	<!-- 제이쿼리 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<!--alert-->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
</body>
</html>