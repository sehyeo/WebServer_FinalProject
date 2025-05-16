<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    request.setCharacterEncoding("UTF-8");

    String realFolder = application.getRealPath("/resources/assets");
    String encType = "utf-8";
    int maxSize = 50 * 1024 * 1024; // 50MB로 파일 크기 제한

    // 디렉토리가 존재하지 않으면 생성
    File uploadDir = new File(realFolder);
    if (!uploadDir.exists()) {
        uploadDir.mkdirs();
    }

    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType);

    String lectureName = multi.getParameter("lectureName");
    String category = multi.getParameter("category");
    String description = multi.getParameter("description");
    String unitPrice = multi.getParameter("unitPrice");
    String existingFilename = multi.getParameter("existingFilename");
    String uploadDate = new SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date());

    Enumeration<?> files = multi.getFileNames();
    String fname = (String) files.nextElement();
    String fileName = multi.getFilesystemName(fname);

    // 파일명에 타임스탬프 추가
    if (fileName != null) {
        String fileExt = fileName.substring(fileName.lastIndexOf("."));
        String fileBaseName = fileName.substring(0, fileName.lastIndexOf("."));
        String newFileName = fileBaseName + "_" + System.currentTimeMillis() + fileExt;
        File oldFile = new File(realFolder + "/" + fileName);
        File newFile = new File(realFolder + "/" + newFileName);
        oldFile.renameTo(newFile);
        fileName = newFileName;
    } else {
        fileName = existingFilename; // 새 파일이 없으면 기존 파일명을 사용
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/LifeDB", "root", "1234");

        String sql = "UPDATE lecture SET l_category=?, l_description=?, l_unitPrice=?, l_filename=?, l_uploadDate=? WHERE l_lectureName=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, category);
        pstmt.setString(2, description);
        pstmt.setString(3, unitPrice);
        pstmt.setString(4, fileName);
        pstmt.setString(5, uploadDate);
        pstmt.setString(6, lectureName);
        
        pstmt.executeUpdate();
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }

    response.sendRedirect("../admin/manageLectures.jsp?edit=update");
%>
