<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>신고 내역 관리</title>
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
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
        <h1 class="text-center">신고 내역 관리</h1>
        <br />
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>강의 제목</th>
                    <th>파일 이름</th>
                    <th>신고 시간</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String reportDirectory = "D:\\reports"; // 신고 내용이 저장된 디렉토리
                    File dir = new File(reportDirectory);
                    File[] reportFiles = dir.listFiles((d, name) -> name.startsWith("report_") && name.endsWith(".txt"));
                    Arrays.sort(reportFiles); // 파일을 정렬하여 순서대로 출력

                    if (reportFiles != null && reportFiles.length > 0) {
                    	
                        for (File reportFile : reportFiles) {
                            try (BufferedReader br = new BufferedReader(new FileReader(reportFile))) {
                                String lectureTitle = br.readLine().split(": ")[1];
                                String filename = br.readLine().split(": ")[1];
                                String reason = br.readLine().split(": ")[1];
                                String reportTime = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date(reportFile.lastModified()));
                                
                                String reportFileName = reportFile.getName();
                %>
                <tr>
                    <td><a href="reportDetail.jsp?file=<%= reportFileName %>"><%= lectureTitle %></a></td>
                    <td><%= filename %></td>
                    <td><%= reportTime %></td>
                </tr>
                <%
                            } catch (IOException e) {
                                e.printStackTrace();
                            }
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3">신고 내역이 없습니다.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <br />
        <a class="btn btn-primary" href="<c:url value='/admin/adminPage.jsp'/>">관리자 페이지로 돌아가기</a>
    </div>
</main>
<br />
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
