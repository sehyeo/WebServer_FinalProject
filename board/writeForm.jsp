<!-- writeForm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name = (String) session.getAttribute("name");
    String sessionId = (String) session.getAttribute("sessionId");
%>
<html>
<head>
    <title>게시물 작성</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <h1>게시물 작성</h1>
        <form action="<c:url value='/BoardWriteAction.do' />" method="post">
            <input type="hidden" name="id" value="${sessionId}">
            <div class="form-group">
                <label for="name">작성자:</label>
                <input type="text" id="name" name="name" class="form-control">
            </div>
            <div class="form-group">
                <label for="subject">제목:</label>
                <input type="text" id="subject" name="subject" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="content">내용:</label>
                <textarea id="content" name="content" class="form-control" required></textarea>
            </div>
            <br />
            <button type="submit" class="btn btn-primary">글 등록</button>
        </form>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
