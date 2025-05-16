<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String postId=request.getParameter("postId");
	String title=request.getParameter("title");
	String author=request.getParameter("author");
	String reference=request.getParameter("reference");
	String contents=request.getParameter("contents");
	String category=request.getParameter("category");
	String comments=request.getParameter("comments");
	String releaseDate=request.getParameter("releaseDate");
	String hashtag=request.getParameter("hashtag");
	String quantity=request.getParameter("quantity");
	
	Integer scrap;
	
	if (quantity.isEmpty())
		scrap=0;
	else
		scrap=Integer.valueOf(quantity);
	
	long count;
	
	if (comments.isEmpty())
		count=0;
	else
		count=Long.valueOf(comments);
	
	PreparedStatement pstmt = null;
	
	String sql = "INTSERT INTO post VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, postId);
	pstmt.setString(2, title);
	pstmt.setString(3, author);
	pstmt.setString(4, reference);
	pstmt.setString(5, contents);
	pstmt.setString(6, category);
	pstmt.setInt(7, scrap);
	pstmt.setString(8, releaseDate);
	pstmt.setString(9, hashtag);
	pstmt.setLong(10, count);
	pstmt.executeUpdate();
	
	if (pstmt!=null)
		pstmt.close();
	if (conn!=null)
		conn.close();
	
	response.sendRedirect("posts.jsp");
%>