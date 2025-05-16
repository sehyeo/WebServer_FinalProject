<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>위시리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <style>
        .card {
            margin-bottom: 15px;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <h1>위시리스트</h1>
        <%
            String userId = (String) session.getAttribute("user_id");
            if (userId != null) {
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                List<Map<String, String>> wishlist = new ArrayList<>();

                try {
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
                    String sql = "SELECT * FROM wishlist WHERE user_id = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, userId);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        Map<String, String> item = new HashMap<>();
                        item.put("lectureName", rs.getString("lecture_name"));
                        item.put("category", rs.getString("category"));
                        wishlist.add(item);
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }

                if (!wishlist.isEmpty()) {
        %>
        <div class="row">
            <%
                for (Map<String, String> item : wishlist) {
                    String lectureName = item.get("lectureName");
                    String category = item.get("category");
            %>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%= lectureName %></h5>
                        <p class="card-text">카테고리: <%= category %></p>
                        <a class="btn btn-primary" href="../lecture/lectureDetail.jsp?lecture=<%= lectureName %>">자세히 보기</a>
                        <button class="btn btn-danger" onclick="removeFromWishlist('<%= lectureName %>', '<%= category %>')">삭제</button>
                    </div>
                </div>
            </div>
            <%
                }
            %>
        </div>
        <%
                } else {
        %>
        <p>위시리스트에 강의가 없습니다.</p>
        <%
                }
            } else {
        %>
        <p>로그인이 필요합니다.</p>
        <%
            }
        %>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
<script>
    function removeFromWishlist(lectureName, category) {
        if (confirm("위시리스트에서 이 강의를 삭제하시겠습니까?")) {
            window.location.href = "removeWishlist.jsp?lectureName=" + encodeURIComponent(lectureName) + "&category=" + encodeURIComponent(category);
        }
    }
</script>
</body>
</html>
