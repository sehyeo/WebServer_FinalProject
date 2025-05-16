<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="dto.Lecture" %>
<%@ page import="dao.LectureRepository" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String lectureTitle = request.getParameter("lecture");
    String filename = request.getParameter("filename");
    String sessionId = session.getId();
    String userId = (String) session.getAttribute("user_id");  // 사용자 ID 가져오기
    
    if (lectureTitle == null || filename == null || lectureTitle.trim().equals("") || filename.trim().equals("")) {
        response.sendRedirect("../lecture/lectures.jsp");
        return;
    }

    LectureRepository dao = LectureRepository.getInstance();
    Lecture lecture = dao.getLectureByLectureNameAndFilename(lectureTitle, filename);
    if (lecture == null) {
        response.sendRedirect("../exceptionNoLectureId.jsp");
        return;
    }

    try {
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");
        String sql = "SELECT * FROM cart WHERE user_id = ? AND lectureName = ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userId);
        pstmt.setString(2, lectureTitle);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            sql = "UPDATE cart SET quantity = quantity + 1 WHERE user_id = ? AND lectureName = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            pstmt.setString(2, lectureTitle);
            pstmt.executeUpdate();
        } else {
            sql = "INSERT INTO cart (session_id, user_id, lectureName, category, description, filename, unitPrice, quantity, uploadDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, sessionId);
            pstmt.setString(2, userId);
            pstmt.setString(3, lecture.getLectureName());
            pstmt.setString(4, lecture.getCategory());
            pstmt.setString(5, lecture.getDescription());
            pstmt.setString(6, lecture.getFilename());
            pstmt.setInt(7, lecture.getUnitPrice());
            pstmt.setInt(8, 1); // 처음 담을 때는 수량 1로 설정
            pstmt.setString(9, lecture.getUploadDate());
            pstmt.executeUpdate();
        }

        rs.close();
        pstmt.close();
        conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }

    response.sendRedirect("../cart/cart.jsp");
%>
