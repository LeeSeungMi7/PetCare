<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="/resources/css/user/write.css" rel="stylesheet">
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
		var title= $("#input_title").val();
		console.log(title);
		
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", [])
		var content = document.getElementById("ir1").value
		console.log(content);

		if(title == ""){
			swal('제목을 입력해주세요.', 'error');
			document.getElementById("title").focus();
			console.log
			return false;
		}
		if(content == ""){
			oEdiotrs.getById["ir1"].exec("FOCUS")
			return false;
		}
		swal('등록되었습니다.');
		document.getElementById("form1").submit();
	}


</script>
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Page</title>
</head>

<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
		<!--본문-->
		<%-- <%@ include file="/WEB-INF/page/user/views/show_write.jsp" %> --%>
		<form id="form1" name="qnaVO" method="POST" onsubmit="return onclickOk()" action="/qna_insert.do" enctype="multipart/form-data">
			<div class="eidtor">
				<!--제목-->
				<div class="mb-3">
					<label for="formGroupExampleInput" class="form-label" id="title">TITLE</label> 
					<input
						type="text" class="datebox form-control" maxlength="20"
						placeholder="" style="max-width: 300px;" name="f_title" id="input_title">
				</div>
				<!--대표이미지-->
				<div class="mb-3">
					<label for="formGroupExampleInput2" class="form-label">IMAGE</label>
					<div>
					<input type="file" name="qna_file" id="profile_pt" onchange="previewImage(this,'View_area')"/>
					<div id='View_area' style='position:relative;  border: 0px solid black; dispaly: inline; '></div>
					</div>
				</div>
				<!--내용-->
				<div>
					<label>CONTENT</label>
					<textarea id="ir1" rows="10" cols="100" style="max-width: 650px;" name="f_content"></textarea>
				</div>
				<!--버튼-->
				<div>
					<input type="hidden" name="f_writer" value="${user.m_name}">
					<input type="hidden" name="f_number" value="${user.m_number}">
					<input type="hidden" name="f_pro" value="${user.m_role}">
					<input type="submit" class="btn btn-success" id="btnSave" value="등록">
					<!-- <button class="btn btn-success" type="button" id="btnSave" ">등록</button> -->
					<a class="btn btn-danger" href="qna.do" role="button" onclick="Cancel()">취소</a>
				</div>
			</div>

		</form>
		</div>

		<script type="text/javascript" src="/se2/js/service/HuskyEZCreator.js"
			charset="utf-8"></script>
		<script src="/resources/js/user/write.js"></script>
		<script src="/resources/js/user/qna_write.js"></script>


		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
</body>
</html>

