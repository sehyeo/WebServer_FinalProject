<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link href=<c:url value='/resources/css/board.css'/> rel="stylesheet" />
<title>탈퇴 전 확인</title>
<style>
    .notice {
        border: 1px solid #ddd;
        padding: 20px;
        border-radius: 5px;
        background-color: #f9f9f9;
    }
    .notice h2 {
        font-size: 24px;
        color: #d9534f;
    }
    .notice ul {
        list-style-type: none;
        padding: 0;
    }
    .notice li {
        margin-bottom: 10px;
        font-size: 16px;
    }
    .notice .important {
        color: #d9534f;
    }
    .notice .emphasis {
        color: #007bff;
    }
</style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <div class="container">
        <div class="notice">
            <h2>탈퇴 안내 사항</h2>
            <p>서비스에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요? 그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요! 감사합니다. 🙏</p>
            <h3>유의사항</h3>
            <ul>
                <li class="important">1. 계정 탈퇴 시, L!FE와 관련 서비스에서 모두 탈퇴됩니다.</li>
                <li>2. 탈퇴 시 계정과 관련된 모든 권한이 사라지며 복구할 수 없습니다.</li>
                <li>3. 직접 작성한 콘텐츠(동영상, 게시글, 댓글 등)는 자동으로 삭제되지 않으며, 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.</li>
                <li>4. 탈퇴 후 동일한 아이디로 재가입이 가능하나, 탈퇴한 계정과 연동되지 않습니다.</li>
                <li>5. 현재 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.</li>
            </ul>
            <div class="d-grid"><a class="btn btn-outline-primary" href="deleteUser.jsp">탈퇴하기</a></div>
        </div>
    </div>
</main>
<jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
