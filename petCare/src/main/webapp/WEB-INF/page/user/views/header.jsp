<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.petcare.web.user.vo.MemberVO" %>

<script src="/resources/js/user/header.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script> 
<script>
Kakao.init('1a82b1fa2f985ba700ddc5675445bbe3');

function loginWithKakao() {
	
    Kakao.Auth.login({
      success: function(authObj) {

        window.Kakao.API.request({
            url:'/v2/user/me',
            success:res =>{

             var kakao_id = res.id;
             $.ajax({
		             method:"POST",
		             url:"/kakaoLogin.do",
		             dataType:"json",
		             data:{"kakao_id" : kakao_id},
		             success:function(result){
		             	if(result.msg=="로그인"){
		             		swal({
		     					title: "로그인 성공.",
		     					text: "카카로 로그인으로 성공되었습니다",
		     					icon : "success",
		     				}, function(){			
		     					window.location.href ="/home.do";
		     					$("#login_Div").hide();
		     				});
		             	}
		             },
		             error : function(error) {
		     				alert("error : " + error);
		     		 }
         	 })//ajax close

            },
            fail:function(err){
               alert(JSON.stringify(err));
            }
        })
        
    }
})

}

function kakaoLogout() {
	if (!Kakao.Auth.getAccessToken()) {
	  alert('Not logged in.');
	  return false;
	}
	Kakao.Auth.logout(function() {
		window.location.href="/logout.do";
	});
   
  }  
</script>

<style>
.dropdown {position: relative; display: inline-block;}
.dropdown-content { display: none; position: absolute; background-color: #F9F9F9; min-width: 160px; padding: 8px; box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);}
.dropdown:hover .dropdown-content { display: block; }
.btn-block { display: block; width: 222px; height: 54.58px;}
</style>

<header class="pet-header background--white" id="header">
<div class="pet-header__logo pet-row">
    <a href="home.do">
        <img class="logo" src="/resources/img/petcare_logo.png">
    </a>
    
    <c:if test="${empty user.m_id}">
    <div class="pet-header__join">
        <a href="javascript:openModal('modal1');" class="button modal-open text--14-normal" data-bs-target="#loginModal">로그인</a> 
        <a href="signinForm.do" class="button text--14-normal">회원가입</a> 	
    </div>
    </c:if>
    <c:if test="${not empty user.m_id and user.kakao_member=='N'}">
    <div class="pet-header__join">
    	<span id="login_memberID"><c:out value="${user.m_name}"/></span>님 로그인되었습니다.&nbsp;&nbsp; 
        <a href="javascript:void(0);" onclick="logout();" class="button text--14-normal">[ 로그아웃 ]</a> 	
		</div>
    </c:if>
    
    <c:if test="${not empty user.m_id and user.kakao_member=='Y'}">
    <div class="pet-header__join">
    	<span id="login_memberID"><c:out value="${user.m_name}"/></span>님 로그인되었습니다.&nbsp;&nbsp; 
  
        <a href="javascript:void(0)" onclick="kakaoLogout();" class="button text--14-normal"><span>[ 로그아웃 ]</span></a>

		</div>
    </c:if>

    
</div>
<div class="pet-header__tabs pet-row">
    <a class="pet-header__tab text--16-normal color--black active" href="home.do">홈</a>
    <a class="pet-header__tab text--16-normal color--black" href="hospital.html">내주변 병원</a>
    <a class="pet-header__tab text--16-normal color--black" href="show.do">자랑하기</a>
    <a class="pet-header__tab text--16-normal color--black" href="qna.do">QnA</a>
    <a class="pet-header__tab text--16-normal color--black" href="ency_BoardList.do">동물백과</a>
   
   <!-- 마이페이지 -->
   <c:if test="${user.m_role=='0'}">
    <div class="dropdown pet-header__tab text--16-normal color--black">
		<span>내정보</span>
		<div class="dropdown-content">
			<c:if test="${user.kakao_member == 'N'}">
			<form action="/user_mypage_password.do" method="POST">
	        	<input type="submit" class="dropdown-item" value="내 정보 수정">
	        </form>
			</c:if>
			
			<c:if test="${user.kakao_member == 'Y'}">
			<form action="/kakao_myPage_update.do" method="POST">
	        	<input type="hidden" name=m_number value="${user.m_number}">
	        	<input type="submit" class="dropdown-item" value="내 정보 수정">
	        </form>
			</c:if>
			
	        <form action="/user_myreservation.do" method="POST">
	        	<input type="hidden" name=m_number value="${user.m_number}">
	        	<input type="submit" class="dropdown-item" value="내 예약 관리">
	        </form>
		</div>
	</div>
   </c:if>

	<!-- 병원페이지 -->
	<c:if test="${user.m_role=='1'}">
	<div class="dropdown pet-header__tab text--16-normal color--black">
		<span>내정보</span>
		<div class="dropdown-content">
			<form action="/partner_mypage_password.do" method="POST">
	        	<input type="submit" class="dropdown-item" value="병원 정보 수정">
	        </form>
	        <form action="/hos_reservation.do" method="POST">
	        	<input type="hidden" name=m_number value="${user.m_number}">
	        	<input type="submit" class="dropdown-item" value="병원 예약 관리">
	        </form>
		</div>
	</div>
	</c:if>
	<c:if test="${empty user.m_role}">
	<!-- 로그인 안할때 -->
	<a class="pet-header__tab text--16-normal color--black" role="button" id="partner_myPage" aria-expanded="true" onclick="No_myPage()">내정보</a>
	</c:if>
 </div>  
 

<!--로그인 모달창-->
	<div id="modal"></div>
		<div class="modal-con modal1 shadow-lg" >
			<a href="javascript:;" class="close">X</a>
			<p class="title">로그인</p>
		   <div class="con">

				로그인 창

				<div class="card align-middle "
					style="width: 20rem; border-radius: 20px;">

					<div class="card-body">
						<form id="form_login" class="form-signin" method="POST" action="user_login.do">
							<input type="text" id="uid" name="m_id" class="form-control" placeholder="Email address" required autofocus><BR>
							<input type="password" id="upw" name="m_pw" class="form-control" placeholder="Password" required><br>
							
							<div align="center">
							<button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button" onclick="fn_loginCheck()" style="margin: 0;">로 그 인</button>
							
							<a id="custom-login-btn" href="javascript:loginWithKakao()">
							  <img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" style="width:222px; margin-top:10px;" alt="카카오 로그인 버튼" />
							</a>
							</div>
							
							<div class="searchBox">
								<a href="/user_password.do">비밀번호 찾기</a><br> <a
									href="/signinForm.do">회원가입</a>
							</div>
							<label style="font-size:12px">제휴 병원 가입신청은 회원가입으로 진행해주세요</label>
						</form>
					</div>
				</div>

			<div class="modal"></div>
		</div>
	</div>


</header>
