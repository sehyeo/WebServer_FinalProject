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
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
    <%!
        	String lectures = "강의 목록";
	%>	
<br />
	<div class="container">
        <h1><%=lectures%>
        <%
                    String selectedCategory = request.getParameter("category");
                    if (selectedCategory != null && !selectedCategory.isEmpty() && !selectedCategory.equals("전체")) {
                        out.print(" - " + selectedCategory);
                    }
        %>
        </h1><br />
        <form method="get" action="lectures.jsp">
            <label for="category">카테고리:</label>
            <select name="category" id="category">
                <option value="전체">전체</option>
                <option value="운동" <%= "운동".equals(selectedCategory) ? "selected" : "" %>>운동</option>
                <option value="요리" <%= "요리".equals(selectedCategory) ? "selected" : "" %>>요리</option>
                <option value="기타" <%= "기타".equals(selectedCategory) ? "selected" : "" %>>기타</option>
            </select>
            <button type="submit">필터</button>
        </form>
        <br />
<table>
    <tr>
        <th>강의명</th>
        <th>카테고리</th>
        <th>강의 소개</th>
        <th>업로드 날짜</th>
    </tr>
    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
            String sql;
            if (selectedCategory != null && !selectedCategory.isEmpty() && !selectedCategory.equals("전체")) {
                sql = "SELECT * FROM lecture WHERE l_category = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, selectedCategory);
            } else {
                sql = "SELECT * FROM lecture";
                pstmt = conn.prepareStatement(sql);
            }
            rs = pstmt.executeQuery();

            while (rs.next()) {
    %>
    <tr>
        <td><a href="lectureDetail.jsp?lecture=<%= rs.getString("l_lectureName") %>"><%= rs.getString("l_lectureName") %></a></td>
        <td><%= rs.getString("l_category") %></td>
        <td><%= rs.getString("l_description") %></td>
        <td><%= rs.getString("l_uploadDate") %></td>
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
