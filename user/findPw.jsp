<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href=<c:url value='/resources/css/board.css'/> rel="stylesheet" />
<title>비밀번호 찾기</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
	<br />
	<div class="container">
	<div id="findPwForm">
		<br />
		<h2 class="text-center">비밀번호 찾기</h2>
		<br />
    	<form class="text-center">
        	<label for="email">등록된 이메일:</label>
        	<input type="email" id="email" name="email" placeholder="이메일 주소 입력">
        	<button type="button" class="bg-success text-white" onclick="sendPasswordResetLink()">변경 링크 전송하기</button>
    	</form>
    	<br />
    	<div class="text-center">
  			<a class="btn btn-info text-white bg-primary" href="<c:url value='/user/loginUser.jsp'/>">로그인하러 가기</a>
  		</div>
	</div>
	</main>
		<jsp:include page="/footer.jsp" />  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
        <script>
    	function showFindPwForm() {
        	document.getElementById('findIdForm').style.display = 'none';
        	document.getElementById('findPwForm').style.display = 'block';
    	}
        function sendPasswordResetLink() {
            var email = document.getElementById('email').value;
            // 여기에서 서버로 이메일 주소를 전송하고, 서버에서는 해당 이메일로 비밀번호 변경 링크를 전송하는 로직을 구현해야 합니다.
            console.log("비밀번호 변경 링크가 " + email + "로 전송되었습니다.");

            // 이메일 전송 성공 메시지 표시 (예시)
            alert("비밀번호 변경 링크가 전송되었습니다. 이메일을 확인해주세요.");
        }
</script>
</body>
</html>