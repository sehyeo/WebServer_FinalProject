<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String userId = (String) session.getAttribute("user_id");

    if (userId == null || userId.trim().equals("")) {
        response.sendRedirect("cart.jsp");
        return;
    }

    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
        String sql = "DELETE FROM cart WHERE user_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.executeUpdate();

        pstmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    response.sendRedirect("cart.jsp");
%>
