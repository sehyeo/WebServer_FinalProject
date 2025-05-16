<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의 상세</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <h1 class="text-center">문의 상세</h1>
        <br />
        <%
            String contactFiles = request.getParameter("file");
            if (contactFiles != null) {
                File contactFile = new File("D:\\contacts", contactFiles);
                if (contactFile.exists()) {
                    try (BufferedReader br = new BufferedReader(new FileReader(contactFile))) {
                        String title = br.readLine().split(": ")[1];
                        String name = br.readLine().split(": ")[1];
                        String email = br.readLine().split(": ")[1];
                        String message = br.readLine().split(": ")[1];
                        String contactTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(contactFile.lastModified()));
        %>
        <div class="mb-3">
            <label class="form-label">문의 제목</label>
            <p class="form-control"><%= title %></p>
        </div>
        <div class="mb-3">
            <label class="form-label">작성자</label>
            <p class="form-control"><%= name %></p>
        </div>
        <div class="mb-3">
            <label class="form-label">이메일</label>
            <p class="form-control"><%= email %></p>
        </div>
        <div class="mb-3">
            <label class="form-label">내용</label>
            <p class="form-control"><%= message %></p>
        </div>
        <div class="mb-3">
            <label class="form-label">접수 시간</label>
            <p class="form-control"><%= contactTime %></p>
        </div>
        <br />
        <a class="btn btn-success" href="#" id="replyButton">답변하기</a>
        <form id="replyForm" method="post" action="sendReply.jsp" style="display:none;">
            <input type="hidden" name="contactFile" value="<%= contactFiles %>">
            <div class="mb-3">
                <label class="form-label">답변 제목</label>
                <input type="text" class="form-control" name="replyTitle" required>
            </div>
            <div class="mb-3">
                <label class="form-label">답변 내용</label>
                <textarea class="form-control" name="replyContent" rows="5" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary">전송하기</button>
        </form>
        <script>
            document.getElementById('replyButton').addEventListener('click', function() {
                document.getElementById('replyForm').style.display = 'block';
            });
        </script>
        <%
                    } catch (IOException e) {
                        out.println("<p>문의 내용을 읽는 중 오류가 발생했습니다: " + e.getMessage() + "</p>");
                    }
                } else {
                    out.println("<p>해당 문의 내역을 찾을 수 없습니다.</p>");
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
