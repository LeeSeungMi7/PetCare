<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="/resources/css/user/datepicker.css" rel="stylesheet"
	type="text/css" media="all">
<!-- Air datepicker css -->
<script src="/resources/js/user/datepicker.js"></script>
<!-- Air datepicker js -->
<script src="/resources/js/user/datepicker.ko.js"></script>
<!-- 달력 한글 추가를 위해 커스텀 -->

<!-- 부트스트랩 CDN 로드 : 항상 최신 버전 사용 : maxcdn -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript"
        src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <link
        href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
        rel="stylesheet"/> -->

<link href="/resources/css/admin/styles.css" rel="stylesheet" />
<link href="/resources/css/admin/morris.css" rel="stylesheet" />
<link href="/resources/css/admin/ad_charts.css" rel="stylesheet" />

</head>
<body class="sb-nav-fixed">
	<!--헤더 영역-->
	<%@ include file="/WEB-INF/page/admin/views/ad_header.jsp"%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_content">
			<main>
				<!--본문영역-->
				<div class="container-fluid px-4">
					<h1 class="mt-4">차트</h1>
					<div class="card mb-4">
						<div class="card-header" style="white-space: nowrap">
							<i class="fas fa-chart-area me-1"></i> 제휴 병원 등록 <br> <br>
							<div class="dateselect">
								날짜 선택 : <input type="text" id="datepicker1" class="datepick"
									readonly>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; <input
									type="text" id="datepicker2" class="datepick" readonly>
								<button type="button" id="drawlinechart" class="btn btn-success btn-sm linebtn"
									style="margin-bottom: 5px;">선 택</button>
							</div>
						</div>
						<div class="card-body">
							<canvas id="myAreaChart" width="100%" height="30"></canvas>
						</div>
						<div class="card-footer small text-muted" onload="showClock1()">
							<p id="divClock1" style="color: black; height: 8px;"></p>
						</div>
					</div>
					<div class="card mb-4">
						<div class="card-header" style="white-space: nowrap">
							<i class="fas fa-chart-bar me-1">></i> 게시글 활성도 <br> <br>
							<div>
								날짜 선택 : <input type="text" id="datepicker3" class="datepick"
									readonly>&nbsp;&nbsp;&nbsp;~&nbsp;&nbsp; <input
									type="text" id="datepicker4" class="datepick" readonly>
								<button type="button" id="drawbarchart" class="btn btn-success btn-sm barbtn"
									style="margin-bottom: 5px;">선 택</button>
							</div>
						</div>
						<div class="card-body">
							<canvas id="bar-example" width="100%" height="30"></canvas>
						</div>
						<div class="card-footer small text-muted" onload="showClock2()">
							<p id="divClock2" style="color: black; height: 8px;"></p>
						</div>
					</div>
				</div>
			</main>
			<!--푸터-->
			<%@ include file="/WEB-INF/page/admin/views/ad_footer.jsp"%>
		</div>
	</div>

	<script src="/resources/js/admin/ad_common.js"></script>
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="/resources/js/admin/scripts.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>
	<script src="/resources/js/admin/datatables-simple-demo.js"></script>
	<script src="/resources/js/admin/morris.js"></script>
	<script src="/resources/js/admin/raphael.min.js"></script>
	<script src="/resources/js/admin/ad_charts.js"></script>
	<script src="/resources/js/user/ur_reservation.js"></script>
	<script>
		var updatedate1;
		var updatedate2;
		var updatedate3;
		var updatedate4;
		var mylinechart;
		var mybarchart;
		$(document).ready(function(){
			getGraph();
			getBarGraph();
		});
		function getGraph(){
			let timeList = [];
			let posList = [];
			
			$.ajax({
				url:"/ad_chart.mdo",
				type:"get",
				data:{date:"{chartone.date}", pos_type:"승인 병원"},
				dataType:"json",
				success:function(data){
					for (let i = 0; i<data.length; i++){
						timeList.push(data[i].date);
						posList.push(data[i].cnt);
					}
					mylinechart = new Chart(document.getElementById("myAreaChart"),{
						type:'line',
						data:{
							labels:timeList,
							datasets:[{
								data:posList,
								label:"승인 병원",
								borderColor:"#3e95cd",
								fill:false
							}]
						},
						options: {
							scales: {
					            y: {
					                beginAtZero: true,
					                stepSize : 1
					            }
					        }
					    }
					});
				},
				error:function(){
					alert("실패");
				}
			})
		}
		function getBarGraph(){
			let timeList = [];
			let pos1List = [];
			let pos2List = [];
			
			$.ajax({
				url:"/ad_barchart.mdo",
				type:"get",
				data:{date2:"{barcomm.date2}", pos_type:"갯수"},
				dataType:"json",
				success:function(data){
					for (let i = 0; i<data.barcomm.length; i++){
						pos2List.push(data.barcomm[i].commentcnt);
					}
					for (let i = 0; i<data.barfaq.length; i++){
						timeList.push(data.barfaq[i].date2);
						pos1List.push(data.barfaq[i].faqcnt);
					}
					mybarchart = new Chart(document.getElementById("bar-example"),{
						type:'bar',
						data:{
							labels:timeList,
							datasets:[{
								data:pos1List,
								label:"질문",
								borderColor:"#00FF40",
								backgroundColor:"#2EFE9A",
								borderWidth:3
							},{
								data:pos2List,
								label:"답변",
								borderColor:"#58FA82",
								backgroundColor:"#81F7D8",
								borderWidth:3
							}
							]
						},
						option:{
							responsive: false,
							scales: {
					            y: {
					                beginAtZero: true,
					                stepSize : 1
					            }
					        },
							x: {
					            title: {
					                display: true,
					                text: '글 수 and 답변 수'
					            }
					        },
					        'y-left': {
					            type: 'linear',
					            position: 'left',
					            title: {
					                display: true,
					                text: '질문'
					            },
					            grid: {
					                display: false
					            }
					        },
					        'y-right': {
					            type: 'linear',
					            position: 'right',
					            title: {
					                display: true,
					                text: '답변'
					            },
					            grid: {
					                display: false
					            }
					        }
						}
					});
				},
				error:function(){
					alert("실패");
				}
			})
		}
		$("#drawlinechart").click(function(){
			mylinechart.destroy();
			updatedate1 = $("#datepicker1").val();
			updatedate2 = $("#datepicker2").val();
			updatelinegraph();
		});
		function updatelinegraph(){
			let timeList = [];
			let posList = [];
			$.ajax({
				url:"/updatelinechart.mdo",
				type:"get",
				data:{date:"{chartone.date}", pos_type:"승인 병원", "updatedate1":updatedate1, "updatedate2":updatedate2},
				async:false,
				dataType:"json",
				success:function(data){
					for (let i = 0; i<data.length; i++){
						timeList.push(data[i].date);
						posList.push(data[i].cnt);
					}
					mylinechart = new Chart(document.getElementById("myAreaChart"),{
						type:'line',
						data:{
							labels:timeList,
							datasets:[{
								data:posList,
								label:"승인 병원",
								borderColor:"#3e95cd",
								fill:false
							}]
						},
						option:{
							scales: {
					            y: {
					                beginAtZero: true,
					                stepSize : 1
					            }
					        }
						}
					});
				},
				error:function(){
					alert("실패");
				}
			})
		}
		$("#drawbarchart").click(function(){
			mybarchart.destroy();
			updatedate3 = $("#datepicker3").val();
			updatedate4 = $("#datepicker4").val();
			updatebargraph();
		});
		function updatebargraph(){
			let timeList = [];
			let pos1List = [];
			let pos2List = [];
			
			$.ajax({
				url:"/updatebarchart.mdo",
				type:"get",
				data:{date2:"{barcomm.date2}", pos_type:"갯수","updatedate3":updatedate3, "updatedate4":updatedate4},
				dataType:"json",
				success:function(data){
					for (let i = 0; i<data.barcomm.length; i++){
						pos2List.push(data.barcomm[i].commentcnt);
					}
					for (let i = 0; i<data.barfaq.length; i++){
						timeList.push(data.barfaq[i].date2);
						pos1List.push(data.barfaq[i].faqcnt);
					}
					mybarchart = new Chart(document.getElementById("bar-example"),{
						type:'bar',
						data:{
							labels:timeList,
							datasets:[{
								data:pos1List,
								label:"질문",
								borderColor:"#00FF40",
								backgroundColor:"#2EFE9A",
								borderWidth:3
							},{
								data:pos2List,
								label:"답변",
								borderColor:"#58FA82",
								backgroundColor:"#81F7D8",
								borderWidth:3
							}
							]
						},
						option:{
							responsive: false,
							scales: {
					            y: {
					                beginAtZero: true,
					                stepSize : 1
					            }
					        },
							x: {
					            title: {
					                display: true,
					                text: '글 수 and 답변 수'
					            }
					        },
					        'y-left': {
					            type: 'linear',
					            position: 'left',
					            title: {
					                display: true,
					                text: '질문'
					            },
					            grid: {
					                display: false
					            }
					        },
					        'y-right': {
					            type: 'linear',
					            position: 'right',
					            title: {
					                display: true,
					                text: '답변'
					            },
					            grid: {
					                display: false
					            }
					        }
						}
					});
				},
				error:function(){
					alert("실패");
				}
			})
		}
		function showClock() {
			var today = new Date();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var hours = ('0' + today.getHours()).slice(-2);
			var minutes = ('0' + today.getMinutes()).slice(-2);
			var seconds = ('0' + today.getSeconds()).slice(-2);

			var timeString = '최종 업데이트 : ' + month + '월 ' + day + '일 ' + hours
					+ ':' + minutes + ':' + seconds;
			var divClock1 = document.getElementById('divClock1');
			divClock1.innerText = timeString;
			var divClock2 = document.getElementById('divClock2');
			divClock2.innerText = timeString;
		}
		showClock();
	</script>
</body>
</html>