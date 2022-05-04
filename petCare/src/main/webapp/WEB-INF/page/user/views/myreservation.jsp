<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petcare.web.user.vo.ReservationVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="/resources/css/user/myreservation.css" rel="stylesheet">
    
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
  <script type="text/javascript" src="/resources/js/user/myreservation.js"></script>   
</head>

<body>
<div id="pet-layout" class="background--white">
   	<!--헤더-->
    <%@ include file="/WEB-INF/page/user/views/header.jsp" %>

    <!--본문-->
		<div class="myreservation_body">

			<h2 style="margin-left: 20px; padding-top: 20px;">내 예약 목록</h2>
			<table class="table table-bordered" style="margin-top: 20px;">
				<thead>
					<tr class="table-success">
						<th scope="col">번호</th>
						<th scope="col">병원명</th>
						<th scope="col">반려동물 이름</th>
						<th scope="col">날짜</th>
						<th scope="col">시간</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
				private int rv_number;
	private int rv_partner_number;
	private String rv_date;
	private String rv_time;
	private String rv_access;
	private String rv_petName;
				<c:forEach var="reservationList" items="reservationList">
					<tr>
						<th scope="row">1</th>
						<td>멍멍이 동물병원</td>
						<td>구름이</td>
						<td>22-04-25</td>
						<td><select class="form-select form-select-sm">
								<option value="오전 9시">오전 9시</option>
								<option value="오전 10시">오전 10시</option>
								<option value="오전 11시">오전 11시</option>
								<option value="오후 1시">오후 1시</option>
								<option value="오후 2시">오후 2시</option>
								<option value="오후 3시">오후 3시</option>
								<option value="오후 4시">오후 4시</option>
								<option value="오후 5시">오후 5시</option>
								<option value="오후 6시">오후 6시</option>
						</select></td>
						<td>
							<button type="button" class="btn-success btn-sm"
								onclick="deleteRowFunction(this)">예약 수정</button>
							<button type="button" class="btn-danger btn-sm"
								onclick="deleteRowFunction(this)">예약 취소</button>
						</td>
					</tr>
					
				</c:forEach>
				</tbody>
			</table>
		</div>
		<!--푸터-->
    <%@ include file="/WEB-INF/page/user/views/footer.jsp" %>

</div>
</body>
</html>