<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dto.Profile" %>
<%@ page import="dao.ProfileRepository" %>
<%@ page errorPage="exceptionNoProfileId.jsp" %>
<html>
<head>
<title>Profile</title>
</head>
<body>
<!-- 프로필 --> 
	<div class="col-lg-3">
	    <div class="d-flex align-items-center mt-lg-5 mb-4">
	        <img class="img-fluid rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." />
	        <div class="ms-3">
		        <!-- Profile content-->
	            <%
					String userId=request.getParameter("userId");
					ProfileRepository dao=ProfileRepository.getInstance();
					Profile profile=dao.getProfileById(userId);
				%>
                <div class="fw-bold"><%=profile.getUserId() %></div>
	            <div class="text-muted"><%=profile.getRole() %></div>
	        </div>
	    </div>
	</div>
</body>
</html>