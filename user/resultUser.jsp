<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link href="../resources/css/board.css" rel="stylesheet" />
<title>회원 정보</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
<div class="container">
 <div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
      <%
            String msg = request.getParameter("msg");
            if (msg != null) {
                if (msg.equals("0") || msg.equals("2")) {
        %>
        <h1 class="display-5 fw-bold">회원 정보</h1>
        <p class="col-md-8 fs-4">Membership Info</p>
        <%
                } else if (msg.equals("1")) {
        %>  
        <h1 class="display-5 fw-bold">회원 가입</h1>
        <p class="col-md-8 fs-4">Membership SignUp</p>
        <%
                } else if (msg.equals("deleted")) {
        %>
        <h1 class="display-5 fw-bold">회원 탈퇴</h1>
        <p class="col-md-8 fs-4">Membership Deletion</p>
        <%
                }
            }
        %>
      </div>
    </div>
    
    <div class="row align-items-md-stretch text-center">
        <%
            if (msg != null) {
                if (msg.equals("0")) {
                    out.println(" <h2 class='alert alert-danger'>회원정보가 수정되었습니다.</h2>");
                } else if (msg.equals("1")) {
                    out.println(" <h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
                } else if (msg.equals("2")) {
                    String loginId = (String) session.getAttribute("sessionId");
                    if (request.isUserInRole("admin")) {
                        out.println(" <h2 class='alert alert-danger'>관리자 " + loginId + "님 환영합니다</h2>");
                    } else {
                        out.println(" <h2 class='alert alert-danger'>" + loginId + "님 환영합니다</h2>");
                    }
         %>
         <div class="row align-items-md-stretch text-center">
            <div class="col-md-12">
                <div class="h-100 p-5">
                    <%
                        // 현재 접속 시각 표시
                        Date day = new Date();
                        String am_pm;
                        int hour = day.getHours();
                        int minute = day.getMinutes();
                        int second = day.getSeconds();
                        if (hour / 12 == 0) {
                            am_pm = "AM";
                        } else {
                            am_pm = "PM";
                            hour = hour - 12;
                        }
                        String CT = hour + ":" + String.format("%02d", minute) + ":" + String.format("%02d", second) + " " + am_pm;
                        out.println("<h5>현재 접속 시각: " + CT + "</h5>");
                    %>
                </div>
            </div>
        </div>
         <%
                } else if (msg.equals("deleted")) {
                    out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
                }
            } else {
                out.println("<h2 class='alert alert-danger'>회원정보가 삭제되었습니다.</h2>");
            }
        %>
    </div>    
</div>    
</main>
<jsp:include page="/footer.jsp" />  
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="../resources/js/board.js"></script>
</body>
</html>
