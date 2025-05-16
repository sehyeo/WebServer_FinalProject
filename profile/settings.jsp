<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <title>설정</title>
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
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <a class="settings-option" href="<c:url value='/user/updateUser.jsp'/>">
            <div>
                <h5>계정 정보 수정하기</h5>
                <p>회원가입 시 작성했던 정보를 수정합니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
        <a class="settings-option" href="<c:url value='/profile/notification.jsp'/>">
            <div>
                <h5>알림 설정</h5>
                <p>알림 설정을 변경합니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
        <a class="settings-option" href="<c:url value='/user/deleteUserConfirm.jsp'/>">
            <div>
                <h5>탈퇴하기</h5>
                <p>더 이상 사이트를 이용할 수 없게 됩니다.</p>
            </div>
            <div class="arrow">&gt;</div>
        </a>
    </div>
</main>
<jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
