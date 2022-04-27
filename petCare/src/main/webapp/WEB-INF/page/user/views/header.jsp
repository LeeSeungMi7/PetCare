<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="pet-header__logo pet-row">
    <a href="home.html">
        <img class="logo" src="../../../../resources/img/petcare_logo.png">
    </a>
    <div class="pet-header__join">
        <a href="javascript:openModal('modal1');" class="button modal-open text--14-normal">로그인</a>
        <a href="/signinForm.do" class="text--14-normal">회원가입</a>
    </div>
</div>
<div class="pet-header__tabs pet-row">
    <a class="pet-header__tab text--16-normal color--black active" href="home.html">홈</a>
    <a class="pet-header__tab text--16-normal color--black" href="hospital.html">내주변 병원</a>
    <a class="pet-header__tab text--16-normal color--black" href="show.html">자랑하기</a>
    <a class="pet-header__tab text--16-normal color--black" href="qna.html">QnA</a>
    <a class="pet-header__tab text--16-normal color--black" href="ency_boardList.html">동물백과</a>
    <a class="pet-header__tab text--16-normal color--black" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">내정보</a>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
        <li><a class="dropdown-item" href="now_password.html">내 정보 수정</a></li>
        <li><a class="dropdown-item" href="myreservation.html">내 예약 관리</a></li>
    </ul>
</div>

<!--로그인 모달창-->
<div id="modal"></div>
<div class="modal-con modal1">
    <a href="javascript:;" class="close">X</a>
    <p class="title">로그인</p>
    <div class="con">
        
        <!--로그인 창-->

        <div class="card align-middle" style="width:20rem; border-radius:20px;">
            
            <div class="card-body">

            <form class="form-signin" method="POST" onSubmit="logincall();false">
                    <input type="text" id="uid" class="form-control" placeholder="Email address" required autofocus><BR>
                    <input type="password" id="upw" class="form-control" placeholder="Password" required><br>
<<<<<<< HEAD:petCare/src/main/webapp/WEB-INF/page/user/views/header.html
                    <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" style="margin: 0;">로 그 인</button>
                    <button class="btn btn-lg btn-primary_kakao btn-block" style="margin: 0; margin-top: 10px;">
                        <img src="../../../../resources/img/kakao.png" class="kakao_img">
=======
                    <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">로 그 인</button>
                    <button class="btn btn-lg btn-primary_kakao btn-block" >
                        <img src="/resources/img/kakao.png" class="kakao_img">
>>>>>>> feature/회원가입_기능:petCare/src/main/webapp/WEB-INF/page/user/views/header.jsp
                        카카오 로그인
                    </button>

                    <div class="searchBox">
                        <a href="./password.html">비밀번호 찾기</a><br>
                        <a href="/signinForm.do">회원가입</a>
                    </div>
                    <label><p>제휴 병원 가입신청은 회원가입으로 진행해주세요</p></label>
            </form>
          
            </div>
        </div>
    
        <div class="modal">
        </div>
    </div>
</div>