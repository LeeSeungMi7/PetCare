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
<link href="/resources/css/user/comm_board.css" rel="stylesheet">
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
		<%-- <%@ include file="/WEB-INF/page/user/views/qna_board_body.jsp" %> --%>

        <div class="board shadow p-3 mb-5 bg-body rounded">
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">제목</label>
                <input
                    type="text"
                    class="titlebox form-control"
                    id="formGroupExampleInput"
                    placeholder=""disabled>
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">작성자</label>
                <input
                    type="text"
                    class="namebox form-control"
                    id="formGroupExampleInput2"
                    placeholder=""disabled>
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput2" class="form-label">날짜</label>
                <input
                    type="text"
                    class="datebox form-control"
                    id="formGroupExampleInput2"
                    placeholder=""disabled>
            </div>
            <div class="mb-3">
                <label for="formGroupExampleInput" class="form-label">내용</label>
                <div class="form-floating">
                    <textarea class="contentbox form-control" placeholder="" id="floatingTextarea2"disabled></textarea>
                </div>
            </div>
            <hr>
            <div class="comment">
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col" colspan="2">총 댓글 수 : 3개</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>홍길동</td>
                            <td class="sb-sidenav-collapse-arrow" style="width: 450px;">
                                가나다라마바사아자차카파타하가나다라마바사아자차카파타하가나다라마바사아자차카파타하
                            </td>
                            <td>22-04-20 17:58</td>
                            <td>
                                <button type="button" class="btn-close" aria-label="Close"></button>
                            </td>
                        </tr>
            
                        <tr>
                            <th scope="row">2</th>
                            <td>손오공</td>
                            <td class="sb-sidenav-collapse-arrow" style="width: 450px;">
                                댓글테스트2
                            </td>
                            <td>22-04-20 18:00</td>
                            <td>
                                <button type="button" class="btn-close" aria-label="Close"></button>
                            </td>
                        </tr>
            
                        <tr>
                            <th scope="row">3</th>
                            <td>사오정</td>
                            <td class="sb-sidenav-collapse-arrow" style="width: 450px;">
                                댓글테스트3
                            </td>
                            <td>22-04-20 18:03</td>
                            <td>
                                <button type="button" class="btn-close" aria-label="Close"></button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <hr>
            <div class="form-floating">
                <textarea
                    class="commentbox form-control"
                    id="floatingTextarea2"></textarea>
                <label for="floatingTextarea2">댓글 작성</label>
            </div>
            <a class="btn btn-success" href="#" role="button">댓글 등록</a>
            <hr>
            <a class="btn btn-secondary" href="qna.do" role="button">목록으로</a>
            <a class="btn btn-secondary" href="qna_rewrite.do" role="button" >수정</a>
            <a class="btn btn-danger" href="#" role="button">삭제</a>
            <a class="btn btn-success" href="qna_write.do" role="button">글 작성</a>
        </div>

		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>

</body>
</html>

