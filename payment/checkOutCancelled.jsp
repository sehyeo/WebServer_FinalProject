<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<title>결제 취소</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="../menu.jsp" %>
	<div class="row align-items-md-stretch">
	
		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">결제 취소</h1>
				<p class="col-md-8 fs-4">Order Cancellation</p>
			</div>
		</div>
	
		<h2 class="alert alert-danger">결제가 취소되었습니다.</h2>
	</div>
	
	<div class="container">
		<p> <a href="./lectures.jsp" class="btn btn-secondary"> &laquo;강의 목록</a>
	</div>
	
	<%@ include file="../footer.jsp" %>
</div>
</body>
</html>