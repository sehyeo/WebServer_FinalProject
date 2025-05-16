<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
<title>강의 업데이트</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
<div class="container">
    <div class="p-5 mb-4 bg-body-teriary rounded-3">
        <div class="container-fluid">
            <h1 class="display-5 fw-bold">강의 수정</h1>
            <p class="col-md-8 fs-4">Lecture Update</p>
        </div>
    </div>
    <%
        String lectureName = request.getParameter("lecture");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String category = "", description = "", unitPrice = "", filename = "";

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
            String sql = "SELECT * FROM lecture WHERE l_lectureName = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, lectureName);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                category = rs.getString("l_category");
                description = rs.getString("l_description");
                unitPrice = rs.getString("l_unitPrice");
                filename = rs.getString("l_filename");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
    <form action="processUpdateLecture.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="lectureName" value="<%= lectureName %>">
        <input type="hidden" name="existingFilename" value="<%= filename %>">
        <div class="mb-3">
            <label for="category" class="form-label">카테고리</label>
            <input type="text" class="form-control" id="category" name="category" value="<%= category %>">
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">강의 소개</label>
            <textarea class="form-control" id="description" name="description" rows="3"><%= description %></textarea>
        </div>
        <div class="mb-3">
            <label for="unitPrice" class="form-label">가격</label>
            <input type="text" class="form-control" id="unitPrice" name="unitPrice" value="<%= unitPrice %>">
        </div>
        <div class="mb-3">
            <label for="filename" class="form-label">동영상 파일</label>
            <input type="file" class="form-control" id="filename" name="filename">
            <% if (filename != null && !filename.isEmpty()) { %>
                <p>현재 파일: <%= filename %></p>
            <% } %>
        </div>
        <button type="submit" class="btn btn-primary">저장</button>
    </form>
</div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
