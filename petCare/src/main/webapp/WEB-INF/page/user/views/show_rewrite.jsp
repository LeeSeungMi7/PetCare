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

function onclickOk2(){
      var title= $("#input_title").val();
      console.log(title);
      
      oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", [])
      var content = document.getElementById("ir1").value
      console.log(content);

      if(title == ""){
         alert("제목을 입력하세요.");
         document.getElementById("title").focus();
         console.log
         return false;
      }
      if(content == ""){
         alert("내용을 입력하세요.");
         oEdiotrs.getById["ir1"].exec("FOCUS")
         return false;
      }
      alert("등록되었습니다.")
      document.getElementById("form2").submit();
   }


</script>

</head>

<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
		<!--본문-->
		<%-- <%@ include file="/WEB-INF/page/user/views/show_rewrite_body.jsp" %> --%>
				<input type="hidden" name="board_num" value="${rewrite_view.board_num}">
				<input type="hidden" name="c_num" value="${rewrite_view.board_num}">
		<form id="form2" name="showVO" method="POST"
			onsubmit="return onclickOk2()" action="/board_update.do"
			enctype="multipart/form-data">
			<div class="eidtor">
				<!--제목-->
				<div style="display: flex; flex-direction: row;align-items: center;">
					<div style="display: flex;flex-direction: column;">
					<div class="mb-3">
						<label for="formGroupExampleInput" class="form-label">TITLE</label>
						<input type="text" class="datebox form-control" maxlength="20"
							name="b_title" style="max-width: 300px;"
							value="${rewrite_view.b_title }">
					</div>
					<!--날짜-->
					<div class="mb-3">
						<label for="formGroupExampleInput2" class="form-label">DATE</label>
						<input type="text" class="datebox form-control"
							style="max-width: 300px;" value="${rewrite_view.b_date }" disabled>
					</div>
					<!--대표이미지-->
					<div class="mb-3">
						<label for="formGroupExampleInput2" class="form-label">IMAGE</label>
						<div>
						<div class="filebox">
		               <input id="file_name" class="upload-name" value="파일선택" disabled="disabled">
		               <label for="ex_filename">수정</label>
		               <input type="file" id="ex_filename" class="upload-hidden" name="show_update_file">	
		                </div>
						</div>
					</div>
					
					</div>
					<c:if test="${rewrite_view.b_file_path != null }">
					<div >
					<label for="formGroupExampleInput2" class="form-label" style="align-items: center;"id="before-image">BEFORE IMAGE</label>
					<img id="board_img" src="${rewrite_view.b_file_path}" class="file_img">
					</div>
					</c:if>
				</div>
				
               <script type="text/javascript">
	               document.getElementById('ex_filename').oninput = (e) => {
	            	   
	   				document.getElementById('file_name').value = e.target.files[0].name;
	   				console.error(e.target.files[0]);
	               }
               </script>
				
				
				
				<!--내용-->
				<div>
					<label>CONTENT</label>
					<textarea id="ir1" rows="10" cols="100" name="b_content"
						style="max-width: 650px;">${rewrite_view.b_content }</textarea>
				</div>




				<!--버튼-->
				<div>
				<input type="hidden" name="b_writer" value="${rewrite_view.b_writer}">
				<input type="hidden" name="b_number" value="${rewrite_view.b_number}">
				<input type="hidden" name="b_file_name" value="${rewrite_view.b_file_name}">
				<input type="hidden" name="b_file_path" value="${rewrite_view.b_file_path}">
				<input type="submit" class="btn btn-success" id="btnSave" value="수정완료">
				<a class="btn btn-danger" href="show.do" role="button" onclick="Cancel()">취소</a>
				</div>
			</div>

		</form>
</div>


		<script type="text/javascript" src="/se2/js/service/HuskyEZCreator.js"
			charset="utf-8"></script>
		<script src="/resources/js/user/write.js"></script>
		<script src="/resources/js/user/qna_rewrite.js"></script>

		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
</body>
</html>

