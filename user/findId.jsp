<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<link href=<c:url value='/resources/css/board.css'/> rel="stylesheet" />
<title>아이디 찾기</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
<jsp:include page="/menu.jsp" />
	<br />
	<div class="container">
	<div id="findIdForm">
		<br />
		<h2 class="text-center">아이디 찾기</h2>
		<br />
		<form class="text-center">
        	<label for="phoneNumber">휴대폰 번호:</label>
        	<input type="text" id="phoneNumber" name="phoneNumber" placeholder="휴대폰 번호 입력">
        	<button type="button" class="bg-success text-white" onclick="requestVerification()">인증 요청</button>
    	</form>
    	<br />
    	<div id="verificationSection" class="hidden text-center">
        	<label for="verificationCode">인증 코드:</label>
        	<input type="text" id="verificationCode" name="verificationCode" placeholder="인증 코드 입력">
        	<button type="button" class="bg-success text-white" onclick="verifyCode()">인증 확인</button>
    	</div>
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
    	function showFindIdForm() {
        	document.getElementById('findIdForm').style.display = 'block';
        	document.getElementById('findPwForm').style.display = 'none';
    	}
    	function requestVerification() {
            // 인증 요청 로직을 여기에 구현합니다.
            // 예를 들어, 서버에 휴대폰 번호를 전송하고 인증 코드를 받는 등의 작업을 할 수 있습니다.
            console.log("인증 요청이 전송되었습니다.");

            // 인증 코드 입력 섹션을 표시합니다.
            document.getElementById('verificationSection').classList.remove('hidden');
        }

        function verifyCode() {
            // 인증 코드 검증 로직을 여기에 구현합니다.
            // 예를 들어, 사용자가 입력한 인증 코드를 서버에 전송하여 검증할 수 있습니다.
            console.log("인증 코드가 확인되었습니다.");

            // 여기에서 추가적인 처리를 할 수 있습니다.
            // 예를 들어, 인증이 성공했다면 사용자의 아이디를 표시하거나, 다음 단계로 넘어갈 수 있습니다.
        }
</script>
</body>
</html>