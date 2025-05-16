<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href=<c:url value='/resources/css/board.css'/> rel="stylesheet" />
<style>
    .settings-option {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 5px;
            margin-bottom: 15px;
            border: 1px solid #e0e0e0;
            text-decoration: none;
            color: #000;
        }
        .settings-option h5 {
            margin: 0;
            font-size: 18px;
        }
        .settings-option p {
            margin: 0;
            font-size: 14px;
            color: #6c757d;
        }
        .settings-option .arrow {
            font-size: 18px;
            color: #6c757d;
        }
</style>
<title>계정 찾기</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
	<br />
	<h2 class="text-center">계정을 분실하셨나요?</h2>
	<br />
	<div class="container">
		<a class="settings-option" href="<c:url value='/user/findId.jsp'/>">
			<div>
				<h5>아이디 찾기</h5>
				<p>회원의 휴대폰 번호를 인증합니다.</p>
			</div>
			<div class="arrow">&gt;</div>
		</a>
		<a class="settings-option" href="<c:url value='/user/findPw.jsp'/>">
            <div>
                <h5>비밀번호 찾기</h5>
                <p>이메일을 입력하여 비밀번호 변경 링크를 전송합니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
	</main>
		<jsp:include page="/footer.jsp" />  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>