<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.petcare.web.user.vo.MemberVO" %>
<%@ page import="com.petcare.web.user.vo.MyPetVO" %>
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
<link href="/resources/css/user/user_joinUser.css" rel="stylesheet">


<!--부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="/resources/css/user/user_joinUser_myPet.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
<!-- 제이쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!--alert-->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<!-- 카카오 주소 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
<title>PetCare Page</title>
</head>
<body>
	<div id="pet-layout" class="background--white">
		<!--헤더-->
		<%@ include file="/WEB-INF/page/user/views/header.jsp"%>

		<!--본문-->
		<form onsubmit="return modify_submit();" method="post" action="/user_mofify.do">
			<div class="pet-body pet-home">
				<!-- 홈 최상단 슬라이더 -->
				<section name="f">
					<div class="join-user" style="align-items: center">
						<!--사용자이름-->
						<div class="join-user__items">
							<label>이름</label> 
							<input type="text" value="${member.m_name}" readonly="readonly" name="m_name">
							<span class="error_next_box" id="error_email" aria-live="assertive">
							이름은 수정 불가능 합니다.</span>
						</div>

						<!--이메일-->
						<div class="join-user__items">
							<label>이메일</label>		
							<input type="email" oninput="onInputInvalid('email')" name="m_id" value="${member.m_id}" readonly="readonly" />
							<span class="error_next_box" id="error_email" aria-live="assertive">이메일은 수정 불가능 합니다.</span>	
						</div>
						<!--비밀번호-->
						<div class="join-user__items">
							<label>비밀번호</label> 
							<input id="user_password" type="password" maxlength="15" placeholder="비밀번호를 입력하세요" oninput="onInputInvalid('password')" required> 
							<input id="user_check_password" type="password" maxlength="15" placeholder="비밀번호 확인" style="margin-top: 10px;"oninput="onInputInvalid('passwordCheck')" name="m_pw"> 
							<span class="error_next_box" id="error_password" aria-live="assertive"></span>
						</div>
						<!--연락처-->
						<div class="join-user__items">
							<label>연락처</label>
							<div class="join-user__items--row"
								style="justify-content: space-between">
								<select id="user_phone_number_pre" style="min-width: 90px;"name="m_tel1">
									
									<option value="010" <c:if test="${member.m_tel1 == '010'}">selected</c:if>>010</option>
									<option value="011" <c:if test="${member.m_tel1 == '011'}">selected</c:if>>011</option>
									<option value="016" <c:if test="${member.m_tel1 == '016'}">selected</c:if>>016</option>
								</select> - 
								<input id="user_phone_number_in" style="max-width: 90px" maxlength="4" oninput="onInputInvalid('phoneNumber')" name="m_tel2" value="${member.m_tel2}"> 
								- 
								<input id="user_phone_number_post" style="max-width: 90px" maxlength="4" oninput="onInputInvalid('phoneNumber')" name="m_tel3" value="${member.m_tel3}">
							</div>
							<span class="error_next_box" id="error_phone_number" aria-live="assertive"></span>
						</div>
						<!--주소-->
						<div class="join-user__items">
							<label>주소</label> 
							<input id="user_post" type="text" placeholder="우편번호" name="m_zipcode" readonly onclick="findAddr()" value="${member.m_zipcode}"> 
							<input id="user_addr" type="text" placeholder="주소" name="m_address" readonly style="margin-top: 10px;" value="${member.m_address}"> <br> 
							<input id="user_addr_detail" type="text" placeholder="상세주소를 입력하세요." name="m_address_detail" style="margin-top: -12px;" value="${member.m_address_detail}">
							<span class="error_next_box" id="error_address" aria-live="assertive"></span>
						</div>

						<!--내반려동물-->
						<div class="join-user__items">

							<ul class="list-group" id="myPetBox">
								<li class="list-group-item active" aria-current="true">반려동물 등록
									<button type="button" class="addList" data-bs-toggle="modal" data-bs-target="#exampleModal">추가</button>
								</li>
								
								<c:forEach var ="mypet" items="${mypet}" varStatus="status"> 
									<li class="list-group-item">
									<div class="petbox">
		    						<div class="mypet_box1">	
			    					<a href="javascript:myPet_modify();" id="petdetail">
			    					이름 : ${mypet.mp_petName} 
			    					<c:if test="${mypet.mp_petType == '강아지'}">
			    					🐶
			    					</c:if>
			    					<c:if test="${mypet.mp_petType == '고양이'}">
			    					😺
			    					</c:if>
			    					<c:if test="${mypet.mp_petType != '고양이' && mypet.mp_petType != '강아지'}">
			    					❔
			    					</c:if>
			    					</a>
				    					<input type="hidden" name="petList[${status.index}].myPet_num" id="petNum" value="${mypet.myPet_num}">
										<input type="hidden" name="petList[${status.index}].mp_petName" value="${mypet.mp_petName}">
						        		<input type="hidden" name="petList[${status.index}].mp_petAge" value="${mypet.mp_petAge}">
						        		<input type="hidden" name="petList[${status.index}].mp_petGender" value="${mypet.mp_petGender}">
						        		<input type="hidden" name="petList[${status.index}].mp_sugery" value="${mypet.mp_sugery}">
						        		<input type="hidden" name="petList[${status.index}].mp_petType" value="${mypet.mp_petType}">
				    				<button type="button" class="delete_myPetBtn">
				    				<img src="/resources/img/minus.png">
				    				</button>
			        				</div>
									<div class="mypet_box2">
		            					<div>나이 : ${mypet.mp_petAge}</div>
		            					<div>성별 : ${mypet.mp_petGender}</div>
		            					<div>중성화 : 
		            					<c:if test="${mypet.mp_sugery == '0'}">
		            					&nbsp;X
		            					</c:if>
		            					<c:if test="${mypet.mp_sugery == '1'}">
		            					&nbsp;O
		            					</c:if>
		            					</div>
		        					</div>
		        					</div>
		        					</li>
								</c:forEach>
								
							</ul>

						</div>
						<!--완료-->
						<div class="join-user__items">
							<div class="join-user__items--row" style="justify-content: space-between">
								<input type="hidden" value="${member.m_number}" name="m_number">
								<input type="submit" class="buttonOk button_class" value="수정">
								<button class="buttonOk button_class" onClick="location.href='home.do'">취소</button>
								<button class="buttonOk button_class deleteMember">탈퇴</button>
							</div>
						</div>
					</div>
				</section>
			</div>
		</form>
		

		<!-- Modal Body 제일 하단에 추가-->
		<form name="petModal">
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">반려동물 추가</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<!--반려동물 이름-->
							<div class="join-user__items">
								<label>반려동물 이름</label> <input type="text" id="pet_name" oninput="onInputInvalids('pet')" /> 
								<span class="error_next_box" id="error_pet" aria-live="assertive"></span>
							</div>

							<!--어떤 동물인가요?-->
							<div class="join-user__items">
								<label>어떤 동물인가요?</label> 
								<input id="user_animal" type="text" maxlength="20" placeholder="예) 강아지, 고양이" oninput="onInputInvalids('animal')" /> 
								<span class="error_next_box" id="error_animal" aria-live="assertive"></span>
							</div>
							<!--몇살인가요?-->
							<div class="join-user__items">
								<label>몇살인가요?</label>
								<div class="join-user__items--row"
									style="justify-content: space-between">
									<input id="user_old" type="text" maxlength="5" oninput="onInputInvalids('old')" style="padding-right: 40px;">
									살
								</div>
								<span class="error_next_box" id="error_old" aria-live="assertive"></span>
							</div>
							<!--성별-->
							<div class="join-user__items">
								<label>성별</label>
								<div class="join-user__items--row"
									style="justify-content: space-between">
									<input type="radio" name="mp_petGender" value="남아" checked="checked" /> 수컷입니다. 
									<input type="radio" name="mp_petGender" value="여아" /> 암컷입니다.
								</div>
							</div>
							<!--중성화수술은 했나요?-->
							<div class="join-user__items">
								<label>중성화수술은 했나요?</label>
								<div class="join-user__items--row"
									style="justify-content: space-between">
									<input type="radio" name="mp_sugery" value="0" checked="checked" /> 수술&nbsp;&nbsp;전.
									<input type="radio" name="mp_sugery" value="1" /> 수술완료.
								</div>
							</div>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn_pet btn-success" onclick="petsubmit()">추가</button>
							<button type="button" class="btn_pet btn-secondary" data-bs-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!--푸터-->
	<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
<script type="application/javascript" src="/resources/js/user/pet_joinUser.js"></script>
<script type="application/javascript" src="/resources/js/user/userupdate.js"></script>
<script type="text/javascript">
var pet_idx = ${fn:length(mypet)};

/* 모달창 닫으면 input text 초기화 */	  
var myModalEl = document.getElementById('exampleModal')
	myModalEl.addEventListener('hidden.bs.modal', function (event) {
		document.forms['petModal'].reset();
})

/* 펫 추가 */	
function petsubmit() {

	if (invalids.all()) {
		
		var p_name = document.getElementById('pet_name').value;
		var p_type = document.getElementById('user_animal').value;
		var p_old = document.getElementById('user_old').value;
		var p_gender = $('input[name="mp_petGender"]:checked').val();
		var p_sugery = $('input[name="mp_sugery"]:checked').val();
		
	    $('#myPetBox').append(
	    			'<li class="list-group-item"><div class="petbox">'+
	    			'<div class="mypet_box1"><div id="petdetail">이름 : '+ p_name +
		    		'</div> <button onclick="rainbow_btn(this)">'+
		    		'<img src="/resources/img/minus.png"></button>'+
		        	'</div>' +
					'<div class="mypet_box2">' +
	            	'<div>나이 : '+ p_old +'</div>' +
	            	'<div>성별 : '+ p_gender + '</div>' +
	        		'</div></div>'+
	        		'<input type="hidden" name="petList['+ pet_idx +'].mp_petName" value="'+ p_name +'">'+
	        		'<input type="hidden" name="petList['+ pet_idx +'].mp_petAge" value="'+ p_old +'">'+
	        		'<input type="hidden" name="petList['+ pet_idx +'].mp_petGender" value="'+ p_gender +'">'+
	        		'<input type="hidden" name="petList['+ pet_idx +'].mp_sugery" value="'+ p_sugery +'">'+
	        		'<input type="hidden" name="petList['+ pet_idx +'].mp_petType" value="'+ p_type +'">'+
	        		'</li>'
	    		);
	    pet_idx++;
		petuser.info();
		$('#exampleModal').modal('hide'); //모달창 닫기
	} else {
		for (let type in errorPetTypes) {
			onInputInvalids(type);
		}
	}
}	

/* 펫 리스트에서 해당 펫 삭제 */	
function rainbow_btn(e){

	 swal({
			title: "삭제되었습니다.",
			icon : "info",
			closeOnClickOutside: false
		}, function(){
			deletelist(e);
		});
}

function deletelist(e){
	   
    var class_name = $(e).parents('li').attr('class');
    
    if (class_name == "list-group-item") {
        $(e).parents('li').remove();
        pet_idx--; 
    } else 

    return false;
}

/* 내펫 삭제 */
$(".delete_myPetBtn").click(function(){ 
	var petNum = $(this).parent().find("#petNum").val();

	swal({
		title : "정말로 삭제하시겠습니까?",
		text : "확인을 누르면 내펫 리스트에서 없어지게 됩니다",
		type : "warning",
		showCancelButton : true, 
		confirmButtonClass : "btn-danger", 
		confirmButtonText : "예",
		cancelButtonText : "아니오",
		closeOnConfirm : false,
	    closeOnCancel : true  
	}, function(isConfirm) {
		if (isConfirm) {
			
			$.ajax({
				type:"GET",
				data : {
					"petNum" : petNum
				},
				url : "/delete_MyPet.do",
				dataType : "json",
				success : function(data) {
					if(data == 1){
						swal({
							title: "삭제되었습니다.",
							icon : "success",
							closeOnClickOutside: false
						}, function(){
							location.reload();
						});
	
					}
				},
				error : function(error) {
					swal('삭제 불가.', '해당 반려동물은 병원예약이 되어있어요.', 'info');
				}
			})
		}else{
		}

	});

});

function modify_submit() {
	
	if(invalid.all()){
		user.info();
		return true;
	}else{
		for ( let type in errorTypes) {
			onInputInvalid(type);

		}
		return false;
	}

} 
$(".deleteMember").click(function(){
	
	var m_number = $("input[name='m_number']").val();

	swal({
		title : "정말로 탈퇴하시겠습니까?",
		text : "동일 E_mail로 가입 불가능하며,\n 6개월 이후 모든 데이터 복구가 불가능합니다.",
		type : "warning",
		showCancelButton : true, 
		confirmButtonClass : "btn-danger", 
		confirmButtonText : "예",
		cancelButtonText : "아니오",
		closeOnConfirm : false,
	    closeOnCancel : true  
	}, function(isConfirm) {
		if (isConfirm) {
			$.ajax({
				type : "POST",
				data : {"m_number" : m_number},
				url : "/delete_member.do", 
				dataType : "json",
				success : function(data) {
					if(data==1){
						 swal({
								title: "성공적으로 탈퇴되었습니다.",
								text:"그동안 이용해 주셔서 감사합니다.",
								closeOnClickOutside: false
							}, function(){
								window.location.href ="/home.do";
						});
					}
				},
				error : function(error) {
					alert("error : " + error);
				}
			});
		}else{
			
		}

	});

})
</script>
</body>
</html>


