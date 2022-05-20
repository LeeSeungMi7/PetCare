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
    <link href="/resources/css/user/home.css" rel="stylesheet">
    <link href="/resources/css/user/now_password.css" rel="stylesheet">


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
  <!--카카오 MAP API-KEY -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
  
</head>

<body>
<div id="pet-layout" class="background--white">
    <!--헤더-->
    <%@ include file="/WEB-INF/page/user/views/header.jsp"%>

    <!--본문-->
		<div class="pet-body pet-home">
			<!-- 홈 최상단 슬라이더 -->
			<section name="f">
				<div class="join-user" style="align-items: center">
				<img class="now_password_img" src="/resources/img/now_password.png">
					<!--비밀번호-->
					<div class="now_password_box">
					<div class="join-user__items">
					<label>현재 비밀번호를 입력해주세요.</label>
						<input id="user_password" type="password" maxlength="15" placeholder="현재 비밀번호를 입력하세요" > 
						<span class="error_next_box" id="error_password" aria-live="assertive"></span>
					</div>

					<!--완료-->
					<div class="join-user__items">
						<div class="join-user__items--row"
							style="justify-content: space-between">
							<button class="buttonOk button_class pass_check">확인</button>
							<button class="buttonOk button_class" onClick="location.href='/home.do'">취소</button>
						</div>
					</div>
					</div>
				</div>
			</section>
		</div>
		<input type="hidden" name="m_number" value="${user.m_number}">
		<!--푸터-->
    <%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
<script type="application/javascript">
$(".pass_check").click(function(){
	var m_number = $("input[name='m_number']").val();
	var password = $("#user_password").val();

	$.ajax({
		type : "POST",
		data : {
			"m_number" : m_number,
			"password" : password
			},
		url : "/password_check.do", 
		dataType : "json",
		success : function(data) {
			if(data.mas==0){
				 swal('비밀번호를 확인해주세요', '비밀번호가 일치하지않습니다 확인해주세요.', 'error');
			}else if(data.mas==1){
				var newForm = document.createElement('form');
				
				newForm.name = 'newForm';
				newForm.method = 'post';
				newForm.action = '/user_myPage_update.do';
				var input1 = document.createElement('input');
				var m_number = $("input[name='m_number']").val();
				
				input1.setAttribute("type", "hidden");
				input1.setAttribute("name", "m_number");
				input1.setAttribute("value", m_number);

				newForm.appendChild(input1);

				
				document.body.appendChild(newForm);
				
				newForm.submit();
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