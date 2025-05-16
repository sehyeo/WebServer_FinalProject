<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C:\\Users\\Administrator\\workspace_webServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BookMarket_JYW\\0412\\resources\\references";
	int maxSize = 5*1024*1024;	// 최대 업로드될 파일의 크기 5MB
	String encType = "utf-8";	// 인코딩 유형
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String postId=request.getParameter("postId");
	String title=request.getParameter("title");
	String author=request.getParameter("author");
	String contents=request.getParameter("contents");
	String category=request.getParameter("category");
	String hit=request.getParameter("hit");
	String releaseDate=request.getParameter("releaseDate");
	String comments=request.getParameter("comments");
	String quantity=request.getParameter("quantity");
	String hashtag=request.getParameter("hashtag");
	String reference=request.getParameter("reference");
	
	long views;
	if (hit.isEmpty())
		views=0;
	else
		views=Long.valueOf(hit);
	
	long replys;
	if (comments.isEmpty())
		replys=0;
	else
		replys=Long.valueOf(comments);
	
	long likes;
	if (quantity.isEmpty())
		likes=0;
	else
		likes=Long.valueOf(quantity);
	
	PreparedStatement pstmt = null;
	
	String sql = "INSERT INTO post VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, postId);
	pstmt.setString(2, title);
	pstmt.setString(3, author);
	pstmt.setString(4, contents);
	pstmt.setString(5, category);
	pstmt.setLong(6, views);
	pstmt.setString(7, releaseDate);
	pstmt.setLong(8, replys);
	pstmt.setLong(9, likes);
	pstmt.setString(10, hashtag);
	pstmt.setString(11, reference);
	pstmt.executeUpdate();
	
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	response.sendRedirect("posts.jsp");
%>