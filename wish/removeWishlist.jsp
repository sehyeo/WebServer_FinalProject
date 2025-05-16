<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String lectureName = request.getParameter("lectureName");
    String category = request.getParameter("category");
    String userId = (String) session.getAttribute("user_id");

    if (lectureName != null && category != null && userId != null) {
        try {
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
            String sql = "DELETE FROM wishlist WHERE user_id = ? AND lecture_name = ? AND category = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, lectureName);
            pstmt.setString(3, category);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    response.sendRedirect("wishlist.jsp");
%>
