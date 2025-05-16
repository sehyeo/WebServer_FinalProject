<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="dto.Lecture" %>
<%@ page import="dao.LectureRepository" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>강의 상세정보</title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
    <style>
        .container {
            margin: 0 auto;
        }
        .card {
            position: relative;
            margin-bottom: 15px;
        }
        .card h5 {
            font-size: 24px;
        }
        .card p {
            margin-bottom: 10px;
        }
        .btn-primary {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-cart, .btn-report, .btn-wishlist {
            position: absolute;
            top: 10px;
            padding: 5px 10px;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            z-index: 1; /* Ensure it is on top */
        }
        .btn-cart {
            right: 10px;
            background-color: #28a745;
        }
        .btn-report {
            right: 80px;
            background-color: #dc3545;
        }
        .btn-wishlist {
            right: 180px;
            background-color: #ff69b4;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <br />
    <div class="container">
        <h1>강의 상세정보</h1>
        <%
            String selectedLecture = request.getParameter("lecture");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
                String sql = "SELECT * FROM lecture WHERE l_lectureName = ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, selectedLecture);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String lectureName = rs.getString("l_lectureName");
                    String category = rs.getString("l_category");
                    String description = rs.getString("l_description");
                    String unitPrice = rs.getString("l_unitPrice");
                    String filename = rs.getString("l_filename");
                    String uploadDate = rs.getString("l_uploadDate");
        %>
        <%
            LectureRepository dao = LectureRepository.getInstance();
            Lecture lecture = dao.getLectureByLectureNameAndFilename(lectureName, filename);
        %>
        <form name="addForm" action="../cart/addCart.jsp" method="post">
            <input type="hidden" name="lecture" value="<%= lectureName %>">
            <input type="hidden" name="filename" value="<%= filename %>">
            <div class="card mb-3">
                <div class="card-body">
                    <h5 class="card-title"><%= lectureName %></h5>
                    <p class="card-text">카테고리: <%= category %></p>
                    <p class="card-text">설명: <%= description %></p>
                    <p class="card-text">가격: <%= unitPrice %>원</p>
                    <p class="card-text">업로드 날짜: <%= uploadDate %></p>
                    <video controls width="100%">
                        <source src="<%= request.getContextPath() + "/uploadVideo/" + filename %>" type="video/mp4">
                        동영상을 지원하지 않는 브라우저입니다.
                    </video>
                    <button type="button" class="btn-wishlist" onclick="addToWishlist('<%= lectureName %>', '<%= category %>')">❤️</button>
                    <button type="button" class="btn-report" onclick="reportLecture('<%= lectureName %>', '<%= filename %>')">신고하기</button>
                    <button type="button" class="btn-cart btn btn-info" onclick="addToCart('<%= lectureName %>', '<%= filename %>')">담기</button>
                </div>
            </div>
        </form>
        <%
                } else {
        %>
        <p>선택한 강의를 찾을 수 없습니다.</p>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("데이터베이스 오류: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
<script>
    function addToCart(lectureName, filename) {
        if (confirm("이 강의를 장바구니에 추가하시겠습니까?")) {
            document.addForm.action = "../cart/addCart.jsp";
            document.addForm.submit();
        }
    }

    function reportLecture(title, filename) {
        window.location.href = "../post/report.jsp?lecture=" + encodeURIComponent(title) + "&filename=" + encodeURIComponent(filename);
    }

    function addToWishlist(lectureName, category) {
        window.location.href = "../wish/addWishlist.jsp?lectureName=" + encodeURIComponent(lectureName) + "&category=" + encodeURIComponent(category);
    }
</script>
</body>
</html>
