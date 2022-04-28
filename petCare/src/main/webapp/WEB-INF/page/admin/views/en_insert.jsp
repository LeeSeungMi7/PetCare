<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <!-- 제이쿼리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
       
        <link href="/resources/css/admin/ad_commboard.css" rel="stylesheet"/>
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
                        <div class="insertEn">
                            <div class="insert" style="height: 93vh;">
                                <form action="./boardInsert" method="POST">
                                    <input class="title" type="text" name="title" placeholder="제목"/>
                                    <textarea class="content" name="content" placeholder="내용"></textarea>
                                    <div class="file-hidden-list"></div>
                                </form>
                                <button id="addFile" class="add-button">파일 첨부</button>
                                <div class="file-list"></div>
                                <div class="buttonarea">
                                    <button type="button" class="btn btn-primary">
                                        <a href="">등록</a>
                                    </button>
                                    <button type="button" class="btn btn-secondary">
                                        <a href="ad_encyclopedia.mdo">취소</a>
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

        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"crossorigin="anonymous"></script>
        <script src="/resources/js/admin/ad_getboard.js"></script>
        <script src="/resources/js/admin/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/morris.js"></script>
        <script src="/resources/js/admin/raphael.min.js"></script>
        <script src="/resources/js/admin/scripts.js"></script>
        <script src="/resources/js/admin/ad_common.js"></script>
    </body>
</html>