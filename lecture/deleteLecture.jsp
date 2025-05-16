<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
    String lectureName = request.getParameter("lecture");
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
        String sql = "DELETE FROM lecture WHERE l_lectureName = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, lectureName);
        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
            out.println("강의가 성공적으로 삭제되었습니다.");
        } else {
            out.println("일치하는 강의가 없습니다.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }

    response.sendRedirect("../admin/manageLectures.jsp");
%>
