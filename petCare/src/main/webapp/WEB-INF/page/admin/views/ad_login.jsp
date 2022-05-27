<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
		<title>PetCare Admin</title>
        <link href="/resources/css/admin/styles.css" rel="stylesheet" />
        <link href="/resources/css/admin/addmin_page.css" rel="stylesheet" />

        <!-- 제이쿼리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    	<script>
    		$(document).ready(function(){
    			$("#btnLogin").click(function(){
    				var ad_id = $("#ad_id").val();
    				var ad_pw = $("#ad_pw").val();
    				if(ad_id == ""){
    					alert("아이디를 입력해주세요.");
    					$("#ad_id").focus();
    					return;
    				}
    				if(ad_pw == ""){
    					alert("비밀번호를 입력해주세요.");
    					$("#ad_pw").focus();
    					return;
    				}
    				document.form1.action="/loginCheck.mdo";
    				document.form1.submit();
    			});
    		});
    	</script>
    </head>
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content" class="admin_back">
                <main>
                    <div class="container">
                        <div class="row justify-content-center admin_login_box">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">관리자 로그인</h3></div>
                                    <div class="card-body">
                                        <form name="form1" method="post">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="ad_id" id="ad_id" type="text" placeholder="ID" />
                                                <label for="inputEmail">ID</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" name="ad_pw" id="ad_pw" type="password" placeholder="Password" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <button class="btn btn-primary" id="btnLogin">로그인</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/resources/js/admin/scripts.js"></script>
    </body>
</html>
