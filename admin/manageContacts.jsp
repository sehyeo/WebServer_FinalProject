<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>문의 내역 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2 !important;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <c:choose>
            <c:when test="${param.message == 'replySuccess'}">
                <h2 class="text-success">답변을 완료하였습니다</h2>
                <br />
                <a class="btn btn-primary" href="<c:url value='/admin/manageContacts.jsp'/>">문의 목록으로 돌아가기</a>
            </c:when>
            <c:otherwise>
                <h1 class="text-center">문의 내역 관리</h1>
                <br />
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>이름</th>
                            <th>이메일</th>
                            <th>문의 시간</th>
                            <th>처리 상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String contactDirectory = "D:\\contacts";
                            File dir = new File(contactDirectory);
                            if (dir.exists() && dir.isDirectory()) {
                                File[] contactFiles = dir.listFiles((d, name) -> name.startsWith("contact_") && name.endsWith(".txt"));
                                Arrays.sort(contactFiles); // 파일을 정렬하여 순서대로 출력
                                if (contactFiles != null && contactFiles.length > 0) {
                                    for (File contactFile : contactFiles) {
                                        try (BufferedReader reader = new BufferedReader(new FileReader(contactFile))) {
                                            String contactTitle = reader.readLine().split(": ")[1];
                                            String name = reader.readLine().split(": ")[1];
                                            String email = reader.readLine().split(": ")[1];
                                            String contactTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(contactFile.lastModified()));
                                            
                                            String contactFileName = contactFile.getName();
                                            // Check if there is a corresponding reply file
                                            File replyFile = new File("D:\\replies\\reply_" + contactFileName.substring(8));
                                            boolean isReplied = replyFile.exists();
                        %>
                        <tr>
                            <td><a href="contactDetail.jsp?file=<%= contactFileName %>"><%= contactTitle %></a></td>
                            <td><%= name %></td>
                            <td><%= email %></td>
                            <td><%= contactTime %></td>
                            <td><%= isReplied ? "O" : "X" %></td>
                        </tr>
                        <%
                                        } catch (IOException e) {
                                            out.println("<tr><td colspan='5'>파일을 읽는 중 오류가 발생했습니다: " + e.getMessage() + "</td></tr>");
                                        }
                                    }
                                } else {
                        %>
                        <tr>
                            <td colspan="5">문의 내역이 없습니다.</td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="5">문의 폴더가 존재하지 않습니다.</td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <br />
                <a class="btn btn-primary" href="<c:url value='/admin/adminPage.jsp'/>">관리자 페이지로 돌아가기</a>
            </c:otherwise>
        </c:choose>
    </div>
</main>
<br />
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
