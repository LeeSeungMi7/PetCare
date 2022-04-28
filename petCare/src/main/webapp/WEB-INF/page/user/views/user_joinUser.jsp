<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	    <link href="/resources/css/user/user_joinUser_myPet.css" rel="stylesheet">

	  <!--부트스트랩-->
	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"  crossorigin="anonymous">
	  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
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
	  <script type="text/javascript">
	  
	  /** 펫 등록 서브밋 함수 **/
	  function petsubmit() {
	      if (invalids.all()) {
	          // TODO: 모든 값들에 대해 유효성 통과
	          
	          petuser.info();
	      } else {
	          for(let type in errorPetTypes) {
	              onInputInvalids(type);
	          }
	      }
	  }
	  	
	 
	  
	  </script>
	  </head>
		
	   <body>
			<div id="pet-layout" class="background--white">
			    <!--헤더-->
					<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
			
				<!--본문-->
				<div class="pet-body pet-home">
			    <!-- 홈 최상단 슬라이더 -->
			    <section name="f">
			        <div class="join-user" style="align-items: center">
			            <!--사용자이름-->
			            <div class="join-user__items">
			                <label>이름</label>
			                <input type="text" id="user_name" oninput="onInputInvalid('name')" />
			                <span class="error_next_box" id="error_name" aria-live="assertive"></span>
			            </div>
			
			            <!--이메일-->
			            <div class="join-user__items">
			                <label>이메일</label>
			                <div class="join-user__items--row" style="justify-content: space-between">
			                    <input id="user_email" type="email" oninput="onInputInvalid('email')" />
			                    <button class="button_class">인증</button>
			                </div>
			                <span class="error_next_box" id="error_email" aria-live="assertive"></span>
			            </div>
			            <!--비밀번호-->
			            <div class="join-user__items">
			                <label>비밀번호</label>
			                <input id="user_password" type="password" maxlength="15" placeholder="비밀번호를 입력하세요"
			                    oninput="onInputInvalid('password')">
			                <input id="user_check_password" type="password" maxlength="15" placeholder="비밀번호 확인"
			                    style="margin-top: 10px;" oninput="onInputInvalid('passwordCheck')">
			                <span class="error_next_box" id="error_password" aria-live="assertive"></span>
			            </div>
			            <!--연락처-->
			            <div class="join-user__items">
			                <label>연락처</label>
			                <div class="join-user__items--row" style="justify-content: space-between">
			                    <select id="user_phone_number_pre" style="min-width: 90px;" oninput="onInputInvalid('phoneNumber')">
			                        <option value="010">010</option>
			                        <option value="011">011</option>
			                        <option value="016">016</option>
			                    </select>
			                    -
			                    <input id="user_phone_number_in" style="max-width: 90px" maxlength="4"
			                        oninput="onInputInvalid('phoneNumber')">
			                    -
			                    <input id="user_phone_number_post" style="max-width: 90px" maxlength="4"
			                        oninput="onInputInvalid('phoneNumber')">
			                </div>
			                <span class="error_next_box" id="error_phone_number" aria-live="assertive"></span>
			            </div>
			            <!--주소-->
			            <div class="join-user__items">
			                <label>주소</label>
			                <input id="user_post" type="text" placeholder="우편번호" readonly onclick="findAddr()">
			                <input id="user_addr" type="text" placeholder="주소" readonly style="margin-top: 10px;"> <br>
			                <input id="user_addr_detail" type="text" placeholder="상세주소를 입력하세요." style="margin-top: -12px;">
			                <span class="error_next_box" id="error_address" aria-live="assertive"></span>
			            </div>
			
			            <!--내반려동물-->
			            <div class="join-user__items">
			
			                <ul class="list-group">
			                    <li class="list-group-item active" aria-current="true">반려동물 등록
			                        <a href="#" class="addList" data-bs-toggle="modal" data-bs-target="#exampleModal">추가</a>
			                    </li>
			                    <li class="list-group-item">
			
			                        <div class="mypet_box1">
			                            <a href="#"><div>이름 : 구름이</div></a>
			                            <button onclick="rainbow_btn(this)"><img src="/resources/img/minus.png"></button>
			                        </div>
			
			                        <div class="mypet_box2">
			                            <div>나이 : 7살</div>
			                            <div>성별 : 남아</div>
			                        </div>
			                    </li>
			                </ul>
			
			            </div>
			            <!--완료-->
			            <div class="join-user__items">
			                <div class="join-user__items--row" style="justify-content: space-between">
			                    <button class="buttonOk button_class" onclick="submit()">가입</button>
			                    <button class="buttonOk button_class"onClick="location.href='home.html'">취소</button>
			                </div>
			            </div>
			        </div>
			    </section>
			</div>
			
			
			<!-- Modal Body 제일 하단에 추가-->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			    <div class="modal-dialog">
			        <div class="modal-content">
			            <div class="modal-header">
			                <h5 class="modal-title" id="exampleModalLabel">반려동물 추가</h5>
			                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			            </div>
			            <div class="modal-body">
			                <!--반려동물 이름-->
			                <div class="join-user__items">
			                    <label>반려동물 이름</label>
			                    <input type="text" id="pet_name" oninput="onInputInvalids('pet')" />
			                    <span class="error_next_box" id="error_pet" aria-live="assertive"></span>
			                </div>
			
			                <!--어떤 동물인가요?-->
			                <div class="join-user__items">
			                    <label>어떤 동물인가요?</label>
			                    <input id="user_animal" type="text" maxlength="20" placeholder="예) 강아지, 고양이"
			                        oninput="onInputInvalids('animal')" />
			                    <span class="error_next_box" id="error_animal" aria-live="assertive"></span>
			                </div>
			                <!--몇살인가요?-->
			                <div class="join-user__items">
			                    <label>몇살인가요?</label>
			                    <div class="join-user__items--row" style="justify-content: space-between">
			                        <input id="user_old" type="text" maxlength="5" oninput="onInputInvalids('old')"
			                            style="padding-right: 40px;">
			                        살
			                    </div>
			                    <span class="error_next_box" id="error_old" aria-live="assertive"></span>
			                </div>
			                <!--성별-->
			                <div class="join-user__items">
			                    <label>성별</label>
			                    <div class="join-user__items--row" style="justify-content: space-between">
			                        <input type="radio" name="gender" value="male" checked="checked" /> 수컷입니다.
			                        <input type="radio" name="gender" value="female" /> 암컷입니다.
			                    </div>
			                </div>
			                <!--중성화수술은 했나요?-->
			                <div class="join-user__items">
			                    <label>중성화수술은 했나요?</label>
			                    <div class="join-user__items--row" style="justify-content: space-between">
			                        <input type="radio" name="" value="yes" /> 수술완료.
			                        <input type="radio" name="" value="no" checked="checked" /> 안했습니다.
			                    </div>
			                </div>
			            </div>
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
			                <button type="button" class="btn btn-success"onclick="petsubmit()">추가하기</button>
			            </div>
			        </div>
			    </div>
			</div>
		</div>

		<!--푸터-->
		<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>

		<script type="application/javascript" src="/resources/js/user/user_joinUser.js"></script>
		<script type="application/javascript" src="/resources/js/user/pet_joinUser.js"></script>

</body>
</html>

