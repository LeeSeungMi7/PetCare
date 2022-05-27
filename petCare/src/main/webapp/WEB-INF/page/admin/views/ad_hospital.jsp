<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

<head>

<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<link href="/resources/css/admin/ad_hospital.css?after" rel="stylesheet" />
<link href="/resources/css/admin/styles.css" rel="stylesheet" />
<link href="/resources/css/admin/morris.css" rel="stylesheet" />
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Admin</title>

</head>

<body class="sb-nav-fixed">
	<!--헤더 영역-->
	<%@ include file="/WEB-INF/page/admin/views/ad_header.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
			<main> <!--본문 영역-->
			<div class="container-fluid px-4">
				<h1 class="mt-4">병원 관리</h1>
				<hr>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 신청 병원(대기중)
					</div>
					<div class="card-body">
						<table id="datatablesSimple">
							<thead>
								<tr>
									<th>번호</th>
									<th>병원이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>사업자등록증</th>
									<th>결재</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>병원이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>사업자등록증</th>
									<th>결재</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="list" items="${UnAccHosList}" varStatus="status">
									<tr>
										<td><c:out value="${status.count}" /></td>
										<td><c:out value="${list.m_name}" /><input type="hidden" name="m_name" value="${list.m_name}"></td>
										<td><c:out value="${list.m_tel}" /></td>
										<td><c:out value="${list.m_id}" /></td>
										<td>
											<button type="button" class="btn1 open_btn" data-bs-toggle="modal"
												data-bs-target="#exampleModal${status.index}">open</button>
											<div class="modal fade" id="exampleModal${status.index}"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">사업자등록증
																상세보기</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<img src="${list.p_file_path}" class="modalimg">
														</div>
													</div>
												</div>
											</div>
										</td>
										<td>
											<div class="btngroup">
												<button class="btn1 save" type="button">승인</button>
												<button class="btn1 cancel" type="button">기각</button>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</form>
					</div>
				</div>
				<hr>
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table me-1"></i> 전체 병원
					</div>
					<div class="card-body">
						<table id="datatablesSample">
							<thead>
								<tr>
									<th>번호</th>
									<th>병원이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>사업자등록증</th>
								</tr>
							</thead>
							<tfoot>
								<tr>
									<th>번호</th>
									<th>병원이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>사업자등록증</th>
								</tr>
							</tfoot>
							<tbody>
								<c:forEach var="list" items="${AccHosList}" varStatus="status">
									<tr>
										<td><c:out value="${status.count}" /></td>
										<td><c:out value="${list.m_name}" /></td>
										<td><c:out value="${list.m_tel}" /></td>
										<td><c:out value="${list.m_id}" /></td>
										<td>
											<button type="button" class="btn1 open_btn" data-bs-toggle="modal"
												data-bs-target="#exampleModal${status.index}">open</button>
											<div class="modal fade" id="exampleModal${status.index}"
												tabindex="-1" aria-labelledby="exampleModalLabel"
												aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalLabel">사업자등록증
																상세보기</h5>
															<button type="button" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
														</div>
														<div class="modal-body">
															<img src="${list.p_file_path}" class="modalimg">
														</div>
													</div>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			</main>
			<!--푸터-->
			<%@ include file="/WEB-INF/page/admin/views/ad_footer.jsp"%>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="../assets/demo/chart-area-demo.js"></script> <script
        src="../assets/demo/chart-bar-demo.js"></script> -->
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/resources/js/admin/morris.js"></script>
	<script src="/resources/js/admin/raphael.min.js"></script>
	<script src="/resources/js/admin/ad_hospital.js"></script>
	<script src="/resources/js/admin/ad_common.js"></script>
	<script src="/resources/js/admin/scripts.js"></script>
	<script src="/resources/js/admin/datatables-simple-demo.js"></script>
	<script>
	$(document).ready(function() {
		$('.swal-button').click(function() {
			location.reload();
		});
		$(".save").click(function(){
			var checkBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent().parent();
			var td = tr.children();
			var hosid = td.eq(1).text();
			console.log("클릭한 Row의 이름 데이터 : " + hosid);
			$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + hosid);
			$.ajax({
		         type : "post",
		         data : {
		            "m_name" : hosid
		         },
		         url : "/update_hospital.mdo",
		         dataType : "json",
		         success : function(data) {
		        	 if(data=="1"){
		        		 location.reload();	 
		        	 }
		         },
		         error : function(error) {
		         }
		      });
		});
		$(".cancel").click(function(){
			var checkBtn = $(this);
			
			// checkBtn.parent() : checkBtn의 부모는 <td>이다.
			// checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
			var tr = checkBtn.parent().parent().parent();
			var td = tr.children();
			var hosid = td.eq(3).text();
			console.log("클릭한 Row의 이름 데이터 : " + hosid);
			$("#ex2_Result1").html(" * 클릭한 Row의 모든 데이터 = " + hosid);
			$.ajax({
		         type : "post",
		         data : {
		            "m_id" : hosid
		         },
		         url : "/delete_hospital.mdo",
		         dataType : "json",
		         success : function(data) {
		        	 if(data=="1"){
		        		 location.reload();	 
		        	 }
		         },
		         error : function(error) {
		         }
		      });
		});
	});
	</script>
</body>
</html>