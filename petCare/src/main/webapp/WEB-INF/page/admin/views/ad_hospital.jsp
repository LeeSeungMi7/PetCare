<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

    <head>

        <!-- 제이쿼리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link
            href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
            rel="stylesheet"/>
        <script
            src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
            crossorigin="anonymous"></script>
        <link href="/resources/css/admin/ad_hospital.css" rel="stylesheet"/>
        <link href="/resources/css/admin/styles.css" rel="stylesheet"/>
        <link href="/resources/css/admin/morris.css" rel="stylesheet"/>

    </head>

    <body class="sb-nav-fixed">
        <!--헤더 영역-->
        <%@ include file="/WEB-INF/page/admin/views/ad_header.jsp"%>
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <main>
                    <!--본문 영역-->
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">병원 관리</h1>
                        <hr>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                신청 병원(대기중)
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>병원이름</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>사업자등록증</th>
                                            <th>결재</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>병원이름</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>사업자등록증</th>
                                            <th>결재</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>멍멍이 동물병원</td>
                                            <td>010-1234-1235</td>
                                            <td>dog@naver.com</td>
                                            <td>
                                                <button
                                                    type="button"
                                                    class="btn1"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal">
                                                    open
                                                </button>
                                            </td>
                                            <td>
                                                <div class="btngroup">
                                                    <button class="btn1 save" onclick="deleteRowFunction(this)">승인</button>
                                                    <button class="btn1 cancel" onclick="deleteRowFunction(this)">기각</button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>야옹이 동물병원</td>
                                            <td>010-1233-1235</td>
                                            <td>cat@naver.com</td>
                                            <td>
                                                <button
                                                    type="button"
                                                    class="btn1"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal">
                                                    open
                                                </button>
                                            </td>
                                            <td>
                                                <div class="btngroup">
                                                    <button class="btn1 save" onclick="deleteRowFunction(this)">승인</button>
                                                    <button class="btn1 cancel" onclick="deleteRowFunction(this)">기각</button>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <hr>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                전체 병원
                            </div>
                            <div class="card-body">
                                <table id="datatablesSample">
                                    <thead>
                                        <tr>
                                            <th>번호</th>
                                            <th>병원이름</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>사업자등록증</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>병원이름</th>
                                            <th>연락처</th>
                                            <th>이메일</th>
                                            <th>사업자등록증</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1.</td>
                                            <td>멍멍이 동물병원</td>
                                            <td>010-1234-1235</td>
                                            <td>dog@naver.com</td>
                                            <td>
                                                <button
                                                    type="button"
                                                    class="btn1"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal">
                                                    open
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>2.</td>
                                            <td>야옹이 동물병원</td>
                                            <td>010-1233-1235</td>
                                            <td>cat@naver.com</td>
                                            <td>
                                                <button
                                                    type="button"
                                                    class="btn1"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#exampleModal">
                                                    open
                                                </button>
                                            </td>
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
        <!-- Modal -->
        <div
            class="modal fade"
            id="exampleModal"
            tabindex="-1"
            aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">사업자등록증 상세보기</h5>
                        <button
                            type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <img src="/resources/img/admin_사업자등록증test.jpg">
                    </div>
                </div>
            </div>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
            crossorigin="anonymous"></script>
        <!-- <script src="../assets/demo/chart-area-demo.js"></script> <script
        src="../assets/demo/chart-bar-demo.js"></script> -->
        <script
            src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
            crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="/resources/js/admin/morris.js"></script>
        <script src="/resources/js/admin/raphael.min.js"></script>
        <script src="/resources/js/admin/ad_hospital.js"></script>
        <script src="/resources/js/admin/ad_common.js"></script>
        <script src="/resources/js/admin/scripts.js"></script>
        <script src="/resources/js/admin/datatables-simple-demo.js"></script>

    </body>
</html>