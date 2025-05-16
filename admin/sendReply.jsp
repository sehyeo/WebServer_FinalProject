<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String contactFile = request.getParameter("contactFile");
    String replyTitle = request.getParameter("replyTitle");
    String replyContent = request.getParameter("replyContent");

    if (contactFile == null || contactFile.isEmpty()) {
        out.println("<p>잘못된 요청입니다. 문의 파일 정보가 누락되었습니다.</p>");
        return;
    }

    String replyDirectory = "D:\\replies";
    File replyDir = new File(replyDirectory);
    if (!replyDir.exists()) {
        replyDir.mkdirs();
    }

    String replyFileName = "reply_" + contactFile.substring(8); // Use the timestamp part of the contact file name
    File replyFile = new File(replyDir, replyFileName);

    try (BufferedWriter writer = new BufferedWriter(new FileWriter(replyFile))) {
        writer.write("Title: " + replyTitle + "\n");
        writer.write("Content: " + replyContent + "\n");
        writer.write("Reply Time: " + new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) + "\n");
    } catch (IOException e) {
        e.printStackTrace();
        out.println("<p>답변 저장 중 오류가 발생했습니다: " + e.getMessage() + "</p>");
        return;
    }

    // Redirect to manageContacts.jsp with a success message
    response.sendRedirect("manageContacts.jsp?message=replySuccess");
%>
