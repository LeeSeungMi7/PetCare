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

</head>

<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
		<!--본문-->
		<%-- <%@ include file="/WEB-INF/page/user/views/show_rewrite_body.jsp" %> --%>
   <section>
        <div class="eidtor">
            <!--제목-->
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">제목</label>
                <input type="text" class="datebox form-control" maxlength="20" placeholder="" style="max-width: 300px;">
            </div>
            <!--날짜-->
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">날짜</label>
                <input type="text" class="datebox form-control" placeholder="" style="max-width: 300px;" disabled>
            </div>
            <!--내용-->
            <div>
                <label>내용</label>
                <textarea name="ir1" id="ir1" rows="10" cols="100" style="max-width: 650px;"></textarea>
            </div>

            <!--버튼-->
            <div>
                <a class="btn btn-success" href="show.do" role="button"  onclick="Ok();">수정완료</a>
                <a class="btn btn-danger" href="show.do" role="button" onclick="Cancel()">취소</a>
            </div>
        </div>

    </section>

    <script type="text/javascript" src="/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <script src="/resources/js/user/write.js"></script>
    <script src="/resources/js/user/qna_rewrite.js"></script>

		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>

</body>
</html>

