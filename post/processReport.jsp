<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>신고 접수 결과</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
<br />
    <div class="container">
        <h1>신고 접수 결과</h1>
        <%
            String lectureTitle = request.getParameter("lectureTitle");
            String filename = request.getParameter("filename");
            String reason = request.getParameter("reason");
            String otherReason = request.getParameter("otherReason");

            if (lectureTitle != null && filename != null && reason != null && !lectureTitle.trim().equals("") && !filename.trim().equals("") && !reason.trim().equals("")) {
                // 신고 내용을 파일에 저장
                String reportDirectory = "D:\\reports"; // D드라이브의 reports 폴더 경로에 신고 내용이 저장됨.
                File dir = new File(reportDirectory);
                if (!dir.exists()) { // 디렉터리가 존재하지 않으면 mkdirs() 명령어를 사용하여 디렉터리를 생성해줌.
                    dir.mkdirs();
                }
                String reportFileName = "report_" + System.currentTimeMillis() + ".txt";
                File reportFile = new File(dir, reportFileName);
                try (BufferedWriter writer = new BufferedWriter(new FileWriter(reportFile))) {
                    writer.write("Lecture Title: " + lectureTitle);
                    writer.newLine();
                    writer.write("Filename: " + filename);
                    writer.newLine();
                    if ("기타".equals(reason) && otherReason != null && !otherReason.trim().equals("")) {
                        writer.write("Reason: " + otherReason);
                    } else {
                        writer.write("Reason: " + reason);
                    }
                    writer.newLine();
                    writer.write("Report Time: " + new Date().toString());
                    writer.newLine();
                } catch (IOException e) {
                    out.println("<p>신고를 처리하는 중 오류가 발생했습니다: " + e.getMessage() + "</p>");
                }
        %>
        <p>신고가 접수되었습니다.</p>
        <%
            } else {
        %>
        <p>모든 필드를 작성해주세요.</p>
        <%
            }
        %>
        <a class="btn btn-primary" href="<c:url value='/lecture/lectures.jsp'/>">강의 목록으로 돌아가기</a>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
