<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.petcare.web.user.vo.ReservationVO" %>
<%@ page import="com.petcare.web.user.vo.Criteria"%>
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> 
    <!-- 제이쿼리 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!--alert-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
    <link rel="stylesheet" href="/resources/css/user/partner_mypage_reservation.css"> 
    <!-- 카카오 주소 -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
    <!-- 카카오 MAP API-KEY -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script> 
    
    <!-- 데이터피커 -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> 
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link href="/resources/css/user/hos_reservation.css" rel="stylesheet">
	
</head>

<body>
    <div id="pet-layout" class="background--white">
        <!--헤더-->
        <%@ include file="/WEB-INF/page/user/views/header.jsp" %>

        <!--본문-->
        <div class="table_box">
        <Label style="margin-left:20px; padding-top: 20px;" class="text--20-normal">예약 신청 목록</Label>
        <table class="table table-bordered" style="margin-top: 20px; margin-bottom: 20px;">
            <thead>
                <tr class="table-success">
                    <th scope="col">번호</th>
                    <th scope="col">날짜</th>
                    <th scope="col">시간</th>
                    <th scope="col" colspan="4">예약자정보</th>
                </tr>
            </thead>
            <tbody>
            
            <c:forEach var ="reservation" items="${reservationInfo}" varStatus="status">
                <tr>
                    <th scope="row"><c:out value="${criteria.pageNum + (status.count)}"></c:out></th>
                    <td>${reservation.rv_date}</td>
                    <td>${reservation.rv_time}</td>
                    <td>${reservation.reservation_name}</td>
                    <td>${reservation.reservation_tel}</td>
                    <td>${reservation.rv_petName}</td>
                    <td>
                    	<input type="hidden" value="${reservation.reservation_num}" name="reservation_num">
                        <button type="button" class="btn-success btn-sm reservation_ok">승인</button>
                        <button type="button" class="btn-danger btn-sm reservation_no">거절</button>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="page1">
        <ul class="pagination1 modal1">
        	
                 
            <c:if test="${criteria.pageNum > 1 }">
            	<li><a href="javascript:fnSubmitForm(${criteria.block_start-1});" class="arrow1 left1">[처음]</a></li>
            </c:if>
            
            <c:forEach var="i" begin="${criteria.block_start}" end="${criteria.block_end}">
            	<li><a href="javascript:fnSubmitForm(${i});" class="num1">[${i}]</a><li>
            </c:forEach>
            
            <c:if test="${!(criteria.block_num >= criteria.total_block)}">
            	<li><a href="javascript:fnSubmitForm(${criteria.block_end+1});" class="arrow1 right1" >[마지막]</a></li>
            </c:if>
            
           
        </ul>
        </div>
        
        <form action="/hos_reservation.do" method="post" name="pageNumform">
        	<input type="hidden" name="pageNum" id="pageNumId" value="">
        	<input type="hidden" name="m_number" value="${user.m_number}">
        </form>
        
        <hr style="margin-bottom: 20px;">
        <Label style="margin-left:20px; padding-top: 20px;" class="text--20-normal">확정자 명단</Label><br>
        
        <label for="formGroupExampleInput2" class="text--16-normal">날짜 선택 : </label>
        <input type="hidden" style="width:9rem; height:25px;" value="${user.m_number}" id="m_number">
        <input type="text" id="datepicker" >

        <button type="button" class="btn" id="excelDownload" onclick="excel_function()">Excel</button>
	        
	    <form action="/excel_down.do" method="GET" name="excel">
        	<input type="hidden" name=date id="date_picker" value="">
        	<input type="hidden" name="number" value="${user.m_number}">
        </form>
	        
        <table class="table table-bordered" id="resevtable">
            <thead>
                <tr class="table-success">
                    <th scope="col">번호</th>
                    <th scope="col">날짜</th>
                    <th scope="col">시간</th>
                    <th scope="col">보호자</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">반려동물</th>
                </tr>
            </thead>
            <tbody id="table_List">
    
            </tbody>
        </table>
        
        </div>
    <!--푸터-->
		<div class="pet-footer">
			<div>상호명 : 주식회사 PETCARE</div>
			<div class="text--12-lighter">
				주식회사 PETCARE은 의료정보의 중개서비스 또는 의료정보중개시스템의 제공자로서, <br>의료정보의 당사자가
				아니며, 의료정보와 관련된 의무와 책임은 각 의료기관에게 있습니다.
			</div>
			<div class="text--12-lighter">© 2022 PetCare All right reserved
			</div>
		</div>

	</div>
  
<script type="application/javascript" src="/resources/js/user/hos_reservation.js"></script>
<script type="text/javascript">
$(".reservation_ok").click(function(){
	 var pet_num = $(this).parent().find("input[name='reservation_num']").val();
	 var tr = $(this).parent().parent();
	 var phoneNumber = tr.children().eq(4).text();
	 var petName = tr.children().eq(5).text();
	 
	 $.ajax({
		type:"POST",
		data : {
			"number" : phoneNumber,
			"pet_num" : pet_num,
			"petName" : petName
		},
		url : "/sms_reservation_ok.do",
		dataType : "json",
		success : function(data) {
			if(data==1){
				swal('예약 승인','보호자 연락처로 문자전송을 완료하였습니다.', 'success')
			}
		},
		error : function(error) {
			alert("error : " + error);
		}
				
		}); 
	 $(this).closest("tr").remove();
	    	
 })

$(".reservation_no").click(function(){
	 var pet_num = $(this).parent().find("input[name='reservation_num']").val();
	 var tr = $(this).parent().parent();
	 var phoneNumber = tr.children().eq(4).text();
	 var petName = tr.children().eq(5).text();
	 $.ajax({
			type:"POST",
			data : {
				"number" : phoneNumber,
				"pet_num" : pet_num,
				"petName" : petName
			},
			url : "/sms_reservation_no.do",
			dataType : "json",
			success : function(data) {
				if(data==1){
					swal('예약 거절','보호자 연락처로 문자전송을 완료하였습니다.', 'info')
				}
			},
			error : function(error) {
				alert("error : " + error);
			}
					
			}); 
		 $(this).closest("tr").remove();
	 
})

$("#datepicker").on("change", function(){
	var selected = $(this).val();
	var number = $("#m_number").val();
	$("#table_List>tr").remove(); //기존 테이블 지우기
		$.ajax({
			type:"GET",
			data : {
				"date" : selected,
				"number" : number
			},
			url : "/dateSearch.do",
			/* dataType : "text", */
			success : function(data) {
				var List = data
				var index=1;
				var str='<tr>';
				$.each(List , function(i){
					str+='<th scope="row">'+index+'</th>'+
				            '<td>'+List[i].rv_date+'</td>'+
				            '<td>'+List[i].rv_time+'</td>'+
				            '<td>'+List[i].reservation_name+'</td>'+
				            '<td>'+List[i].reservation_tel+'</td>'+
				            '<td>'+List[i].rv_petName+'</td>';
				    str+='</tr>';
				    index++;
				})
				$("#table_List").append(str);
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

function excel_function(){
	
	document.getElementById("date_picker").value = $("#datepicker").val() ;
	document.excel.submit();
	
}
</script>
</body>

</html>