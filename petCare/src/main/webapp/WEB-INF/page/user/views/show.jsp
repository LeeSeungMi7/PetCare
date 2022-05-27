<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link href="/resources/css/user/show.css" rel="stylesheet">
<link href="/resources/css/user/mywrite.css" rel="stylesheet">
<link href="/resources/css/user/myreservation.css" rel="stylesheet">
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
<!-- 카카오 MAP API-KEY -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Page</title>
</head>

<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>

		<!--본문-->
        <div class="getboard">
            <span class="badge badge-pill badge-success" >자 랑 하기</span>
             <a class="button_class" href="javascript:void(0);" onclick="show_write_check();" role="button">나도 자랑하기</a>
            <div class="mainboard">
            <c:forEach var="showPageList" items="${showPageList}" varStatus ="status">
                <div class="card"onclick="location.href='show_board.do?board_num=${showPageList.board_num}'" style="max-height:445px;">
           		<c:choose>
                   <c:when test="${showPageList.b_file_path != null }">
                   <img src="${showPageList.b_file_path}" class="card-img-top show-im" alt="...">
                   	</c:when>
                   <c:otherwise>
                   	  <img class ="show-img" src = "/resources/img/no_image.png">
                   	</c:otherwise>
                 </c:choose>
                    <div class="card-body">
                        <div>
                        <h6 class="look">LOOK ${showPageList.b_hit}</h6>
                        <h5 class="card-title" >${showPageList.b_title} </h5>
                    	</div>
                    </div>
                    <ul class="list-group list-group-flush rowpoint" >
                        <li class="list-group-item writer">WRITER : ${showPageList.b_writer }
                        </li>
                        <li class="list-group-item date">${showPageList.b_date}
                        </li>
                    </ul>
                </div>
                </c:forEach>
       	</div>
				<div class="page1">
					<ul class="pagination1 modal1">

						<c:if test="${showPageVO.pageNum > 1 }">
							<li><a
								href="javascript:fnSubmitForm(0,1);"
								class="arrow1 left1">[처음으로]</a></li>
							
						</c:if>

						<c:forEach var="i" begin="${showPageVO.block_start}" end="${showPageVO.block_end}">
							<li><a href="javascript:fnSubmitForm(${i},${showPageVO.pageConunt});" class="num1">[${i}]</a>
							<li>
						</c:forEach> 
						
						<c:if test="${showPageVO.block_end < showPageVO.total_page}">
							<li><a href="javascript:fnSubmitForm(${showPageVO.block_end+1},${showPageVO.pageConunt+1});" class="arrow1 right1">[다음]</a></li>
						</c:if>


					</ul>
				</div>

				<form action="/show.do" method="post" name="pageNumform">
					<input type="hidden" name="pageNum" id="pageNumId" value="">
					<input type="hidden" name="pageConunt" id="pageConunt" value="">
				</form>
	</div>
</div>
		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
	
<script type="text/javascript">
function show_write_check(){

		$.ajax({	
		 	url: "/check_board.do",
	        type: "GET",
		 	success : function(data) {
		 		if(data.user_ok=="0"){
		 			swal('로그인 진행 요청.', '회원만 가능합니다', 'error');
		 		}else{
		 			window.location.href ="/show_write.do";
		 		}
			},
			error : function(error) {
				alert("error : " + error);
			}
		});
}
function fnSubmitForm(page,pageConunt){
	document.getElementById("pageNumId").value =page;
	document.getElementById("pageConunt").value =pageConunt;
	document.pageNumform.submit();
}	
</script>
</body>

</html>