<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" />
<link href="<c:url value='/resources/css/board.css'/>" rel="stylesheet" />
<script>
	function checkForm() {
		let form = document.newUser;
		let messages = [];
		let passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
		if (!form.id.value.trim()) {
			messages.push("아이디를 입력하세요.");
		}
		if (!form.password.value.trim()) {
			messages.push("비밀번호를 입력하세요.");
		} else if (!passwordPattern.test(form.password.value.trim())) {
			messages.push("비밀번호는 영어, 숫자, 특수문자를 포함하여 8자리 이상이어야 합니다.");
		}
		if (form.password.value.trim() !== form.password_confirm.value.trim()) {
			messages.push("비밀번호를 동일하게 입력하세요.");
		}
		if (!form.name.value.trim()) {
			messages.push("이름을 입력하세요.");
		}
		if (!form.gender.value.trim()) {
			messages.push("성별을 선택하세요.");
		}
		if (!form.birthyy.value.trim() || !form.birthmm.value || !form.birthdd.value.trim()) {
			messages.push("생년월일을 입력하세요.");
		}
		if (!form.mail1.value.trim()) {
			messages.push("이메일을 입력하세요.");
		}
		if (!form.phone.value.trim()) {
			messages.push("전화번호를 입력하세요.");
		}

		if (messages.length > 0) {
			alert(messages.join("\n"));
			return false;
		}
		
		return true;
	}
</script>
<title>회원 가입</title>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
   <jsp:include page="/menu.jsp" />
<div class="container">
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold">회원 가입</h1>
        <p class="col-md-8 fs-4">Membership Signup</p>      
      </div>
	</div>
	
   <div class="row align-items-md-stretch text-center">
		<form name="newUser" action="<c:url value='/user/processAddUser.jsp'/>" method="post" onsubmit="return checkForm()">
			<div class="mb-3 row">
				<label class="col-sm-2">아이디</label>
				<div class="col-sm-3">
					<input name="id" type="text" class="form-control" placeholder="아이디" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호</label>
				<div class="col-sm-3">
					<input name="password" type="password" class="form-control" placeholder="영어+숫자+특수문자 포함(8자리 이상)" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">비밀번호 확인</label>
				<div class="col-sm-3">
					<input name="password_confirm" type="password" class="form-control" placeholder="비밀번호를 동일하게 입력하세요" >
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2">이름</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" placeholder="이름" >
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2">성별/생년월일</label>
				<div class="col-sm-10">
				  <div class="row">
				  	<div class="col-sm-2">
						<select name="gender" class="form-select">
							<option value="">성별</option>
							<option value="남">남</option>
							<option value="여">여</option>
						</select>
						</div>
				  	<div class="col-sm-2">
						<input type="text" name="birthyy" maxlength="4"  class="form-control" placeholder="년(4자)" size="6"> 
					</div>
					<div class="col-sm-2">
					<select name="birthmm" class="form-select">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> 
					</div>
					<div class="col-sm-2">
					<input type="text" name="birthdd" maxlength="2" class="form-control" placeholder="일" size="4">
					</div>
				</div>
				</div>
			</div>
			
		<div class="mb-3 row">
			<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
				  <div class="row">
					<div class="col-sm-4">
						<input type="text" name="mail1" maxlength="50" class="form-control"  placeholder="이메일">
					</div> @
					<div class="col-sm-3">
						 <select name="mail2" class="form-select">
							<option>laif.com</option>
						</select>
					</div>
				</div>		
			</div>		
		</div>
			<div class="mb-3 row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="전화번호" >

				</div>
			</div>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="submit" class="btn btn-primary " value="등록" > 
					<input type="reset" class="btn btn-primary " value="취소" onclick="reset()" >
				</div>
			</div>
		</form>
	</div>
	</div>
	</main>
		   <jsp:include page="/footer.jsp" />  
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="<c:url value='/resources/js/board.js'/>"></script>
  	
</body>
</html>