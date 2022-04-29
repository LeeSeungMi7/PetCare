<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <!-- 제이쿼리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
        
        <!-- <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script> -->
        <link href="/resources/css/admin/ad_board.css" rel="stylesheet"/>
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
                        <h1 class="mt-4">커뮤니티</h1>
                        <hr>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                커뮤니티 관리
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>글내용</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>글내용</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td><a href="comm_getBoard.mdo">커뮤니티 테스트</a></td>
                                            <td>홍길동</td>
                                            <td>글 내용 테스트입니다 최대한 길게 작성</td>
                                            <td>2022/04/17</td>
                                            <td>61</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <!--푸터-->
                <%@ include file="/WEB-INF/page/admin/views/ad_footer.jsp"%>
            </div>
        </div>
        <script src="/resources/js/admin/ad_common.js"></script>
        <script src="/resources/js/admin/scripts.js"></script>
        <script src="/resources/js/admin/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/morris.js"></script>
        <script src="/resources/js/admin/raphael.min.js"></script>

        <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script> -->
        <!-- <script src="../assets/demo/chart-area-demo.js"></script>
        <script src="../assets/demo/chart-bar-demo.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
    </body>
</html>