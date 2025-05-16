<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>관리자 로그인</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
        <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <jsp:include page="/menu.jsp" />
            <div class="container">
             <div class="p-5 bg-body-tertiary rounded-3 text-center">
      <div class="container-fluid py-5">
                    <h1 class="display-5 fw-bold">관리자 로그인</h1>
                    <p class="fs-4">Admin Login</p>
                    </div>
                    </div>
            <div class="container" align="center">
            <div class="col-md-4 col-md-offset-4">
                        <h5 class="form-signin-heading">관리자 페이지에 접근하기 위해서는</h5>
                        <h5 class="form-signin-heading">로그인이 필요합니다.</h5>
                        <%
                            String error = request.getParameter("error");
                            if (error != null) {
                                out.println("<div class='alert alert-danger'>");
                                out.println("아이디와 비밀번호를 확인해 주세요");
                                out.println("</div>");
                            }
                        %>
                        <form class="form-signin" action="j_security_check" method="post">
                            <div class="form-floating mb-3 row">
                                <input type="text" class="form-control" name="j_username" required autofocus>
                                <label for="floatingInput">아이디</label>
                            </div>
                            <div class="form-floating mb-3 row">
                                <input type="password" class="form-control" name="j_password">
                                <label for="floatingInput">비밀번호</label>
                            </div>
                            <button class="btn btn-lg btn-success" type="submit">로그인</button>
                        </form>
                    </div>
                </div>
            </div>
            </main>
        <jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
    </body>
</html>
