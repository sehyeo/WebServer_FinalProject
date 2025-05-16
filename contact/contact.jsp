<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <!-- Page content-->
    <section class="py-5">
        <div class="container px-5">
            <!-- Contact form-->
            <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                <div class="text-center mb-5">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-envelope"></i></div>
                    <h1 class="fw-bolder">문의하기</h1>
                    <p class="lead fw-normal text-muted mb-0">문제를 신속하게 해결할 수 있도록 노력하겠습니다.</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6">
                        <form id="contactForm" method="post" action="<c:url value='/contact/processContact.jsp'/>">
                            <!-- 이름 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="name" name="name" type="text" placeholder="이름" required />
                                <label for="name">이름</label>
                                <div class="invalid-feedback">이름을 입력해주세요.</div>
                            </div>
                            <!-- 이메일 input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="email" name="email" type="email" placeholder="name@example.com" required />
                                <label for="email">이메일</label>
                                <div class="invalid-feedback">답장받을 이메일을 입력해주세요.</div>
                            </div>
                            <!-- 제목 input -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="title" name="title" type="text" placeholder="제목" required />
                                <label for="title">제목</label>
                                <div class="invalid-feedback">제목을 입력해주세요.</div>
                            </div>
                            <!-- 문의내용 input-->
                            <div class="form-floating mb-3">
                                <textarea class="form-control" id="message" name="message" type="text" placeholder="문의 내용" style="height: 10rem" required></textarea>
                                <label for="message">문의내용</label>
                                <div class="invalid-feedback">문의내용을 입력해주세요.</div>
                            </div>
                            <!-- 제출 성공 -->
                            <div class="d-none" id="submitSuccessMessage">
                                <div class="text-center mb-3">
                                    <div class="fw-bolder">제출 완료하였습니다.</div>
                                </div>
                            </div>
                            <!-- 제출 실패 -->
                            <div class="d-none" id="submitErrorMessage">
                                <div class="text-center text-danger mb-3">제출 오류</div>
                            </div>
                            <!-- Submit Button-->
                            <div class="d-grid">
                                <button class="btn btn-primary btn-lg" id="submitButton" type="submit">제출</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- Contact cards-->
            <div class="row gx-5 row-cols-2 row-cols-lg-4 py-5">
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-chat-dots"></i></div>
                    <div class="h5 mb-2">채팅상담</div>
                    <p class="text-muted mb-0">사이트의 관리자와 실시간으로 상담하세요.</p>
                </div>
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-people"></i></div>
                    <div class="h5">커뮤니티에 질문하기</div>
                    <p class="text-muted mb-0">커뮤니티를 둘러보고 다른 사용자들과 소통하세요.</p>
                </div>
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-question-circle"></i></div>
                    <div class="h5">지원 센터</div>
                    <p class="text-muted mb-0"><a href="<c:url value='/footer/faq.jsp'/>">FAQ</a>를 보고 문제를 해결해보세요.</p>
                </div>
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-telephone"></i></div>
                    <div class="h5">전화상담</div>
                    <p class="text-muted mb-0">근무 시간(9:00~18:00)에 010-1234-5678으로 전화주세요.</p>
                </div>
            </div>
        </div>
    </section>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
