<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        
        <!-- 제이쿼리 -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet"/>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link href="/resources/css/admin/styles.css" rel="stylesheet"/>
        <link href="/resources/css/admin/morris.css" rel="stylesheet"/>
        <link href="/resources/css/admin/ad_common.css" rel="stylesheet"/>
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
                        <h1 class="mt-4">사용자 관리</h1>
                        <hr>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                총 사용자
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>주소</th>
                                            <th>세부 주소</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>이름</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>주소</th>
                                            <th>세부 주소</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach var="list" items="${userList}" varStatus="status">
                                        <tr>
                                            <td><c:out value="${list.m_name}" /></td>
                                            <td><c:out value="${list.m_id}" /></td>
                                            <td><c:out value="${list.m_tel}" /></td>
                                            <td><c:out value="${list.m_address}" /></td>
                                            <td><c:out value="${list.m_address_detail}" /></td>
                                        </tr>
                                       </c:forEach>
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


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <!-- <script src="../assets/demo/chart-area-demo.js"></script>
        <script src="../assets/demo/chart-bar-demo.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="/resources/js/admin/datatables-simple-demo.js"></script>
        <script src="/resources/js/admin/morris.js"></script>
        <script src="/resources/js/admin/raphael.min.js"></script>
        <script src="/resources/js/admin/scripts.js"></script>
        <script src="/resources/js/admin/ad_common.js"></script>

    </body>
</html>