<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
<title>장바구니</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <jsp:include page="/menu.jsp" />
    <div class="container">
        <div class="p-5 mb-4 bg-body-teriary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">장바구니</h1>
                <p class="col-md-8 fs-4">Cart</p>
            </div>
        </div>

        <div class="row align-items-md-stretch">
            <div class="row">
                <table width="100%">
                    <tr>
                        <td align="left"><a href="./deleteCart.jsp?cartId=<%=session.getId()%>" class="btn btn-danger">삭제하기</a></td>
                        <td align="right"><a href="./shippingInfo.jsp?cartId=<%=session.getId()%>" class="btn btn-success">주문하기</a></td>
                    </tr>
                </table>
            </div>
            <div style="padding-top: 50px">
                <table class="table table-hover">
                    <tr>
                        <th>강의</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>소계</th>
                        <th>비고</th>
                    </tr>
                    <%
                        int sum = 0;
                        String userId = (String) session.getAttribute("user_id");  // 사용자 ID 가져오기
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;

                        try {
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
                            String sql = "SELECT * FROM cart WHERE user_id = ?";
                            pstmt = conn.prepareStatement(sql);
                            pstmt.setString(1, userId);
                            rs = pstmt.executeQuery();

                            while (rs.next()) {
                                String lectureName = rs.getString("lectureName");
                                String category = rs.getString("category");
                                int unitPrice = rs.getInt("unitPrice");
                                int quantity = rs.getInt("quantity");
                                int total = unitPrice * quantity;
                                sum += total;
                    %>
                    <tr>
                        <td><%= category %> - <%= lectureName %></td>
                        <td><%= unitPrice %></td>
                        <td><%= quantity %></td>
                        <td><%= total %></td>
                        <td><a href="./removeCart.jsp?lecture=<%= lectureName %>&filename=<%= rs.getString("filename") %>" class="badge text-bg-danger">삭제</a></td>
                    </tr>
                    <%
                            }
                            rs.close();
                            pstmt.close();
                            conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    %>
                    <tr>
                        <th></th>
                        <th></th>
                        <th>총액</th>
                        <th><%= sum %></th>
                        <th></th>
                    </tr>
                </table>
                <a href="<c:url value='/lecture/lectures.jsp'/>" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
            </div>
        </div>
    </div>
</main>
<jsp:include page="/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<c:url value='/resources/js/board.js'/>"></script>
</body>
</html>
