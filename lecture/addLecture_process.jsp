<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>

<%
    PreparedStatement pstmt = null;

    try {
        // 동영상 파일 저장 디렉토리
        String saveDirectory = "D:\\uploadVideo";

        // 최대 업로드 파일 크기 설정 (예: 100MB)
        int maxPostSize = 100 * 1024 * 1024;

        // MultipartRequest 객체 생성
        MultipartRequest multi = new MultipartRequest(request, saveDirectory, maxPostSize, "utf-8", new DefaultFileRenamePolicy());

        // 폼 필드 출력
        String lectureName = multi.getParameter("lectureName");
        String category = multi.getParameter("category");
        String description = multi.getParameter("description");
        String unitPrice = multi.getParameter("unitPrice");

        // 현재 날짜 가져오기
        String uploadDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

        // 파일 정보 출력
        Enumeration<?> files = multi.getFileNames();
        while (files.hasMoreElements()) {
            String fileParam = (String) files.nextElement();
            String filename = multi.getFilesystemName(fileParam);
            String original = multi.getOriginalFileName(fileParam);
            String type = multi.getContentType(fileParam);
            File file = multi.getFile(fileParam);

            if (file != null) {
                // 강의 정보를 데이터베이스에 삽입
                String sql = "INSERT INTO lecture (l_lectureName, l_category, l_description, l_unitPrice, l_filename, l_uploadDate) VALUES (?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, lectureName);
                pstmt.setString(2, category);
                pstmt.setString(3, description);
                pstmt.setString(4, unitPrice);
                pstmt.setString(5, filename);
                pstmt.setString(6, uploadDate);
                pstmt.executeUpdate();
            }
        }

        // lectures.jsp로 리디렉션
        response.sendRedirect("../admin/manageLectures.jsp");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("데이터베이스 오류: " + e.getMessage());
    } catch (IOException e) {
        e.printStackTrace();
        out.println("파일 업로드 오류: " + e.getMessage());
    } catch (Exception e) {
        e.printStackTrace();
        out.println("오류: " + e.getMessage());
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
