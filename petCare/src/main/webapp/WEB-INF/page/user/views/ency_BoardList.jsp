<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link href="/resources/css/user/ency_BoardList.css?after"
	rel="stylesheet">
<link href="/resources/css/user/myreservation.css" rel="stylesheet">
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Page</title>
</head>
<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
		<div class="getboard">
			<span class="badge badge-pill badge-success"
				style="font-size: 20px; margin-bottom: 10px;">동 물 백 과</span>
			<ul class="list-group">
				<c:forEach var="List" items="${showEnList}" varStatus="status">
					<div class="media"
						onclick="location.href='ency_Board.do?en_number=${List.en_number }'">
						<div class="media-left">
							<img class="media-object" data-src="holder.js/64x64" alt="64x64"
								src="${List.en_file_path }" data-holder-rendered="true"
								style="width: 64px; height: 64px;">
						</div>
						<div class="media-body" onclick="location.href='ency_Board.html'">
							<h4 class="media-heading" id="top-aligned-media">
								${List.en_title }</h4>
							<p class="content">${List.en_content }</p>
							<p class="insertdate">작성일 : ${List.en_date } 조회수 :
								${List.en_hit }</p>
						</div>
					</div>
				</c:forEach>
			</ul>
			<div class="page1">
				<ul class="pagination1 modal1">


					<c:if test="${showPageVO.pageNum > 1 }">
						<li><a
							href="javascript:fnSubmitForm(${showPageVO.block_start-1});"
							class="arrow1 left1">[처음]</a></li>
					</c:if>

					<c:forEach var="i" begin="${showPageVO.block_start}"
						end="${showPageVO.block_end}">
						<li><a href="javascript:fnSubmitForm(${i});" class="num1">[${i}]</a>
						<li>
					</c:forEach>

					<c:if test="${!(showPageVO.block_num >= showPageVO.total_block)}">
						<li><a
							href="javascript:fnSubmitForm(${showPageVO.block_end+1});"
							class="arrow1 right1">[마지막]</a></li>
					</c:if>


				</ul>
			</div>

			<form action="/ency_BoardList.do" method="post" name="pageNumform">
				<input type="hidden" name="enpageNum" id="pageNumId" value="">
			</form>
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
	<script type="text/javascript">
		function fnSubmitForm(page) {
			document.getElementById("pageNumId").value = page;
			document.pageNumform.submit();
		}
	</script>
</body>
</html>