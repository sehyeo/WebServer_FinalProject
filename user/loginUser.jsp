<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link href=<c:url value='/resources/css/board.css'/> rel="stylesheet" />
<title>Login</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
<div class="container">
 <div class="p-5 mb-4 bg-body-tertiary rounded-3 text-center">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 로그인</h1>
        <p class="fs-4">Membership Login</p>      
      </div>
    </div>
	<div class="container" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h5 class="form-signin-heading">L!FE에 오신 것을 환영합니다</h5>
			<%
				String error = request.getParameter("error");
				if (error != null) {
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해 주세요");
					out.println("</div>");
				}
			%>
  			<form class="form-signin" method="post" action="<c:url value='/user/processLoginUser.jsp'/>">
  
    			<div class="form-floating mb-3 row">     
      				<input type="text" class="form-control" name='id' id="floatingInput" placeholder="ID" required autofocus>
      				<label for="floatingInput">아이디</label>      
    			</div>
    			<div class="form-floating  mb-3 row">     
     	 			<input type="password" class="form-control" name='password' placeholder="Password">
    				 <label for="floatingPassword">비밀번호</label>
			</div>

   			<div class="row mb-3">
    			<div class="col">
  					<button class="btn btn-lg btn-success" type="submit">로그인</button>
  				</div>
  				<div class="col">
  					<a class="btn btn-lg btn-info text-white" href="<c:url value='/user/findAccount.jsp'/>">계정찾기</a>
  				</div>
  				<div class="col">
  					<a class="btn btn-lg btn-primary text-white" href="<c:url value='/user/agreements.jsp'/>">회원가입</a>
  				</div>
  			</div>

  			</form>
		</div>
	</div>
  </div>
  </main>
<jsp:include page="/footer.jsp" />  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
  </body>
</html>
