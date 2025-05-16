<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>신고 상세</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <h1 class="text-center">신고 상세</h1>
        <br />
        <%
            String reportFileName = request.getParameter("file");
            if (reportFileName != null) {
                File reportFile = new File("D:\\reports", reportFileName);
                if (reportFile.exists()) {
                    try (BufferedReader br = new BufferedReader(new FileReader(reportFile))) {
                        String lectureTitle = br.readLine().split(": ")[1];
                        String filename = br.readLine().split(": ")[1];
                        String reason = br.readLine().split(": ")[1];
                        String reportTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(reportFile.lastModified()));
        %>
        <div class="mb-3">
            <label class="form-label">강의 제목</label>
            <p class="form-control"><%= lectureTitle %></p>
        </div>
        <div class="mb-3">
            <label class="form-label">파일 이름</label>
            <p class="form-control"><%= filename %></p>
        </div>
        <div class="mb-3">
            <label class="form-label">신고 사유</label>
            <p class="form-control"><%= reason %></p>
        </div>
        <div class="mb-3">
            <label class="form-label">신고 시간</label>
            <p class="form-control"><%= reportTime %></p>
        </div>
        <br />
        <a class="btn btn-danger" href="#">해당 게시물 삭제</a>
        <a class="btn btn-primary" href="<c:url value='/admin/manageReports.jsp'/>">신고 목록으로 돌아가기</a>
        <%
                    } catch (IOException e) {
                        out.println("<p>신고 내용을 읽는 중 오류가 발생했습니다: " + e.getMessage() + "</p>");
                    }
                } else {
                    out.println("<p>해당 신고 내역을 찾을 수 없습니다.</p>");
                }
            } else {
                out.println("<p>잘못된 요청입니다.</p>");
            }
        %>
    </div>
</main>
<br />
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
