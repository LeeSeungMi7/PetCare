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
    <link href="/resources/css/user/home.css" rel="stylesheet">
    <link href="/resources/css/user/hospital.css?after" rel="stylesheet">
	<link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
	<title>PetCare Page</title>
    
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
  <!-- 경은이 카카오 MAP API-KEY -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1e818982c81810e2470dd6b0b339e676&libraries=services"></script>
</head>

<body>
<div id="pet-layout" class="background--white">
	<%@ include file="/WEB-INF/page/user/views/header.jsp"%>
	<div class="pet-hospital__infos pet-row">
   	 <div id="map"></div>
   	 <div class="pet-hospital__info pet-column">
        <div>
            <button type="button" class="button--sl filter" onclick="findAddr()">주소</button>
            <c:if test="${user.m_number != null}">
            <button type="button" class="button--sl filter" onclick="currentLocation()">우리 동네</button>
            </c:if>
            <button type="button" class="button--sl filter" id="filter-24hour" onclick="onClickFilter('filter-24hour')">24시간</button>
            <button type="button" class="button--sl filter" id="reservation" onclick="onClickFilter('reservation')">예약가능</button>
        </div>
        <input id="input_address" type="text" placeholder="주소" readonly style="margin-top: 10px;"> <br>

        <div class="pet-hospital__list-title text--20-bold  background--blue color--white">병원리스트</div>
        <div class="pet-hospital__list" id="pet-hospital__list"></div>
    </div>
</div>
<%@ include file="/WEB-INF/page/user/views/footer.jsp"%>
</div>
<script src="/resources/js/user/hospital.js?after"></script>
</body>
</html>