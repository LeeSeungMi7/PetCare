<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.error_box{
	background-color: #f5f5f5;
}
.error_button{
	background-color: transparent;
    width: 10rem;
    height: 3rem;
    position: absolute;
    left: 55%;
    top: 45%;
    font-size: 20px;
    color: #6F4F28;
    border: 2px solid #6F4F28;
    border-radius: 15px;
}
</style>
</head>

<body>
    <div align="center" class="error_box">
		<img src="/resources/img/error.png" width="920">
		<button class="error_button" onclick='location.href="/home.do";'>홈으로 이동</button>
    </div>
</body>
</html>