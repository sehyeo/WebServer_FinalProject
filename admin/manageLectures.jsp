<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
<title>강의 목록</title>
<style>
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        border: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
<script type="text/javascript">
    function confirmDelete(lectureName) {
        if (confirm("강의를 삭제하시겠습니까?")) {
            window.location.href = '../lecture/deleteLecture.jsp?lecture=' + encodeURIComponent(lectureName);
        }
    }
</script>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
    <%!
        	String lectures = "강의 목록";
	%>	
<br />
	<div class="container">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h1><%=lectures%></h1>
            <a class="btn btn-primary" href="<c:url value='/lecture/addLecture.jsp'/>">등록하기</a>
        </div>
        <br />
<table>
    <tr>
        <th>강의명</th>
        <th>카테고리</th>
        <th>강의 소개</th>
        <th>업로드 날짜</th>
        <th>작업</th>
    </tr>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
            String sql = "SELECT * FROM lecture";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
    %>
    <tr>
        <td><a href="../lecture/lectureDetail.jsp?lecture=<%= rs.getString("l_lectureName") %>"><%= rs.getString("l_lectureName") %></a></td>
        <td><%= rs.getString("l_category") %></td>
        <td><%= rs.getString("l_description") %></td>
        <td><%= rs.getString("l_uploadDate") %></td>
        <td>
            <a class="btn btn-success btn-sm" href="../lecture/updateLecture.jsp?lecture=<%= rs.getString("l_lectureName") %>">수정</a>
            <a class="btn btn-danger btn-sm" href="javascript:void(0);" onclick="confirmDelete('<%= rs.getString("l_lectureName") %>')">삭제</a>
        </td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    %>
</table>
</div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
