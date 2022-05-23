<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petcare.web.admin.vo.Ad_encyVO" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <!-- 제이쿼리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
       
        <link href="/resources/css/admin/new_ad_commboard.css?after" rel="stylesheet"/>
        <link href="/resources/css/admin/styles.css" rel="stylesheet"/>
        <link href="/resources/css/admin/morris.css" rel="stylesheet"/>
        
    </head>
    <body class="sb-nav-fixed">
        <!--헤더 영역-->
        <%@ include file="/WEB-INF/page/admin/views/ad_header.jsp"%>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">백과사전 등록</h1>
                        <hr>
                        <form id="form1" name="ad_encyVO" method="POST" onsubmit="return onclickOk()" enctype="multipart/form-data" action="/eninsert.mdo">
                        <div class="insertEn">
                            <div class="insert" style="height: 93vh;">
                                <input class="title" type="text" name="en_title" placeholder="제목" id="title"/>
                                <input type="file" style="margin-top:15px;" name="inserten_file" id="profile_pt" onchange="previewImage(this,'View_area')"/>
								<div id='View_area' style='position:relative;  border: 0px solid black; dispaly: inline; margin_top:10px; '></div>
                                <textarea class="content" id="ir1" name="en_content" placeholder="내용"></textarea>
                                <div class="buttonarea">
                                    <input type="submit" class="btn btn-primary" id="btnSave" value="등록">
                                    <button type="button" class="btn btn-secondary">
                                        <a href="ad_encyclopedia.mdo">취소</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                </main>

                <!--푸터-->
                <%@ include file="/WEB-INF/page/admin/views/ad_footer.jsp"%>
            </div>
        </div>

        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"crossorigin="anonymous"></script>
        <script src="/resources/js/admin/ad_getboard.js"></script>
        <script src="/resources/js/admin/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/morris.js"></script>
        <script src="/resources/js/admin/raphael.min.js"></script>
        <script src="/resources/js/admin/scripts.js"></script>
        <script src="/resources/js/user/write.js"></script>
		<script src="/resources/js/user/show_write.js"></script>
        <script>

function onclickOk(){
		var title= $("#input_title").val();
		console.log(title);
		
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", [])
		var content = document.getElementById("ir1").value
		console.log(content);

		if(title == ""){
			alert("제목을 입력하세요.");
			document.getElementById("title").focus();
			console.log
			return false;
		}
		if(content == ""){
			alert("내용을 입력하세요.");
			oEdiotrs.getById["ir1"].exec("FOCUS")
			return false;
		}
		alert("등록되었습니다.")
		document.getElementById("form1").submit();
	}


</script>
    </body>
</html>