<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <link href="../../../../resources/css/user/index.css" rel="stylesheet">
    <link href="../../../../resources/css/user/color.css" rel="stylesheet">
    <link href="../../../../resources/css/user/text.css" rel="stylesheet">
    <link href="../../../../resources/css/user/header.css" rel="stylesheet">
    <link href="../../../../resources/css/user/footer.css" rel="stylesheet">
    <link href="../../../../resources/css/user/button.css" rel="stylesheet">
    <link href="../../../../resources/css/user/loginForm.css" rel="stylesheet">
    <link href="../../../../resources/css/user/password.css" rel="stylesheet">
    
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

</head>

<body>
<div id="pet-layout" class="background--white">
    <!--헤더-->
    <%@ include file="/WEB-INF/page/user/views/header.jsp"%>

    <!--본문-->
		<div class="password-body">
			<div class="password-body-form">
				<div class="card shadow-lg border-0 rounded-lg mt-5">
					<div class="card-header">
						<h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3>
					</div>
					<div class="card-body">
						<div class="small mb-3 text-muted">이메일 입력 시 이메일로 비밀번호가
							발송됩니다.</div>
						<form>
							<div class="form-floating mb-3">
								<input class="form-control" id="inputEmail" type="email"
									placeholder="name@example.com" /> <label for="inputEmail">이메일
									입력</label>
							</div>
							<div
								class="d-flex align-items-center justify-content-between mt-4 mb-0">
								<a class="btn btn-primary" href="login.html">비밀번호 발송</a>
							</div>
						</form>
					</div>
					<div class="card-footer text-center py-3">
						<div class="small">
							<a href="/signinForm.do">회원가입으로 이동</a>
						</div>
					</div>
				</div>
			</div>
		</div>

	<!--푸터-->
    <%@ include file="/WEB-INF/page/user/views/footer.jsp"%>

</div>
</body>
</html>
