<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
    <head>
        <!-- 제이쿼리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
       
        <link href="/resources/css/admin/ad_commboard.css?after" rel="stylesheet"/>
        <link href="/resources/css/admin/styles.css" rel="stylesheet"/>
        <link href="/resources/css/admin/morris.css" rel="stylesheet"/>
        <link href="/resources/img/petcare_logo.png" rel="shortcut icon" type="image/x-icon">
		<title>PetCare Admin</title>
    </head>
    <body class="sb-nav-fixed">
        <!--헤더 영역-->
        <%@ include file="/WEB-INF/page/admin/views/ad_header.jsp"%>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">글 상세보기</h1>
                        <hr>
                        <div class="insertEn">
                            <div class="insert" style="height: 43rem;">
                                <form action="./boardInsert" method="POST">
                                    <input class="title" type="text" name="title" placeholder="제목" value="${CM_view.b_title }" readonly/>
                                    <input class="username" type="text" name="name" placeholder="작성자" value="${CM_view.b_writer }" readonly/>
                                    <input class="insertdate" type="text" name="insertdate" placeholder="작성일" value="${CM_view.b_date }" readonly/>
                                    <img class="boardthumbnail" src="${CM_view.b_file_path }">
                                    <div class="content" name="content" placeholder="내용" readonly>${CM_view.b_content }</div>
                                    <div class="file-hidden-list"></div>
                                </form>
                                <div class="buttonarea">
                                    <button type="button" class="btn btn-danger">
                                    	<a href="${path}/board_delete.mdo?board_num=${CM_view.board_num }">삭제</a></button>
                                    <button type="button" class="btn btn-secondary">
                                        <a href="ad_community.mdo">취소</a>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <!--푸터-->
                <%@ include file="/WEB-INF/page/admin/views/ad_footer.jsp"%>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" rossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <!-- <script src="../assets/demo/chart-area-demo.js"></script>
        <script src="../assets/demo/chart-bar-demo.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        
        <script src="/resources/js/admin/ad_getboard.js"></script>
        <script src="/resources/js/admin/morris.js"></script>
        <script src="/resources/js/admin/raphael.min.js"></script>
        <script src="/resources/js/admin/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/scripts.js"></script>
        <script src="/resources/js/admin/ad_common.js"></script>

    </body>
</html>