<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>글 수정</title>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">
	
	<div class="container py-4">
		<%@ include file="../menu.jsp" %>
		
		<div class="p-5 mb-4 bg-body-teriary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">글 수정</h1>
				<p class="col-md-8 fs-4">post Updating</p>
			</div>
		</div>
		<%@ include file="../dbconn.jsp" %>
		<%
			String postId=request.getParameter("id");
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="SELECT * FROM post WHERE p_id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, postId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
		%>
		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="../resources/images/<%=rs.getString("p_filename")%>" alt="image" style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newpost" action="./processUpdatepost.jsp" method="post" enctype="multipart/form-data">
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="p_title" /></label>
						<div class="col-sm-3">
							<input type="text" title="title" id="title" class="form-control">
						</div>
					</div>
						
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="category" /></label>
						<select class="col-sm-5" name="category">
	                		<option value="운동"><fmt:message key="ca_workOut" /></option>
	                		<option value="요리"><fmt:message key="ca_cooking" /></option>
	                		<option value="기타"><fmt:message key="ca_etc" /></option>
	                	</select>
					</div>		
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="reference" /></label>
						<div class="col-sm-5">
							<input type="file" title="reference" class="form-control">
						</div>
					</div>
											
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="contents" /></label>
						<div class="col-sm-5">
							<textarea title="contents" id="contents" cols="25" rows="2"
							class="form-control" placeholder=내용></textarea>
							</div>
						</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="hashtag" /></label>
						<div class="col-sm-3">
							<input type="text" title="hashtag" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="<fmt:message key="btn_insert" />">
						</div>
					</div>
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
	<jsp:include page="../footer.jsp" />	
</body>
</html>