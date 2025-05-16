<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
<title>글 등록</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
	<fmt:setLocale value='<%=request.getParameter("language") %>' />
	<fmt:bundle basename="bundle.message">
	<div class="container">
		<%!
        	String what = "Add Post";
		%>
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold"><%=what %></h1>
				<p class="col-md-8 fs-4">글 등록</p>
			</div>
		</div>
		<div class="row align-items-md-stretch">
		
			<form title="newPost" method="post" enctype="multipart/form-data" action="<c:url value='/post/processAddPost.jsp'/>">
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
				</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2"><fmt:message key="hashtag" /></label>
						<div class="col-sm-3">
							<input type="text" title="hashtag" class="form-control">
						</div>
					</div>
					<div class="mb-3 row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="button" class="btn btn-primary" value="<fmt:message key="btn_insert" />" onclick="CheckAddPost()">
						</div>
					</div>
				</form>
			</div>
		</div>
		</fmt:bundle>
		</main>
		<jsp:include page="/footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>		
</body>
</html>