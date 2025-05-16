<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <title>알림 설정</title>
    <style>
        .notification-option {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px;
            background: #f8f9fa;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        .notification-option h5 {
            margin: 0;
        }
        .notification-option p {
            margin: 0;
            font-size: 14px;
            color: #6c757d;
        }
        .notification-option .form-check-input {
            width: 40px;
            height: 20px;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <h1>알림 설정</h1>
        <form id="notificationForm">
            <div class="notification-option">
                <div>
                    <h5>공지사항</h5>
                    <p>중요한 공지사항, 기능 업데이트 등 새로운 L!FE 소식을 받을 수 있어요.</p>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" checked />
                </div>
            </div>
            <div class="notification-option">
                <div>
                    <h5>강의 새소식</h5>
                    <p>수강 중인 강의의 지식공유자가 보내는 강의 새소식 알림을 받을 수 있어요.</p>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" checked />
                </div>
            </div>
            <div class="notification-option">
                <div>
                    <h5>커뮤니티 댓글</h5>
                    <p>작성한 게시글의 댓글, 대댓글이 등록될 때 알림을 받을 수 있어요.</p>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" checked />
                </div>
            </div>
            <div class="notification-option">
                <div>
                    <h5>L!FE 소식 및 홍보</h5>
                    <p>할인, 이벤트, 강의추천 등 유용한 정보를 알려주는 소식을 받을 수 있어요.</p>
                </div>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" checked />
                </div>
            </div>
        </form>
    </div>
</main>
<jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
