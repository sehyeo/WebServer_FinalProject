<!-- view.jsp -->
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="mvc.model.BoardDTO"%>

<%
    BoardDTO board = (BoardDTO) request.getAttribute("board");
    int num = ((Integer) request.getAttribute("num")).intValue();
    int nowpage = ((Integer) request.getAttribute("page")).intValue();
%>
<html>
<head>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <title>게시글 보기</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <div class="container">
        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">게시판</h1>
                <p class="col-md-8 fs-4">Board</p>
            </div>
        </div>
        <div class="row align-items-md-stretch text-center">
            <form name="newUpdate" action="<c:url value='/BoardUpdateAction.do?num=${board.num}&pageNum=${nowpage}' />" method="post">
                <div class="mb-3 row">
                    <label class="col-sm-2 control-label">성명</label>
                    <div class="col-sm-3">
                        <input name="name" class="form-control" value="${board.name}" readonly>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 control-label">제목</label>
                    <div class="col-sm-5">
                        <input name="subject" class="form-control" value="${board.subject}">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 control-label">내용</label>
                    <div class="col-sm-8" style="word-break: break-all;">
                        <textarea name="content" class="form-control" cols="50" rows="5">${board.content}</textarea>
                    </div>
                </div>
                <div class="mb-3 row">
                    <div class="col-sm-offset-2 col-sm-10">
                        <c:set var="userId" value="${board.id}" />
                        <c:if test="${sessionScope.sessionId == userId}">
                            <p>
                                <a href="<c:url value='/BoardDeleteAction.do?num=${board.num}&pageNum=${nowpage}' />" class="btn btn-danger">삭제</a>
                                <input type="submit" class="btn btn-success" value="수정">
                            </p>
                        </c:if>
                        <a href="<c:url value='/BoardListAction.do' />" class="btn btn-secondary">목록으로 돌아가기</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
