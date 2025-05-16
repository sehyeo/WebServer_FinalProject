<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="../dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename="";
	String realFolder="C:\\Users\\user1\\workspace_webServer\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\WebServerFinalProject\\resources\\images";
	String encType="utf-8";
	int maxSize=5*1024*1024;
	
	MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String lectureName=multi.getParameter("lectureName");
	String category=multi.getParameter("category");
	String description=multi.getParameter("description");
	String uploadDate=multi.getParameter("uploadDate");
	
	Enumeration files=multi.getFileNames();
	String fname=(String) files.nextElement();
	String fileName=multi.getFilesystemName(fname);
		
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	String sql="SELECT * FROM lecture WHERE l_id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, lectureName);
	rs=pstmt.executeQuery();
	
	if(rs.next()) {
		if(fileName!=null) {
			sql="UPDATE lecture SET l_lectureName=?, l_category=?, l_description=?, l_uploadDate=?, WHERE l_id=?";
			pstmt.setString(1, lectureName);
			pstmt.setString(2, category);
			pstmt.setString(3, description);
			pstmt.setString(4, fileName);
			pstmt.setString(5, uploadDate);
			pstmt.executeUpdate();
		} else {
			sql="UPDATE lecture SET l_lectureName=?, l_category=?, l_description=?, l_uploadDate=?, WHERE l_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, lectureName);
			pstmt.setString(2, category);
			pstmt.setString(3, description);
			pstmt.setString(4, fileName);
			pstmt.setString(5, uploadDate);
			pstmt.executeUpdate();
			}
		}
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
			
			
		response.sendRedirect("editLecture.jsp?edit=update");
%>