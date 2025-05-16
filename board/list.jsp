<!-- list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시물 목록</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <h1>게시물 목록</h1>
        <div class="table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="board" items="${boardlist}">
                        <tr>
                            <td>${board.num}</td>
                            <td><a href="<c:url value='/BoardViewAction.do?num=${board.num}&pageNum=${pageNum}' />">${board.subject}</a></td>
                            <td>${board.name}</td>
                            <td>${board.regist_day}</td>
                            <td>${board.hit}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="<c:url value='/BoardWriteForm.do' />" class="btn btn-primary">글쓰기</a>
        </div>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
