<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <title>검색 결과</title>
</head>
<body>
    <h1>검색 결과</h1>
    <%
        String query = request.getParameter("query");
        if (query != null && !query.trim().isEmpty()) {
            // 데이터베이스 연결 정보
            String url = "jdbc:mysql://localhost:3306/LifeDB";
            String user = "root";
            String password = "1234";

            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, user, password);

                // SQL 쿼리 작성
                String sql = "SELECT * FROM yourtable WHERE column LIKE ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, "%" + query + "%");

                rs = pstmt.executeQuery();

                if (rs.next()) {
                    out.println("<ul>");
                    do {
                        out.println("<li>" + rs.getString("column") + "</li>");
                    } while (rs.next());
                    out.println("</ul>");
                } else {
                    out.println("<p>검색 결과가 없습니다.</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>오류가 발생했습니다.</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
                if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
            }
        } else {
            out.println("<p>검색어를 입력하세요.</p>");
        }
    %>
</body>
</html>
