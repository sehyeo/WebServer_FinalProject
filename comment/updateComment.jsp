<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value='<%=request.getParameter("language") %>' />
<fmt:bundle basename="bundle.message">

<div class="container py-4">
	<%@ include file="../menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-teriary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">댓글 수정</h1>
			<p class="col-md-8 fs-4">comment Updating</p>
		</div>
	</div>
	<%@ include file="../dbconn.jsp" %>
	<%
		String commentId=request.getParameter("id");
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM comment WHERE c_id=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, commentId);
		rs=pstmt.executeQuery();
		if(rs.next()) {
	%>
	<div class="row align-items-md-stretch">
		<div class="col-md-5">
			<img src="../resources/images/<%=rs.getString("c_filename")%>" alt="image" style="width: 100%" />
		</div>
		<div class="col-md-7">
		<form class="mb-4" onsubmit="addComment(event)">
		    <textarea id="commentText" class="form-control" rows="3" ></textarea>
		    <button type="submit" class="btn btn-primary mt-2" value="<fmt:message key="btn_insert" />"></button>
		</form>
	</div>
	<%
		}
		if(rs != null)
			rs.close();
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	%>
	</div>
</div>
</fmt:bundle>