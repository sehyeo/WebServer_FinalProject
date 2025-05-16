<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
    	<title>챌린지 목록</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <jsp:include page="/menu.jsp" />
            <!-- Page Content-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">챌린지</h1>
                        <p class="lead fw-normal text-muted mb-0">우리의 도전들</p>
                    </div>
                    <div class="row gx-5">
                        <div class="col-lg-6">
                            <div class="position-relative mb-5">
                                <img class="img-fluid rounded-3 mb-3" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />
                                <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#!">프로젝트 이름</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="position-relative mb-5">
                                <img class="img-fluid rounded-3 mb-3" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />
                                <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#!">프로젝트 이름</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="position-relative mb-5 mb-lg-0">
                                <img class="img-fluid rounded-3 mb-3" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />
                                <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#!">프로젝트 이름</a>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="position-relative">
                                <img class="img-fluid rounded-3 mb-3" src="https://dummyimage.com/600x400/343a40/6c757d" alt="..." />
                                <a class="h3 fw-bolder text-decoration-none link-dark stretched-link" href="#!">프로젝트 이름</a>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="py-5 bg-light">
                <div class="container px-5 my-5">
                    <h2 class="display-4 fw-bolder mb-4">챌린지를 추가해보세요!</h2>
                    <a class="btn btn-lg btn-primary" href="#!">추가하기</a>
                </div>
            </section>
        </main>
        <jsp:include page="/footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<c:url value='/resources/js/board.js'/>"></script>
    </body>
</html>
