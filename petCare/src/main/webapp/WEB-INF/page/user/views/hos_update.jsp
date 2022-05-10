<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.petcare.web.user.vo.MemberVO" %>
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
    <!--부트스트랩-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"  crossorigin="anonymous">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="/resources/css/user/hos_joinUser.css" rel="stylesheet">
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
	
</head>

<body>
    <div id="pet-layout" class="background--white">
        <!--헤더-->
        <%@ include file="/WEB-INF/page/user/views/header.jsp" %>

        <!--본문-->
        
        <div id="pet-layout" class="background--white">

			<div class="pet-body pet-home">

				<!--본문-->
				<div class="pet-body pet-home">
					<!-- 홈 최상단 슬라이더 -->
					<section name="f" class="pet-home__boards">
					<form onsubmit=" return fn_submit();" method="post" action="/partner_modify.do" enctype="multipart/form-data">
	                   	 <div class="join-user" style="align-items: center">
	                        <!--병원이름-->
	                        <div class="join-user__items">
	                            <label>병원 이름</label>
	                            <input type="text" id="user_name" oninput="onInputInvalid('name')" name="m_name" value="${member.m_name}" required/>
	                            <span class="error_next_box" id="error_name" aria-live="assertive"></span>
	                        </div>
	                        
	            
	                        <!--이메일-->
	                        <div class="join-user__items">
	                            <label>이메일</label>
	                            <div class="join-user__items" style="justify-content: space-between">
	                                <input id="user_email" type="email" oninput="onInputInvalid('email')" name="m_id" value="${member.m_id}" readonly="readonly" required/>
	                            	<span class="error_next_box" id="error_email" aria-live="assertive">이메일은 수정 불가능 합니다.</span>
	                            </div>        
	                        </div>
	                        <!--비밀번호-->
	                        <div class="join-user__items">
	                            <label>비밀번호</label>
	                            <input id="user_password" type="password" maxlength="15" placeholder="비밀번호를 입력하세요"
	                                oninput="onInputInvalid('password')" autoComplete="on" name="m_pw" required>
	                            <input id="user_check_password" type="password" maxlength="15" placeholder="비밀번호 확인"
	                                style="margin-top: 10px;" oninput="onInputInvalid('passwordCheck')" autoComplete="on" required>
	                            <span class="error_next_box" id="error_password" aria-live="assertive"></span>
	                        </div>
	                        <!--연락처-->
	                        <div class="join-user__items">
	                            <label>병원 번호</label>
	                            <div class="join-user__items--row" style="justify-content: space-between">
	                                
	                                <input type="text"  id="user_phone_number_pre" type="text" style="max-width: 90px" maxlength="4"
	                                    oninput="onInputInvalid('phoneNumber')" name="m_tel1" value="${member.m_tel1}" required>
	 
	                                -
	                                <input id="user_phone_number_in" style="max-width: 90px" maxlength="4"
	                                    oninput="onInputInvalid('phoneNumber')" name="m_tel2" value="${member.m_tel2}" required>
	                                -
	                                <input id="user_phone_number_post" style="max-width: 90px" maxlength="4"
	                                    oninput="onInputInvalid('phoneNumber')" name="m_tel3" value="${member.m_tel3}" required>
	                            </div>
	                            <span class="error_next_box" id="error_phone_number" aria-live="assertive"></span>
	                        </div>
	                        <!--주소-->
	                        <div class="join-user__items">
	                            <label>주소</label>
	                            <input id="user_post" type="text" placeholder="우편번호" readonly onclick="findAddr()" name="m_zipcode" value="${member.m_zipcode}" required>
	                            <input id="user_addr" type="text" placeholder="주소" readonly style="margin-top: 10px;" name="m_address" value="${member.m_address}" required> <br>
	                            <input id="user_addr_detail" type="text" placeholder="상세주소를 입력하세요." style="margin-top: -12px;" name="m_address_detail" value="${member.m_address_detail}" required>
	                            <span class="error_next_box" id="error_address" aria-live="assertive"></span>
	                        </div>
	            
	                        <!--진료시간-->
	                        <div class="join-user__items">
	                            <label>진료시간</label>
	                            <div class="join-user__items--row__time">
	                                <input type="text" id="user_weekday_start" oninput="onInputInvalid('openingHours')" placeholder="평일진료" style="max-width:150px;" maxlength="5" name="p_weekday1" value="${member.p_weekday1}" required/>
	                                ~
	                                <input type="text" id="user_weekday_end" oninput="onInputInvalid('openingHours')" placeholder="" style="max-width:150px;" maxlength="5" name="p_weekday2" value="${member.p_weekday2}" required/>
	                            </div>
	                            <div class="join-user__items--row__time">
	                                <input type="text" id="user_weekend_start" oninput="onInputInvalid('openingHours')" placeholder="주말진료" style="max-width:150px;" maxlength="5" name="p_weekend1" value="${member.p_weekend1}" required/>
	                                ~
	                                <input type="text" id="user_weekend_end" oninput="onInputInvalid('openingHours')" placeholder="" style="max-width:150px;" maxlength="5" name="p_weekend2" value="${member.p_weekend2}" required/>
	                            </div>
	                            <div class="join-user__items--row__time">
	                                <input type="text" id="user_lunch_start" oninput="onInputInvalid('openingHours')" placeholder="점심시간"style="max-width: 150px" maxlength="5" name="p_breaktime1" value="${member.p_breaktime1}" required/>
	                                ~
	                                <input type="text" id="user_lunch_end" oninput="onInputInvalid('openingHours')" placeholder=""style="max-width: 150px" maxlength="5" name="p_breaktime2" value="${member.p_breaktime2}" required/>
	                            </div>
	                            <span class="error_next_box" id="error_time" aria-live="assertive"></span>
	                        </div>
	            
	                        <!--24시간 병원인지 체크-->
	                        <div class="join-user__items">
	                            <div class="custom-control custom-checkbox">
	                                <input type="checkbox" id="jb-checkbox" class="custom-control-input" <c:if test="${member.p_24hour=='1'}">checked</c:if>>
	                                <label class="custom-control-label" for="jb-checkbox">24시 병원</label>
	                            </div>
	                        </div>
	            
	                        <!--사업자등록증 첨부-->
	                        <div class="join-user__items">
	                            <label>사업자등록증 첨부</label>
	                                <div class="filebox">
	                                    <input class="upload-name" value="파일선택" disabled="disabled">
	                                    <label for="ex_filename">업로드</label>
	                                    <input type="file" id="ex_filename" class="upload-hidden" name="file" >
	                                	
	                                </div><br>
	                                <input type="button" value="기존 사업자 등록증 보기" onclick="file_open()"><br>    
	                        </div>              
	                        
	                        <!--완료-->
	                        <div class="join-user__items">
	                            <div class="join-user__items--row" style="justify-content: space-between">
	                            	<input type="hidden" name="m_number" value="${member.m_number}">
	                                <input type="submit" class="button_class buttonOk" value="수정">
	                                <button class="button_class buttonOk" onclick="location.href='home.do'">취소</button>
	                            	<button class="button_class buttonOk" onclick="location.href='home.do'">탈퇴</button>
	                            </div>
	                        </div>
	                    </div>
	                    <input type="hidden" name="emailcheck" value="0">
	                    <input type="hidden" id="p_24hour" name="p_24hour" value="0">
	                    </form>
	                </section>		
				</div>
			</div>	
		</div>
		
		<!--푸터-->
        <%@ include file="/WEB-INF/page/user/views/footer.jsp" %>

    </div>
 
<script type="application/javascript" src="/resources/js/user/hos_joinUser.js"></script>
<script type="text/javascript">

/** 서브밋 함수 **/
function fn_submit() {
		
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

function file_open(){
	window.open('${member.p_file_path}');
}
</script>
</body>

</html>