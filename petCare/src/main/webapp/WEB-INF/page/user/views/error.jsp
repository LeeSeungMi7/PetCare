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
    width: 15rem;
    height: 3.5rem;
    position: absolute;
    left: 45%;
    top: 43.5%;
    font-size: 20px;
    border: transparent;
}
</style>
</head>

<body>
    <div align="center" class="error_box">
		<img src="/resources/img/errorpage.png" width="920">
		<button class="error_button" onclick='location.href="/home.do";'></button>
    </div>
</body>
</html>