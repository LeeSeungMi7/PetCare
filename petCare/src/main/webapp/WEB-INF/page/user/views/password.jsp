<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <!-- 카카오 MAP API-KEY -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
  <link href="/resources/css/user/password.css" rel="stylesheet">
</head>

<body>
<div id="pet-layout" class="background--white">
    <!--헤더-->
    <%@ include file="/WEB-INF/page/user/views/header.jsp"%>

    <!--본문-->
		<div class="password-body">
			<div class="password-body-form">
			<img class="password_back" src="/resources/img/password.png">
				<div>
					
					<div class="card-body">
						<div class="small mb-3 text-muted">이메일 입력 시 이메일로 비밀번호가 발송됩니다.</div>
						<form id="passwordForm">
							<div class="form-floating mb-3">
								<input class="form-control" id="inputEmail" type="email"/> 
								<label for="inputEmail">이메일 입력</label>
							</div>
							<div class="d-flex align-items-center justify-content-between mt-4 mb-0">
								<a class="singform_go" href="/signinForm.do">회원가입으로 이동</a>
								<input type="button" class="btn btn-primary email_send" value="비밀번호 발송">
							</div>
						</form>
					</div>
					<div class="card-footer text-center py-3">
						
					</div>
				</div> 
			</div>
		</div>

	<!--푸터-->
    <%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
<script type="text/javascript">
$(".email_send").click(function(){
	var m_id = $("#inputEmail").val();

	 $.ajax({
		type : "post",
		data : {
			"m_id" : m_id
		},
		url : "/password_send_email.do",
		dataType : "json",
		success : function(data) {
			if (data.data == "아이디없음") {
				swal({
					title : "존재하지 않는 E_mail",
				    text: m_id + " \n는 존재하지 않습니다. 확인해 주세요.",
				    closeOnClickOutside : false
				}, function(){
					$("#passwordForm")[0].reset();
				});
			} else if(data.data == "오류"){
				swal({
					title : "죄송합니다.",
				    text: "전송 중 오류가 발생하였습니다. 다시 시도해주세요.",
				    closeOnClickOutside : false
				}, function(){
					$("#passwordForm")[0].reset();
				});
			} else if(data.data == "발송완료"){
				swal({
					title : "E_mail 전송완료",
				    text: m_id + "로 임시 비밀번호가 전송되었습니다. \n E_mail을 확인해주세요.",
				    closeOnClickOutside : false
				}, function(){
					window.location="/home.do";
				});
				
					
			} else{
				swal({
					title : "전송 실패",
				    text: m_id + "다시 시도해주세요.",
				    closeOnClickOutside : false
				}, function(){
					$("#passwordForm")[0].reset();
				});
			}
		},
		error : function(error) {
			alert("error : " + error);
		}
	}); 
})
</script>
</div>
</body>
</html>
