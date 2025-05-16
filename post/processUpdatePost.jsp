<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String reference="";
	String realFolder="C:\\Users\\user1\\workspace_webServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BookMarket\\resources\\images";
	String encType="utf-8";
	int maxSize=5*1024*1024;
	
	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String postId=multi.getParameter("postId");
	String title=multi.getParameter("title");
	String author=multi.getParameter("author");
	String contents=multi.getParameter("contents");
	String category=multi.getParameter("category");
	String hit=multi.getParameter("hit");
	String releaseDate=multi.getParameter("releaseDate");
	String comments=multi.getParameter("comments");
	String quantity=multi.getParameter("quantity");
	String hashtag=multi.getParameter("hashtag");

	Enumeration files=multi.getFileNames();
	String fname=(String) files.nextElement();
	String Reference=multi.getFilesystemName(fname);
	
	long h, c, q, total;

	if(hit.isEmpty())
		h=0;
	else
		h=Long.valueOf(hit);

	if(comments.isEmpty())
		c=0;
	else
		c=Long.valueOf(comments);

	if(quantity.isEmpty())
		q=0;
	else
		q=Long.valueOf(quantity);
		
	if(h==0 && c==0 && q==0)
		total=0;
	else
		total=Long.valueOf(hit+comments+quantity);

	
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="SELECT * FROM post WHERE p_id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, postId);
	rs=pstmt.executeQuery();
	
	if(rs.next()) {
		if(Reference!=null) {
			sql="UPDATE post SET p_title=?, p_author=?, p_contents=?, p_category=?, p_hit=?, p_releaseDate=?, p_comments=?, quantity=?, p_hashtag=?, p_reference=? WHERE p_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, author);
			pstmt.setString(3, contents);
			pstmt.setString(4, category);
			pstmt.setLong(5, h);
			pstmt.setString(6, releaseDate);
			pstmt.setLong(7, c);
			pstmt.setLong(8, q);
			pstmt.setString(9, hashtag);
			pstmt.setString(10, Reference);
			pstmt.setString(11, postId);
			pstmt.executeUpdate();
		} else {
			sql="UPDATE post SET p_title=?, p_author=?, p_contents=?, p_category=?, p_hit=?, p_releaseDate=?, p_comments=?, quantity=?, p_hashtag=?, p_reference=? WHERE p_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, author);
			pstmt.setString(3, contents);
			pstmt.setString(4, category);
			pstmt.setLong(5, h);
			pstmt.setString(6, releaseDate);
			pstmt.setLong(7, c);
			pstmt.setLong(8, q);
			pstmt.setString(9, hashtag);
			pstmt.setString(10, postId);
			pstmt.executeUpdate();
			}
		}
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
			
			
		response.sendRedirect("editpostk.jsp?edit=update");
%>