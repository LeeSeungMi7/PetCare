<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link href="/resources/css/user/pet_joinUser.css" rel="stylesheet">
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
  

</head>

<body>
<div id="pet-layout" class="background--white">

    <!--본문-->
	<div class="pet-body pet-home">

            <!--본문-->
            <div class="pet-body pet-home">
                <!-- 홈 최상단 슬라이더 -->
                <section name="f">
                    <div class="join-user" style="align-items: center">
                        <!--반려동물 이름-->
                        <div class="join-user__items">
                            <label>반려동물 이름</label>
                            <input type="text" id="user_name" oninput="onInputInvalid('name')" />
                            <span class="error_next_box" id="error_name" aria-live="assertive"></span>
                        </div>
            
                        <!--어떤 동물인가요?-->
                        <div class="join-user__items">
                            <label>어떤 동물인가요?</label>
                                <input id="user_animal" type="text" maxlength="20" placeholder="예) 강아지, 고양이" oninput="onInputInvalid('animal')" />
                            <span class="error_next_box" id="error_animal" aria-live="assertive"></span>
                        </div>
                        <!--몇살인가요?-->
                        <div class="join-user__items">
                            <label>몇살인가요?</label>
                            <div class="join-user__items--row"style="justify-content: space-between">
                            <input id="user_old" type="text" maxlength="5" oninput="onInputInvalid('old')"style="padding-right: 40px;">
                            살
                            </div>
                            <span class="error_next_box" id="error_old" aria-live="assertive"></span>
                        </div>
                        <!--성별-->
                        <div class="join-user__items">
                            <label>성별</label>
                            <div class="join-user__items--row" style="justify-content: space-between">
                                <input type="radio" name="gender" value="male" checked="checked"/> 수컷입니다.
                                <input type="radio" name="gender" value="female" /> 암컷입니다.
                            </div>
                        </div>
                        <!--중성화수술은 했나요?-->
                        <div class="join-user__items">
                            <label>중성화수술은 했나요?</label>
                            <div class="join-user__items--row" style="justify-content: space-between">
                                <input type="radio" name="ch1" value="yes" /> 수술완료.
                                <input type="radio" name="ch1" value="no" checked="checked"/> 수술 전.
                            </div>
                        </div>
                        <!--완료-->
                        <div class="join-user__items">
                            <div class="join-user__items--row" style="justify-content: space-between">
                                <button class="buttonOk button_class" onclick="submit()">가입</button>
                                <button class="buttonOk button_class">취소</button>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- 푸터 -->
                <footer id="footer">
                    
                </footer>
            </div>
        </div>
    
    <script src="/resources/js/user/user_joinUser.js"></script>
</div>
</body>
</html>