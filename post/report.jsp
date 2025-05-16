<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시물 신고하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
<br />
    <div class="container">
        <h1>게시물 신고하기</h1>
        <form method="post" action="<c:url value='/post/processReport.jsp'/>">
            <div class="mb-3">
                <label for="lectureTitle" class="form-label">게시물 제목</label>
                <input type="text" class="form-control" id="lectureTitle" name="lectureTitle" readonly value="<%= request.getParameter("lecture") %>">
            </div>
            <div class="mb-3">
                <label for="filename" class="form-label">파일 이름</label>
                <input type="text" class="form-control" id="filename" name="filename" readonly value="<%= request.getParameter("filename") %>">
            </div>
            <div class="mb-3">
                <label for="reason" class="form-label">해당 게시글을 신고하는 이유를 알려주세요</label>
				<div class="form-check">
                    <input class="form-check-input" type="radio" name="reason" id="reasonSpam" value="스팸/홍보/도배글입니다" onclick="toggleOtherReason(false)">
                    <label class="form-check-label" for="reasonSpam">스팸/홍보/도배글입니다</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reason" id="reasonAbuse" value="부적절한 내용입니다" onclick="toggleOtherReason(false)">
                    <label class="form-check-label" for="reasonInadequate">부적절한 내용입니다</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reason" id="reasonCopyright" value="저작권을 침해하였습니다" onclick="toggleOtherReason(false)">
                    <label class="form-check-label" for="reasonCopyright">저작권을 침해하였습니다</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="reason" id="reasonOther" value="기타" onclick="toggleOtherReason(true)">
                    <label class="form-check-label" for="reasonOther">기타</label>
                </div>
                <div class="mb-3" id="otherReasonContainer" style="display: none;">
                    <label for="otherReason" class="form-label">직접 작성하기</label>
                    <textarea class="form-control" id="otherReason" name="otherReason" rows="4"></textarea>
                </div>
            </div>
            <button type="submit" class="btn btn-primary">제출</button>
        </form>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
<script>
    function toggleOtherReason() {
        var otherReasonCheckbox = document.getElementById('reasonOther');
        var otherReasonContainer = document.getElementById('otherReasonContainer');
        if (otherReasonCheckbox.checked) {
            otherReasonContainer.style.display = 'block';
        } else {
            otherReasonContainer.style.display = 'none';
        }
    }
</script>
</body>
</html>
