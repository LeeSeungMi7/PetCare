<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petcare.web.user.vo.Criteria"%>   
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
  <link href="/resources/css/user/myreservation.css" rel="stylesheet">
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Page</title>
</head>

<body>

   	<!--헤더-->
    <%@ include file="/WEB-INF/page/user/views/header.jsp" %>

    <!--본문-->
    <div id="pet-layout" class="background--white">
		<div class="myreservation_body">
		
			<Label style="margin-left:20px; padding-top: 20px;" class="text--20-normal">병원 예약 목록</Label><br>
			<table class="table table-bordered" style="margin-top: 20px;">
				<thead>
					<tr class="table-success">
						<th scope="col">번호</th>
						<th scope="col">병원명</th>
						<th scope="col">반려동물</th>
						<th scope="col">날짜</th>
						<th scope="col">시간</th>
						<th scope="col">예약상태</th>
					</tr>
				</thead>
				<tbody>

				<c:forEach var="reservation" items="${reser}" varStatus ="status">
					<tr>
						<th scope="row">
						<c:out value="${(criteria.total-status.index)-(criteria.total_page -1) * criteria.pageNum}" >
						</c:out>
						</th>
						<td>${reservation.partner_name}</td>
						<td class="petName_box">${reservation.rv_petName}</td>
						<td>${reservation.rv_date}</td>
						<c:if test="${reservation.rv_access == '0'}">
						<td><select class="form-select form-select-sm" id="time">
								<option value="오전 9시" <c:if test="${reservation.rv_time == '오전 9시'}">selected</c:if>>오전 9시</option>
								<option value="오전 10시" <c:if test="${reservation.rv_time == '오전 10시'}">selected</c:if>>오전 10시</option>
								<option value="오전 11시" <c:if test="${reservation.rv_time == '오전 11시'}">selected</c:if>>오전 11시</option>
								<option value="오전 12시" <c:if test="${reservation.rv_time == '오전 12시'}">selected</c:if>>오전 12시</option>
								<option value="오후 1시" <c:if test="${reservation.rv_time == '오후 1시'}">selected</c:if>>오후 1시</option>
								<option value="오후 2시" <c:if test="${reservation.rv_time == '오후 2시'}">selected</c:if>>오후 2시</option>
								<option value="오후 3시" <c:if test="${reservation.rv_time == '오후 3시'}">selected</c:if>>오후 3시</option>
								<option value="오후 4시" <c:if test="${reservation.rv_time == '오후 4시'}">selected</c:if>>오후 4시</option>
								<option value="오후 5시" <c:if test="${reservation.rv_time == '오후 5시'}">selected</c:if>>오후 5시</option>
								<option value="오후 6시" <c:if test="${reservation.rv_time == '오후 6시'}">selected</c:if>>오후 6시</option>					
						</select></td>
						</c:if>
						<c:if test="${reservation.rv_access != '0'}">
						<td><select class="form-select form-select-sm" id="time" disabled>
								<option value="오전 9시" <c:if test="${reservation.rv_time == '오전 9시'}">selected</c:if>>오전 9시</option>
								<option value="오전 10시" <c:if test="${reservation.rv_time == '오전 10시'}">selected</c:if>>오전 10시</option>
								<option value="오전 11시" <c:if test="${reservation.rv_time == '오전 11시'}">selected</c:if>>오전 11시</option>
								<option value="오전 12시" <c:if test="${reservation.rv_time == '오전 12시'}">selected</c:if>>오전 12시</option>
								<option value="오후 1시" <c:if test="${reservation.rv_time == '오후 1시'}">selected</c:if>>오후 1시</option>
								<option value="오후 2시" <c:if test="${reservation.rv_time == '오후 2시'}">selected</c:if>>오후 2시</option>
								<option value="오후 3시" <c:if test="${reservation.rv_time == '오후 3시'}">selected</c:if>>오후 3시</option>
								<option value="오후 4시" <c:if test="${reservation.rv_time == '오후 4시'}">selected</c:if>>오후 4시</option>
								<option value="오후 5시" <c:if test="${reservation.rv_time == '오후 5시'}">selected</c:if>>오후 5시</option>
								<option value="오후 6시" <c:if test="${reservation.rv_time == '오후 6시'}">selected</c:if>>오후 6시</option>					
						</select></td>
						</c:if>
						<td align="center">
							<input type="hidden" name="idx" value="${reservation.reservation_num}"/>
							<c:if test="${reservation.rv_access == '0'}">
							<button type="button" class="btn-success btn-sm checkBtn" >예약 수정</button>
							<button type="button" class="btn-danger btn-sm cancelBtn" >예약 취소</button>
							</c:if>
							<c:if test="${reservation.rv_access == '1'}">
							<span class="reservation_n" > 예약 불가</span>
							<td align="center">
							<button type="button" class="btn-danger btn-sm" style="width:160px" onclick="deleteRowFunction(this)">삭 제</button>
							</td>
							</c:if>
							<c:if test="${reservation.rv_access == '2'}">
							<span class="reservation_o" > 예약 확정</span>

							</c:if>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			
				<div class="page1">
					<ul class="pagination1 modal1">


						<c:if test="${criteria.pageNum > 1 }">
							<li><a
								href="javascript:fnSubmitForm(${criteria.block_start-1});"
								class="arrow1 left1">[처음]</a></li>
						</c:if>

						<c:forEach var="i" begin="${criteria.block_start}"
							end="${criteria.block_end}">
							<li><a href="javascript:fnSubmitForm(${i});" class="num1">[${i}]</a>
							<li>
						</c:forEach>

						<c:if test="${!(criteria.block_num >= criteria.total_block)}">
							<li><a href="javascript:fnSubmitForm(${criteria.block_end+1});" class="arrow1 right1">[마지막]</a></li>
						</c:if>


					</ul>
				</div>

				<form action="/user_myreservation.do" method="post" name="pageNumform">
					<input type="hidden" name="pageNum" id="pageNumId" value="">
					<input type="hidden" name="m_number" value="${user.m_number}">
				</form>
		</div>
	</div>
		<!--푸터-->
    <%@ include file="/WEB-INF/page/user/views/footer.jsp" %>
<script type="text/javascript" >
$(".checkBtn").click(function(){ 
	var index =$(this).parent().find("input[name='idx']").val();
	var time = $(this).parent().parent().find("select").val();
		
	$.ajax({
			type : "GET",
			data : {
				"index" : index,
				"time" : time
				},
			url : "/reservation_modify.do",
			dataType : "json",
			success : function(data) {
				if(data==1){
					 swal({
							title: "예약 변경완료.",
							text:" 시간이 변경되었습니다. ",
							closeOnClickOutside: false
						}, function(){
							location.reload();
					});
				}
			},
			error : function(error) {
				alert("error : " + error);
			}
		});	
});

$(".cancelBtn").click(function(){
	var index =$(this).parent().find("input[name='idx']").val();
	$.ajax({
		type : "GET",
		data : {
			"index" : index
			},
		url : "/reservation_delete.do",
		dataType : "json",
		success : function(data) {
			if(data==1){
				 swal({
						title: "취소완료.",
						text:" 예약이 취소되었습니다. ",
						closeOnClickOutside: false
					}, function(){
						location.reload();
				});
			}
		},
		error : function(error) {
			alert("error : " + error);
		}
	});
	
})
function fnSubmitForm(page){
	document.getElementById("pageNumId").value =page;
	document.pageNumform.submit();
}	

</script>   

</body>
</html>